<%@page import="a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<head>
    <title>관리자 페이지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      /* Add your CSS styles here */
      body {
        font-family: Arial, sans-serif;
        background-color: #f1f1f1;
      }

      h1 {
        text-align: center;
        margin-top: 30px;
        color: #333;
      }

      .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 5px #ccc;
      }
      ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
      }

      li {
        margin-bottom: 10px;
      }

      a {
        display: block;
        padding: 10px;
        border-radius: 5px;
        text-decoration: none;
        color: #333;
        background-color: #f1f1f1;
        transition: background-color 0.2s;
      }

      a:hover {
        background-color: #ccc;
      }
    </style>
  </head>
  <body>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login.getAuth() != 2 || login.getUser_id() == null){
		%>
			location.href="main.do";
		<%
	}
%> 



    <h1>관리자 페이지</h1>
    <div class="container">
    <div style="text-align: right;"><%=login.getUser_id()%>님 안녕하세요. 권한 : <%=login.getAuth()%></div>
      <div style="text-align: center; margin-top: 20px;">
      <ul>
       	  <a href="memberlist.do">회원 관리</a>
      </ul>
      <ul>
          <a href="freepostList.do">게시판 관리</a>
      </ul>
      <ul>
         <a href="commentList.do">댓글 관리</a>
        </ul>
      </div>
    </div>
  </body>
</html>




      