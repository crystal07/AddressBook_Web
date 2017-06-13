<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message</title>
</head>
<body>
<%!
	int index=-1;
	String name=null;
	String phone=null;
	String img=null;
	String organization=null;
	String email=null;
	String memo=null;
	int total=0;
	
	Connection conn=null;
	Statement stmt=null;
	String sql;
%>

<%
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "oodp"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);

	total = 0;
	
	try {
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement();

		sql = "DELETE FROM message";
		stmt.executeUpdate(sql);
	
		stmt.close();
		conn.close();
		%>
		<script language="javascript">
		self.window.alert("success");
		location.href="message_list.jsp"; 
		</script>
	<%	
	}
	catch (SQLException e) {
		out.println( e.toString() );
	}
%>
</body>
</html>