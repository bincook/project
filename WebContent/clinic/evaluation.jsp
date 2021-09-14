<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="clinic.ClinicReplyDto" %>
<%@page import="clinic.ClinicReplyDao" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.Calendar" %>

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


<script>
	alert('댓글이 등록 되었습니다.');
	location.href = '/clinic/clinic.jsp';
</script>