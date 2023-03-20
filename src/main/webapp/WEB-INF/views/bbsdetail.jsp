<%@page import="a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="a.dto.BbsImgVO"%>
<%@page import="a.dto.FpdImgDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="a.dto.FreePostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<!-- Bootstrap 4.6.2 CSS 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery 3.6.3 Slim 파일 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

<!-- Popper.js 1.16.1 파일 -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Bootstrap 4.6.2 JS 파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 3.6.3 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style>
body {
    background-color: #f5f5f5;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
    color: #555;
    line-height: 1.5;
    margin-top: 50px;
}

.container {
    max-width: 960px;
}

.card {
    border: none;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    margin-bottom: 30px;
}

.card-title {
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 10px;
}

.card-body {
    padding: 30px;
}

.table {
    margin-bottom: 0;
}

.table td {
    vertical-align: middle;
    padding: 5px 10px;
    border-top: none;
    font-size: 14px;
    color: #888;
}

pre {
    white-space: pre-wrap;
    word-break: keep-all;
}

img {
    max-width: 100%;
    height: auto;
    margin-top: 10px;
    margin-bottom: 10px;
}
</style>

</head>

<body>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%> 

<div class="container bg-light py-4">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <%
                FpdImgDto dto2 = (FpdImgDto)request.getAttribute("bbsdto");
                FreePostDto dto = dto2.getFreepostdto();
                List<BbsImgVO> ivo = dto2.getBbsimgvo();

                // 작성일 저장
                Date date = dto.getWdate();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
                String dateString = sdf.format(date);
            %>
            <h3 class="mb-4">자유게시판</h3>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=dto.getTitle() %></h5>
                    
                    <table class="table table-borderless">
                        <tbody>
                            <tr style="text-align: center;">	<%-- 추후에 작성자프로필 사진 연동하는 작업 필요. --%>
                                <td><%=dto.getuser_id() %></td> <%-- 작성자 --%>
                                <td><%=dateString %></td>   <%-- 작성일 --%>
                                <td>조회수 : <%=dto.getReadcount() %></td> <%-- 조회수 --%>
                            </tr>
                            
                                    <tr>
							          <td colspan="3">
							            <hr>
							          </td>
							        </tr>
                            
                            <tr>
                                <td colspan="3" class="pt-3"><pre><%=dto.getContent()%>
                                <% for (BbsImgVO img : ivo) { %><img src="<%=request.getContextPath() + "/resources/upload/" + img.getImg_name()%>" alt="BBS Image" class="img-fluid rounded mt-3"><% } %>
                                </pre></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" onclick="bbslist()">글 목록</button>
                    
                    <!-- 주소창으로 인한 접근을 막기위해 인터셉터가 필요한데, 사용법을 모르겠습니다.. -->
                    <!-- 아래의 내용은 로그인 세션과 글 작성자가 동일해야지만 보이도록 하겠음. -->
                    <%if(dto.getuser_id().equals(login.getUser_id())){
                    	%>
                    <button type="button" class="btn btn-primary" onclick="bbsupdate()">글 수정</button>
                    <button type="button" class="btn btn-primary" onclick="bbsdelete()">글 삭제</button>
                                        	<%
                    }
                    %>
                </div>
            </div>

            <script type="text/javascript">
            function bbslist(){
                location.href = "bbslist.do";
            }
            
            function bbsupdate(){
            	location.href = "bbsupdate.do?bbs_seq=<%=dto.getBbs_seq() %>";
            }
            
            function bbsdelete(){
            	location.href = "bbsdelete.do?bbs_seq=<%=dto.getBbs_seq() %>";
            }
            </script>
        </div>
    </div>
</div>