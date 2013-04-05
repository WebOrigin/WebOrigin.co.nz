<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>
<!--#include FILE="upload.inc"--> 

<% 


dim upload,file,formName,formPath 
set upload=new upload_5xSoft

cumail = upload.form("E-mail")
cusletter = upload.form("Newsletter")

sTemail = "contact@weborigin.co.nz"
' sTemail = "leask@weborigin.co.nz"
sTname = "WebOrigin"


Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Host = "mx.hosting.isx.net.nz" ' Required
Mail.Port = 25 
Mail.From = "webcustomer@weborigin.co.nz" ' Required
Mail.FromName = cumail ' Optional
Mail.Username = "webcustomer@weborigin.co.nz"
Mail.Password = "weborigin"
Mail.AddAddress sTemail, sTname
Mail.AddReplyTo cumail
Mail.Subject = "Subscribe: " & cumail
Mail.Body = "E-mail: " & cumail & vbcrlf & vbcrlf & "Newsletter: " & cusletter
if File_ex=true then Mail.AddAttachment file_rst

Mail.Send


If Err <> 0 Then
	Response.Write "An error occurred: " & Err.Description
	Response.Redirect("http://www.weborigin.co.nz/Submit_fail.html")
End If


Response.Redirect("http://www.weborigin.co.nz/subscribe_success.html")
%>