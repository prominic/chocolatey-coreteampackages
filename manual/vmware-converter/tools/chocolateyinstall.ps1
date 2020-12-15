$ErrorActionPreference	= 'Stop';
$toolsDir	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName	= 'VMware vCenter Converter Standalone*'
$fileType	= 'exe'
$url	= 'https://slc.lo4d.com/files/vmware-vcenter-converter-standalone/VMware-converter-en-6.2.0-8466193.exe'
$url64bit	= $url
$softwareName	= 'VMware vCenter Converter Standalone*'
$checksum	= 'CA4FD6ECB0BE2EE7D96485D16325B79FBFE0AF46E94180D2899727AC99A56EA3'
$checksumType	= 'sha256'
$checksum64	= $checksum
$checksumType64	= $checksumType
$silentArgs	= '/s /v"/qn ADDLOCAL=ALL"'
$validExitCodes		= @(0)

	$packageArgs = @{
	  packageName   	= $env:ChocolateyPackageName
	  fileType			= $fileType
	  url				= $url
	  url64bit			= $url64bit
	  unzipLocation 	= $toolsDir
	  checksum      	= $checksum
	  checksumType		= $checksumType
	  checksum64      	= $checksum64
	  checksumType64	= $checksumType64
	  silentArgs		= $silentArgs
	  validExitCodes	= $validExitCodes  
	}

Install-ChocolateyPackage @packageArgs
