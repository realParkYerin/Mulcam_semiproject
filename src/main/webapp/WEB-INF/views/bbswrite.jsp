<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%> 

<!DOCTYPE html>
<html>
<head>
<style>
  body {
    background-color: #f7f7f7;
  }
</style>
<style>
  label {
    font-size: 1.2rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
    display: block;
  }

  input[type=text], textarea {
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 0.5rem;
    font-size: 1.2rem;
    width: 100%;
    margin-bottom: 2rem;
  }

  button#frmsubmit {
    font-size: 1.5rem;
    font-weight: bold;
    padding: 1rem 2rem;
    background-color: #007bff;
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
  }

  button#frmsubmit:hover {
    background-color: #0069d9;
  }

  button#cancelBtn {
    font-size: 1.2rem;
    padding: 0.5rem 1rem;
    background-color: white;
    border: 1px solid #ced4da;
    border-radius: 5px;
    cursor: pointer;
  }

  button#cancelBtn:hover {
    background-color: #ced4da;
  }
  #frmsubmit {
  font-size: 0.875rem;
  padding: 0.375rem 0.75rem;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-l58vFZ1bItRcuyg8WlY0wvDyq0ycC+jfX9+psCmIgKfZmR89/zL8xEzQgYwMrdD3KilJH81XnjTfNbiuL7V2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<%-- 세션검사해서 없으면 list.do로 이동추가--%>
<br>
<div class="container my-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h2 class="mb-4">게시글 작성</h2>

            <form action="bbswriteAf.do" id="frm" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="title">제목</label>
					<input type="hidden" name="user_id" id="user_id" value="<%=login.getUser_id() %>">
                    <input type="text" id="title" name="title" class="form-control form-control-lg" placeholder="제목을 입력하세요">
                </div>

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" class="form-control" rows="10" placeholder="내용을 입력하세요"></textarea>
                </div>

                <div class="form-group">
                    <label for="file">첨부 파일 load</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" name="file" id="file" multiple>
                        <label class="custom-file-label" for="file">파일을 선택하세요</label>
                        <!-- 본래는 특수기호 못들어가게 AJAX에서 또한 걸러내야합니다. 시연할거니까 문제는 되지 않을거 같아요~ -->
                    </div>
                </div>

                <div class="text-right">
                    <button type="button" class="btn btn-secondary mr-2" id="cancelBtn">취소</button>
                    <button type="button" class="btn btn-primary" id="frmsubmit">작성완료</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery and Bootstrap JS -->


<body>


<%-- 세션검사해서 없으면 list.do로 이동추가--%>



<script type="text/javascript">
$(document).ready(function() {
    $("#cancelBtn").click(function() {
        location.href = "list.do";
    });

    $("#frmsubmit").click(function() {
    	 if($("#user_id").val().trim() == "" || $("#user_id").val() == null){
    		alert("세션이 만료되었습니다. 다시 로그인 해주세요.");
    		location.href = "login.do";
    	}
    	else if($("#title").val().trim() == "" ){
            alert("제목을 기입해 주십시오");
            return;
        }else if($("#content").val().trim() == "" ){
            alert("내용을 기입해 주십시오");
            return;
        }else{
            $("#frm").submit();
        }       // 파일 확장자명 jpg , gif, png, jpeg등등 이미지파일만 받을수 있게 AJAX하나 추가하기.
    }); 
    
    // 파일 선택 시 선택한 파일 개수 출력
    $('#file').on('change', function() {
        var fileList = $(this)[0].files;
        var fileName = "";
        for(var i=0; i<fileList.length; i++){
            fileName += fileList[i].name + " ";
        }
        $('.custom-file-label').text(fileName.slice(0, -2));
    }); 
});
</script>

</body>
</html>