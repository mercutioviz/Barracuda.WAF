<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    Example of how to use this cmdlet
.EXAMPLE
    Another example of how to use this cmdlet
.INPUTS
    Inputs to this cmdlet (if any)
.OUTPUTS
    Output from this cmdlet (if any)
.NOTES
    General notes
.COMPONENT
    The component this cmdlet belongs to
.ROLE
    The role this cmdlet belongs to
.FUNCTIONALITY
    The functionality that best describes this cmdlet
.LINK
    https://campus.barracuda.com/product/webapplicationfirewall/article/WAF/RESTAPIServiceGroup/
#>
function Remove-ServiceGroup {
    [CmdletBinding()]
    [Alias()]
    [OutputType([PSCustomObject])]
    Param (
        # VSite help description
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]        
        [String]
        $VSite,

        # Name help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('service-group')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ServiceGroup
    )
    
    process {
        foreach ($name in $ServiceGroup) {
            try {
                Invoke-API -Path $('/restapi/v3/vsites/{0}/service-groups/{1}' -f $VSite, $name) -Method Delete
            } catch {
                if ($_.Exception -is [System.Net.WebException]) {
                    Write-Verbose "ExceptionResponse: `n$($_ | Get-ExceptionResponse)`n"
                    if ($_.Exception.Response.StatusCode -ne 404) {
                        throw
                    }
                } else {
                    throw
                }
            }
        }
    }
}