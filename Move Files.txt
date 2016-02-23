# Move files based on a date
# http://stackoverflow.com/questions/5912051/move-files-older-then-31-days-to-another-drive

Function Move {
  #Moves all files older than 31 days old from the Source folder to the Target 
  Get-Childitem -Path "E:\source" | Where-Object { $_.LastWriteTime -lt (get-date).AddDays(-31)} |
  ForEach {
    Move-Item $_.FullName -destination "F:\target" -force -ErrorAction:SilentlyContinue
  }
}