<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="covid_status_city.CovidStatusCityDao" %>
<%@ page import="covid_status_city.CovidStatusCityDto" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/delete.css">
<style>
	.fixed_headers {
		 table-layout: fixed;
		 border-collapse: collapse;
		 width: 100%;
	}
	.fixed_headers th, .fixed_headers td {
		 padding: 8px;
		 text-align: left;
	}
	
	.fixed_headers th {
		background-color: #333;
		 color: #FDFDFD;
	}

	 .fixed_headers thead {
		 background-color: #333;
		 color: #FDFDFD;
	}
	 .fixed_headers thead tr {
		 display: block;
		 position: relative;
	}
	 .fixed_headers tbody {
		 display: block;
		 overflow: auto;
		 width: 100%;
	}
	.fixed_headers tbody tr {
		width: 100%;	
	}
	 .fixed_headers tbody tr:nth-child(even) {
		 background-color: #DDD;
	}
</style>
<script>
function get_date(n) {
	location = 'issue_delete.jsp?year=' + [n];
	
}

function get_date1(n){
	var parsedUrl = new URL(window.location.href);

	parsedUrl.searchParams.set('month', n)
	location.href = parsedUrl.href
}
</script>
</head>
<body>
<table class="fixed_headers">
<%
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	if (yearStr == null) {
		yearStr = "0";
	}
	
	if (monthStr == null) {
		monthStr = "0";
	}
	
	if(yearStr == null || monthStr == null){
%>
  <tr>
    <td colspan="4"> <h3>삭제할 날짜</h3><br>
      <select name="dateYear" onchange="javascript:get_date(this.value)">
        <option value="0" <% if ("0".equals(yearStr)) { %>selected<% } %>> 연도</option>
        <option value="2021" <% if ("2021".equals(yearStr)) { %>selected<% } %>>2021년</option>
        <option value="2020" <% if ("2020".equals(yearStr)) { %>selected<% } %>>2020년</option>
      </select>
      
      <select name="dateMonth" onchange="javascript:get_date1(this.value)">
        <option value="0" <% if ("0".equals(yearStr)) { %>selected<% } %>> 월</option>
	<% for(int i = 1;i < 13;i++){ %>
		<%
			if (Integer.parseInt(monthStr) == i) {
		%>
			<option value="<%=i %>" selected><%=i %>월</option>
		<% } else { %>
        	<option value="<%=i %>"><%=i %>월</option>
        <% } %>
	<% } %>
      </select>

    </td>
  </tr>
  
  <!-- 해당 달의 이슈 모두 보기 -->
<%
	}
	else {
%>
  <tr>
    <td colspan="4"> <h3>삭제할 날짜</h3><br>
      <select name="dateYear" onchange="javascript:get_date(this.value)">
        <option value="0" <% if ("0".equals(yearStr)) { %>selected<% } %>> 연도</option>
        <option value="2021" <% if ("2021".equals(yearStr)) { %>selected<% } %>>2021년</option>
        <option value="2020" <% if ("2020".equals(yearStr)) { %>selected<% } %>>2020년</option>
      </select>
      
      <select name="dateMonth" onchange="javascript:get_date1(this.value)">
        <option value="0" <% if ("0".equals(yearStr)) { %>selected<% } %>> 월</option>
	<% for(int i = 1;i < 13;i++){ %>
		<%
			if (Integer.parseInt(monthStr) == i) {
		%>
			<option value="<%=i %>" selected><%=i %>월</option>
		<% } else { %>
        	<option value="<%=i %>"><%=i %>월</option>
        <% } %>
	<% } %>
      </select>

    </td>
  </tr>
<% 
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		
		CovidStatusCityDao dao = new CovidStatusCityDao();
		ArrayList<CovidStatusCityDto> list = dao.issue_list(year, month);
%>
  <tr>
    <th> 날짜</th>
    <th> 도시</th>
    <th> 제목</th>
    <th> 삭제</th>
  </tr>

<% 
		for(int j = 0;j < list.size();j++){
%>  
  <tr>
    <td class="no"> <%=list.get(j).getOccurrence_date() %></td>
    <td class="no"> <%=list.get(j).getName_ko() %></td>
    <td class="no"> <%=list.get(j).getTitle() %></td>
    <td class="no"> 
      <a href="issue_delete_ok.jsp?issue_id=<%=list.get(j).getIssue_id() %>">삭제</a>
    </td>
  </tr>
<%
		}
	}
%>
</table>

</body>
</html>