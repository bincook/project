<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="covid_status_city.CovidStatusCityDao" %>
<%@ page import="covid_status_city.CovidStatusCityDto" %>
<%
	request.setCharacterEncoding("utf-8");

	String city_id = request.getParameter("IssueCity_id");
	String title = request.getParameter("IssueTitle");
	String year = request.getParameter("dateYear");
	String month = request.getParameter("dateMonth");
	String day = request.getParameter("dateDay");
	String date = year + "-" + month + "-" + day; 
	String description = request.getParameter("IssueDescription");
	String link = request.getParameter("IssueLink");
	
	CovidStatusCityDao dao = new CovidStatusCityDao();
	dao.issue_insert_ok(city_id, title, date, description, link);
%>
<script>
  opener.location.reload();
  close();
</script>