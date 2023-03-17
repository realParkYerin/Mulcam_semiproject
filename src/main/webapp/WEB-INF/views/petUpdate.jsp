<%@page import="a.dto.PetDto"%>
<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	PetDto pet = (PetDto) session.getAttribute("pet");
%>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>내 반려동물 관리</title>
</head>
<body>
	<script type="text/javascript">
		// 저장된 펫 정보 없을 시 alert
		<%
		if (pet == null) {
		%>
			alert("등록된 반려동물이 없습니다. 새로 등록해주세요.");
		<%
		}
		%>
	</script>
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
		<div id="petUpdateDetail">
			<form action="petUpdateAf.do" method="post" id="frm">
				<input type="hidden" name="user_id" value="<%=login.getUser_id()%>">
				<table border="1" style="text-align: center;">
					<tr>
						<td width="100px">종</td>
						<td width="250px">
							<select id="species" name="species">
								<option value="">종을 선택해주세요</option>
								<option value="dog">강아지</option>
								<option value="cat">고양이</option>
								<option value="etc">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>
							<input type="text" value="" id="kind" name="kind">
						</td>					
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" value="" id="pet_name" name="pet_name">
						</td>
					</tr>
					<tr>
						<td>생년</td>
						<td>
							<input type="text" value="" id="pet_yy" name="pet_yy" placeholder="YYYY">
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" id="radioMale" name="gender" value="male">♂&nbsp;
							<input type="radio" id="radioFemale" name="gender" value="female">♀
						</td>
					</tr>
				</table>
				<br>
				<button type="button" id="petUpdateBtn">저장</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})

		// 저장된 펫 정보 불러오기
		<%
		if (pet != null) {
		%>
			$("#species").val("<%=pet.getSpecies()%>").prop("selected", true);
			$("#kind").val("<%=pet.getKind()%>");
			$("#pet_name").val("<%=pet.getPet_name()%>");
			$("#pet_yy").val("<%=pet.getPet_yy()%>");
			
			// gender 확인 후 해당 성별에 체크되게 함
			if ("<%=pet.getGender()%>" == "male") {
				$("#radioMale").prop("checked", true);
			} else {
				$("#radioFemale").prop("checked", true);
			}
		<%
		}
		%>
		
		// 저장
		$("#petUpdateBtn").click(function() {
			// 빈칸 조사
			if ($("#species").val() == "" || $("#kind").val() == "" || $("#pet_name").val() == "" || $("#pet_yy").val() == ""
				|| (!($("#radioMale").is(":checked")) && !($("#radioFemale").is(":checked")))) {
				alert("입력되지 않은 항목이 있습니다.")
				return;
			}
			
			$("#frm").submit();
		})
	</script>
</body>
</html>