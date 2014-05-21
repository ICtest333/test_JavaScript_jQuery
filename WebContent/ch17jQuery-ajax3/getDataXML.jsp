<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*"%>
<?xml version="1.0" encoding="UTF-8"?>
<items>
<%
String jdbcUrl = "jdbc:oracle:thin:@192.168.0.10:1521:orcl";
String dbId = "scott";
String dbPass = "tiger";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	String sql = "select * from item";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
		<item>
			<code><%= rs.getInt("code")%></code>
			<name><%= rs.getString("name")%></name>
			<quantity><%= rs.getInt("quantity")%></quantity>
			<price><%= rs.getInt("price")%></price>
		</item>	
<%	
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null)try{rs.close();}catch(SQLException e){}
	if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
	if(conn!=null)try{conn.close();}catch(SQLException e){}
}
%>
</items>