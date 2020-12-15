﻿import-module au

$releases = "https://github.com/jgraph/drawio-desktop/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]drawioversion\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
      "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    ".\tools\VERIFICATION.txt" = @{
      "(^Download from here:\s)(.*)" = "`$1'$($Latest.URL)'"
      "(^\s*if\s*)(.*)" = "`$1(get-filehash -algorithm $($Latest.ChecksumType32) draw.io-setup-signed-$($Latest.Version)).hash = '$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = 'https:\/\/github.com\/jgraph\/drawio-desktop\/releases\/download\/v[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/draw\.io-[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}-windows-installer\.exe$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|-' | Select-Object -Last 1 -Skip 2
  $url = "https://github.com/jgraph/drawio-desktop/releases/download/v$version/draw.io-$version-windows-installer.exe"
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32