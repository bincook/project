<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="clinic.ClinicReplyDto" %>
<%@page import="clinic.ClinicReplyDao" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	request.setCharacterEncoding("utf-8");
    
    
    String evaluation = request.getParameter("evaluation");
    System.out.print(evaluation);
    ClinicReplyDto cdto = new ClinicReplyDto();
    cdto.setContent(evaluation);
    cdto.setWriteday(new Date(Calendar.getInstance().getTime().getTime()));
    
    String email = (String)session.getAttribute("email");
    cdto.setEmail(email);
   
    ClinicReplyDao clinicReplyDao = new ClinicReplyDao();
    clinicReplyDao.saveclinicreply(cdto);
 %>
</body>
</html>