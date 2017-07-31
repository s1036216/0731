<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello HTML</title>

<!-- /*  @import url("/resources/css/common.css"); 
 @import url("/resources/css/member.css"); */ -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css"> 

</head>
<body  >
<div id="wrapper">
<header>
<h1 class="gms-text-center">성적관리 시스템 [GMS]</h1> 
<div>
<%=new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss").format(new Date()) %>
</div>
</header>
<hr />
<div id="container"> 
<table id="index-tab" > 
	<tr id="index-tab-tr"  >
		<td ><i class="glyphicon glyphicon-user">학생관리</i></td>
		<td ><i class="glyphicon glyphicon-envelope">성적관리</i></td>
		<td ><i class="glyphicon glyphicon-thumbs-up">게시판</i></td>
	</tr>
	<tr>
		<td style="">
			<ul class="index-ul" >
				
				<li ><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_add">학생추가 정보</a></li>
				<li ><a href="<%=request.getContextPath()%>/member.do?action=list&page=member_list">학생정보 목록</a></li>
				<li ><a href="<%=request.getContextPath()%>/member.do?action=detail&page=member_detail">학생 상세정보</a></li>
				<li ><a href="<%=request.getContextPath()%>/member.do?action=update&page=member_update">학생정보 수정</a></li>
				<li ><a href="<%=request.getContextPath()%>/member.do?action=delete&page=member_delete">학생정보 삭제</a></li>
				
				
			</ul>
		</td>
		<td style="">
			<ul class="index-ul">
			<li ><a href="grade/grade_add.jsp">성적 입력</a></li>
			<li ><a href="grade/grade_list.jsp">성적 목록</a></li>
			<li ><a href="grade/grade_detail.jsp">성적 상세</a></li>
			<li ><a href="grade/grade_update.jsp">성적 수정</a></li>
			<li ><a href="grade/grade_delete.jsp">성적 삭제</a></li>
			
				</ul>
		</td>
		
		<td style="">
			<ul class="index-ul">
				<li ><a href="board/board_write.jsp">게시글 쓰기</a></li>
				<li ><a href="board/board_list.jsp">게시글 목록</a></li>
				<li ><a href="board/board_detail.jsp">게시글 상세</a></li>
				<li ><a href="board/board_update.jsp">게시글 수정</a></li>
				<li ><a href="board/board_delete.jsp">게시글 삭제</a></li>
				
			</ul>
		</td>
	</tr>
	
</table>
</div>
<hr />

</div>
</body>
</html>
<%@ include file = "../common/footer.jsp" %>