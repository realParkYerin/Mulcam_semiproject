<%@page import="a.dto.FreeCommentVO"%>
<%@page import="a.dto.LikePostDto"%>
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
	width: 100%;
  	height: auto;
  	overflow: hidden;
    border: none;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
}

.card-title {
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 10px;
}

.card-body {
    padding: 30px;
    margin-bottom: 20px;
}

.card .card-body table {
  margin-bottom: 0;
}

.card .card-body table td {
  padding: 8px;
}

.card .card-body table th {
  padding: 8px;
  font-weight: bold;
}

.card .card-body table td p {
  margin-bottom: 0;
}

.card .card-body table td:first-child {
  width: 10%;
}

.card .card-body table th:first-child {
  width: 10%;
}

.card .card-body table td:last-child {
  width: 60%;
  word-break: break-all;
}

.card .card-body table th:last-child {
  width: 60%;
}

.card .card-body table td:last-child textarea {
  height: auto;
  min-height: 60px;
}

.card .card-body table td:last-child div.textarea-container {
  height: auto;
  min-height: 60px;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

.table {
    margin-bottom: 20px;
}

.table td {
    vertical-align: middle;
    padding: 10px 0;
    border-top: none;
    font-size: 14px;
    color: #888;
}

.table td img{
	margin-top: 10px;
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

<style>
	/* 글 내용의 경계선 표시 */
	.content{
		border: 1px dotted #cecece;
	}
	/* 글 내용안에 있는 이미지의 크기 제한 */
	.content img{
		max-width: 100%;
	}
	/* 댓글에 관련된 css */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments form textarea{
		width: 85%;
		height: 100px;
	}
	.comments form button{
		width: 15%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.comments .user-img{
		width: 20px;
		height: 20px;
		border-radius: 50%;
	}
td a.btn {
  padding: 0.2rem 0.5rem;
  font-size: 0.7rem;
}

td a.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
}

td a.btn-primary:hover {
  background-color: #0069d9;
  border-color: #0062cc;
}

td a.btn-danger {
  background-color: #dc3545;
  border-color: #dc3545;
}

td a.btn-danger:hover {
  background-color: #c82333;
  border-color: #bd2130;
}
	
.round-img{
	border-radius: 50%;
	width: 30px;
	height: 30px;
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
                List<FreeCommentVO> cvo = dto2.getCommentvo();
                // 작성일 저장
                Date date = dto.getWdate();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
                String dateString = sdf.format(date);
                
                if(login.getUser_id() != null && login.getUser_id() == ""){ // 유저 세션이 null이 아닌경우에만.
                LikePostDto likedto = new LikePostDto();	// 게시물 좋아요 DTO
                likedto.setBbs_seq(dto.getBbs_seq());	// 현재 게시판의 bbs_seq setter
                likedto.setUser_id(login.getUser_id());	// 로그인한 사람의 user_id setter
                }
                
                MemberDto mdto = dto2.getWritor();
                List<MemberDto> cmtwritordto = dto2.getCmtwritorlist();
                
                
                int showcount = dto.getLikecount(); 	// 출력용 변수
            %>
            <h3 class="mb-4">자유게시판</h3>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">"<%=dto.getTitle() %>"</h5>
                    
                     <table class="table table-borderless">
                        <tbody>
							<tr> <%-- 작성자의 대표이미지 --%>
							    <td width="10px" class="text-middle"><img src="<%=mdto.getImg_path() %>" class="round-img"></td>
							    <th width="200px" class="text-middle"><%=dto.getuser_id() %></th> <%-- 작성자 --%>
							    <td width="50px"></td>
							      <td class="text-right">
								    <span class="mb-1"><%=dateString %></span> <%-- 작성일 --%>
								  </td>    <%-- 작성일 --%>
							</tr>
							<tr>
							    <td></td>
							    <td></td>
							    <td></td>
							    <td class="text-right"><img id="like-img" src="../../../../spSample1/resources/utilImg/emptyheart.png" onclick="toggleimg()" width="20"> <span id="showcount"><%= showcount %></span></td>
							</tr>
                            
                                    <tr>
							          <td colspan="4">
							            <hr>
							          </td>
							        </tr>
                            
                            <tr>
                                <td colspan="4" class="pt-3"><pre><%=dto.getContent()%>
                                <% for (BbsImgVO img : ivo) { %><img src="<%=request.getContextPath() + "/resources/upload/" + img.getImg_name()%>" alt="BBS Image" class="img-fluid rounded mt-3"><% } %>
                                </pre></td>
                            </tr>
                        </tbody>
                    </table>
					<div class="text-right">
					    <button type="button" class="btn btn-primary" onclick="bbslist()">글 목록</button>
					    
					    <%if(dto.getuser_id().equals(login.getUser_id()) || login.getAuth() == 2 ){ %>
					    <button type="button" class="btn btn-primary" onclick="bbsupdate()">글 수정</button>
					    <button type="button" class="btn btn-primary" onclick="bbsdelete()">글 삭제</button>
					    <% } %>
					</div>
                </div>
            </div>
            
            
            <%-- 여기는 댓글 작성입니다. --%>
            <!-- 아래부터 댓글 내용 작성해야함. -->
			<div class="comments">
			  <!-- 원글에 댓글을 작성할 수 있는 폼 -->
			  <div class="comment_form">
				<form action="comment_insert.do" method="post" onsubmit="return validateForm()">
				  <!-- 작성자 -->
				  <input type="hidden" name="user_id" value="<%=login.getUser_id() %>" />
				  <!-- 어디 게시물의 댓글인지? -->
				  <input type="hidden" name="bbs_seq" value="<%=dto.getBbs_seq() %>" />
				  <!-- 이 게시물은 누가 작성했는지? -->
				  <input type="hidden" name="target_id" value="<%=dto.getuser_id() %>" />
				  
				  <%if(login.getUser_id().equals("") || login.getUser_id() == null){ %>
				    <div class="form-group">
				      <textarea class="form-control" name="needlogin" id="needlogin" readonly="readonly">로그인이 필요합니다.</textarea>
				    </div>
				  <%} else{ %>
				    <div class="form-group">
				      <div class="textarea-container">
				        <!-- 댓글 내용 -->
				        <textarea name="cmt_content" class="form-control" rows="3" placeholder=" 댓글 작성"></textarea>
				      </div>
				    </div>
				  <% } %>
				
				  <button class="btn btn-primary" type="submit">등록</button>
				</form>
			  </div>
			</div>
			
			
			<br><br><br><br><br><hr><br>
			
			  
			  
			  
			  
			  
			  <%-- 여기부터 댓글 표현입니다. --%>
					<%
		if(cvo.isEmpty()){
		    %>
					  <div class="card">
                		<div class="card-body">	
					     <table class="table table-borderless">
					     <tbody>
					      <tr>
					      <td><p style="text-align: center;"><b>작성된 댓글이 없습니다.</b></p></td>
					      </tr>
					      </tbody>
					      </table>
					    </div>
					  </div>
		    <%
		}else{	
	        for(int i = 0;i < cvo.size(); i++)
	        {
	        	FreeCommentVO comment = cvo.get(i);	// 각각의 코멘트들에 대한 정보를 취득하기 위함.
	        	MemberDto cmtwritor = cmtwritordto.get(i);	// 각각의 댓글 작성자의 이미지를 출력하기 위함.
	        	// System.out.println(cmtwritor.toString());
	            	%>
				
	                
	                <%
	                if(comment.getDel_cmt() == 0){
	                    %>
						<div class="card">
			                <div class="card-body"><!-- class="table table-borderless" -->
			                    <table class="table table-borderless"> <!-- <table  border="1"> -->
									<tr>
									  <%-- 작성자의 프로필이미지 불러오기 추가해야함.!! --%>
									  <th class="col-md-1" width="200px"><img src="<%=cmtwritor.getImg_path() %>" class="round-img"></th>
									  <th class="col-md-2" width="400px"><%=comment.getUser_id() %></th>
									  <%-- 댓글 작성자 --%>
									  <%
									  // 양식 치환
									  date = comment.getReg_cmtdate();
									  sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
									  dateString = sdf.format(date);
									  %>
									  <td class="col-md-6" width="500px"><%=dateString %></td>
									  <%-- 작성일자 --%>
									  
									  <%-- 로그인된 유저가 작성자랑 동일한 경우만 수정삭제 노출. 관리자인경우도 포함. --%>
									  <%if(login.getUser_id().equals(comment.getUser_id()) || login.getAuth() == 2){ %>
									  <td width="500px">
									    <div class="d-flex">
									      <form action="comment_update.do" method="post">
									        <!-- 수정 버튼 -->
											  <button type="button" class="btn btn-outline-secondary btn-sm mr-1" onclick="editComment(<%=comment.getComment_seq()%>, '<%=comment.getCmt_content()%>')">수정</button>
									      </form>
									      <form action="comment_delete.do" method="post">
									      	<!-- 작성자 -->
											  <input type="hidden" name="user_id" value="<%=login.getUser_id() %>" />
											  <!-- 어디 게시물의 댓글인지? -->
											  <input type="hidden" name="bbs_seq" value="<%=dto.getBbs_seq() %>" />
											  <!-- 이 게시물은 누가 작성했는지? -->
											  <input type="hidden" name="target_id" value="<%=dto.getuser_id() %>" />
									          <input type="hidden" name="comment_seq" value="<%=comment.getComment_seq() %>">
									        <button type="submit" class="btn btn-outline-secondary btn-sm">삭제</button>
									      </form>
									    </div>
									  </td>
									  <%} %>
									</tr>
						         <tr>
						         </tr>
						          <tr>
						            <td colspan="6" id="bbscomment-<%=comment.getComment_seq() %>"><%=comment.getCmt_content() %></td>
						            <%-- 내용 --%>
						          </tr>
								</table>
								
										  <div  id="comment-<%=comment.getComment_seq() %>">
									      
									      </div>
							</div>
						</div>
	                    	
	                    <%
	                }else if(comment.getDel_cmt() == 1){
	                    %>
			            <div class="card">
						  <div class="card-body text-center">
						    <table class="table table-borderless">
						      <tr>
						        <td>
						          <font color="#ff0000">*** 이 댓글은 관리자 또는 사용자에 의해 삭제되었습니다 ***</font>  
						        </td>
						      </tr>
						    </table>
						  </div>
						</div>
	                    <%
	                }   
	                %>
	                
	            <%
	        }
	
		}
	%>
			
			
			
			<%--
			
	<!-- 모달 -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="commentModalLabel">댓글 수정하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="commentForm">
          <div class="form-group">
            <label for="commentContent">댓글 내용</label>
            <textarea class="form-control" id="commentContent" name="commentContent" rows="3"></textarea>
          </div>
          <input type="hidden" id="commentSeq" name="commentSeq" value="">
          <input type="hidden" id="bbsSeq" name="bbsSeq" value="<%=dto.getBbs_seq() %>">
          <input type="hidden" id="userId" name="userId" value="<%=login.getUser_id() %>">
          <input type="hidden" id="targetId" name="targetId" value="<%=dto.getuser_id() %>">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="saveCommentBtn">저장</button>
      </div>
    </div>
  </div>
</div>		
			
			 --%>
			
			



			
			
			<!-- 
			<script type="text/javascript">
			function validateForm() {
				  var cmt_content = document.getElementsByName("cmt_content")[0].value;
				  if (cmt_content.trim() == "") {
				    alert("댓글 내용을 입력해주세요.");
				    return false;
				  }
				}
			</script>
			 -->
			 
			 		
            <script type="text/javascript">
            
            // 무조건 문서가 처음 실행되었을 경우 AJAX 최초 통신으로 값을 받아와야 함.
            // 좋아요 값
            $(document).ready(function(){
            	
                var user_id = '<%=login.getUser_id() %>';
                var bbs_seq = '<%=dto.getBbs_seq() %>';
                var img = document.getElementById("like-img");
            	
                if(<%=login.getUser_id() != null && login.getUser_id() != "" %>){
                $.ajax({	// 현재상태 취득해서 상태에 맞는 이미지 세팅.
                    type: 'GET',
                    url: 'checkstate.do',
                    data: { user_id: user_id, bbs_seq: bbs_seq },
                    success: function(data) {
                        console.log('success!');

                        // 이미지 변경	// true === 좋아요 누른 상태, false === 안누른 상태
                        if (data === true) {
                        	// console.log(data);
                        	$("#like-img").attr("src", "../../../../spSample1/resources/utilImg/fullheart.png");
                            // img.src =  "../../../../spSample1/resources/utilImg/fullheart.png";
                        } else {
                        	// console.log(data);
                        	$("#like-img").attr("src", "../../../../spSample1/resources/utilImg/emptyheart.png");
                            // img.src =  "../../../../spSample1/resources/utilImg/emptyheart.png";
                        }

                        // 이미지 상태 업데이트
                        // imgstate = data;
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('error!');
                    }
                });
            	}
                
                
              	$('.edit-comment-btn').click(function() {
              		console.log("editComment");
            	    var commentSeq = $(this).data('comment-seq');
            	    var content = $(this).data('content');
            	    editComment(commentSeq, content);
            	  });
            });	// 최초 통신의 끝. (이미지 세팅)
            

            function toggleimg() {	// 좋아요 또는 좋아요 취소를 동작 시 실행됨.
                var user_id = '<%=login.getUser_id() %>';
                var bbs_seq = '<%=dto.getBbs_seq() %>';
                var img = document.getElementById("like-img");
                
                if(user_id == null || user_id =="" ){
                	alert("로그인 되어있지 않습니다. 로그인 후 사용 가능합니다.");
                	
                	return;
                }

                $.ajax({	// DB에 접근하여 값을 토글한다.
                    type: 'GET',
                    url: 'likepost.do',
                    data: { user_id: user_id, bbs_seq: bbs_seq },
                    success: function(data) {
                        console.log('success!');

                        // 이미지 변경	// true === 좋아요 누른 상태, false === 안누른 상태
                        if (data === true) {
                        	console.log(data);
                        	// $("#like-img").attr("src", "../../../../spSample1/resources/utilImg/fullheart.png");
                        } else {
                        	console.log(data);
                        	// $("#like-img").attr("src", "../../../../spSample1/resources/utilImg/emptyheart.png");
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('error!');
                    }
                });
                
                $.ajax({	// 현재상태 취득해서 상태에 맞는 이미지 세팅.
                    type: 'GET',
                    url: 'checkstate.do',
                    data: { user_id: user_id, bbs_seq: bbs_seq },
                    success: function(data) {
                        console.log('success!');

                        // 이미지 변경	// true === 좋아요 누른 상태, false === 안누른 상태
                        if (data === true) {	// 좋아요 취소하기
                        	// console.log(data);
                        	$("#like-img").attr("src", "../../../../spSample1/resources/utilImg/emptyheart.png");
                        	var count = parseInt($("#showcount").text());
                            count -= 1;
                            $("#showcount").text(count);
                        } else {				// 좋아요 하기
                        	// console.log(data);
                        	$("#like-img").attr("src", "../../../../spSample1/resources/utilImg/fullheart.png");
                        	var count = parseInt($("#showcount").text());
                            count += 1;
                            $("#showcount").text(count);
                        }

                        // 이미지 상태 업데이트
                        // imgstate = data;
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('error!');
                    }
                });
            } // 좋아요 or 좋아요 취소 동작 함수 끝

            
            function bbslist(){
                location.href = "bbslist.do";
            }
            
            function bbsupdate(){
            	location.href = "bbsupdate.do?bbs_seq=<%=dto.getBbs_seq() %>";
            }
            
            function bbsdelete(){
            	location.href = "bbsdelete.do?bbs_seq=<%=dto.getBbs_seq() %>";
            }
            
        	$("#needlogin").on("click", function(){
        		//로그인 여부
        		var isLogin=${not empty id};
        		if(isLogin==false){
        			var isMove=confirm("로그인 페이지로 이동하시겠습니까?");
        			if(isMove){
        				location.href="login.do";
        			}
        		}
        	});
        	
  
        	
        	function editComment(commentSeq, content) {
                // 댓글 입력창 생성
                var editForm = '<form id="edit-form-' + commentSeq + '" method="post">';
                editForm += '<div class="form-group">';
                editForm += '<input type="hidden" name="comment_seq" value="' + commentSeq + '">';
                editForm += '<textarea class="form-control" name="cmt_content" rows="3" required>' + content + '</textarea>';
                editForm += '</div>';
                editForm += '<button type="submit" class="btn btn-primary">수정</button>';
                editForm += '<button type="button" class="btn btn-secondary" onclick="cancelEdit(' + commentSeq + ')">취소</button>';
                editForm += '</form>';

                // 댓글 영역에 입력창 추가
                var commentArea = $('#comment-' + commentSeq);
                commentArea.append(editForm);

                // 수정 버튼 비활성화
                commentArea.prev().find('button').prop('disabled', true);
                
                var requestData = {
                        comment_seq: commentSeq,
                        cmt_content: content
                };
                
              // AJAX 요청 보내기
                $('#edit-form-' + commentSeq).submit(function(event) {
                    event.preventDefault();
                    
                    // 수정된 내용 저장하기
                    var modifiedContent = $(this).find('textarea[name="cmt_content"]').val();
                    
                    $.ajax({
                        type: "POST",
                        url: "comment_update.do",
                        data: {
                            comment_seq: commentSeq,
                            cmt_content: modifiedContent // 수정된 내용 가져오기
                        },
                        success: function(data) {
                            if(data){
                                // 전송한 데이터를 변수에 저장
                                var commentSeq = requestData.comment_seq;
                                
                                // 2. 댓글 입력창 제거
                                $('#edit-form-' + commentSeq).remove();
                                
                                // 3. 수정 버튼 활성화
                                $('#comment-' + commentSeq).prev().find('button').prop('disabled', false);
                                
                                // 서버에서 결과가 true이면, 수정된 내용으로 댓글 내용 대체
                                $('#bbscomment-' + commentSeq).text(modifiedContent);
                            }
                        },
                        error: function(xhr, status, error) {
                            console.log("AJAX ERROR");
                        }
                    });
                });
      }

        	function cancelEdit(commentSeq) {
        	    // 댓글 입력창 제거
        	    $('#edit-form-' + commentSeq).remove();
        	  
        	    // 수정 버튼 활성화
        	    $('#comment-' + commentSeq).prev().find('button').prop('disabled', false);
        	}
        	
        	
        	/*
         	// 댓글 수정 버튼 클릭시 모달 열기
        	function editComment(commentSeq, commentContent) {
        	  $('#commentSeq').val(commentSeq); // 댓글 번호 저장
        	  $('#commentContent').val(commentContent); // 댓글 내용 표시
        	  $('#commentModal').modal('show'); // 모달 열기
        	} */
        	
            </script>
        </div>
    </div>
</div>

</body>
</html>