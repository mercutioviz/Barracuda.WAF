## ![logo][] Barracuda.WAF ##
[logo]: assets/Barracuda_Networks.png

PowerShell module for managing your Barracuda Web Application Firewall (WAF).

### Prerequisites ###
In order to use this module you need to have PowerShell installed on your system, which you can download [here][download-powershell].

[download-powershell]: https://github.com/PowerShell/PowerShell

### New to PowerShell? ###
If you are new to PowerShell and would like to learn more, I recommend reviewing the [getting started][getting-started] documentation.

[getting-started]: https://github.com/PowerShell/PowerShell/tree/master/docs/learning-powershell

### Installation ###
1. Download or clone this repository on your desktop.
2. Copy the directory Barracuda.WAF to one of the following directories:
  * $env:USERPROFILE\Documents\WindowsPowerShell\Modules
  * $env:USERPROFILE\Documents\PowerShell\Modules
  * C:\Program Files\WindowsPowerShell\Modules
  * C:\Windows\system32\WindowsPowerShell\v1.0\Modules

*Notice: For a up to date list where you can copy the module directory, execute the following command at the Windows PowerShell command prompt:*
```powershell
$Env:PSMODULEPATH -Split ";"
```

### Getting started ###
To use the module you first need to import it in your current PowerShell session:
```powershell
Import-Module -Name Barracuda.WAF
```

To get retrieve a list of virtual services, enter:
```powershell
# Set the url of your WAF
Set-BarracudaWAFApiUrl -Url "http://192.168.0.1:8000"

# Connect to WAF
Connect-BarracudaWAFAccount -Credential (Get-Credential)

# Retrieve a list of services
Get-BarracudaWAFService

# Disconnect
Disconnect-BarracudaWAFAccount
```

To view all cmdlets, enter:
```powershell
Get-Command -Module Barracuda.WAF
```

### Developing and Contributing ###
Thank you for considering contributing to the Barracuda.WAF! I haven't created any contribution guide yet, but requests are welcome. I will try to implement the full v3 api specification of the WAF. But because this module is being develop in support for a project I am currently working on for a customer of my company. Only the needed feature will get priority and everything else will be added when I get free time.

So if you find this module useful please contribute.

If you have any problems, please file a new issue and I will try to get back to you as soon as possible.
