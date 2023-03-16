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
<title>내 반려동물 관리</title>
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
						<span>내 활동 관리</span>
					</a>
				</li>
				<li>
					<a href="#">
						<span>회원 탈퇴</span>
					</a>
				</li>
			</ul>
		</div>
		<div id="petUpdateDetail">
			<form action="updateAf.do" method="post" id="frm">
				<table border="1" style="width: 500px; text-align: center;">
					<tr>
						<td>종</td>
						<td>
							<select>
								<option>종을 선택해주세요</option>
								<option>강아지</option>
								<option>고양이</option>
								<option>기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>
							<input type="text" value="<%=login.getNickname()%>" id="nickname" name="nickname">
						</td>					
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" value="<%=login.getNickname()%>" id="nickname" name="nickname">
						</td>
					</tr>
					<tr>
						<td>생년</td>
						<td>
							<input type="text" value="<%=login.getEmail()%>" id="email" name="email">
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="text" value="<%=login.getImg_path()%>" id="nickname" name="nickname">
						</td>
					</tr>
				</table>
				<br>
				<button type="button" id="updateSaveBtn">저장</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>