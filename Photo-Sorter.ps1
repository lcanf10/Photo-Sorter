$sourceDirectory = "C:\path\to\source\photos"
$destinationDirectory = "C:\path\to\sorted\photos"

# Ensure the destination directory exists
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -Path $destinationDirectory -ItemType Directory | Out-Null
}

Get-ChildItem -Path $sourceDirectory -Recurse -File | Where-Object { $_.Extension -match "\.(jpg|jpeg|png|tif|tiff)$" } | ForEach-Object {
    $file = $_
    $dateModified = $file.LastWriteTime
    $year = $dateModified.Year
    $month = Get-Culture | Select-Object -ExpandProperty DateTimeFormat | ForEach-Object { $_.GetMonthName($dateModified.Month) }
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath "$year\$month"

    # Ensure the destination directory exists
    if (-not (Test-Path -Path $destinationPath)) {
        New-Item -Path $destinationPath -ItemType Directory | Out-Null
    }

    # Move the file to the destination directory
    Move-Item -Path $file.FullName -Destination $destinationPath
    Write-Host "Moved $($file.Name) to $destinationPath"
}
