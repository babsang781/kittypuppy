<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import = 'java.util.ArrayList'
	import = 'com.kittypuppy.model.*'
%>

<%@ taglib prefix = 'c' uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = 'fn' uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet">

    <!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://bootsnipp.com/dist/bootsnipp.min.css" crossorigin="anonymouse">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

<title>WebKittyPuppy</title>



<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<style>

    html, body {
        height: 100%;
    }

    body{
        background-color: #ffffff;
        display: flex;
        padding: 10px;
    }

    .ls {
        margin: atuo;
        max-width: 442px;
        margin: auto;
    }
    
    i {
        font-size: 3ch;
        font-weight: bold;
        color: #25aa90;
    }

    .container{
        width: 100%;
        max-width: 492px;
        padding:15px;
        margin: auto;
        display:block;
    }

    .title {
        font-size : 25px;
        font-family : serif;
        color : #25aa90;
    }

    .submit {
        width : 50px;
        height : 30px;
        background-color: #25aa90;
        color :#ffffff;
        border : 0px;
        border-radius: 10%;
        outline : none;
    }

    .row {
	    align-items: center;
    }

    @media (min-width: 1050px) {

        .container{
            max-width:1200px;
        }

        .ls {
            max-width: 700px;
        }
        
        .input {
        	font-size : 100px;
        }

    }

    div{
        display:block;
    }

    textArea,select {
        width : 100%;
    }

    .contentArea {
        height : 220px;
    }

    .tagArea {
        height : 35px;
    }

    .img {
        width : 100%;
    }

    .remove {
        font-size: 2px;
        position : absolute;
    }

	.input {
		background-color: #ffffff;
		color : white;
		font-size : 45px;
	}
	
	.hiddenInput {
		display: none;
	}
</style>
</head>
<body>
<div class="container">

	<%
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String nick = member.getNick();
		
	%>
    
    <form action = 'FeedCreateCon.do' method="post" enctype="multipart/form-data" class = 'd-grid gap-2'>
        <div class = 'd-grid gap-3'>
            <!-- 상단 메뉴 -->
            <div class="row text-center">
                <div class = 'col-4' align = 'left'>
                    <a href = 'mypage.jsp'><i class="bi bi-chevron-left"></i></a>
                </div>
                <div class = 'col-4'>
                    <span class = 'title'>글쓰기</span>
                </div>
                <div class = 'col-4' align = 'right'>
                    <input type = 'submit' class ='submit' value = '완료'>
                </div>
            </div>
            <div>
   				<div>
                    <textarea class = 'contentArea' name ='content' placeholder = "내용을 입력해 주세요"></textarea>
                </div>

                <div>
                    <textarea class ='tagArea' name ='tag' placeholder = "# 해시태그입력"></textarea>
                </div>
                <div>
                    <select name = 'openRange'>
                        <option value = 1>전체 공개</option>
                        <option value = 2>팔로워 공개</option>
                        <option value = 3>비공개</option>
                    </select>
                </div>
            </div>
        </div>

        <div class ='row'>
   			<div class = 'col-4 g-4 mb-3' align = 'center'>
				<label class="btn btn-default input">
	       			<i class="bi bi-plus-square"> <input name = 'picAddress1' type="file" onchange = 'inputShow("hiddenInput1")' hidden></i>
	   			</label>
           	</div>
           	
           	<div id = 'hiddenInput1' class = 'col-4 g-4 mb-3 hiddenInput' align = 'center'>
				<label class="btn btn-default input">
	       			<i class="bi bi-plus-square"> <input name = 'picAddress2' type="file" onchange = 'inputShow("hiddenInput2")' hidden></i>
	   			</label>
           	</div>
           	
           	<div id = 'hiddenInput2' class = 'col-4 g-4 mb-3 hiddenInput' align = 'center'>
				<label class="btn btn-default input">
	       			<i class="bi bi-plus-square"> <input name = 'picAddress3' type="file" onchange = 'inputShow("hiddenInput3")' hidden></i>
	   			</label>
           	</div>
           	
           	<div id = 'hiddenInput3' class = 'col-4 g-4 mb-3 hiddenInput' align = 'center' >
				<label class="btn btn-default input">
	       			<i class="bi bi-plus-square"> <input name = 'picAddress4' type="file" onchange = 'inputShow("hiddenInput4")' hidden></i>
	   			</label>
           	</div>
           	
           	<div id = 'hiddenInput4' class = 'col-4 g-4 mb-3 hiddenInput' align = 'center'>
				<label class="btn btn-default input">
	       			<i class="bi bi-plus-square"> <input name = 'picAddress5' type="file" hidden></i>
	   			</label>
           	</div>
        </div>
    </form>

</div>

<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src='jquery-3.6.0.min.js'></script>
<script type='text/javascript'>
	
	function inputShow(id) {
		document.getElementById(id).style.display = 'block';
	}
	
</script>

</body>
</html>