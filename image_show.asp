<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
dim id_sv
dim tx_img
id_sv = Request.QueryString("id")
if id_sv>8 then id_sv=1
if id_sv<1 then id_sv=8
tx_img="images/" & id_sv & ".jpg"	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web Origin Design - Image Show</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
<script type="text/javascript">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
</head>

<body>
<form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="500" colspan="7" align="center"><img src=<%=tx_img%> /></td>
  </tr>
  <tr>
    <td width="200" align="center" background="elements/web_orgin_13.png" class="menu_text"><a href="image_show.asp?id=<%=id_sv-1%>">&lt;&lt;Previous</a></td>
    <td width="2"><img src="elements/web_orgin_15.png" width="2" height="20" /></td>
    <td width="200" align="center" background="elements/web_orgin_13.png" class="menu_text" onfocus="MM_callJS('window.close();')">Close</td>
    <td width="2"><img src="elements/web_orgin_15.png" width="2" height="20" /></td>
    <td width="200" align="center" background="elements/web_orgin_13.png" class="menu_text"><a href="image_show.asp?id=<%=id_sv+1%>">Next&gt;&gt;</a></td>
  </tr>
</table>
</form>
</body>
</html>
