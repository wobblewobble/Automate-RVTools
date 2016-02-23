# Variables
$ZipFolder =  "E:\Reporting\ZippedReportsRVTools" # zip locations
$ReportFolder = "E:\Reporting\RVToolReports" #RVTools Report Folder
# $files_to_transfer = New-Object System.Collections.ArrayList #list of zipped files to be transferred over FTP

# clear out the zip location folder. Change to Zip Folder and delet the file type
cd $ZipFolder
remove-item *.zip
#remove-item *.txt
#remove-item *.7z

#Zip the Files
$ZipFileName = "RVToolsFiles-{0:yyyyMMdd-HHmm}.zip" -f (Get-Date)
$Source = "E:\Reporting\RVToolReports" # Source Folder
$Destination ="E:\Reporting\ZippedReportsRVTools\$ZipFileName" # Destination folder
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($Source, $Destination)



#Connection Details
$smtpServer = “SMTP Server”
$msg = new-object Net.Mail.MailMessage

#Change port number for SSL to 587
$smtp = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 

#Uncomment Next line for SSL  
#$smtp.EnableSsl = $true

# Credentials not needed
#$smtp.Credentials = New-Object System.Net.NetworkCredential( $username, $password )

#From Address
$msg.From = "RVTools@emailaddress.com"
#To Address, Copy the below line for multiple recipients or add , as below
$msg.To.Add(“email1@email.com,email3@email.com,email3@email.com”)

#Message Body
$msg.Body=”RVTools Reports attached. See attached Zip files for details”

#Message Subject
$msg.Subject = “RVTools Reports”

#your file location
$files=Get-ChildItem “E:\Reporting\ZippedReportsRVTools”

Foreach($file in $files)
{
Write-Host “Attaching File :- ” $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList E:\Reporting\ZippedReportsRVTools\$file
$msg.Attachments.Add($attachment)
}

$smtp.Send($msg)
$attachment.Dispose();
$msg.Dispose();