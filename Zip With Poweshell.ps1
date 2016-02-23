# Zip a file in Powershell
$Source = "E:\Reporting\SCOMReports" # Source Folder
$Destination ="E:\Reporting\ZippedReports\SCOMFiles.zip" # Destination folder
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($Source, $Destination)
