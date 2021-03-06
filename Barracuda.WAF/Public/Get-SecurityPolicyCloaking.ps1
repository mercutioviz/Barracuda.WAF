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
    https://campus.barracuda.com/product/webapplicationfirewall/api/9.1.1
#>
function Get-SecurityPolicyCloaking {
    [CmdletBinding()]
    [Alias()]
    [OutputType([PSCustomObject])]
    Param (
        # PolicyName help description
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]        
        [String[]]
        $PolicyName,

        # Parameters help description
        [Parameter(Mandatory = $false)]
        [ValidateSet('filter-response-header', 'headers-to-filter', 'return-codes-to-exempt', 'suppress-return-code')]
        [String[]]
        $Parameters
    )

    process {
        try {
            $params = @{}

            if ($PSBoundParameters.ContainsKey('Parameters')) {
                $params.parameters = $Parameters -join ','
            }

            foreach ($name in $PolicyName) {
                Invoke-API -Path $('/restapi/v3/security-policies/{0}/cloaking' -f $name) -Method Get -Parameters $params
            }
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