<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');

*{
    padding: 0;
    margin: auto;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Source Sans Pro', sans-serif;
}
.login-container{
	width: 450px;
    height: 500px;
    padding: 40px;
    box-sizing: border-box;
    border-radius: 20px;
    box-shadow: 0 0 20px #EAEAEA;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%)
}
#login-form > input {
    width: 100%;
    height: 50px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    border: 1px #bebebe	solid;
}
#login-form > label {
  	font-weight : bold;
  	border-bottom: 20px;
}
#login-form > input::placeholder{
    color: #787878;
}
#login-form > button[type="submit"]{
	width: 200px;
	height: 40px;
    color: #fff;
    font-size: 18px;
    background-color: black;
    border-radius: 3px;
    text-align: center;
    margin: 20px 85px;
}
#login-form > div{
	padding: 0 0 20px 0;
	text-align: right;
}
#login-form > div::label{
	text-align: left;
}
.buttonCSS{
	display: inline-block;
	width: 150px;
	height: 40px;
	font-size : 13px;
    background-color: #F5FFFA;
    border-radius: 3px;
    border: 1px #A9A9A9	solid;
    text-align: center; 
    text-decoration: none;
    color : black;
    line-height: 40px;
}
</style>
</head>
<body>
  <div class="login-container">
    <span class="error id="msg"></span>
    <form action="loginAf.do" method="post" id="login-form">
      <h2>로그인</h2><br>
      <h4>아이디와 비밀번호를 입력하세요</h4><br>
      	<span id="checkId"></span>
        <input type="text" id="user_id" name="user_id" placeholder="아이디"><br>
        <input type="password" id="pwd" name="pwd" placeholder="비밀번호"><br>
        <label>
          <input type="checkbox" id="save_id">&nbsp;
          <small>아이디 저장</small>
        </label>
        <button type="submit">로그인</button>
        <div id="find">
			<label>아이디/비밀번호를 잊으셨나요?</label>&nbsp;&nbsp;&nbsp;&nbsp;       
			<a href="findMember.do" class="buttonCSS">아이디/비밀번호 찾기</a>
		</div>	
		<div id="regi">  	
       		<label>회원이 아니신가요?</label>&nbsp;&nbsp;&nbsp;&nbsp;       	   
       		<a href="register.do" class="buttonCSS">회원가입</a>  
        </div>	
 
      </form>
  </div> 
<script type="text/javascript">
window.onload = function() {
	
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 쿠키값 없으면 공백.
    var userLoginId = getCookie("userLoginId");
    document.getElementById("user_id").value = userLoginId;
	
    // ID가 있는경우 아이디 저장 체크박스 체크
    if(document.getElementById("user_id").value != ""){
    	document.getElementById("save_id").checked = true;
    }
	
    // 아이디 저장하기 체크박스 onchange
    var checkId = document.getElementById("save_id");
    
    checkId.onchange = function (event) {
        if(checkId.checked){ //checked true
            var userLoginId = document.getElementById("user_id").value;
            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
        }else{ //checked false
        	deleteCookie("userLoginId");
        }
    };
    
    // 아이디 저장하기가  눌린상태에서, ID를 입력한 경우
    var idInput = document.getElementById("ID");
    
    idInput.addEventListener("keyup", function(e) {
    	if(checkId.checked){ //checked true
        	var userLoginId = document.getElementById("ID").value;
            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
        }
     })
}
// 쿠키 저장하기
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

// 쿠키 삭제
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

// 쿠키 가져오기
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script> 

  
</body>

</html>





