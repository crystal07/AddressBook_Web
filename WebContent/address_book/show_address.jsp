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
%>

<%
	index = Integer.parseInt(request.getParameter("index"));

 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "addressbook123"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);

	total = 0;
	
	try {
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement();

		sqlCount = "SELECT * FROM address WHERE id="+index;
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
		</script>
		
		<% 
	}
%>

name is <%=name %>
Phone number is <%=phone %>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="edit" OnClick="javascript:location.href='edit_address.jsp?index=<%=index%>'"></td>
   <td><input type=button value="delete" OnClick="window.location='delete_address_success.jsp?index=<%=index%>'"></td>
   <td><input type=button value="call" OnClick="window.location='call.jsp?index=<%=index %>'"></td>
   <td><input type=button value="message" OnClick="window.location='send_message.jsp?index=<%=index %>'"></td>
  </tr>
</table>

</body>
</html>