<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
%>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>회원정보 수정</title>
</head>
<body>
	<div>
		<div>
			<ul>
				<li>
					<a href="main.do">
						<span>메인화면으로</span>
					</a>
				</li>			
				<li>
					<a href="memberUpdate.do">
						<span>회원정보 수정</span>
					</a>
				</li>
				<li>
					<a href="petUpdate.do">
						<span>내 반려동물 관리</span>
					</a>
				</li>
				<li>
					<a href="#">
						<span id="manageMenu">내 활동 관리</span>
					</a>
					<ul id="manageSubmenu" style="display: none;">
						<li>
							<a href="postManage.do">
								<span>내 글 관리</span>
							</a>
						</li>
						<li>
							<a href="commentManage.do">
								<span>내 댓글 관리</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#">
						<span>회원 탈퇴</span>
					</a>
				</li>
			</ul>
		</div>
		<div id="updateInputPwd">
			비밀번호를 입력하세요
			<br>
			<input type="password" id="pwd" placeholder="●●●●●●●●" />
			<button type="button" id="pwdChkBtn">확인</button>
		</div>
		<div style="display: none;" id="updateDetail">
			<form action="memberUpdateAf.do" method="post" id="frm">
				<table border="1" style="width: 500px; text-align: center;">
					<tr>
						<td>이름</td>
						<td>
							<%=login.getUsername() %>
						</td>
					</tr>
					<tr>
						<td>ID</td>
						<td>
							<%=login.getUser_id()%>
							<input type="hidden" value="<%=login.getUser_id()%>" name="user_id">
						</td>					
					</tr>
					<tr>
						<td>닉네임</td>
						<td>
							<input type="text" value="<%=login.getNickname()%>" id="nickname" name="nickname">&nbsp;
							<button type="button" id="nickChkBtn">중복확인</button>
							<p id="nickCheck" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" value="<%=login.getEmail()%>" id="email" name="email">
						</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td>
							<input type="password" placeholder="●●●●●●●●" id="newPwd1">
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" placeholder="●●●●●●●●" id="newPwd2" onchange="newPwdChk()" name="pwd">
							<p id="newPwdCheck" />
						</td>
					</tr>
					<tr style="height: 100px;">
						<td>프로필 사진</td>
						<td>
							<img src="asdf">
							<input type="text" value="이미지 경로" readonly="readonly">
							<button type="button">찾아보기</button>
						</td>
					</tr>
				</table>
				<br>
				<button type="button" id="memberUpdateBtn">저장</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})
	
		// 정보 수정 메뉴 입장 시, 비밀번호 재입력 및 확인
		$("#pwdChkBtn").click(function() {
			$.ajax({
				type: "post",
				url: "pwdcheck.do",
				data: { "pwd":$("#pwd").val() },
				success: function(msg) {
					if (msg == "YES") {
						$("#updateInputPwd").hide();
						$("#updateDetail").show();
					} else {
						alert("비밀번호를 다시 확인해주세요");
					}
				},
				error : function() {
					alert("memberUpdate.jsp pwdChkBtn ajax error");
				}
			})
		})
		
		// 닉네임 중복확인
		$("#nickChkBtn").click(function() {
			// 빈칸 조사
			if ($("#nickname").val() == "" || $("#nickname").val() == null) {
				$("#nickCheck").css("color", "#ff0000");
				$("#nickCheck").text("닉네임을 입력해주세요");
				return;
			}
			
			$.ajax({
				type: "post",
				url: "nickcheck.do",
				data: { "nickname":$("#nickname").val() },
				success: function(msg) {
					if (msg == "YES") {
						$("#nickCheck").css("color", "#0000ff");
						$("#nickCheck").text("사용할 수 있는 닉네임입니다");
					} else {
						$("#nickCheck").css("color", "#ff0000");
						$("#nickCheck").text("사용중인 닉네임입니다");
					}
				},
				error : function() {
					alert("memberUpdate.jsp nickChkBtn ajax error");
				}
			})
		})
		
		// 새 비밀번호 확인
		function newPwdChk() {
			if ($("#newPwd1").val() == $("#newPwd2").val()) {
				$("#newPwdCheck").text("");
				return;
			} else {
				$("#newPwdCheck").css("color", "#ff0000");
				$("#newPwdCheck").text("비밀번호를 다시 확인해주세요");
				$("#newPwd1").val("");
				$("#newPwd2").val("");
			}
		}
		
		// 각 항목 변경 여부 체크
		let isNickChanged = 0;
		let isEmailChanged = 0;
		let isPwdChanged = 0;
		let isPhotoChanged = 0;
		
		// 닉네임
		$("#nickname").change(function() {
			isNickChanged = 1;
			if ($("#nickname").val() == '<%=login.getNickname()%>') {
				isNickChanged = 0;
			}
		})
		
		// 이메일
		$("#email").change(function() {
			isEmailChanged = 1;
			if ($("#email").val() == '<%=login.getEmail()%>') {
				isEmailChanged = 0;
			}
		})
		
		// 비밀번호
		$("#newPwd2").change(function() {
			isPwdChanged = 1;
			if ($("#newPwd2").val() == null || $("#newPwd2").val() == "") {
				isPwdChanged = 0;
			}
		})
		
		// 프사
		
		
		// 변경 여부 체크 끝
		
		// 수정 사항 저장
		$("#memberUpdateBtn").click(function() {
			if (isNickChanged == 0 && isEmailChanged == 0 && isPwdChanged == 0) {
				alert("변경 사항이 없습니다");
				return;
			}
			
			// 닉네임 수정 후 중복확인 미 실시 혹은 중복된 닉네임일 경우 alert
			if (isNickChanged > 0 && ($("#nickCheck").html() == "" || $("#nickCheck").html() == "사용중인 닉네임입니다")) {
				alert("닉네임을 확인해주세요");
				return;
			}
			
			$("#frm").submit();
		})
	</script>
</body>
</html>