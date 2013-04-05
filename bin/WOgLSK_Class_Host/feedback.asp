<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>
<!--#include FILE="upload.inc"--> 

<% 


dim upload,file,formName,formPath 
set upload=new upload_5xSoft


CTName = upload.form("CTName")
CPName = upload.form("CPName")
cumail = upload.form("E-mail")
cuphone = upload.form("Phone")
cuclass = upload.form("Classification")
cusletter = upload.form("Newsletter")
cusmsg = upload.form("Message")
cusatt = upload.form("Supporting Material")
dl_day= upload.form("PDL_Date")
dl_mon= upload.form("PDL_Month")
dl_year= upload.form("PDL_Year")


formPath=upload.form("filepath")
if right(formPath,1)<>"/" then formPath=formPath&"/" 
for each formName in upload.file
set file=upload.file(formName)
if file.FileSize>0 then
file_rst=Server.mappath("mail_upload\"&file.FileName)
file.SaveAs file_rst
File_ex = True
else
File_ex= False
end if 
set file=nothing
next 
set upload=nothing

myemail = "contact@weborigin.co.nz"
myname = "WebOrigin"
smtpserver ="email.weborigin.co.nz"
smtpuser ="webcustomer@weborigin.co.nz"
smtppwd ="weborigin"
smtpemail ="webcustomer@weborigin.co.nz"

set jmail = server.CreateObject ("jmail.message")

jmail.From = "webcustomer@weborigin.co.nz"
jmail.FromName = CTName & "(" & CPName & ")"
jmail.ReplyTo = cumail
jmail.Subject = "Web Customer: " & CTName & "(" & CPName & ")"

jmail.Body ="Name: " & CTName & vbcrlf & vbcrlf & "Company: " & CPName & vbcrlf & vbcrlf & "E-mail: " & cumail & vbcrlf & vbcrlf & "Phone: " & cuphone & vbcrlf & vbcrlf & "Classification: " & cuclass & vbcrlf & vbcrlf & "Project Deadline: " & dl_day & " - " & dl_mon & " " & dl_year & vbcrlf & vbcrlf & "Newsletter: " & cusletter & vbcrlf & vbcrlf & "Message:" & vbcrlf & cusmsg

if File_ex=true then jmail.AddAttachment file_rst
jmail.AddRecipient myemail,myname
jmail.MailServerUserName = smtpuser
jmail.MailServerPassWord = smtppwd

isgo=jmail.Send(smtpserver)
if isgo then
Response.Redirect("http://www.weborigin.co.nz/Submit_success.html")
else
Response.Redirect("http://www.weborigin.co.nz/Submit_fail.html")
end if

jmail.Close
set jmail=nothing
%>