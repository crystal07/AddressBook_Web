<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Book</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "oodp"; // DB 비밀번호

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String organization = request.getParameter("organization");
	String email = request.getParameter("email");
	String memo = request.getParameter("memo");
	String image = request.getParameter("image").toString();
	if (image != null || image.length()<0) image="1494942955_user.png";
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "INSERT INTO address(name, phone, organization, email, memo, image) VALUES(?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, organization);
		pstmt.setString(4, email);
		pstmt.setString(5, memo);
		pstmt.setString(6, image);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
		%>
	<script language=javascript>
   	self.window.alert("success");
   	location.href="address_book.jsp"; 
	</script>
		<%
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>

</body>
</html>