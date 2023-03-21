<%@page import="java.util.List"%>
<%@page import="a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto member = (MemberDto)session.getAttribute("login"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
<title>mulcam.SemiProj_Pet MainPage</title>

<!-- GOOGLE FONTS LINK -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

<!-- css -->
<style>
/* gnb_bottom 영역 시작 */
ul {
        display: flex;
        justify-content: center; /* 가로축 중앙정렬 */
   	 	align-items: center; /* 세로축 중앙정렬 */
        list-style-type: none;
        margin: 0;
        padding: 0;
      }

     ul li {
  margin-right: 25px;
}

ul li:last-child {
  margin-right: 0;
}
ul li a {
  font-size: 1.3rem;
  text-decoration: none;
  border-bottom: 3px solid transparent;
  color: #333;
}

ul li a:hover {
  border-bottom: 3px solid #333;
}

/* main_banner 영역 시작 */
#main_banner {
    width: 100%;
    height: 700px;
    background: linear-gradient(to bottom, rgba(27, 27, 27, .0) 90%, rgba(27, 27, 27, 1) 100%), url(./resources/main/pet.png);
    background-size: cover;
    background-repeat: no-repeat;
}
/* main_banner 영역 종료 */

/* sub 시작 */
.sub1 {
    width: 100%;
    position: absolute;
    top: 40px;
    float: left;
    text-align: left;
    background-color: #000000b3;
    height: 38px;
    display: none;
}

.nav1 li:hover .sub1 {
    display: block;
}
/* sub 종료 */

/* slid_baner 시작 */
#slid_baner {
    margin-top: 80px;
    position: relative;
    width: 1387px;
    height: 580px;
    overflow: hidden;
}
/* slid_baner 종료 */

/* slid_baner2 시작 */
.tit1 {
    width: 500px;
    margin-left: 3px;
}

.tit1 span {
    display: block;
    font-size: 24px;
    line-height: 36px;
    color: #000000;
    margin-bottom: 12px;
}

.tit1 a {
    position: absolute;
    top: 10px;
    right: 6px;
    display: inline-block;
    margin: 0 auto;
    font-size: 16px;
    line-height: 24px;
    color: #a5a5a5;
    cursor: pointer;
}
.tit2 {
    display: block;
    font-size: 24px;
    line-height: 36px;
    color: #fff;
    margin-bottom: 10px;
}

.tit2 a {
    position: absolute;
    right: 310px;
    display: inline-block;
    margin: 0 auto;
    font-size: 16px;
    line-height: 24px;
    color: #a5a5a5;
    cursor: pointer;
}



.slid1 {
    margin: 0 290px;
    float: left;
    width: 100vw;
}

.slid_baner2 {
    height: 498px;
}

.vanner {
    margin: 0 auto;
    width: auto;
    height: 498px;
    margin-top: 70px;
}
.vanner1 {
    margin: 0 auto;
    width: 1240px;
    height: 498px;
    margin-top: 5px;
}

.vanner3{
    margin: 0 auto;
    width: 1240px;
    height: 498px;
    margin-top: 10px;
}
.vanner4{
    margin: 0 auto;
    width: 1240px;
    height: 498px;
    margin-top: 10px;
}

.slid_wapper {
    position: relative;
    width: 1240px;
    height: 450px;
    margin: 0 auto;
    overflow: hidden;
}

.slid {
    position: relative;
    width: 2640px;
    float: left;
    
}
.slid2 {
    position: relative;
    width: 2640px;
    float: left;
    
}
.slid3 {
    position: relative;
    width: 2640px;
    float: left;
    
}



.slid_wapper ul li {
    display: inline-block;
    width: 240px;
    height: 360px;
    margin-right: 5.6px;
    overflow: hidden;
    border-radius: 14px;
}

.slid_wapper ul li img:hover {
    transform: scale(1.1);
    
}

.slid_wapper ul li:nth-child(5n) {
    margin-right: 0;
}

.slid_wapper ul li img {
    width: 100%;
    height: 100%;
    border-radius: 12px;
    transition: 0.2 all linear;
}

/* slid_baner2 종료 */
</style>

<!-- js -->
<!-- <script>
$(function(){
    $(window).scroll(function(){
        let pos = $(this).scrollTop();
        if(pos>0){
            $('#up').css('opacity','1')
        }else {
            $('#up').css('opacity','0')
        }
    
    })
    let sw=false;
    let index=0;
    let auto;
    moveSilder(index);
    autoSlider();
    $('.control_button').click(function(){
        index = $(this).index();
        moveSilder(index);
    });
    // 좌측 버튼 클릭 이벤트
    $('.left_control').click(function(){
        if(index > 0) {
            index--;
            moveSilder(index);
        }else {
            index = 3;
            moveSilder(index);
        }
    })
    // 우측버튼 클릭 이벤트
    $('.right_control').stop(true).click(function(){
        if(index < 3) {
            index++;
            moveSilder(index);
        }else {
            index = 0;
            moveSilder(index);
        }
    });
      // 애니메이션 캔버스 영역
      $('.animation_canvas').hover(function(){
        clearInterval(auto);
    }, function(){
        autoSlider();
    })

    //이미지 슬라이더 구현 함수
    function moveSilder(index) {
        $('.slider_panel').animate({
            left : -(index*910)
        },'slow')
    }
     //자동이미지 슬라이더 구현 함수
            function autoSlider() {
            auto = setInterval(function(){
                    $('.right_control').trigger('click');
            },2000);
        }

        // 첫 번째 미니 슬라이드
        let ide=0;
        miniSlide(ide);
        $('.le').click(function(){
            ide--;
            if(ide < 0) {
                ide = 1;
            }
            
                miniSlide(ide);
                console.log(ide)
        })

        $('.re').click(function(){
            ide++;
            if(ide >= 2){
                ide = 0;
            }
            miniSlide(ide);
        });

       //미니 슬라이드 구현 함수
        function miniSlide(ide) {
            $('.slid').animate({
                left : -(ide*1240)
            },'slow')
        }

        // 두번째 미니 슬라이드

        let ide1=0;
        miniSlide1(ide1);
        $('.le1').click(function(){
            ide1--;
            if(ide1 < 0) {
                ide1 = 1;
            }
            
            miniSlide1(ide1);
                console.log(ide1)
        })

        $('.re1').click(function(){
            ide1++;
            if(ide1 >= 2){
                ide1 = 0;
            }
            miniSlide1(ide1);
        });
   
       //미니 슬라이드 구현 함수
        function miniSlide1(ide1) {
            $('.slid2').animate({
                left : -(ide1*1240)
            },'slow')
        }

          // 세번째 미니 슬라이드

          let ide2=0;
          miniSlide2(ide2);
          $('.le2').click(function(){
            ide2--;
              if(ide2 < 0) {
                ide2 = 1;
              }
              
              miniSlide2(ide2);
                  console.log(ide2)
          })
  
          $('.re2').click(function(){
            ide2++;
              if(ide2 >= 2){
                ide2 = 0;
              }
              miniSlide2(ide2);
          });
  
         //미니 슬라이드 구현 함수
          function miniSlide2(ide2) {
              $('.slid2').animate({
                  left : -(ide2*1240)
              },'slow')
          }

             // 네번째 미니 슬라이드

             let ide3=0;
             miniSlide3(ide3);
             $('.le3').click(function(){
                ide3--;
                 if(ide3 < 0) {
                    ide3 = 1;
                 }
                 
                 miniSlide3(ide3);
                     console.log(ide3)
             })
     
             $('.re3').click(function(){
                ide3++;
                 if(ide3 >= 2){
                    ide3 = 0;
                 }
                 miniSlide3(ide3);
             });
     
     
     
            //미니 슬라이드 구현 함수
             function miniSlide3(ide3) {
                 $('.slid3').animate({
                     left : -(ide3*1240)
                 },'slow')
             }
            
           })
</script> -->
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
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">...</a></li>
            <li><a class="dropdown-item" href="#">나의 일정 관리</a></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="font-family: 'Lobster', cursive">logout</a>
        </li>
        <%if(member.getAuth()==2){
        	%>
        <li class="nav-item">
          <a class="nav-link" href="admin/adminview.do" style="font-family: 'Lobster', cursive">admin page</a>
        </li>
         <% }
        %>
      </ul>
    </div>
  </div>
</nav>
</div>
</nav>
<div>
<!-- <ul style="display: flex;">
		    <li><a href="main.do" style="font-family: 'Lobster', cursive">Home</a></li>
		    <li><a href="bbslist.do" style="font-family: 'Lobster', cursive">Community</a></li>
		    <li><a href="#" style="font-family: 'Lobster', cursive">Hospital</a></li>
		    <li><a href="postmanage.do" style="font-family: 'Lobster', cursive">MY</a></li>
</ul> -->
</div>
</header>
</body>
</html>