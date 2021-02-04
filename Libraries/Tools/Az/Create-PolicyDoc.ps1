# region parameters
param (
    [Parameter(Mandatory=$true)][string[]]$policyNames,
    [Parameter(Mandatory=$true)][string]$managementGroupName,
    [Parameter(Mandatory=$true)][string]$policyDefRootFolder,
    [Parameter(Mandatory=$true)][string]$MarkDownTemplateName,
    #git directory Wiki repo
    [Parameter(Mandatory=$true)][string]$wikiRootFolder,
    [Parameter(Mandatory=$true)][string]$wikiFolder

)
#endregion

foreach ($policy in $policyNames) {
    $pd = Get-AzPolicyDefinition -Name $policy `
                                     -ManagementGroupName $managementGroupName

    #policy info
    $policy = [PSCustomObject]@{
        Name = $pd.Name
        Description = $pd.Properties.description
    }

    $parameterNames = ($pd.Properties.parameters | Get-Member -MemberType NoteProperty).Name

    $paramterList = New-Object System.Collections.ArrayList

    foreach ($name in $parameterNames) {
        $name

        $parameter = New-Object PSCustomObject

        $parameter | Add-Member -MemberType NoteProperty `
                                -Name ParameterName `
                                -Value $name

        $parameter | Add-Member -MemberType NoteProperty `
                                -Name Type `
                                -Value ($pd.Properties.parameters.$name.type `
                                -join ', ')

        $parameter | Add-Member -MemberType NoteProperty `
                                -Name Description `
                                -Value ($pd.Properties.parameters.$name.metadata.description `
                                -join ', ')

        $parameter | Add-Member -MemberType NoteProperty `
                                -Name AllowedValues `
                                -Value ($pd.Properties.parameters.$name.allowedValues `
                                -join ', ')

        $parameter | Add-Member -MemberType NoteProperty `
                                -Name DefaultValue `
                                -Value ($pd.Properties.parameters.$name.defaultValue `
                                -join ', ')

        $paramterList.Add($parameter)
    }

    Write-Output "Creating Inititative PS Object"

    $policyDefinition = [PSCustomObject]@{
        policy = $policy
        parameters = $paramterList
    }

    Write-Output "Setting PSDoc options"

    $options = New-PSDocumentOption -Option @{ 'Markdown.UseEdgePipes' = 'Always'; 'Markdown.ColumnPadding' = 'None' }

    Write-Output "Getting Markdown template"

    $MarkDownTemplate = $policyDefRootFolder + "\s\Core_Services\Libraries\Tools\MarkDownTemplates\" + $MarkDownTemplateName

    $MarkDownTemplate

    Write-Output "Creating Markdown"

    $Markdown = Invoke-PSDocument -Path ('{0}' `
                                  -f $MarkDownTemplate) `
                                  -InputObject $policyDefinition `
                                  -Option $options `
                                  -PassThru

    Write-Output "Setting wiki file name"

    $markdownFileName = ($pd.Name -replace " ","_" -replace "\|","_") + ".md"

    $markdownFileName

    #region push markdown to wiki

    Write-Output "CD to wiki dir"

    Set-Location ($wikiRootFolder + $wikiFolder)

    #"/s/NFCU-Cloud-Infrastructure.wiki/Cloud-Infrastructure-Compliance/Cloud-Governance/Azure-Policy/Policy-Definitions")
        
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"

    git checkout master
    git pull

    New-Item -Path . `
            -Name $markdownFileName `
            -ItemType "file" `
            -Value $Markdown `
            -Force

    git add -A
    git commit -a -m "added test page"
    git push origin
    #endregion
}