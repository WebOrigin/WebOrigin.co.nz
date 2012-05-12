<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>
<!--#include FILE="upload.inc"--> 

<% 


dim upload,file,formName,formPath 
set upload=new upload_5xSoft

cumail = upload.form("E-mail")
cusletter = upload.form("Newsletter")

myemail = "contact@weborigin.co.nz"
myname = "WebOrigin"
smtpserver ="email.weborigin.co.nz"
smtpuser = "webcustomer@weborigin.co.nz"
smtppwd = "weborigin"
smtpemail = "webcustomer@weborigin.co.nz"

set jmail = server.CreateObject ("jmail.message")

jmail.From = "webcustomer@weborigin.co.nz"
jmail.FromName = cumail
jmail.ReplyTo = cumail
jmail.Subject = "Subscribe: " & cumail

jmail.Body ="E-mail: " & cumail & vbcrlf & vbcrlf & "Newsletter: " & cusletter

jmail.AddRecipient myemail,myname
jmail.MailServerUserName = smtpuser
jmail.MailServerPassWord = smtppwd

isgo=jmail.Send(smtpserver)

Response.Redirect("http://www.weborigin.co.nz/subscribe_success.html")

jmail.Close
set jmail=nothing
%>