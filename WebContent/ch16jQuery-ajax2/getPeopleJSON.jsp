<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*" %>
[
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String jdbcUrl = "jdbc:oracle:thin:@192.168.0.10:1521:orcl";
String dbId = "scott";
String dbPass = "tiger";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	String sql = "select * from people order by id asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString("id");
		String name = rs.getString("name");
		String job = rs.getString("job");
		String address = rs.getString("address");
		String bloodType = rs.getString("bloodtype");
		
		if(rs.getRow()>1){
			out.print(",");
		}
		%>
		{
			"id":"<%=id %>",
			"name":"<%=name %>",
			"job":"<%=job %>",
			"address":"<%=address %>",
			"bloodType":"<%=bloodType %>"
		}
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
]