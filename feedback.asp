<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>
<!--#include FILE="upload.inc"--> 

<%
function recaptcha_confirm(privkey,rechallenge,reresponse)
	' Test the captcha field 
	Dim VarString 
	VarString = _ 
			"privatekey=" & privkey & _ 
			"&remoteip=" & Request.ServerVariables("REMOTE_ADDR") & _ 
			"&challenge=" & rechallenge & _ 
			"&response=" & reresponse 
	Dim objXmlHttp 
	Set objXmlHttp = Server.CreateObject("Msxml2.ServerXMLHTTP") 
	objXmlHttp.open "POST", "http://api-verify.recaptcha.net/verify", False 
	objXmlHttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" 
	objXmlHttp.send VarString 
	Dim ResponseString 
	ResponseString = split(objXmlHttp.responseText, vblf) 
	Set objXmlHttp = Nothing 
	if ResponseString(0) = "true" then 
	  'They answered correctly 
	   recaptcha_confirm = True
	else
	  'They answered incorrectly 
	   recaptcha_confirm = False
	end if
end function

function recaptchaCheck(rechallenge,reresponse)
	dim strPrivateKey
	strPrivateKey="6Ld14ggAAAAAAJHioWDRI6jey2Wm5-D7ei9ZN7S2"
	recaptchaCheck=recaptcha_confirm(strPrivateKey,rechallenge,reresponse)
end function
%>

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


if recaptchaCheck(upload.form("recaptcha_challenge_field"),upload.form("recaptcha_response_field")) = False then
	Response.Write("<script language=""JavaScript"">")
	Response.Write("alert('Wrong Captcha!');")
	Response.Write("history.back(-1);")
	Response.Write("</script>")
	Response.End()
end if


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


sTemail = "contact@weborigin.co.nz"
' sTemail = "leask@weborigin.co.nz"
sTname = "WebOrigin"

Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Host = "mx.hosting.isx.net.nz" ' Required
Mail.Port = 25 
Mail.From = "webcustomer@weborigin.co.nz" ' Required
Mail.FromName = CTName & "(" & CPName & ")" ' Optional
Mail.Username = "webcustomer@weborigin.co.nz"
Mail.Password = "weborigin"
Mail.AddAddress sTemail, sTname
Mail.AddReplyTo cumail, CTName
Mail.Subject = "Web Customer: " & CTName & "(" & CPName & ")"
Mail.Body = "Name: " & CTName & vbcrlf & vbcrlf & "Company: " & CPName & vbcrlf & vbcrlf & "E-mail: " & cumail & vbcrlf & vbcrlf & "Phone: " & cuphone & vbcrlf & vbcrlf & "Classification: " & cuclass & vbcrlf & vbcrlf & "Project Deadline: " & dl_day & " - " & dl_mon & " " & dl_year & vbcrlf & vbcrlf & "Newsletter: " & cusletter & vbcrlf & vbcrlf & "Message:" & vbcrlf & cusmsg
if File_ex=true then Mail.AddAttachment file_rst

Mail.Send


'del file
dim fsoDF
set fsoDF = createobject("scripting.filesystemobject")
if fsoDF.FileExists(file_rst)=true then
	fsoDF.deletefile(file_rst)
end if
set fsoDF = nothing


If Err <> 0 Then
	Response.Write "An error occurred: " & Err.Description
	Response.Redirect("http://www.weborigin.co.nz/Submit_fail.html")
End If


Response.Redirect("http://www.weborigin.co.nz/Submit_success.html")
%>