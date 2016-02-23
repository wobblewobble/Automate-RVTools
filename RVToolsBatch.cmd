rem #########################
rem Name	RVToolsBatch
rem By		RobWare
rem Date	November 2013
rem Version	3.6
rem #########################

rem =====================================
rem Include robware/rvtools in searchpath
rem =====================================
set path=%path%;c:\program files (x86)\robware\rvtools


rem =========================
rem Set environment variables
rem =========================
set $VCServer=<your vc server>
set $SMTPserver=<your smtp server>
set $SMTPport=<your smtp port, default = 25>
set $Mailto=<mail address>
set $Mailfrom=<mail sender address>
set $Mailsubject=<subject, example "RVTools batch report">
set $AttachmentDir=<directory name, example c:\temp>
set $AttachmentFile=<file name, example RVTools.xls>


rem ===================
rem Start RVTools batch 
rem ===================
rvtools.exe -passthroughAuth -s %$VCServer% -c ExportAll2xls -d %$AttachmentDir% -f %$AttachmentFile%


rem =========
rem Send mail
rem =========
rvtoolssendmail.exe /smtpserver %$SMTPserver% /smtpport %$SMTPport% /mailto %$Mailto% /mailfrom %$Mailfrom% /mailsubject %$Mailsubject% /attachment %$AttachmentDir%\%$AttachmentFile%
