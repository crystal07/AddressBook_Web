<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Call</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "oodp"; // DB 비밀번호

	String phone = request.getParameter("phone");
	int received = Integer.parseInt(request.getParameter("received"));
	
	String image = request.getParameter("image");
	if (image != null && image.length()<0) image="1494942949_profile.png";
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "INSERT INTO callList(received, phone, time) VALUES(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (received==1) {
			pstmt.setString(1, "1495000013_speakin_tube_down.png");
		}
		else {
			pstmt.setString(1, "1495001619_speakin_tube_up.png");
		}
		pstmt.setString(2, phone);
		java.util.Date date = new java.util.Date();
		String date_string = date.toString();
		
		pstmt.setString(3, date_string);

		pstmt.execute();
		pstmt.close();
		
		conn.close();
		%>
	<script language=javascript>
   	self.window.alert("success");
   	history.go(-1); 
	</script>
		<%
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>

</body>
</html>