<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	String name = request.getParameter("name"); /* 큰따옴표(문자열) */
	String age = request.getParameter("age");
%>
이름 : <%=name%><br>
나이 : <%=age%><br>