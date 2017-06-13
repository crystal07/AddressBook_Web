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
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "oodp"; // DB 비밀번호
	
	String receiver = request.getParameter("receiver").toString();
	String sender = request.getParameter("sender").toString();
	String cont = request.getParameter("content").toString();
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "INSERT INTO message(receiver, sender, content, time) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, receiver);

		pstmt.setString(2, sender);
		
		pstmt.setString(3, cont);
		java.util.Date date = new java.util.Date();
		String date_string = date.toString();
		
		pstmt.setString(4, date_string);

		pstmt.execute();
		pstmt.close();
		
		conn.close();
		%>
	<script language=javascript>
   	self.window.alert("success");
   	history.go(-2); 
	</script>
		<%
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>
</body>
</html>