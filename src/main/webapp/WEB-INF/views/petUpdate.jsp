<%@page import="a.dto.PetDto"%>
<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	PetDto pet = (PetDto) session.getAttribute("pet");
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
<title>내 반려동물 관리</title>
<style type="text/css">
th {
	text-align: center;
}
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
.form-control {
	width: 300px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jsp" %>
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
					<a class="nav-link active" href="petUpdate.do">
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
		<div align="center">
			<div class="card mt-3" style="width: 700px;">
				<div id="petUpdateDetail" class="card-body">
					<form action="petUpdateAf.do" method="post" id="frm">
						<input type="hidden" name="user_id" value="<%=login.getUser_id()%>">
						<table class="table table-bordered">
							<tr>
								<th scope="row" width="305px">종</th>
								<td>
									<select id="species" name="species" class="custom-select">
										<option value="">종을 선택해주세요</option>
										<option value="dog">강아지</option>
										<option value="cat">고양이</option>
										<option value="etc">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">종류</th>
								<td>
									<input type="text" value="" id="kind" name="kind" class="form-control">
								</td>					
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" value="" id="pet_name" name="pet_name" class="form-control">
								</td>
							</tr>
							<tr>
								<th scope="row">생년</th>
								<td>
									<input type="text" value="" id="pet_yy" name="pet_yy" placeholder="YYYY" class="form-control">
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<input type="radio" id="radioMale" name="gender" value="male">♂&nbsp;&nbsp;&nbsp;
									<input type="radio" id="radioFemale" name="gender" value="female">♀
								</td>
							</tr>
						</table>
						<br>
						<button type="button" id="petUpdateBtn" class="btn btn-primary">저장</button>
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
 <%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>