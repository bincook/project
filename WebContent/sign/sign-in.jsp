<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<html>
<head>
    <title>sign-in</title>
<style>

.login_input {
	border: 1px solid #868686 !important;
    width: 100%  !important;
    height: 36px  !important;
}
.outline {
	padding: 5px;
	margin: 0 auto;
	border: 1px solid white;
	border-radius: 15px;
	width: 240px;
}

#first caption {
	padding: 10px;
	size: 36px;
	color: white;
	font-weight: 800;
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
	border-radius: 4px;
	border: none;
}

#first button[type="submit"]:hover {
	cursor: pointer;
	font-weight: 800;
}

#second div {
	width: 120px;
	height: 30px;
	background: #819ca9;
	border-radius: 4px;
}

#second div a {
	color: black;
	line-height: 30px;
	text-decoration: none;
}

#second div:hover{
	background: #29434e;
}

#second div:hover a {
	color: white;
}

#second tr[height="10px"] {
	padding: 10px;
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
     <a href="/sign/sign-out.jsp"><%=session.getAttribute("email") %>님 로그아웃</a>
    </td>
  </tr>
</table>
<%
	}
	else {
%>

<div class="outline">
<form method="post" action="/sign/sign-in_ok.jsp">
<table id="first" align="center">

  <caption> 로그인</caption>
  
  <tr height="50px">
    <td align="center">
      <input class="login_input" type="text" name="member_email" placeholder="이메일 작성 (ID@email.com)">
    </td>
  </tr>
  
  <tr height="50px">
    <td align="center">
      <input  class="login_input" type="password" name="member_userpwd" placeholder="비밀번호">
    </td>
  </tr>
  
  <tr height="50px">
    <td align="center">
      <button type="submit"> 로그인</button>
    <td>
  </tr>
  
 <tr height="50px">
    <td align="center">
      <a href="javascript:signModal()"> 회원가입하기</a>
    <td>
  </tr>
  
</table>
</form>

</div>
<%
	} 
%>
</body>
</html>

