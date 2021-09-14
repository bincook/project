<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="covid_status_city.CovidStatusCityDao" %>
<%@ page import="covid_status_city.CovidStatusCityDto" %>
<%
	request.setCharacterEncoding("utf-8");
	String issue_id = request.getParameter("issue_id");
	
	CovidStatusCityDao dao = new CovidStatusCityDao();
	dao.issue_delete_ok(issue_id);
%>
<script>
	alert('삭제 했습니다');
  	opener.location.reload();
  	close();
</script>