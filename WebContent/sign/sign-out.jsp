<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 자체를 날리셔야 버그가 없습니다.
	// session.removeAttribute("email");
	session.invalidate();
	response.sendRedirect("/");
	// response.sendRedirect("sign-in.jsp");
%>