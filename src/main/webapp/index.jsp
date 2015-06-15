<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%
Context ctx = (Context) new InitialContext().lookup("java:/comp/env");
DataSource ds = (DataSource) ctx.lookup("jdbc/storeDB");

Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("SELECT username FROM users");
ResultSet rs = pstmt.executeQuery();

while(rs.next()) {
	String username = rs.getString(1);
	out.print(username);
}
%>
<html>
<body>
<h2>Hello World!</h2>
</body>
</html>
