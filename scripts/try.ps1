$IsItter = $False
while ($IsItter = $True) {

    $INPUT_DIR = Read-Host "Write dir to check .xml`n EXAMPLES: C:\test\ or .\test\"
    $INPUT_DIR = $INPUT_DIR + "*" 
    
    if (Test-Path -Path $INPUT_DIR) {
        $Test = $True
        break
    }
    else {
        Write-host "Directory is invalid"
    }

}
    
while ($True) { 

    $IS_EXIT_FILES = Test-Path $INPUT_DIR -PathType Leaf -Include "*.xml"
    
    if ($IS_EXIT_FILES) {

        $XML_FILE = Get-ChildItem $INPUT_DIR -File -Recurse | Select-Object -ExpandProperty FullName -First 1
        $XML_FILE
        
        # $Date = Get-Date -Format "HH.mm.ss"
        # $Date = $Date.ToLongDateString()
        # $Date

        $HEADERS = @{
            'Name' = 'main' + $Date + '.xml'
        }

        Invoke-WebRequest `
            -Method 'POST' `
            -Uri 'http://127.0.0.1:8000/' `
            -InFile $XML_FILE `
            -Headers $HEADERS

    }

    else {
        Write-host "Xml-files does not exit"
    }

    # Remove-Item $XML_FILE

    $Sleep_Time = 10
    Start-Sleep -Seconds $Sleep_Time

}




