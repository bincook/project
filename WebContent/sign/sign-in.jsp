<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<html>
<head>
    <title>sign-in</title>
<style>
body {
	margin: auto;
	background: #546e7a;
}

#first caption {
	size: 26px;
}

#first input[name="member_email"],
#first input[name="member_userpwd"] {
	width: 200px;
	height: 26px; 
	background: white;
	color: black;
	border-radius: 4px;
	border: none;
}

#first button[type="submit"] {
	width: 180px;
	height: 36px;
	background: #29434e;
	color: white;
	border-radius: 2px;
	border: none;
}

#second a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

<%
	if(session.getAttribute("email") != null){
%>

<table>
  <tr>
    <td>
      <%=session.getAttribute("email") %>님 
      <a href="/sign/logout.jsp">로그아웃</a>
    </td>
  </tr>
</table>
<%
	}
	else {
%>
<form method="post" action="sign-in_ok.jsp">
<table id="first" width="225px" align="center">

  <caption> 로그인</caption>
  
  <tr height="50px">
    <td align="center">
      <input type="text" name="member_email" placeholder="이메일 작성 (example@example)">
    </td>
  </tr>
  
  <tr height="50px">
    <td align="center">
      <input type="password" name="member_userpwd" placeholder="비밀번호">
    </td>
  </tr>
  
  <tr height="50px">
    <td align="center">
      <button type="submit"> 로그인</button>
    <td>
  </tr>
  
</table>
</form>

<table id="second" width="320px" align="center">

  <tr height="30px">
    <td> &nbsp; </td>
  </tr>
  
  <tr height="10px" style="background: #819ca9;" align="center">
    <td>
      <a href="sign-up.jsp"> 회원가입하기</a>
    </td>
  </tr>
  
</table>
<%
	} 
%>
</body>
</html>

