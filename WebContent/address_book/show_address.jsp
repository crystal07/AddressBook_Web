<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	int total=0;
	
	Connection conn=null;
	Statement stmt=null;
	String sqlCount;
	ResultSet rs=null;
	String received="1";
%>

<%
	phone = request.getParameter("phone").toString();

 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "addressbook123"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);

	total = 0;
	
	try {
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement();

		sqlCount = "SELECT * FROM address WHERE phone="+phone;
		rs = stmt.executeQuery(sqlCount);
		
		if (rs.next()) {
			index = rs.getInt(1);
			name = rs.getString(2);
			phone = rs.getString(3);
			organization = rs.getString(4);
			email = rs.getString(5);
			memo = rs.getString(6);
			image = rs.getString(7);
		}
	 	else {
			%>
			<script language="javascript">
				alert("Not Found");
				history.back(-1);
			</script>
			<%
		} 
		rs.close();
		stmt.close();
		conn.close();
	}
	catch(SQLException e) {
		out.println( e.toString() );

		%>
		<script language="javascript">
			alert("Not Found");
			history.back(-1);
		</script>
		
		<% 
	}
%>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>
      <td>Address Information</td>
      <td width="5"><img src="../img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="100%">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="75"></td>
      <td width="100%" height="40%"><img src="../img/<%=image %>"></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="left" width="76">name</td>
      <td width="100%"><%=name %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="left" width="76">organization</td>
      <td width="100%"><%=organization %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="left" width="76">phone</td>
      <td width="100%"><%=phone %></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="left" width="76">e-mail</td>
      <td width="100%"><%=email %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td width="100%" colspan="2" height="300"><%=memo %></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>

    </table>
   </td>
  </tr>
 </table>


<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="left">
   <td align="left"><input type=image img src="../img/1497225458_user_profile_edit.png" width=75 height=75 value="edit" OnClick="javascript:location.href='edit_address.jsp?index=<%=index%>'">
   <input type=image img src="../img/1494942932_General_-_Office_36.png" width=75 height=75 value="delete" OnClick="window.location='delete_address_success.jsp?index=<%=index%>'">
   <input type=image img src="../img/1494953831_5302_-_Whatsapp.png" width=75 height=75 value="call" OnClick="window.location='../call_list/call.jsp?received=<%=received %>&phone=<%=phone%>'">
   <input type=image img src="../img/1494953845_5368_-_Wechat.png" width=75 height=75 value="message" OnClick="window.location='../message_list/send_message.jsp?received=<%=received %>&phone=<%=phone%>'"></td>
  </tr>
</table>

</body>
</html>