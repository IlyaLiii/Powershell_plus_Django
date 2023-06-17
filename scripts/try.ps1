$URI = 'http://127.0.0.1:8000/'
$INPUT_DIR = 'C:\projects\pythonProject\Powershell_plus_Django\scripts\xml\*'
$DONE_DIR = 'C:\projects\pythonProject\Powershell_plus_Django\scripts\sended\'

while ($True) { 

    $IS_EXIT_FILES = Test-Path $INPUT_DIR -PathType Leaf -Include "*.xml"
    
    if ($IS_EXIT_FILES) {

        foreach($PATH_TO_FILE in Get-ChildItem $INPUT_DIR -File -Recurse | Select-Object -ExpandProperty FullName -Unique)

        {
            $NAME_OF_FILE = Get-ChildItem $INPUT_DIR -File -Recurse | Select-Object -First 1

            $HEADERS = @{
                'Name' = $NAME_OF_FILE
            }

            Invoke-WebRequest `
                -Method 'POST' `
                -Uri $URI `
                -InFile $PATH_TO_FILE `
                -Headers $HEADERS

            Copy-Item $PATH_TO_FILE -Destination $DONE_DIR
            Remove-Item $PATH_TO_FILE
        }

    }

    else {
        Write-host "Xml-files does not exit"
    }

    $Sleep_Time = 3600
    Start-Sleep -Seconds $Sleep_Time

}




