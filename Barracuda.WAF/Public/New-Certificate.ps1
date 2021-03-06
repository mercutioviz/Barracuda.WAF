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
function New-Certificate {
    [CmdletBinding(DefaultParameterSetName = 'UploadTrustedServerCertificates')]
    [Alias()]
    [OutputType([PSCustomObject])]
    Param (
        # AllowPrivateKeyExport help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Alias('allow_private_key_export')]
        [ValidateSet('Yes', 'No')]
        [String]
        $AllowPrivateKeyExport,

        # City help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [ValidateNotNullOrEmpty()]
        [String]
        $City,

        # CommonName help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('common_name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $CommonName,

        # CountryCode help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('country_code')]
        [ValidateNotNullOrEmpty()]
        [String]
        $CountryCode,

        # CurveType help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('curve_type')]
        [ValidateSet('secp256r1', 'secp384r1', 'secp512r1')]
        [String]
        $CurveType,

        # KeySize help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('key_size')]
        [ValidateSet('1024', '2048', '4096')]
        [String]
        $KeySize,

        # Name help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadTrustedServerCertificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadTrustedCACertificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        # TrustedServerCertificateFilePath help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $false, ParameterSetName = 'UploadTrustedServerCertificates')]
        [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
        [ValidateNotNullOrEmpty()]
        [String]
        $TrustedServerCertificateFilePath,

        # TrustedCACertificateFilePath help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $false, ParameterSetName = 'UploadTrustedCACertificates')]
        [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
        [ValidateNotNullOrEmpty()]
        [String]
        $TrustedCACertificateFilePath,

        # OrganizationName help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('organization_name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $OrganizationName,

        # OrganizationUnit help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('organization_unit')]
        [ValidateNotNullOrEmpty()]
        [String]
        $OrganizationUnit,

        # SANCertificate help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Alias('san_certificate')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SANCertificate,

        # State help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [ValidateNotNullOrEmpty()]
        [String]
        $State,

        # Type help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [ValidateSet('pkcs12', 'pem')]
        [String]
        $Type,

        # KeyType help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateSelfsignedCertificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Alias('key_type')]
        [ValidateSet('rsa', 'ecdsa')]
        [String]
        $KeyType,

        # SignedCertificateFilePath help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Alias('signed_certificate')]
        [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
        [ValidateNotNullOrEmpty()]
        [String]
        $SignedCertificateFilePath,

        # AssignAssociatedKey help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Alias('assign_associated_key')]
        [ValidateSet('yes', 'no')]
        [String]
        $AssignAssociatedKey,

        # KeyFilePath help description
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
        [ValidateNotNullOrEmpty()]
        [String]
        $KeyFilePath,

        # IntermediaryCertificateFilePath help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPEMCertificates')]
        [Alias('intermediary_certificate')]
        [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
        [ValidateNotNullOrEmpty()]
        [String]
        $IntermediaryCertificateFilePath,

        # Password help description
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'UploadPKCS12Certificates')]
        [ValidateNotNullOrEmpty()]        
        [SecureString]
        $Password
    )
    
    process {
        try {
            $parameters = @{}
            
            $headers = @{}

            switch ($PSCmdlet.ParameterSetName) {
                'UploadTrustedServerCertificates' {
                    $boundary = [System.Guid]::NewGuid().ToString()

                    $headers.'Content-Type' = 'multipart/form-data; boundary="{0}"' -f $boundary

                    $parameters.upload = 'trusted_server'
                    
                    $allBytes = [System.Io.File]::ReadAllBytes($TrustedServerCertificateFilePath)

                    $trustedServerCertificateFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)

                    $trustedServerCertificateFileName = Split-Path -Path $TrustedServerCertificateFilePath -Leaf

                    $postData = @"
--$boundary
Content-Disposition: form-data; name=`"name`" 

$Name
--$boundary
Content-Disposition: form-data; name=`"trusted_server_certificate`"; filename=`"$trustedServerCertificateFileName`"

$trustedServerCertificateFileContent
--$boundary
"@
                }

                'CreateSelfsignedCertificates' {
                    $postData = $PSBoundParameters | ConvertTo-Post -Separator '_'
                }

                'UploadTrustedCACertificates' {
                    $boundary = [System.Guid]::NewGuid().ToString()

                    $headers.'Content-Type' = 'multipart/form-data; boundary="{0}"' -f $boundary

                    $parameters.upload = 'trusted'
                    
                    $allBytes = [System.Io.File]::ReadAllBytes($TrustedCACertificateFilePath)

                    $trustedCACertificateFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)
                    
                    $trustedCACertificateFileName = Split-Path -Path $TrustedCACertificateFilePath -Leaf

                    $postData = @"
--$boundary
Content-Disposition: form-data; name=`"name`" 

$Name
--$boundary
Content-Disposition: form-data; name=`"trusted_certificate`"; filename=`"$trustedCACertificateFileName`"

$trustedCACertificateFileContent
--$boundary
"@
                }

                'UploadPEMCertificates' {
                    if ($AssignAssociatedKey -eq 'yes') {
                        if ([string]::IsNullOrWhiteSpace($KeyFilePath)) {
                            throw "Parameter KeyFilePath is mandatory when AssignAssociatedKey is set to `"yes`"."
                        }
                    }

                    $boundary = [System.Guid]::NewGuid().ToString()

                    $headers.'Content-Type' = 'multipart/form-data; boundary="{0}"' -f $boundary

                    $parameters.upload = 'signed'
                    
                    $allBytes = [System.Io.File]::ReadAllBytes($SignedCertificateFilePath)

                    $signedCertificateFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)
                    
                    $signedCertificateFileName = Split-Path -Path $SignedCertificateFilePath -Leaf

                    if ($AssignAssociatedKey -eq 'yes') {

                        $allBytes = [System.Io.File]::ReadAllBytes($KeyFilePath)

                        $keyFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)
                        
                        $keyFileName = Split-Path -Path $KeyFilePath -Leaf

                        $keyFile = @"
Content-Disposition: form-data; name=`"key`"; filename=`"$keyFileName`"
                    
$keyFileContent
--$boundary
"@
                    }

                    $allBytes = [System.Io.File]::ReadAllBytes($IntermediaryCertificateFilePath)

                    $intermediaryCertificateFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)
                    
                    $intermediaryCertificateFileName = Split-Path -Path $IntermediaryCertificateFilePath -Leaf

                    $postData = @"
--$boundary
Content-Disposition: form-data; name=`"name`" 

$Name
--$boundary
Content-Disposition: form-data; name=`"type`" 

$Type
--$boundary
Content-Disposition: form-data; name=`"key_type`" 

$KeyType
--$boundary
Content-Disposition: form-data; name=`"signed_certificate`"; filename=`"$signedCertificateFileName`"

$signedCertificateFileContent
--$boundary
Content-Disposition: form-data; name=`"assign_associated_key`" 

$AssignAssociatedKey
--$boundary
Content-Disposition: form-data; name=`"intermediary_certificate`"; filename=`"$intermediaryCertificateFileName`"

$intermediaryCertificateFileContent
--$boundary
Content-Disposition: form-data; name=`"allow_private_key_export`" 

$AllowPrivateKeyExport
--$boundary
$keyFile
"@
                }

                'UploadPKCS12Certificates' {
                    $boundary = [System.Guid]::NewGuid().ToString()

                    $headers.'Content-Type' = 'multipart/form-data; boundary="{0}"' -f $boundary

                    $parameters.upload = 'signed'
                    
                    $allBytes = [System.Io.File]::ReadAllBytes($SignedCertificateFilePath)

                    $signedCertificateFileContent = ([System.Text.Encoding]::GetEncoding("iso-8859-1")).GetString($allBytes)
                    
                    $signedCertificateFileName = Split-Path -Path $SignedCertificateFilePath -Leaf

                    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)

                    $clearPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

                    $postData = @"
--$boundary
Content-Disposition: form-data; name=`"name`" 

$Name
--$boundary
Content-Disposition: form-data; name=`"type`" 

$Type
--$boundary
Content-Disposition: form-data; name=`"key_type`" 

$KeyType
--$boundary
Content-Disposition: form-data; name=`"signed_certificate`"; filename=`"$signedCertificateFileName`"

$signedCertificateFileContent
--$boundary
Content-Disposition: form-data; name=`"allow_private_key_export`" 

$AllowPrivateKeyExport
--$boundary
Content-Disposition: form-data; name=`"password`" 

$clearPassword
--$boundary
"@
                }
            }

            Invoke-API -Path 'restapi/v3/certificates' -Method Post -PostData $postData -Headers $headers -Parameters $parameters
        } catch {
            if ($_.Exception -is [System.Net.WebException]) {
                Write-Verbose "ExceptionResponse: `n$($_ | Get-ExceptionResponse)`n"
            }
            throw
        }
    }
}