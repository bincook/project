<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sign.sign" %>
<%@ page import="sign.signDto" %>
<%
	signDto signD = new signDto();
	signD.setEmail(request.getParameter("member_email"));
	signD.setPassword(request.getParameter("member_userpwd"));
	
	sign sign = new sign();
	sign.member_login_ok(signD, session, response);

%>