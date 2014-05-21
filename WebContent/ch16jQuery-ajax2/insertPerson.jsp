<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String address = request.getParameter("address");
	String bloodType = request.getParameter("bloodType");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbcUrl = "jdbc:oracle:thin:@192.168.0.10:1521:orcl";
	String dbId = "scott";
	String dbPass = "tiger";
	int cnt = 0;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "insert into people(id,name,job,address,bloodtype) values (?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(++cnt, id);
		pstmt.setString(++cnt, name);
		pstmt.setString(++cnt, job);
		pstmt.setString(++cnt, address);
		pstmt.setString(++cnt, bloodType);
		
		pstmt.executeUpdate();
		
		%>
		{"result":"success"}
		<%
		
	}catch(Exception e){
		e.printStackTrace();
		%>
		{"result":"failure"}
		<%
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
	
	
%>