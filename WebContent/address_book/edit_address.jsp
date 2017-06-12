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
		alert("input number");
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
<%!
	int index=-1;
	String name=null;
	String phone=null;
	String image=null;
	String organization=null;
	String email=null;
	String memo=null;
	
	Connection conn=null;
	Statement stmt=null;
	String sqlCount;
	ResultSet rs=null;
%>

<%
	index = Integer.parseInt(request.getParameter("index"));
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "addressbook123"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);
	
	try {
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement();

		
		String sql = "SELECT * FROM address WHERE id="+index;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			index = rs.getInt(1);
			name = rs.getString(2);
			phone = rs.getString(3);
			organization = rs.getString(4);
			email = rs.getString(5);
			memo = rs.getString(6);
			image = rs.getString(7);
		}
		
		rs.close();
		stmt.close();
		conn.close();

	}
	catch(SQLException e) {
		out.println( e.toString() );
	}

%>

<table>
	<form name=writeform method=post action="edit_address_success.jsp?index=<%=index %>">
	<tr>
		<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
			<td width="5"><img src="./img/table_left.gif" width="5" height="30" /></td>
			<td>edit address</td>
			<td width="5"><img src="./img/table_right.gif" width="5" height="30" /></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>&nbsp;</td>
				<td align="center">image</td>
				<td><input name="image" size="50" maxlength="100" value="<%=image%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">name</td>
				<td><input name="name" size="50" maxlength="100" value=<%=name %>></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">organization</td>
				<td><input name="organization" size="50" maxlength="50" value=<%=organization %>></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">phone number</td>
				<td><input name="phone" size="50" maxlength="50" value=<%=phone %>></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">e-mail</td>
				<td><input name="e-mail" size="50" maxlength="50" value=<%=email %>></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">memo</td>
				<td><textarea name="memo" cols="50" rows="13" value=<%=memo %>></textarea></td>
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