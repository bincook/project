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

table button[type="submit"] {
	width: 250px;
	height: 50px;
	border: 2px solid black;
	border-radius: 4px;
	font-size: 22px;
	text-align: center;
	background: #eeeeee;
	line-height: 50px;
}

table button[type="button"] {
	width: 100px;
	height: 20px;
	border: 3px solid black;
	background: white;
	border-radius: 5px;
	font-size: 11px;
	line-height: 20px;
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
		return;
	}
	
	var idStr = "admin";
	if(pkc.member_email.value.includes(idStr)) {
		pkc.member_email.focus();
		alert("admin이 포함된 이메일을 작성하지 마세요");
		return;
	}
		
	var form = document.pkc
	if(form.member_userpwd.value.length < 4){
		pkc.member_userpwd.focus();
		alert("암호는 4자리 이상으로 작성해주세요");
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
<form name="pkc" method="post" action="sign-up_ok.jsp">
<table align="center" width="300">
  <caption> <h4>사용자 정보를 입력해주세요.</h4></caption>
  <tr>
    <td> 이메일 <button type="button" onclick="email_check()">중복확인</button><br>
      <div id="guard">
        <input type="email" name="member_email" placeholder="이메일 입력 (example@example)">
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

