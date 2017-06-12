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
<table>
  <tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
    <td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>  
	<td align="left" width="40%"><img src="../img/1494968790_book.png" width="50" height="30"/>Address Book</td>
	<td align="center" width="20%"><a href="../address_book/address_book.jsp">Address</a></td>
	<td align="center" width="20%"><a href="../call_list/call_list.jsp">Call</a></td>
	<td align="center" width="20%"><a href="../message_list/message_list.jsp">Message</a></td>
	<td width="5"><img src="../img/table_right.gif" width="5" height="30" /></td>
  </tr>
</table>
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
	String sqlList;
	ResultSet rs=null;
%>
<%
	String searched =  request.getParameter("keyword");
	String object = request.getParameter("object");
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "addressbook123"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);

	total = 0;
	
	try {
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement();

		sqlCount = "SELECT id FROM address";
		rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		
		if (object.equals("phone")) {
			sqlList="SELECT * FROM address WHERE phone like '%"+searched+"%' ORDER BY name ASC, phone ASC";
		}
		else {
			sqlList="SELECT * FROM address WHERE name like '%"+searched+"%' ORDER BY name ASC, phone ASC";
		}
		rs = stmt.executeQuery(sqlList);	
%>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
  <tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>
   <td width="5%">&nbsp;</td>
   <td width="15%">name</td>
   <td width="45%">phone</td>
   <td width="35%">&nbsp;</td>
   <td width="5"><img src="../img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 <tr align="center" bgcolor="#FFFFFF" height="30">
	 <td colspan="6">No Data</td>
	 </tr>
<%
	 }
	 else {	
		while(rs.next()) {
			index = rs.getInt(1);
			name = rs.getString(2);
			phone = rs.getString(3);
			organization = rs.getString(4);
			image = rs.getString(7);
%>

	<tr height="25" align="center">
	<td align="left"><img src="../img/<%=image %>" height=50 width=50/></td>
	<%
	if (organization.length()>0) {
	%>
	<td align="center" width="15%"><%=name %> (<%=organization %>)</td>
	<%
	}
	else {
	%> 
	<td align="center" width="15%"><%=name %></td>
	<%
	}
	%>
	<td align="center" width="45%"><%=phone%></td>
	<td align="right" width="35%"><a href="show_address.jsp?phone=<%=phone%>"><img src="../img/1494942926_General_-_Office_37.png" width="50" height="50"/></a>
	<a href="../call_list/call.jsp?phone=<%=phone %>&received=1"><img src="../img/1494953831_5302_-_Whatsapp.png" width="50" height="50"/></a>
	<a href="../message_list/send_message.jsp?phone=<%=phone %>"><img src= "../img/1494953845_5368_-_Wechat.png" width="50" height="50"/></a>
	<a href="delete_address_success.jsp?index=<%=index%>"><img src = "../img/1494942932_General_-_Office_36.png" width="50" height="50"/></a></td>
	
	<td>&nbsp;</td>
	</tr>
 	<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
}
catch(SQLException e) {
	out.print(e.toString());
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 <table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="back" OnClick="javascript:history.back(-1)"></td>
  </tr>
</table>
</body>
</html>