<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mulcam.SemiProj_Pet MainPage</title>

<!-- GOOGLE FONTS LINK -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

</head>
<body>
<header>
 <nav class="navbar navbar-light bg-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="./resources/main/animalFoot.png" alt="" width="30" height="24" class="d-inline-block align-text-bottom">
      <h1 style="font-family: 'Lobster', cursive">Happy Tails</h1>
    </a>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.do" style="font-family: 'Lobster', cursive">Main Page</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="bbslist.do" style="font-family: 'Lobster', cursive">Board</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="memberUpdate.do" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"
          style="font-family: 'Lobster', cursive">
            MyPage
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		    <a font-family: 'Noto Sans KR', sans-serif; class="dropdown-item" href="memberUpdate.do">회원정보 수정</a>
		    <a font-family: 'Noto Sans KR', sans-serif; class="dropdown-item" href="petUpdate.do">내 반려동물 관리</a>
		    <a font-family: 'Noto Sans KR', sans-serif; class="dropdown-item" href="">내 활동 관리</a>
		    <a font-family: 'Noto Sans KR', sans-serif; class="dropdown-item" href="">로그아웃</a>
		  </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.do" style="font-family: 'Lobster', cursive">logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>
</nav>
<div>
</div>
</header>
</body>
</html>