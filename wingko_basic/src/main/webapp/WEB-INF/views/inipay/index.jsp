<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>TX5.0(신TX) 전자지불 시스템 데모</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="css/group.css" type="text/css">
<style>
body, tr, td {font-size:9pt; font-family:굴림,verdana; color:#433F37; line-height:19px;}
table, img {border:none}

/* Padding ******/ 
.pl_01 {padding:1 10 0 10; line-height:19px;}

/* Link ******/ 
.a:link  {font-size:9pt; color:#ECF4FF; text-decoration:none}
.a:visited { font-size:9pt; color:#ECF4FF; text-decoration:none}
.a:hover  {font-size:9pt; color:#FFFFFF; text-decoration:underline}

.txt_03a:link  {font-size: 8pt;line-height:18px;color:#333333; text-decoration:none}
.txt_03a:visited {font-size: 8pt;line-height:18px;color:#333333; text-decoration:none}
.txt_03a:hover  {font-size: 8pt;line-height:18px;color:#EC5900; text-decoration:underline}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#242424" leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0><center>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      
    <td align="center" valign="middle"><table width="632" height="296" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" background="img/index2.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="10%" height="130">&nbsp;</td>
                <td width="90%">&nbsp;</td>
              </tr>
              <tr> 
                <td align="right"><img src="img/icon04.gif" width="7" height="12" hspace="3" vspace="3"></td>
                <td height="25"><font color="ECF4FF"><b><a href="start.do" class="a">INIpay50 - 결제요청</a></b> 
								</td>
              </tr>
              <tr>
                <td align="right"><img src="img/icon04.gif" width="7" height="12" hspace="3" vspace="3"></td>
                <td height="25"><font color="ECF4FF"><b><a href="cancel.do" class="a">INIpay50 - 취소요청</a></b> 
								</td>
              </tr>
              <tr>
                <td align="right"><img src="img/icon04.gif" width="7" height="12" hspace="3" vspace="3"></td>
                <td height="25"><font color="ECF4FF"><b><a href="receipt.do" class="a">INIpay50 - 현금영수증</a></b> 
								</td>
              </tr>
              
            </table></td>
        </tr>
      </table> </td>
    </tr>
  </table>
</body>
</html>
