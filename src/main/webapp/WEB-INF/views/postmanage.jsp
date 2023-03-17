<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="a.dto.FreePostDto"%>
<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	List<FreePostDto> post = (List) session.getAttribute("post");
%>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>내 글 관리</title>
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
		<div>
			<table border="1" width="300px">
				<tr>
					<th>게시판 구분</th>
					<th>제목</th>
					<th>댓글</th>
					<th>좋아요</th>
				</tr>
				<!-- 이 행 위로 추가되게 함. 빈 행이므로 숨김 처리 -->
				<tr id="myPost" style="display: none;"></tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		// 내 활동 관리 클릭 시 마다 show / hide 토글
		$("#manageMenu").click(function() {
			$("#manageSubmenu").toggle();
		})

		// 내 글 출력
		<%
		if (post == null) {
			%>
			let noPostRow = "";
			noPostRow += "<tr>";
			noPostRow += "	<td colspan='4' align='center'>";
			noPostRow += "		작성된 글이 없습니다.";
			noPostRow += "	</td>";
			noPostRow += "</tr>";
			$("#myPost").before(noPostRow);
			<%
		} else {
			%>
			let postRow = "";
			postRow += "<tr>";
			postRow += "	<td>";
			postRow += "		<%=post.get(0).getBbs_seq() %>";
			postRow += "	</td>";
			postRow += "	<td>";
			postRow += "		<%=post.get(0).getContent() %>";
			postRow += "	</td>";
			postRow += "	<td>";
			postRow += "		<%=post.get(0).getCmtcount() %>";
			postRow += "	</td>";
			postRow += "	<td>";
			postRow += "		<%=post.get(0).getLikecount() %>";
			postRow += "	</td>";
			postRow += "</tr>";
			$("#myPost").before(noPostRow);
			<%
		}
		%>
	</script>
</body>
</html>