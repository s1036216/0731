<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../member/member_head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학생상세 정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<div id="wrapper">  <!--전체 웨퍼ㅏ-->
<header>
<h1 style="text-align: center; ">비밀번호틀립니다</h1>
<hr/>
<a id="go_main" href="<%=request.getContextPath()%>/index.jsp">MAIN으로가기</a>
</header>
<hr /><br />
<a href="<%=request.getContextPath()%>/WEB-INF/common/main.jsp"></a>
	<div class="gms-image"><img  src="<%=request.getContextPath()%>/resources/img/123.JPG" alt="" /></a></div><br />
		<form id="login_form" action="<%=request.getContextPath()%>/common.do" method="get"><!--do 서블릿  -->
		<fieldset class="form-edit">
		<legend>로그인</legend>
			<span class="login-span">ID</span>
			<input type="text" name="id" /><br />
			<label>PASSWORD</label><input type="password" name="password"/><br />
			<mark style="font-size: 13px"> *ID는 숫자 포함 8글자 이내*</mark><br />
			<input type="submit" value="로그인" class="submit-pink">
			<input type="reset" value="취소" class="submit-blue">
				<input type="hidden" name="action" value="login" >
				<input type="hidden" name="page" value="main" >
					
		</fieldset>
		</form>
<footer>
<div>
 	 <p>Posted by: 조봉기</p>
  	<p>Contact information: <a href="mailto:someone@example.com">
  	cho1036216@naver.com</a>.</p>
  	<a href="util/jdbc_test.jsp">DB 연결테스트</a>
  </div>
</footer>
<body>
	
</body>
</html>
<jsp:include page="../common/footer.jsp"/>