
$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$JsFiles = Get-ChildItem "$PSScriptRoot\*.bundle.js"
$Maps = Get-ChildItem "$PSScriptRoot\*.map"

$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($IndexJs.FullName)

foreach ($item in $JsFiles) {
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

foreach ($item in $Maps) {
    [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($item.FullName) | Out-Null
}

function New-UDObjectTree {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter(Mandatory = $true)]
        $Object,
        [Parameter()]
        [switch]$Json
        
    )

    End {
        @{
            assetId  = $AssetId
            isPlugin = $true
            type     = "ud-objecttree"

            id       = $Id
            object   = $Object
            isJson   = $Json.IsPresent
        }
    }
}
