<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:include page="../common/common_head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 </title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
@import url("../css/board.css");
</style>
</head>
<body>
<div id="wrapper"> 
<header>
<h1 style="text-align: center; ">게시판</h1>
</header>
<%=new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss").format(new Date()) %>
<hr/>
<a id="go_main" href="<%=request.getContextPath()%>/index.jsp">MAIN으로가기</a>