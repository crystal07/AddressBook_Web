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
	String sender=null;
	String receiver=null;
	String time=null;
	String organization=null;
	String content=null;
	int total=0;
	
	Connection conn=null;
	Statement stmt=null;
	Statement st=null;
	String sqlCount;
	ResultSet rs=null;
	ResultSet address_result=null;
	String address_query;
%>
<%
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/address_book"; //아이피주소와 port와 DB명을 입력합니다.
	String id = "root"; // DB USER명
	String pass = "addressbook123"; // DB 비밀번호
	conn = DriverManager.getConnection(url,id,pass);

	total = 0;
	
	try {
		stmt = conn.createStatement();
		st = conn.createStatement();

		sqlCount = "SELECT id FROM message";
		rs = stmt.executeQuery(sqlCount);

		if(rs.next()){
			total = rs.getInt(1);
		}

		rs.close();
				
		String sqlList = "SELECT * FROM message ORDER BY id DESC";
		rs = stmt.executeQuery(sqlList);
%>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
  <tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>
   <td width="50">received</td>
   <td width="379">name</td>
   <td width="379">content</td>
   <td width="73">information</td>
   <td width="7"><img src="../img/table_right.gif" width="5" height="30" /></td>
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
			receiver = rs.getString(2);
			sender = rs.getString(3);
			time = rs.getString(5);
			content = rs.getString(4);
%>

	<tr height="25" align="center">
	<td align="center"><img src="../img/" height="50" width="50"/></td>
	<%
			address_query = "SELECT * FROM address WHERE PHONE = "+receiver;
			address_result = st.executeQuery(address_query);
			if (address_result.next()) {

				organization = address_result.getString(4);
				name = address_result.getString(2);
				if (organization.length()>0) {
	%>
					<td align="center"><%=name %><h6>(<%=organization %>)</h6></td>
	<%
				}
				else {
	%> 
					<td align="center"><%=name %></td>
	<%
				}
			}
			else {
	%>
				<td align="center"><%=receiver%></td>
	<%
			}

	%>
	<td align="center"><%=time %></td>
	<td align="center"><a href="../call_list/call.jsp?phone=<%=receiver%>&received=1">call</a></td>
	<td align="center"><a href="send_message.jsp?phone=<%=receiver %>&received=1">message</a></td>
	<td align="center"><a href="../address_book/show_address.jsp?index=<%=index%>">information</a></td>
	<td align="center"><a href="delete_message_list_success.jsp?index=<%=index%>">delete</a></td>
	<td>&nbsp;</td>
	</tr>

 	<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
address_result.close();
rs.close();
stmt.close();
conn.close();
	
}

catch(SQLException e) {
	out.println( e.toString() );
}


%>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="add" OnClick="javascript:location.href='send_message.jsp?phone=null&received=-1'"></td>
   <td><input type=button value="delete" OnClick="window.location='delete_selected_address.jsp?index=<%=index%>"></td>
  </tr>
</table>
</body>
</html>