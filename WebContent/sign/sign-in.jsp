<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
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

#first input[name="member_userid"],
#first input[name="member_userpwd"] {
	width: 150px;
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

<form method="post" action="sign-in_ok.jsp">
<table id="first" width="225px" align="center">

  <caption> 로그인</caption>
  
  <tr height="50px">
    <td align="center">
      <input type="text" name="member_userid" placeholder="아이디">
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
      <a href=""> 아이디 찾기</a>
      |
      <a href=""> 비밀번호 찾기</a>
      |
      <a href="sign-up.jsp"> 회원가입하기</a>
    </td>
  </tr>
  
</table>
</body>
</html>

