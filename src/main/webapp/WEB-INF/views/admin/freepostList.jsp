<%@page import="a.dto.FreePostDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Free Post List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<style type="text/css">
.table th, .table td {
	text-align: center;
	vertical-align: middle!important;
}
</style>

</head>
<body bgcolor="#e9e9e9">
<%
List<FreePostDto> list = (List<FreePostDto>)request.getAttribute("bbslist");
int pageBbs = (Integer)request.getAttribute("pageBbs");
int pageNumber = (Integer)request.getAttribute("pageNumber");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
%>

<h2>게시판 목록 - 자유게시판</h2>
<div align="center">
<table class="table table-hover table-sm" style="width: 1300px">
<col width="70"><col width="100"><col width="100"><col width="150"><col width="70">
<col width="70"><col width="100"><col width="300"><col width="300">
<tr class="bg-primary" style="color: white;">
	<th>번호</th>
	<th>게시글 번호</th>
	<th>아이디</th>
	<th>제목</th>
	<th>조회수</th>
	<th>좋아요 수</th>
	<th>댓글 수</th>
	<th>등록일(게시글 등록일)</th>
	<th>삭제 여부</th>
</tr>
<tbody>
<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="9">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	for(int i =0; i <list.size(); i++)
		{
			FreePostDto dto = list.get(i);
	%>
	<tr>
		<th><%=i + 1 + (pageNumber * 10) %></th>
		
		<td style="text-align: left;">
		<%
			if(dto.isDel() == false){
				%>
					<font color="#ff0000">*** 이 글은 관리자에 의해서 삭제되었습니다 ***</font>					
				<%
			}	
			%>
			</td>
			
		<th><%=i + 1 %></th>
		<td><%=dto.getBbs_seq() %></td>
		<td><%=dto.getuser_id() %></a></td>
		<td><a href="bbsdetail.do?seq=<%=dto.getBbs_seq() %>"><%=dto.getTitle() %></td>
		<td><%=dto.getReadcount() %></td>
		<td><%=dto.getLikecount() %></td>
		<td><%=dto.getCmtcount() %></td>
		<td><%=dto.getWdate() %></td>
		<td><%=dto.isDel() %></td>
	</tr>
<%
	}
}
%>
</tr>
</tbody>
</table>

<div align="center">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select class="custom-select" id="choice" name="choice">
				<option selected>선택</option>
				<option value="title">제목</option>
				<option value="writer">작성자(아이디)</option>
				<!-- <option value="nickname"></option> -->
			</select>
		</td>
		<td style="padding-left: 5px" class="align-middle">
			<input type="text" class="form-control" id="search" name="search" placeholder="검색어" value="<%=search %>">
		<td style="padding-left: 5px">
			<span>
				<!-- <button type="button" class="btn btn-primary" onclick="searchBtn()">검색</button> -->
				<input type="submit" value="검색">
			</span>
		</td>
	</tr>
</table> 
</div>
</div>

<br>
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center"></ul>
    </nav>
</div>

<script type="text/javascript">
/* 검색 */
let search = "<%=search %>";
console.log("search = " + search);
if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
}

function enterKeyEvent() {
	if(window.event.keyCode==13){
		searchBtn();
	}
}

function searchBtn() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbs/list.do?choice=" + choice + "&search=" + search;
}

$('#pagination').twbsPagination({
	startPage: <%=pageNumber+1 %>, 
    totalPages: <%=pageBbs %>,
    visiblePages: 10,
    first:'<span srid-hidden="true">«</span>',
    prev:"이전",
    next:"다음",
    last:'<span srid-hidden="true">»</span>',
    initiateStartPageClick:false,   // onPageClick 자동실행되지 않도록
    onPageClick: function (event, page) {
        // alert(page);
        let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
    	location.href = "bbs/list.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
    }
});
</script>
</body>
</html>