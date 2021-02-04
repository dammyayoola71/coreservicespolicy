# Table of Contents
<#
    PowerShell PSDocs Document to create an Markdown Template.

    Requirements:
    - PSDocs PowerShell Module (Install-Module -Name PSDocs)

#>

# Description: A definition to generate markdown for an ARM template
document 'policyu.doc.ps1' {

    # Set document title
    Title $InputObject.policy.Name

    # Write opening line
    $InputObject.policy.Description

    # Table of Contents
    '[[_TOC_]]'
    
    # Add each policy to a table
        Section 'Parameters' {
            $InputObject.parameters | Table -Property @{ Name = 'Parameter'; Expression = { $_.ParameterName }}, Type, AllowedValues, DefaultValue, Description 
        }
    }