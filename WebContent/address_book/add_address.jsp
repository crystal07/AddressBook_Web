<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script language = "javascript">
function writeCheck() {
	var form = document.writeform;
	if (!form.name.value) {
		alert("input name");
		form.name.focus();
		return;
	}
	if (!form.phone.value) {
		alert("input phone number");
		form.phone.focus();
		return;
	}
	if (isNaN(form.phone.value)) {
		alert("input number by using number only");
		form.phone.focus();
		return;
	}

	form.submit();
}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Book</title>
</head>
<body>

	<table>
	<form name=writeform method=post action="add_address_success.jsp" >
	<tr>
		<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
			<td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>
			<td>add address</td>
			<td width="5"><img src="../img/table_right.gif" width="5" height="30" /></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>&nbsp;</td>
				<td align="center">image</td>
				<td><input name="image" size="50" maxlength="100"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">name</td>
				<td><input name="name" size="50" maxlength="100"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">organization</td>
				<td><input name="organization" size="50" maxlength="50"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">phone number</td>
				<td><input name="phone" size="50" maxlength="50"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">e-mail</td>
				<td><input name="e-mail" size="50" maxlength="50"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">memo</td>
				<td><textarea name="memo" cols="50" rows="13"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td></tr>
				<tr height="1" bgcolor="#82B5DF">
				<td colspan="4"></td>
			</tr>
			<tr align="center">
				<td>&nbsp;</td>
				<td colspan="2">
					<input type=button value="submit" OnClick="javascript:writeCheck();">
					<input type=button value="cancel" OnClick="javascript:history.back(-1)">
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	</form>
	</table>
</body>
</html>