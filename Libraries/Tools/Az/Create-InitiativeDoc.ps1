# region parameters
param (
    [Parameter(Mandatory=$true)][string]$managementGroupName,
    #git directory Core Services repo
    [Parameter(Mandatory=$true)][string]$initiativeDefRootFolder,
    [Parameter(Mandatory=$true)][string]$MarkDownTemplateName,
    #git directory Wiki repo
    [Parameter(Mandatory=$true)][string]$wikiRootFolder,
    [Parameter(Mandatory=$true)][string]$wikiFolder

)
#endregion

#region initiatize git
Write-Host "##[debug]Changing Directory to Wiki directory"

Set-Location ($wikiRootFolder + $wikiFolder)

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

$branch = git branch --show-current

if ($branch -ne "origin/master") {
    Write-Host "##[debug]   Current branch not origin/master, checking out master"

    git checkout master
    git pull
}
#endregion

#region format initiative markdown
$customInitiatives = Get-AzPolicySetDefinition -ManagementGroupName $managementGroupName -Custom

foreach ($initiativeDef in $customInitiatives) {
    Write-Host "##[debug]Processing: $($initiative.name)"

    #initiative info
    $initiative = [PSCustomObject]@{
        Name = $initiativeDef.Name
        Description = $initiativeDef.Properties.description
        Groups = $initiativeDef.Properties.policyDefinitionGroups
    }

    $initativePolicies = New-Object System.Collections.ArrayList

    #policies info
    foreach ($policy in $initiativeDef.Properties.policyDefinitions) {

        Write-Host "##[debug]   Processing: $($policy.policyDefinitionId)"

        $policy

        $parameters = $policy.parameters | Get-Member -MemberType NoteProperty

        $pd = Get-AzPolicyDefinition -Id $policy.policyDefinitionId

        $pdp = $pd.Properties.parameters.psobject.members | where-object membertype -like 'NoteProperty'

        $paramterList = New-Object System.Collections.ArrayList

        foreach ($x in $pdp) {

            $parameter = New-Object PSCustomObject

            if (($parameters.name) -and $parameters.name.Contains($x.Name)) {
                #use initiative setting
                $x.Name
                "set in init"

                $parameter | Add-Member -MemberType NoteProperty `
                                        -Name ParameterName -Value $x.Name
                $parameter | Add-Member -MemberType NoteProperty `
                                        -Name Value -Value ($policy.parameters.($x.Name).value -join ', ')

                if ($policy.parameters.($x.Name).value -like "*parameter*") {
                    $parameter | Add-Member -MemberType NoteProperty `
                                        -Name ValueType -Value "Inititative Parameter"
                }
                else {
                    $parameter | Add-Member -MemberType NoteProperty `
                                        -Name ValueType -Value "Set value"
                }
                
            }
            else {
                #use policy default setting
                $x.Name
                "using default"
                
                $parameter | Add-Member -MemberType NoteProperty `
                                        -Name ParameterName `
                                        -Value ($pdp | Where-Object {$_.name -eq $x.Name}).Name
                $parameter | Add-Member -MemberType NoteProperty `
                                        -Name Value `
                                        -Value (($pdp | Where-Object {$_.name -eq $x.Name}).Value.defaultValue -join ',')
                $parameter | Add-Member -MemberType NoteProperty `
                                        -Name ValueType -Value "Default Value"
            }

            $paramterList.Add($parameter)
        }

        $policyDef = New-Object PSCustomObject

        $policyDef | Add-Member -MemberType NoteProperty -Name Name -Value $pd.name
        $policyDef | Add-Member -MemberType NoteProperty -Name DisplayName -Value $pd.Properties.displayName
        $policyDef | Add-Member -MemberType NoteProperty -Name GroupName -Value $policy.groupNames
        $policyDef | Add-Member -MemberType NoteProperty -Name Description -Value $pd.Properties.description
        $policyDef | Add-Member -MemberType NoteProperty -Name Parameters -Value $paramterList

        $initativePolicies.Add($policyDef)
    }

Write-Host "##[debug]   Creating Inititative PS Object"

$initiativeDefinition = [PSCustomObject]@{
    initiative = $initiative
    policies = $initativePolicies
}

Write-Host "##[debug]   Setting PSDoc options"

$options = New-PSDocumentOption -Option @{ 'Markdown.UseEdgePipes' = 'Always'; 'Markdown.ColumnPadding' = 'None' }

Write-Host "##[debug]   Getting Markdown template $MarkDownTemplateName"

$MarkDownTemplate = $initiativeDefRootFolder + "\s\Core_Services\Libraries\Tools\MarkDownTemplates\" + $MarkDownTemplateName

Write-Host "##[debug]   Creating Markdown"

$Markdown = Invoke-PSDocument -Path ('{0}' -f $MarkDownTemplate) `
                              -InputObject $initiativeDefinition `
                              -Option $options `
                              -PassThru

Write-Host "##[debug]   Setting wiki file name"

$markdownFileName = ($initiative.Name -replace " ","_") + ".md"
#endregion

#region add and commit
Write-Host "##[debug]   Creating/updating: $markdownFileName"
      
New-Item -Path . `
         -Name $markdownFileName `
         -ItemType "file" `
         -Value $Markdown `
         -Force

Write-Host "##[debug]   Git Add/Commit"

git add -A

git commit -a -m "added/updating $markdownFileName"

}
#endregion

#region push additions/changes
Write-Host "##[debug]   Git Push"

git push origin
#endregion