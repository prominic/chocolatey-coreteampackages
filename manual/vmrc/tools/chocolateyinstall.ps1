$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'vmrc'
$packageVer = '11.2.0'
$packageBuild = '16492666'
$zipFileName = 'vmrc-windows.tar'
$url = "https://softwareupdate.vmware.com/cds/vmw-desktop/$packageName/$packageVer/$packageBuild/windows/$zipFileName"
$installerType	= 'exe'
$file	= $toolsDir + "\VMware-VMRC-$packageVer-$packageBuild.exe"
$fileType	= $installerType
$checksum	= 'B5FDFB3F1F4C1ED9F314FF33B7066CE9D80D4FF4D0AA621D7F8DE6B6A97C2375'
$checksumType	= 'sha256'
$silentArgs	= '/s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=1 DATACOLLECTION=0 REBOOT=ReallySuppress'
$validExitCodes		= @(0, 3010, 1641)

	$zippackageArgs = @{
	  packageName   	= $env:ChocolateyPackageName
	  url				= $url
	  unzipLocation 	= $toolsDir
	  checksum      	= $checksum
	  checksumType		= $checksumType
	  
	}
	
	$packageArgs = @{
	  packageName   	= $env:ChocolateyPackageName
	  file				= $file
	  silentArgs		= $silentArgs
	  validExitCodes	= $validExitCodes
	  
	}

Install-ChocolateyZipPackage @zippackageArgs; Install-ChocolateyInstallPackage @packageArgs
