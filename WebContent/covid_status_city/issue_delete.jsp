<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="covid_status_city.covid_status_cityDao" %>
<%@ page import="covid_status_city.covid_status_cityDto" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/delete.css">
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
<table>
<%
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	if(yearStr == null || monthStr == null){
%>
  <tr>
    <td colspan="4"> <h3>������ ��¥</h3><br>
      <select name="dateYear" onchange="javascript:get_date(this.value)">
        <option value="0"> ����</option>
        <option value="2021">2021��</option>
        <option value="2020">2020��</option>
      </select>
      
      <select name="dateMonth" onchange="javascript:get_date1(this.value)">
        <option value="0"> ��</option>
<% for(int i = 1;i < 13;i++){ %>
        <option value="<%=i %>"><%=i %>��</option>
<% } %>
      </select>

    </td>
  </tr>
  
  <!-- �ش� ���� �̽� ��� ���� -->
<%
	}
	else {
%>
  <tr>
    <td colspan="4"> <h3>������ ��¥</h3><br>
      <select name="dateYear" onchange="javascript:get_date(this.value)">
        <option value="0"> ����</option>
        <option value="2021">2021��</option>
        <option value="2020">2020��</option>
      </select>
      
      <select name="dateMonth" onchange="javascript:get_date1(this.value)">
        <option value="0"> ��</option>
<% for(int i = 1;i < 13;i++){ %>
        <option value="<%=i %>"><%=i %>��</option>
<% } %>
      </select>

    </td>
  </tr>
<% 
		int year = Integer.parseInt(yearStr);
		int month = Integer.parseInt(monthStr);
		
		covid_status_cityDao dao = new covid_status_cityDao();
		ArrayList<covid_status_cityDto> list = dao.issue_list(year, month);
%>
  <tr>
    <th> ��¥</th>
    <th> ����</th>
    <th> ����</th>
    <th> ����</th>
  </tr>

<% 
		for(int j = 0;j < list.size();j++){
%>  
  <tr>
    <td class="no"> <%=list.get(j).getOccurrence_date() %></td>
    <td class="no"> <%=list.get(j).getName_ko() %></td>
    <td class="no"> <%=list.get(j).getTitle() %></td>
    <td class="no"> 
      <a href="issue_delete_ok.jsp?issue_id=<%=list.get(j).getIssue_id() %>">����</a>
    </td>
  </tr>
<%
		}
	}
%>
</table>

</body>
</html>