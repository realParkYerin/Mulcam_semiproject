<%@page import="a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
        <link rel="stylesheet" href="../resources/css/admin-main.css">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 페이지</h1>


<!-- 관리자일때만 확인 가능 ***추후 수정 필요***-->
<%-- <c:if test="${loginUser!=null || loginUser.auth() ==2}"> --%>
    <a href="memberlist.do">회원 관리</a><br><br>
    <a>게시판 관리</a><br><br>
    <li><a href="freepostList.do">자유게시판 관리</a></li><br>
    <li><a href="">Q&A 관리</a></li><br><br>
    <a>댓글 관리</a><br><br>
    <li><a href="commentList.do">자유게시판 댓글 관리</a></li><br>
    <li><a href="">Q&A 댓글 관리</a></li><br><br>
<%-- </c:if> --%>
</body>
</html>