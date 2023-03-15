<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
*{
    padding: 0;
    margin: auto;
    border: none;
}
body{
    font-size: 14px;
    font-family: sans-serif;
}
.regi-container{
	width: 450px;
    height: 900px;
    padding: 40px;
    box-sizing: border-box;
    border-radius: 20px;
    box-shadow: 0 0 20px #EAEAEA;
}
.regi-container > h3{
	font-size: 28px;
    margin-bottom: 20px;
}
#regi-form > .chk, #regi_user_id > #user_id, #regi_nickname > #nickname {
    width: 100%;
    height: 50px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    border: 1px #bebebe	solid;
}
#regi-form > label, #regi_user_id > label, #regi_nickname > label {
  font-weight : bold;
}
#regi_user_id, #regi_nickname{
	position: relative;
}
#regi_user_id > #idChkBtn, #regi_nickname > #nicknameChkBtn{
	position: absolute;
  	width: 90px;
  	height: 40px;
  	top: 2px;
  	bottom: 0;
  	right: 5px;
  	margin: auto 0;
  	border-radius: 6px;
  	background-color: black;
  	color: #fff;
}
#regi-form > input::placeholder{
    color: #787878;
}
#regi-form > button[type="submit"]{
	width: 200px;
	height: 40px;
    color: #fff;
    font-size: 18px;
    background-color: black;
    border-radius: 3px;
    margin-top: 20px;
    margin: auto;
    display:block;
    text-align: center;
}
</style>
</head>
<body>

<div class="regi-container">
<h3>회원가입</h3>
<p>HAPPY TAILS에 오신 것을 환영합니다.<br>회원이 되어 반려동물을 소개해주세요!</p>
<br><br>

<!-- 파일 업로드 위해 enctype 설정 -->
<form action="registerAf.do" method="post" enctype="multipart/form-data" id="regi-form">

<div id="regi_user_id">
	<label>아이디</label>&nbsp;<span id="checkId"></span>
	<input type="text" required="required" id="user_id" name="user_id" class="chk" placeholder="아이디 입력(6 ~ 20자)">
	<input type="button" id="idChkBtn" value="중복확인">
	
</div>

<label>비밀번호</label>&nbsp;<span id="checkPwd1"></span>
<input type="password" required="required" id="pwd" name="pwd" class="chk" placeholder="비밀번호 입력(숫자,영문 포함 8 ~ 20자)"><br>

<label>비밀번호 확인</label>&nbsp;<span id="checkPwd2"></span>
<input type="password" required="required" id="pwdChk" name="pwdChk" class="chk" placeholder="비밀번호 재입력"><br>

<label>이름</label>&nbsp;<span id="checkName"></span>
<input type="text" required="required" id="username" name="username" class="chk" placeholder="이름 입력"><br>

<label>이메일</label>&nbsp;<span id="checkEmail"></span>
<input type="text" required="required" id="email" name="email" class="chk" placeholder="이메일 주소"><br>

<div id="regi_nickname">
	<label>닉네임</label>&nbsp;<span id="checkNickname"></span>
	<input type="text" required="required" id="nickname" name="nickname" class="chk" placeholder="닉네임 입력">
	<input type="button" id="nicknameChkBtn" value="중복확인">
</div>

<label>프로필 사진 등록</label><br>
<!-- 이미지만 업로드하게 제한하기 위해 accept property 추가 -->
<!-- input=file의 name은 controller의 MultipartFile 객체가 선언되는 이름과 같아야 함 : 500 에러 주의 -->
<input type="file" accept="image/*" name="memberImg"><br>

<button type="submit" id="regiBtn">회원등록</button>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	let validateCheck = {
	    "user_id" : false,
	    "pwd" : false,
	    "pwdChk" : false,
	    "username" : false,
	    "email" : false,
	    "nickname" : false
	}
	
	// 아이디 유효성 검사
	$("#user_id").on("input", function(){
	    let regExp = /^[a-zA-Z0-9]{6,20}$/;
	    let id = $("#user_id").val();
	    
	    // test(string) 함수는 인자로 전달된 문자열이 정규표현식의 패턴과 일치하면 true를 리턴하며 그렇지 않으면 false를 리턴
	    if(!regExp.test(id)){ 
	        $("#checkId").text("숫자, 영문을 포함한 6 ~ 20자로 입력해주세요.").css("color", "red");
	        validateCheck.id = false;
	    } else{
	        $("#checkId").text("정확한 아이디 형식입니다.").css("color", "green");
	    }
	});
	
	// 아이디 중복확인 버튼 클릭
	$("#idChkBtn").click(function() {	
		// 공백 상태
		if($("#user_id").val().trim() == ''){
			$("#checkId").text("아이디를 입력해주세요.").css("color", "red");
			validateCheck.id = false;
			return;
		}
		
		// 중복확인
		$.ajax({
			type:"post",
			url:"idcheck.do",
			data:{ "user_id":$("#user_id").val() },
			success:function(msg){				
				if(msg == "YES"){
					$("#checkId").text("사용할 수 있는 아이디입니다.").css("color", "green");
					validateCheck.id = true;
				}else{
					$("#checkId").text("사용중인 아이디입니다.").css("color", "red");
					$("#user_id").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
	
	// 비밀번호 유효성 검사 & 일치검사
	$("#pwd, #pwdChk").on("input", function(){
	    let regExp =  /^[a-zA-Z0-9]{8,20}$/;
	    let pwd1 = $("#pwd").val();		// 비밀번호
	    let pwd2 = $("#pwdChk").val();	// 비밀번호 확인
	    
	    if(!regExp.test(pwd1)){ 
	        $("#checkPwd1").text("숫자, 영문을 포함한 8 ~ 20자로 입력해주세요.").css("color", "red");
	        validateCheck.pwd = false;
	    } else{
	        $("#checkPwd1").text("정확한 비밀번호 형식입니다.").css("color", "green");
	        validateCheck.pwd = true;
	    }
	    
		// 비밀번호가 유효하지 않은 상태(입력은 되었지만 형식이 맞지 않음)에서 비밀번호 확인 작성시
		if(!validateCheck.pwd && pwd2.length > 0){ // length가 1 이상인 경우는 해당 객체가 존재한다는 의미로 if문 내의 코드를 작동시킨다.
			$("#checkPwd2").text("정확한 비밀번호를 먼저 작성해주세요.").css("color", "red");
	        $("#pwdChk").val(""); // 비밀번호 확인에 입력한 값 공백으로
	        $("#pwd").focus();	// 비밀번호 입력 칸으로 이동
	    }
		else{	// 비밀번호와 비밀번호 확인 일치 검사
	    	if(pwd1.length == 0 || pwd2.length == 0){ // 비밀번호를 입력하지 않은 상태(length == 0)에서 비밀번호 확인 작성
	    		$("#checkPwd2").text("");
	    	} else if(pwd1 == pwd2){ // 일치
	    		$("#checkPwd2").text("비밀번호가 일치합니다.").css("color", "green");
	    		validateCheck.pwdChk = true;
	    	} else{ // 불일치
	    		$("#checkPwd2").text("비밀번호가 일치하지 않습니다.").css("color", "red");
	    		validateCheck.pwdChk = false;
	    	}
	    }
		
	});
		
		// 이름 유효성 검사
		$("#username").on("input", function(){
		    let regExp = /^[가-힣a-zA-Z]{2,}$/; // 한글 + 영문 2자 이상
		
		    let name = $("#username").val();
		    if(!regExp.test(name)){
		        $("#checkName").text("이름 형식이 유효하지 않습니다.").css("color", "red");
	            validateCheck.name = false;
		    }else {
		        $("#checkName").text("정확한 이름 형식입니다.").css("color", "green");
	            validateCheck.name = true;
		    }
	});
				
		// 이메일 유효성 검사
		$("#email").on("input", function() {
			let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			let email = $("#email").val();
			if(!regExp.test(email)){
				$("#checkEmail").text("이메일 형식에 맞춰서 입력해주세요.").css("color", "red");
		        validateCheck.email = false;
		    } else{
		        $("#checkEmail").text("정확한 이메일 형식입니다.").css("color", "green");
		        validateCheck.email = true;
		    }
	});
		
		// 닉네임 유효성 검사
		$("#nickname").on("input", function(){
		    let regExp = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/; // 문자열에 한글, 영어, 숫자만 있는지 확인
		    let id = $("#nickname").val();
		    
		    // test(string) 함수는 인자로 전달된 문자열이 정규표현식의 패턴과 일치하면 true를 리턴하며 그렇지 않으면 false를 리턴
		    if(!regExp.test(id)){ 
		        $("#checkNickname").text("닉네임은 한글, 숫자, 영문만 입력해주세요.").css("color", "red");
		        validateCheck.nickname = false;
		    } else{
		        $("#checkNickname").text("정확한 닉네임 형식입니다.").css("color", "green");
		    }
	});
		
		// 닉네임 중복확인 버튼 클릭
		$("#nicknameChkBtn").click(function() {	
			// 공백 상태
			if($("#nickname").val().trim() == ''){
				$("#checkNickname").text("닉네임을 입력해주세요.").css("color", "red");
				validateCheck.nickname = false;
				return;
			}
			
			// 중복확인
			$.ajax({
				type:"post",
				url:"nicknamecheck.do",
				data:{ "nickname":$("#nickname").val() },
				success:function(msg){				
					if(msg == "YES"){
						$("#checkNickname").text("사용할 수 있는 닉네임입니다.").css("color", "green");
						validateCheck.nickname = true;
					}else{
						$("#checkNickname").text("사용중인 닉네임입니다.").css("color", "red");
						$("#nickname").val("");
					}
				},
				error:function(){
					alert('error');
				}
		});
	});
		
});

</script>

</body>
</html>