Import-Module UniversalDashboard 
Import-Module (Join-Path $PSScriptRoot "output/UniversalDashboard.ObjectTree/UniversalDashboard.ObjectTree.psd1") 

$Dashboard = New-UDDashboard -Title "Object Tree" -Content {
    $Data = @{
        Test = "This is a test"
        Date = Get-Date 
        Version = @{
            AnotherProperty = "Nested object"
        }
    }

    New-UDObjectTree -Object $Data
}

Start-UDDashboard -Dashboard $Dashboard -Port 10000 -Force