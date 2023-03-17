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
<title>내 댓글 관리</title>
</head>
<body>
	<div>
		<div>
			<ul>
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
	</div>
	<script type="text/javascript">
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})

	</script>
</body>
</html>