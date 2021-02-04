# Table of Contents
<#
    PowerShell PSDocs Document to create an Markdown Template.

    Requirements:
    - PSDocs PowerShell Module (Install-Module -Name PSDocs)

#>

# Description: A definition to generate markdown for an ARM template
document 'initiative.doc.ps1' {

    # Set document title
    Title $InputObject.initiative.Name

    # Write opening line
    $InputObject.initiative.Description

    # Table of Contents
    '[[_TOC_]]'

    # Add groups to a table
        Section 'Groups' {
            $InputObject.initiative.Groups | Table -Property @{ Name = 'Group Name'; Expression = { $_.Name } }
        }

    # Add global parameter section
        Section 'Global Parameters'{
            $InputObject.globalParameters | Table -Property @{ Name = 'Parameter'; Expression = { $_.Name } }, DefaultValue, AllowedValues
        }
    
    # Add each policy to a table
        Section 'Policies' {
        foreach ($policy in $InputObject.policies) {
            Section $policy.DisplayName {
                '---'
                '**Name:** ' + ($policy.name)
                '**Display Name**: ' + ($policy.DisplayName)
                '**Description:** ' + $policy.description
                '**Group Name:** ' + $policy.groupName
                '**Policy Parameters**'
                $policy.parameters | Table -Property @{ Name = 'Parameter'; Expression = { $_.ParameterName }}, Value, ValueType
                '<br>'
            }            
        }
    }
}