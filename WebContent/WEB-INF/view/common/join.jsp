<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../member/member_head.jsp"/>

<div id="container" style="width:500px"> <!--컨테이너 중간  --> 
<form action="member_detail.jsp" method="get">
 <fieldset>
    <legend>아이디가 존재하지않습니다</legend>
<span id=join_id >ID </span>
<input name="id"type="text" placeholder="ID"/><br />
<span id=join_pass>PASS </span>
<input name="pass"type="text" placeholder="PASS"/><br />
<span id=join_name>NAME </span>
<input name="name" type="text" placeholder="NAME"/><br />
<span id=birth>생년월일 </span>
<input name="birthday"type="text" /><br />
<input type="radio" name="gender" value="남자"/>남자
<input type="radio" name="gender" value="여자"/>여자<br />
	E-Mail
	<input type="email" name="email" />
	<h3>전공</h3>
	<select name="major">
	<option name="major" value="컴퓨터공학" selected>컴퓨터공학</option>
	<option name="major" value="경제학">경제학</option>
	<option name="major" value="관광학">관광학</option>
	<option name="major" value="미술학" >미술학</option>
	</select><br/>
	<h3>수강과목</h3>	
	<input type="checkbox" name="subject" value="java" checked/>자바<br/>
	<input type="checkbox" name="subject" value="c" checked/>C언어<br/>
	<input type="checkbox" name="subject" value="html" />HTML<br/>
	<input type="checkbox" name="subject" value="css" />CSS<br/>
	<input type="checkbox" name="subject" value="javascript" />자바스크립트<br/>
	<input type="checkbox" name="subject" value="sql" />SQL<br/>
	<input type="checkbox" name="subject" value="python" />파이선<br/>	
<input id="join_yes_btn" type="submit" value="등록" >
<input id="join_no_btn" type="reset" value="취소" >
 </fieldset>
</form>
</div>
<jsp:include page="../common/footer.jsp"/>