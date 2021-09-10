<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sign.sign" %>
<%@ page import="sign.signDto" %>
<%
	request.setCharacterEncoding("utf-8");
	signDto signD = new signDto();
	signD.setEmail(request.getParameter("member_email"));
	signD.setPassword(request.getParameter("member_userpwd"));
	
	sign sign = new sign();
	sign.insert_user_info(signD);
	
	response.sendRedirect("sign-in.jsp");
%>