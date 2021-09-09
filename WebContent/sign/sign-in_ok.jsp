<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sign.sign" %>
<%@ page import="sign.signDto" %>
<%
	signDto signD = new signDto();
	String email = request.getParameter("member_email");
	String pwd = request.getParameter("member_userpwd");
	signD.setEmail(email);
	signD.setPassword(pwd);
	
	sign sign = new sign();
	sign.member_login_ok(signD, session, response);

%>