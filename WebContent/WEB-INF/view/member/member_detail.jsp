<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "member_head.jsp" %>
         <header>
         <h1 class="gms-h1">Member Detail</h1>
         </header>
         <hr /><br />
         <h1 class="gms-text-center">회원 상세정보</h1>
         <table id = "detail-tab">
            <tr>
               <td colspan="2" rowspan="3" align="left" width="20%"><img src="<%=request.getContextPath()%>/resources/img/defaultimg.jpg"></td>
               <td> 이름 </td>
               <td></td>
            </tr>
            <tr>
               <td>ID </td>
               <td></td>
            </tr>
            <tr>
               <td> SSN </td>
               <td></td>
            </tr>
            <tr>
               <td>전화</td>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td>전공</td>
               <td colspan="3"></td>
            </tr>
         </table>
         <div id="btn_div">
         <br />
         <button id="list_btn" onclick="javascript:goList()">목록</button>
         <button id="update_btn" onclick="javascript:goUpdate()">수정</button>
         </div>
         <script>
         function goList() {
            location.href="<%=request.getContextPath()%>/member/member_list.jsp?action=list";
            
            
         }
         function goUpdate() {
            location.href="<%=request.getContextPath()%>/member/member_update.jsp?id=";
         }
         </script>
         <%@ include file = "../common/footer.jsp" %>


   