<%@page import="a.dto.FreeCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	List<FreeCommentVO> comment = (List) session.getAttribute("comment");
	String sortOption = (String) request.getParameter("sortOption");
	if (sortOption == null) {
		sortOption = "new";
	}
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
<title>내 댓글 관리</title>
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
						<a class="nav-link dropdown-toggle active" href="#" id="manageMenu" role="button" data-toggle="dropdown" aria-expanded="false">
							내 활동 관리
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="postManage.do">내 글 관리</a></li>
							<li><a class="dropdown-item active" href="commentManage.do">내 댓글 관리</a></li>
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
		<div>
			<br>
			<form action="sortComment.do" method="get" id="frm">
				<select id="sortOption" name="sortOption" class="custom-select">
					<option value="new">최신순</option>
					<option value="old">오래된 순</option>
				</select>
				&nbsp;&nbsp;
				<button type="button" id="sortCmtBtn" class="btn btn-primary">검색</button>
			</form>
			<br>
		</div>
		<div>
			<table class="table table-bordered" style="text-align: center;">
				<tr id="myComment">
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		// 정렬 시 select에서 해당 옵션 유지
	    $("#sortOption").val("<%=sortOption%>");
	    $("#sortOption").attr("selected", "selected");
	
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})
		
		// 정렬
		$("#sortCmtBtn").click(function() {
			$("#frm").submit();
			
			<%
			comment = (List) request.getAttribute("sortComment");
			%>
		})
		
		// 내 댓글 출력
		<%
		if (comment == null) {
			%>
			let commentRow = "";
			commentRow += "<tr>";
			commentRow += "	<td colspan='4' align='center'>";
			commentRow += "		조건을 선택 후 검색 버튼을 눌러주세요.";
			commentRow += "	</td>";
			commentRow += "</tr>";
			$("#myComment").after(commentRow);
			<%
		} else {
			%>
			let commentRow = "";
			<%
			if (comment.size() == 0) {
				%>
				alert("작성된 댓글이 없습니다.");
				<%
			} else {
				for (int i = 0; i < comment.size(); i++) {
					%>
					commentRow = "";
					commentRow += "<tr>";
					commentRow += "	<td>";
					commentRow += "		<%=comment.get(i).getCmt_content() %>";
					commentRow += "	</td>";
					commentRow += "	<td>";
					commentRow += "		<%=comment.get(i).getReg_cmtdate() %>";
					commentRow += "	</td>";
					commentRow += "</tr>";
					$("#myComment").after(commentRow);
					<%
				}
			}
		}
		%>
	</script>
</body>
</html>