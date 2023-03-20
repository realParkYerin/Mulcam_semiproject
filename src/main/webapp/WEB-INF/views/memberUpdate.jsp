<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 부트스트랩 CSS 파일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery 스크립트 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>회원정보 수정</title>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<div>
			<ul class="nav nav-pills">
				<li class="nav-item">
					<a class="nav-link" href="main.do">
						메인화면으로
					</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link active" href="memberUpdate.do">
						회원정보 수정
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="petUpdate.do">
						내 반려동물 관리
					</a>
				</li>
				<li>
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="manageMenu" role="button" data-toggle="dropdown" aria-expanded="false">
							내 활동 관리
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="postManage.do">내 글 관리</a></li>
							<li><a class="dropdown-item" href="commentManage.do">내 댓글 관리</a></li>
						</ul>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="delMember.do">
						회원 탈퇴
					</a>
				</li>
			</ul>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div id="updateInputPwd">
					<p class="mb-1">비밀번호를 입력하세요</p>
					<div class="input-group mb-3">
						<input type="password" class="form-control" id="pwd" placeholder="●●●●●●●●" />
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" id="pwdChkBtn">확인</button>
						</div>
					</div>
				</div>
				<div style="display: none;" id="updateDetail">
					<form action="memberUpdateAf.do" method="post" id="frm" enctype="multipart/form-data">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th scope="row">이름</th>
									<td><%=login.getUsername() %></td>
								</tr>
								<tr>
									<th scope="row">ID</th>
									<td>
										<%=login.getUser_id()%>
										<input type="hidden" value="<%=login.getUser_id()%>" name="user_id">
									</td>					
								</tr>
								<tr>
									<th scope="row">닉네임</th>
									<td>
										<input type="text" value="<%=login.getNickname()%>" id="nickname" name="nickname">&nbsp;
										<button type="button" id="nickChkBtn" class="btn btn-sm btn-secondary">중복확인</button>
										<p id="nickCheck" />
									</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<input type="text" value="<%=login.getEmail()%>" id="email" name="email">
									</td>
								</tr>
								<tr>
									<th scope="row">새 비밀번호</th>
									<td>
										<input type="password" placeholder="●●●●●●●●" id="newPwd1">
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인</th>
									<td>
										<input type="password" placeholder="●●●●●●●●" id="newPwd2" onchange="newPwdChk()" name="pwd">
										<p id="newPwdCheck" />
									</td>
								</tr>
								<tr>
									<th scope="row">프로필 사진</th>
									<td>
										<img src="<%=request.getContextPath() + "/memberImgs/" + login.getImg_path()%>" id="memberImg" width="100px">
										<input type="file" id="newMemImg" name="newMemImg" accept="image/*">
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<button type="button" id="memberUpdateBtn" class="btn btn-primary">저장</button>
					</form>
				</div>
			</div>
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
		
		// 중복확인 여부
		let isNickChecked = 0;
		
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
			
			// 중복확인 여부 반영
			isNickChecked = 1;
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
		let isImgChanged = 0;
		
		// 닉네임
		$("#nickname").change(function() {
			isNickChanged = 1;
			if ($("#nickname").val() == "<%=login.getNickname()%>") {
				isNickChanged = 0;
				isNickChecked = 0;
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
		
		// 프사 변경 시 미리보기, 변경 여부 반영
		$("#newMemImg").on("change", function(event) {
			// 취소 눌러 파일이 선택되지 않았을 경우
			if (event.target.files[0] == null) {
				$("#memberImg").attr("src", "<%=request.getContextPath() + "/memberImgs/" + login.getImg_path()%>");
				isImgChanged = 0;
				return;
			}
			
			$("#isImgReset").attr("value", "n");
			
			var file = event.target.files[0];
	
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$("#memberImg").attr("src", e.target.result);
			}

			reader.readAsDataURL(file);
			
			// 변경 여부 반영
			isImgChanged = 1;
		});
		
		// 수정 사항 저장
		$("#memberUpdateBtn").click(function() {
			if (isNickChanged == 0 && isEmailChanged == 0 && isPwdChanged == 0 && isImgChanged == 0) {
				alert("변경 사항이 없습니다");
				return;
			}
			
			// 닉네임이 빈칸이거나, 중복 확인을 안 했거나, 중복된 닉네임일 경우 return
			if ($("#nickname").val() == "" || isNickChecked == 0 || $("#nickCheck").html() == "사용중인 닉네임입니다") {
				alert("닉네임을 확인해주세요");
				return;
			}
			
			$("#frm").submit();
		})
	</script>
</body>
</html>