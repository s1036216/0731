<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<div id="container"> 
	<img src="../img/123.JPG" alt="" /><br />
		<span id="login_id">ID </span> 
		<input type="text"/> <mark>아이디는 숫자포함8자</mark> <br />
		<span id="login_pass">pass</span> 
		<input type="text"/> <br />
	<button id="login_btn" onclick="window.location.href='member_detail.jsp'">LOGIN</button>
	<button id="cancel_btn" onclick="window.location.href='mypage.jsp'">CANCLE</button>
 </div>
<jsp:include page="../common/footer.jsp"/>