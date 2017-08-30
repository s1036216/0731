<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<div id="container" style="width:500px"> <!--컨테이너 중간  --> 

<form id="join_form" onsubmit="memberAdd()">
 <fieldset>
    <legend>join information:</legend>
<span id="join_id" >ID </span>
<input id="id" name="id" type="text" placeholder="ID"/><br />
<span id="join_pass">PASS </span>
<input id="pass" name="pass"type="text" placeholder="PASS" value="1"/><br />
<span id="join_name">NAME </span>
<input id="name"  name="name" type="text" placeholder="NAME" value="이길동"/><br />
<span id="join_phone">PHONE </span>
<input id="phone"  name="phone" type="text" placeholder="NAME" value="010-9189"/><br />
<span id="birth" name="birth" type="text" value="2017-08">생년월일 </span>
<input name="birth" type="text" /><br />
<input type="radio" name="gender" value="남자" checked/>남자
<input type="radio" name="gender" value="여자"/>여자<br />
	E-Mail
	<input type="email" name="email" value="leegd@test.com"/>
	<h3>전공</h3>
	<select name="major">
	<option  value="computer" selected>컴퓨터공학</option>
	<option  value="경제학">경제학</option>
	<option  value="관광학">관광학</option>
	<option  value="미술학" >미술학</option>
	</select><br/>
	<h3>수강과목</h3>
		
	<input type="checkbox" name="subject" value="java" checked/>자바<br/>
	<input type="checkbox" name="subject" value="c" checked/>C언어<br/>
	<input type="checkbox" name="subject" value="html" checked/>HTML<br/>
	<input type="checkbox" name="subject" value="css" />CSS<br/>
	<input type="checkbox" name="subject" value="javascript" />자바스크립트<br/>
	<input type="checkbox" name="subject" value="sql" />SQL<br/>
	<input type="checkbox" name="subject" value="python" />파이선<br/>	
<input id="join_yes_btn" type="submit" value="등록" />
<input id="join_no_btn" type="reset" value="취소" />
<input type="hidden" name="action" value="join" />
<input type="hidden" name="page" value="main" />
 </fieldset>
</form>
</div>
<jsp:include page="../common/footer.jsp"/>