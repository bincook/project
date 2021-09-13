<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/insert.css">
<script>
function chk_info() {
	/* 유효성 체크 */
	if(pkc.IssueCity_id.value == '0') {
		pkc.IssueCity_id.focus();
		alert("도시를 선택하지 않았습니다.");
		return;
	}
	
	if(pkc.IssueTitle.value == "") {
		pkc.IssueTitle.focus();
		alert("제목을 입력하세요");
		return;
	}
	
	if(pkc.dateDay.value == '0') {
		pkc.dateYear.focus();
		alert("삽입할 날자를 선택하세요");
		return;
	}
	
	pkc.action="issue_insert_ok.jsp";
	pkc.submit();
}
</script>
</head>
<body>
<form name="pkc" method="post">
<table>

  <caption> 관리자 입력</caption>
  
  <tr>
    <td> occurred city_name<br>
      <select name="IssueCity_id" >
      	<option value="0">없으면 인근 지역으로</option>
        <option value="18">서울</option>
        <option value="17">부산</option>
        <option value="16">대구</option>
        <option value="15">인천</option>
        <option value="14">광주</option>
        <option value="13">대전</option>
        <option value="12">울산</option>
        <option value="11">세종</option>
        <option value="10">경기</option>
        <option value="9">강원</option>
        <option value="8">충북</option>
        <option value="7">충남</option>
        <option value="6">전북</option>
        <option value="5">전남</option>
        <option value="4">경북</option>
        <option value="3">경남</option>
        <option value="2">제주</option>
      </select>
    </td>
  </tr>
  
  <tr>
    <td> title<br>
      <input type="text" name="IssueTitle" >
    </td>
  </tr>
  
  <tr>
    <td> date<br>
      <select name="dateYear">
        <option> 연도</option>
        <option value="2021">2021년</option>
        <option value="2020">2020년</option>
      </select>
      
      <select name="dateMonth">
        <option> 월</option>
<% for(int i = 1;i < 13;i++){ %>
        <option value="<%=i %>"><%=i %>월</option>
<% } %>
      </select>
      
      <select name="dateDay">
        <option value="0"> 일</option>
<% for(int j = 1;j < 32;j++){ %>
        <option value="<%=j %>"><%=j %>일</option>
<% } %>
      </select>
      
    </td>
  </tr>
  
  <tr>
    <td> description<br>
      <textarea cols="40" rows="5" name="IssueDescription"></textarea>
    </td>
  </tr>
  
  <tr>
    <td> link<br>
      <input type="text" name="IssueLink">
    </td>
  </tr>
  
  <tr>
    <td>
      <button type="button" onclick="chk_info()"> 저장</button>
    </td>
  </tr>

</table>
</form>
</body>
</html>
