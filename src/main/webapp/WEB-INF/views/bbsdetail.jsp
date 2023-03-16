<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="a.dto.FreePostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-8 mx-auto">
			<%
				FreePostDto dto = (FreePostDto)request.getAttribute("bbsdto");
				
				// 작성일 저장
				Date date = dto.getWdate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
				String dateString = sdf.format(date);
			%>
			<h3>자유게시판</h3>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"><%=dto.getTitle() %></h5>
					<table class="table table-borderless">
						<tbody>
							<tr>
								<td><%=dto.getuser_id() %></td> <%-- 작성자 --%>
								<td><%=dateString %></td>	<%-- 작성일 --%>
								<td>조회수 : <%=dto.getReadcount() %></td>	<%-- 조회수 --%>
							</tr>
							<tr>
								
								<td colspan="3"><pre><%=dto.getContent() %></pre></td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-primary" onclick="bbslist()">글 목록</button>
				</div>
			</div>
			
			<script type="text/javascript">
			function bbslist(){
				location.href = "bbslist.do";
			}
			</script>
		</div>
	</div>
</div>

<%-- 아래부터는 댓글 작성예정 --%>


