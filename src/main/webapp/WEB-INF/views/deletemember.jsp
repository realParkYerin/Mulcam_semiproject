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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 부트스트랩 CSS 파일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery 스크립트 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>회원 탈퇴</title>
<style type="text/css">
@font-face {
	font-family: 'Katuri';
	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/Katuri.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
body{
   font-size: 14px;
   font-family: Katuri, sans-serif;
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
					<a class="nav-link" href="memberUpdate.do">
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
					<a class="nav-link active" href="delMember.do">
						회원 탈퇴
					</a>
				</li>
			</ul>
		</div>
		<div class="card mt-3">
			<div class="card-body" style="text-align: center;">
				<form action="delMemberAf.do" id="frm">
					<p>회원 탈퇴 시, 모든 개인정보가 삭제되며 되돌릴 수 없습니다.</p>
					<p>탈퇴하시겠습니까?</p>
					<br>
					<button type="button" id="delMemBtn" class="btn btn-primary">회원 탈퇴</button>
					<input type="hidden" name="user_id" value="<%=login.getUser_id()%>">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})
		
		// 회원 탈퇴
		$("#delMemBtn").click(function() {
			frm.submit();
		})
	</script>
</body>
</html>