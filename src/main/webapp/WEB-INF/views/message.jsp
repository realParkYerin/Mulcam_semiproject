<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 세션 만료 시 메시지 출력
String sessionOut = (String)request.getAttribute("sessionOut");
if(sessionOut != null && !sessionOut.equals("")){
		%>
		<script type="text/javascript">
		alert("로그아웃 되었습니다.");
		location.href = "main.do";
		</script>
		<%
}

// 회원 정보 수정 후 세션 종료 및 메시지 출력
String updateMsg = (String) request.getAttribute("updateMsg");
if (updateMsg != null && !updateMsg.equals("")) {
	if (updateMsg.equals("UPDATE_SUCCESS")) {
		%>
		<script type="text/javascript">
			alert("회원 정보가 수정되었습니다. 다시 로그인 해 주십시오.");
			<%
				session.invalidate();
			%>
			location.href ="login.do";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("오류가 발생하였습니다 : UPDATE_FAIL");
			location.href = "myPage.do";
		</script>
		<%
	}
}

//회원가입 후 메세지 출력
String register = (String)request.getAttribute("register");
if(register != null && !register.equals("")){
	if(register.equals("MEMBER_ADD_YES")){
		%>
		<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("가입되지 않았습니다 다시 가입해 주십시오");
		location.href = "register.do";
		</script>
		<%		
	}
}

// 내 반려동물 등록/수정 후 메시지 출력
String petUpdateMsg = (String) request.getAttribute("petUpdateMsg");
if (petUpdateMsg != null && !petUpdateMsg.equals("")) {
	if (petUpdateMsg.equals("UPDATE_PET_SUCCESS")) {
		%>
		<script type="text/javascript">
			alert("확인되었습니다. 정보 반영을 위해 다시 로그인 해 주세요.");
			<%
			session.invalidate();
			%>
			location.href ="login.do";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("오류가 발생하였습니다 : " + "<%=petUpdateMsg%>");
			location.href = "petUpdate.do";
		</script>
		<%
	}
}
//로그인 후 메세지 출력
String login = (String)request.getAttribute("login");
if(login != null && !login.equals("")){
	if(login.equals("LOGIN_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 로그인되었습니다");
		location.href = "main.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("아이디나 비밀번호를 다시 한 번 확인해주세요");
		location.href = "login.do";
		</script>
		<%		
	}
}

// 회원 탈퇴 후 메시지 출력
String delMemMsg = (String) request.getAttribute("delMemMsg");
if (delMemMsg != null && !delMemMsg.equals("")) {
	if (delMemMsg.equals("DELETE_SUCCESS")) {
		%>
		<script type="text/javascript">
			alert("회원 탈퇴되었습니다.");
			<%
			session.invalidate(); // 세션 삭제
			%>
			location.href = "login.do";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("오류가 발생하였습니다 : " + "<%=delMemMsg%>");
			location.href = "delMember.do";
		</script>
		<%
	}
}
%>




