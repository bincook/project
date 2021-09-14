<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="covid_status_city.covid_status_cityDao" %>
<%@ page import="covid_status_city.covid_status_cityDto" %>
<%
	request.setCharacterEncoding("utf-8");
	String issue_id = request.getParameter("issue_id");
	
	covid_status_cityDao dao = new covid_status_cityDao();
	dao.issue_delete_ok(issue_id);
%>
<script>
  opener.location.reload();
  close();
</script>