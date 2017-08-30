<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp" />
<header>

	<div class="row">
   <div class="col-lg-6" style="margin: 0 auto;width:80%;height:5%;">
         <div class="input-group">
        <input type="text" class="form-control"   placeholder="Search for..." id="search" name="search">
        <span class="input-group-btn">
          <button  class="btn btn-default" type="submit" onclick="search()">Go!</button>
           </span>
   </div><!-- /input-group -->
</div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div style="height: 40px;width:300px;"></div>
 </header>
<hr />
<br />
<table id="mem_list_tab">
	<tr>
		<th style="width: 5%">No</th>
		<th style="width: 10%">아이디</th>
		<th style="width: 10%">이름</th>
		<th style="width: 10%">생년월일</th>
		<th style="width: 10%">전화번호</th>
		<th style="width: 15%">이메일</th>
		<th style="width: 20%">수강과목</th>
		<th style="width: 10%">등록일</th>
		<th style="width: 10%">수정/삭제</th>
	</tr>
	<c:forEach var="i" items="${requestScope.list}">
		<!--jstl 엑션테그  el을 쓴다   값을주고 사라짐-->
		<tr>
			<td>${i.num}</td>
			<td>${i.id}</td>
			<td><a onclick="detailStudent('${i.id}')">${i.name}</a></td>
			<td>${i.ssn}</td>
			<td>${i.phone}</td>
			<td>${i.email}</td>
			<td>${i.title}</td>
			<td>${i.regdate}</td>
			<td>
			<a onclick="updateStudent('${i.id}')">수정</a>
			/
			<a onclick="deleteStudent('${i.id}')">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
<div>
<nav aria-label="Page navigation" style="width: 400px; margin:0 auto;">
	<ul class="pagination" >
	<c:if test="${requestScope.prevBlock gt 0}">
		 <li><a onclick="list('member','member_list',${requestScope.startPage-1})" ><span class="glyphicon glyphicon-circle-arrow-left" aria-hidden="true"></span></a></li>
		<li>
			<a onclick="list('member','member_list',${requestScope.prevBlock})" aria-label="Previous"> 
		<span aria-hidden="true">&laquo;</span>
		</a>
		</li >
	</c:if>			
	<c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
		<c:choose>
		<c:when test="${i.index eq requestScope.pageNumber}">
			<li class="active" ><a>${i.index}</a></li>
		</c:when>
		<c:otherwise>
			<li><a onclick="list('member','member_list',${i.index})">${i.index}</a></li>
		</c:otherwise>	
		</c:choose>
	</c:forEach>	
		<c:if test="${requestScope.prevBlock eq 0}">
		<li><a onclick="list('member','member_list',${requestScope.endPage+1})"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
		 <li><a onclick="list('member','member_list',${requestScope.endBlock})"><span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span></a></li>
	</c:if>	
	</ul>
</nav>
</div>
<script>

</script>

<jsp:include page="../common/footer.jsp" />