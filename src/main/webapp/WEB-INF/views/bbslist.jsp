<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="a.dto.FreePostDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 추후에 번호랑 상단에 th태그들 없애고 이미지 있는경우 첫번째 이미지를 대표 이미지로 보이게 한다음
  	   내용들은 content내용 일부만 보이게 수정해볼 생각입니다.. -->  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

</head>
<body bgcolor="#e9e9e9">

<%
List<FreePostDto> list = (List<FreePostDto>)request.getAttribute("bbslist");
int pageBbs = (Integer)request.getAttribute("pageBbs");
int pageNumber = (Integer)request.getAttribute("pageNumber");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
%>


<!-- 이미지 뿌려주기 추가해야합니다. -->
<h1>게시판</h1>
<hr>
<!-- 변수 임시확인용도 -->
<!-- <p><%=pageBbs  %>|<%=pageNumber %>|<%=choice %>|<%=search %><p>  -->
<div align="center">

<table class="table table-hover table-sm" style="width: 1000px">
<col width="70"><col width="600"><col width="100"><col width="150">
<thead class="thead-dark">
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>
</thead>
<tbody>

<%
if(list == null || list.size() == 0){
    %>
    <tr>
        <td colspan="4">작성된 글이 없습니다</td>
    </tr>
    <%
    /* 이미지경로 이렇게 불러오지말고 추후에 controller에서 이미지경로를 반환하는 xml쿼리문을 model에 추가해서 가져오도록 수정. */
    /* 파지네이션과 검색이 초기설정이 되지 않는 오류 있음. */
}else{	
    
        for(int i = 0;i < list.size(); i++)
        {
            FreePostDto dto = list.get(i);
            	%>
            <tr>
                <th><%=i + 1 + (pageNumber * 10) %></th>
                
                <%
                if(dto.isDel() == 0){
                    %>
                    <td>	<!-- 조회수 로직은 bbsdetail과 관련된 Dao에서 추가로 서비스 호출하도록 작성하겠습니다. -->
                        <a href="bbsdetail.do?bbs_seq=<%=dto.getBbs_seq() %>">
                            <%=dto.getTitle() %>
                        </a>
                    </td>            
                    <%
                }else if(dto.isDel() == 1){
                    %>
                    <td>
                        <font color="#ff0000">*** 이 글은 삭제되었습니다 ***</font>    
                    </td>
                    <%
                }   
                %>
                
                <td><%=dto.getReadcount() %></td>
                <td><%=dto.getuser_id() %></td>
            </tr>
            <%
        }

}
%>


</tbody>
</table>

<br>







<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center"></ul>
    </nav>
</div>

<br><br>
<div class="form-row align-items-center d-flex justify-content-center align-items-center container">
<select id="choice">
	<option value="">검색</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<div class="col-sm-2 my-1">
	<input type="text" id="search" class="form-control"  value="<%=search %>">
</div>

<button type="button" onclick="searchBtn()" class="btn btn-primary">검색</button>
</div>



<br><br>
<button type="button" onclick="wrtieBtn()"class="btn btn-primary">글쓰기</button>
</div>

<script type="text/javascript">

let search = "<%=search %>";
console.log("search = " + search);

if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
}

function searchBtn() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	

	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search;
}

function wrtieBtn(){
	/*
		세션검사해서 세션 있으면, bbswrite.do로 이동, 없으면 로그인해달라고 alert
	*/ 
	location.href = "bbswrite.do"; 
}

function goPage( pageNumber ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;	
}





$('#pagination').twbsPagination({
	startPage: <%=pageNumber+1 %>,
    totalPages: <%=pageBbs%>,
    visiblePages: 10,
    first:'<span srid-hidden="true">«</span>',
    prev:"이전",
    next:"다음",
    last:'<span srid-hidden="true">»</span>',
    initiateStartPageClick:false,	// onPageClick 자동실행 금지
    onPageClick: function (event, page) {

       	let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
    	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
    }
}).on('page', function (event, page) {
    console.info(page + ' (from event listening)');
});

</script>


</body>
</html>



