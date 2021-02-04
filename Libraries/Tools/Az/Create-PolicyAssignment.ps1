# region parameters
param (
    [Parameter(Mandatory=$true)][string]$rootFolder,
    [Parameter(Mandatory=$true)][string[]]$assignmentNames,
    # location of policies and initiatives
    [Parameter(Mandatory=$true)][string]$definitionLocation
)
#endregion

# evaluate $definitionLocation
# if subscription, lookup sub GUID
# if managementgroup, lookup GUID for Tenant Root Group or name for other

# if scope is NFCU-CLOUD-DEVOPS look for policy or initiatives in that sub
# if scope is NFCU-INFOSEC-SDBX look for policy or initiatives in that sub
# default to tentant root group

function Trim-Length {
    param (
        [parameter(Mandatory=$True,ValueFromPipeline=$True)] [string] $Str
      , [parameter(Mandatory=$True,Position=1)] [int] $Length
    )
        
        $Str[($Str.Length-24)..($Str.Length-1)] -join ""

}

foreach ($assignmentName in $assignmentNames) {

    $assignmentPath = $RootFolder + "\Assignments\" + $assignmentName + ".json"

    Write-Host "##[section] Creating $assignmentName Policy/Initiative"
    Write-Host "##[debug]     Assignment Def Path: $assignmentPath"

    $assignmentDef = Get-Content -Path $assignmentPath | ConvertFrom-Json

    #region processing scope
    # get managementgroupID or subscriptionID (formated correctly)
    switch ($assignmentDef.scope.type){
        'Management Group' {$scope = (Get-AzManagementGroup -GroupName $assignmentDef.scope.name).Id; break}
        'Subscription' {$scope = "/subscriptions/$((Get-AzSubscription -SubscriptionName $assignmentDef.scope.name).Id)"; break}
    }

    Write-Host "##[debug]     Assignment Scope: $scope"

    #endregion

    #region all policies and initiatives

    $azPD = Get-AzPolicyDefinition -ManagementGroupName $definitionLocation
    $azID = Get-AzPolicySetDefinition -ManagementGroupName $definitionLocation

    #endregion

    #region processing policies
    foreach ($policy in $assignmentDef.policies) {

        $policyLookup = $azPD | Where-Object {$_.Name -eq $policy.Name}

        $policyName = $policyLookup.Name

        if ($policyName) {
            Write-Host "##[section] Processing $policyName"
        }
        else {
            Write-Host "Policy not found"
        }
    }
    #endregion

    #region processing initiatives
    foreach ($initiative in $assignmentDef.initiatives) {

        $initiativeParameter = @{}

        "##[section] Processing $($initiative.initiativeName)"

        $initiativeLookup = $azID | Where-Object {$_.Name -eq $($initiative.initiativeName)}

        $initiativeName = $initiativeLookup.Name

        if ($initiativeName) {
            Write-Host "##[debug]       Found $initiativeName"

            $initParam = $initiativeLookup.Properties.Parameters

            foreach ($param in $initParam.psobject.Properties) {
                $paramName = $param.Name

                Write-Host "##[debug]       Processing Param: $paramName"

                if ($initiative.parameters.$paramName) {
                    Write-Host "##[Debug]       Setting param to init policy value"

                    $initiativeParameter.$paramName = @{}

                    $initiativeParameter.$paramName = $initiative.parameters.$paramName.value
                }
                elseif ($assignmentDef.globalParameters.$paramName) {
                    Write-Host "##[Debug]       Setting param to init global value"

                    $initiativeParameter.$paramName = @{}

                    $initiativeParameter.$paramName = $assignmentDef.globalParameters.$paramName.value
                }
            }

    #region processing not scope

    $notScope = $initiative.notScope + $assignmentDef.globalNotScope

    #endregion
        
            $initiativeName

            $initiativeLookup | ConvertTo-Json -Depth 100

            $scope

            $notScope | ConvertTo-Json -Depth 100

            $initiativeParameter | ConvertTo-Json -Depth 100

            $initiativeFormatedName = $initiativeName | Trim-Length 24

            $createAssignment = @{
                "Name" = $initiativeFormatedName
                "DisplayName" =  $initiativeLookup.Properties.DisplayName
                "Description" = $initiativeLookup.Properties.Description
                "PolicySetDefinition" = $initiativeLookup
                "Scope" =  $scope
                "PolicyParameterObject" = $initiativeParameter
                "Location" = 'eastus'
            }

            if ($notScope) {
                $notScope = @{"NotScope" =  $notScope}
            
                $createAssignment += $notScope
            }            

            New-AzPolicyAssignment @createAssignment `
                                -AssignIdentity
        }
        else {
            Write-Host "##[debug]       Initiative not found"
        }
    }   
}
#endregion