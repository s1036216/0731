<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 쓰기</title>
<style>
@import url(../css/board.css);
</style>
</head>
<body>
<div id="wrapper">  <!--전체 웨퍼ㅏ-->
<h1 id="title">게시글 쓰기</h1>
<hr/>
<header>
<a id="go_main" href="../index.jsp">MAIN으로가기</a>
</header>
<div id="container">

<form action="" method="get"class=" float-left">
  <textarea name="message" rows="10" cols="30" class="width-200">게시판글쓰기</textarea>
  <br>
  <input type="submit">							
</form>
</div>
</div>
</body>
</html>