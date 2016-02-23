# Zip a file in Powershell
# reference Ed - Scripting Guy
# https://blogs.technet.microsoft.com/heyscriptingguy/2015/03/09/use-powershell-to-create-zip-archive-of-folder/

$Source = "E:\Reporting\SCOMReports" # Source Folder
$Destination ="E:\Reporting\ZippedReports\SCOMFiles.zip" # Destination folder
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($Source, $Destination)
