<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GMS</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home"> &nbsp;HOME</span></a></li>
      <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="flase">학생관리 </a> 
       <ul id="navbar_ul_stud">
          <li><a>학생추가</a></li>
          <li><a>학생 목록</a></li>
          <li><a>학생 조회</a></li>
          <li role="separator" class="divider"></li>
          <li><a>학생삭제</a></li>
       </ul>
      </li>
       <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="flase">성적관리 </a>
          <ul id="navbar_ul_grade">
          <li><a>성적추가</a></li>
          <li><a>성적 목록</a></li>
          <li><a>성적 조회</a></li>
          <li role="separator" class="divider"></li>
          <li><a>성적 삭제</a></li>
       </ul>
      </li>
       <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="flase">게시판 관리 </a>
          <ul id="navbar_ul_board">
          <li><a>게시판 추가</a></li>
          <li><a>게시판 목록</a></li>
          <li><a>게시판 조회</a></li>
          <li role="separator" class="divider"></li>
          <li><a>게시판 삭제</a></li>
       </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li style="font-weight:bold;color: white ">${sessionScope.user.name}</li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a id="logout" onclick="logout('common','home')"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
    </ul>
  </div>
</nav>
<script>
window.onload=navbarLoad();
function logout(directory,page) {
   location.href="${ctx}/"+directory+".do?action=logout&page="+page;
}
function moveTo(directory,page) {
	alert('무브투');
   location.href="${ctx}/"+directory+".do?action=move&page="+page;
}
function deleteTarget(){
      prompt(target+'의 ID');
   }
function list(directory,page,pageNumber) {
	location.href="${ctx}/"+directory+".do?action=list&page="+page+"&pageNumber="+pageNumber;
}
function mainLoad() {
/* 	var main_ul=[];
	var u1=$("#main_ul_stud");
	var u2=$("#main_ul_grade");
	var u3=$("#main_ul_board"); */
   var u1=document.getElementById("main_ul_stud");
   var u2=document.getElementById("main_ul_grade");
   var u3=document.getElementById("main_ul_board");
   u1.setAttribute("class", "list-group");
   u2.setAttribute("class", "list-group");
   u3.setAttribute("class", "list-group");
   var u1c=u1.children;
   var u2c=u2.children;
   var u3c=u3.children;
   var i;
   for(i=0;i<u1c.length;i++){
      u1c[i].setAttribute("class", "list-group-item");
   }
   for(i=0;i<u2c.length;i++){
      u2c[i].setAttribute("class", "list-group-item");
   }
   for(i=0;i<u3c.length;i++){
      u3c[i].setAttribute("class", "list-group-item");
   }
   u1c[0].setAttribute("onclick", "moveTo('member','member_add')");
   u1c[1].setAttribute("onclick", "list('member','member_list','1')");
   u1c[2].setAttribute("onclick", "moveTo('member','member_detail')");
   u1c[3].setAttribute("onclick", "deleteTarget()");
   u2c[0].setAttribute("onclick", "moveTo('grade','grade_add')");
   u2c[1].setAttribute("onclick", "list('grade','grade_list','1')");
   u2c[2].setAttribute("onclick", "moveTo('grade','grade_detail')");
   u2c[3].setAttribute("onclick", "deleteTarget()");
   u3c[0].setAttribute("onclick", "moveTo('board','board_write')");
   u3c[1].setAttribute("onclick", "list('board','board_list','1')");
   u3c[2].setAttribute("onclick", "moveTo('board','board_detail')");
   u3c[3].setAttribute("onclick", "deleteTarget()");
}
function navbarLoad() {
   var u1=document.getElementById("navbar_ul_stud");
   var u2=document.getElementById("navbar_ul_grade");
   var u3=document.getElementById("navbar_ul_board");
   var u1c=u1.children;
   var u2c=u2.children;
   var u3c=u3.children;
   u1.setAttribute("class", "dropdown-menu");
   u2.setAttribute("class", "dropdown-menu");
   u3.setAttribute("class", "dropdown-menu");
   u1c[0].setAttribute("onclick", "moveTo('member','member_add')");
   u1c[1].setAttribute("onclick", "list('member','member_list','1')");
   u1c[2].setAttribute("onclick", "moveTo('member','member_detail')");
   u1c[3].setAttribute("role", "separator");
   u1c[3].setAttribute("class", "divider");
   u1c[4].setAttribute("onclick", "deleteTarget('학생')");
   u2c[0].setAttribute("onclick", "moveTo('grade','grade_add')");
   u2c[1].setAttribute("onclick", "list('grade','grade_list','1')");
   u2c[2].setAttribute("onclick", "moveTo('grade','grade_detail')");
   u2c[3].setAttribute("role", "separator");
   u2c[3].setAttribute("class", "divider");
   u2c[4].setAttribute("onclick", "deleteTarget('성적')");
   u3c[0].setAttribute("onclick", "moveTo('grade','grade_add')");
   u3c[1].setAttribute("onclick", "list('grade','grade_list','1')");
   u3c[2].setAttribute("onclick", "moveTo('grade','grade_detail')");
   u3c[3].setAttribute("role", "separator");
   u3c[3].setAttribute("class", "divider");
   u3c[4].setAttribute("onclick", "deleteTarget('게시판')");
  
   var logout=doucument.getElementById("logout");
   logout.setAttribute("onclick","'logout'('common','home')");
}

function search(){
	
	var search=document.getElementById("search").value;
	if(search===""){
		alert('검색어 입력');
		return ;
	}
	alert('입력'+search);
	location.href="${ctx}/member.do?action=search&page=member_list&search="+search;

}


	function updateStudent(id){
		alert('수정할 id'+id);
		location.href="${ctx}/member.do?action=update&page=member_update&id="+id;
	}
	function deleteStudent(id){
		alert('삭제할 id'+id);
		location.href="${ctx}/member.do?action=delete&page=member_list&id="+id;
	}
	function detailStudent(id){
		alert('삭제할 id'+id);
		location.href="${ctx}/member.do?action=detail&page=member_detail&id="+id;
	}
	
	function studentInfo(){
  	  var id='id',
  	      id_val='${requestScope.student.id}',
  	      name='name',
  	      name_val='${requestScope.student.name}',
  	      email='email',
  	      email_val='${requestScope.student.email}'
  	      ;
  	  sessionStorage.setItem(id,id_val);    
  	  sessionStorage.setItem(name,name_val);    
  	  sessionStorage.setItem(email,email_val);    
    }
    function testss() {
  	  alert('ㅇㅇ');
    }
    window.addEventListener('load',test,false);
    
    function memberAdd(){
    	var form=document.getElementById("join_form");  //타입은 input
    	form.setAttribute=('action','${ctx}/common.do');
    	form.setAttribute=('metehod','post');
    	return true;
    }
    		
</script>