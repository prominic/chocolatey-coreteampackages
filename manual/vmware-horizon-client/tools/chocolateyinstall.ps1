$ErrorActionPreference 		= 'Stop';
$toolsDir 			= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName 			= 'vmware-horizon-client'
$fileType 			= 'exe'
$url 				= 'https://download3.vmware.com/software/view/viewclients/CART21FQ2/VMware-Horizon-Client-2006-8.0.0-16531419.exe'
$softwareName 			= "VMware Horizon Client*"
$checksum 			= '2A3912FBBD092C37BEB42B19F8780158AB83D4610A2617ABE8E26E39CFCA7C9F'
$checksumType 			= 'sha256'
$silentArgs 			= '/silent /norestart'
$validExitCodes			= @(0, 3010, 1641)

	$packageArgs = @{
	  packageName		= $env:ChocolateyPackageName
	  fileType		= $fileType
	  url			= $url
	  softwareName		= $softwareName
	  checksum      	= $checksum
	  checksumType		= $checksumType
	  silentArgs		= $silentArgs
	  validExitCodes	= $validExitCodes
	}

Install-ChocolateyPackage @packageArgs
