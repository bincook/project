<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>sign-up</title>
<style>
body {
	margin: auto;
}

table h4 {
	align: left;
}

table input[type="email"],
table input[type="password"] {
	width: 280px;
	height: 31px;
	font-size: 16px;
	border: none;
}

table td {
	padding-bottom: 30px;
}

table #guard {
	border-bottom: 2px solid gray;
}

table button[type="button"] {
	width: 250px;
	height: 40px;
	border: 2px solid black;
	background: white;
	border-radius: 4px;
	font-size: 18px;
	font-weight: 700;
	cursor: pointer;
}
</style>
<script>
function pwd_check(){
	var pwd = document.pkc.member_userpwd.value;
	var pwd2 = document.pkc.member_userpwd2.value;
	if(pwd == pwd2){
		document.getElementById("pwd_check").innerHTML="<strong style='color:blue;font-size:12px'>사용가능</strong>";
		return true
	}
	else{
		document.getElementById("pwd_check").innerHTML="<strong style='color:red;font-size:12px'>사용불가능</strong>";
		return false
	}
}
function check() {
	
	var form = document.pkc
	var checked = pwd_check()
	
	console.log(checked)
	
	if (checked) {
		form.submit()
	} else {
		return alert('패스워드가 다릅니다')
	}
	
}

function chkEverything() {
	var aa = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(!pkc.member_email.value.match(aa)) {
		alert("이메일을 정확히 입력하세요");
		pkc.member_email.focus(); /* 걸린 위치로 포인트 옮기기 */
		document.getElementById("check_email").innerHTML="<strong style='color:red;font-size:12px'>이메일 양식으로 작성하세요</strong>"
		return;
	}
	
	var idStr = "admin";
	if(pkc.member_email.value.includes(idStr)) {
		pkc.member_email.focus();
		alert("포함이 불가능한 글자가 있습니다.");
		document.getElementById("check_email").innerHTML="<strong style='color:red;font-size:12px'>포함이 불가능한 글자가 있습니다.</strong>"
		return;
	}
		
	var form = document.pkc
	if(form.member_userpwd.value.length < 4){
		pkc.member_userpwd.focus();
		alert("암호는 4자리 이상으로 작성해주세요");
		document.getElementById("pwd_check").innerHTML="<strong style='color:red;font-size:12px'>암호가 4자리 미만입니다.</strong>"
		return;
	}
	

	var checked = pwd_check()
	
	if (checked) {
		form.submit()
	} 
	else {
		return alert('패스워드가 다릅니다')
	}
	
	pkc.submit();
}
</script>
</head>
<body>
<form name="pkc" method="post" action="/sign/sign-up_ok.jsp">
<table align="center" width="300">
  <caption> <h4>사용자 정보를 입력해주세요.</h4></caption>
  <tr>
    <td> 이메일<!-- 미구현 -->
      <div id="guard">
        <input type="email" name="member_email" placeholder="이메일 입력 (ID@email.com)">
      </div>
      <span id="check_email"></span>
    </td>
  </tr>
  
  <tr>
    <td> 비밀번호<br>
      <div id="guard">
        <input type="password" name="member_userpwd" placeholder="비밀번호 입력"><br>
      </div>
      <div id="guard">
        <input type="password" name="member_userpwd2" placeholder="비밀번호 재입력" onkeyup="pwd_check()">
      </div>
      <span id="pwd_check"></span>
    </td>
  </tr>

  <tr>
    <td align="center">
      <button type="button" onclick="chkEverything()">회원가입하기</button>
    </td>
  </tr>
  
</table>
</form>
</body>
</html>

