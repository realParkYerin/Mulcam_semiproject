<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%> 

<!DOCTYPE html>
<html>
<head>


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
.custom-file-label {
  font-size: 14px;
}
</style>
</head>

<script type="text/javascript">
<%-- 세션검사해서 없으면 login.do로 이동추가--%>
<%
	int bbs_seq = (int)request.getAttribute("bbs_seq");
%>
<%	// or 조건으로 묶었습니다.
if(login == null || login.getUser_id() == "" || login.getUser_id() == null){
	%>
	 location.href = "login.do";
	<%
}
%>
</script>


<br>
<%-- <p><%=bbs_seq %></p> --%>
<div class="container my-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h2 class="mb-4">게시글 수정</h2>

            <form action="bbsupdateAf.do" id="frm" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="hidden" name="user_id" id="user_id" value="<%=login.getUser_id() %>">
					<input type="hidden" name="bbs_seq" id="bbs_seq" value="<%=bbs_seq %>">
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
                        <label class="custom-file-label" for="file">이미지를 업로드 할 수 있습니다.</label>
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
<script>

</script>


<body>





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
    
    // 파일 선택 시 유효한 확장자만 파일이름 출력, 유효하지않은경우 -> 알림후 초기화
    $('#file').on('change', function() {
        var fileList = $(this)[0].files;
        var validExtensions = ['jpg', 'jpeg', 'png', 'gif'];
        var invalidFiles = [];
        var fileName = "";
        for(var i=0; i<fileList.length; i++){
            var fileExtension = fileList[i].name.split('.').pop().toLowerCase();
            if($.inArray(fileExtension, validExtensions) == -1){
                invalidFiles.push(fileList[i].name);
            }else{
                fileName += fileList[i].name + ", ";
            }
        }
        if(invalidFiles.length > 0){
            alert(invalidFiles.join(', ') + " 파일은 업로드할 수 없습니다.");
            $(this).val('');
            $('.custom-file-label').text('파일을 선택하세요');
            return false;
        }else{
            $('.custom-file-label').text(fileName.slice(0, -2));
        }
    });
});
</script>

</body>
</html>