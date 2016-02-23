rem =====================================
rem Include robware/rvtools in searchpath
rem =====================================
set path=%path%;c:\program files (x86)\robware\rvtools


rem =========================
rem Set environment variables
rem =========================
set $VCServer=dcs-vcs01.uds.nuigalway.ie
set $AttachmentDir=E:\Reporting\RVToolReports
set $AttachmentFile=RVTools.xls

rem ===================
rem Start RVTools batch 
rem ===================
rvtools.exe -passthroughAuth -s %$VCServer% -c ExportAll2xls -d %$AttachmentDir% 

rem ===================
rem Call the powershell zip program.
rem ===================

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'E:\Scripts\EmailRVToolsReports-V2.ps1'"
