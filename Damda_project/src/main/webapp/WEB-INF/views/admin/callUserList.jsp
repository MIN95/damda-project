<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table text-center">
       <thead> 
           <tr>
               <th>
                   <input type="checkbox" id="all_chk1" style=" text-align: center;"/>
                   <label for="all_chk1"></label> 
               </th>    
               <th style=" text-align: center;">회원번호</th>
               <th style=" text-align: center;">ID</th> 
               <th style=" text-align: center;">이름</th>
               <th style=" text-align: center;">생일</th>
               <th style=" text-align: center;">E-mail</th>
               <th style=" text-align: center;">연락처</th>
               <th style=" text-align: center;">주소</th>
               <th style=" text-align: center;">계좌번호</th>
               <th style=" text-align: center;">구매금액</th>
               <th style=" text-align: center;">적립금</th>
               <th style=" text-align: center;">등급</th>
           </tr> 
       </thead>
		<tbody> 
		<c:forEach items="${List}" var="List" varStatus="status">
			<tr class="loadTr text-center">
				<td><input type="checkbox" name="chk" id="chk${status.count}" /><label for="chk${status.count}"></label></td>
				<td>${List.userNum}</td>
				<td>${List.userId}</td> 
				<td>${List.userName}</td> 
				<td>${List.userbirth}</td>
				<td>${List.userEmail}</td>
				<td>${List.userPhone}</td>
				<td>${List.userPostnum}&nbsp;${List.userAddr1}&nbsp;${List.userAddr2}</td>
				<td>${List.userAccOwner}&nbsp;${List.userBank}&nbsp;${List.userAcc}</td>
				<td>${List.userBuy}</td> 
				<td>${List.userPoint}</td>
				<td id="userGrade">${List.userGrade}</td>
			</tr> 
		</c:forEach>
		 <tr id="lastTr" class="text-left">
		    <td>
		        <input type="checkbox" id="all_chk2" />
		        <label for="all_chk2"></label>
		    </td>
		    <td colspan="12" id ="btn_div1" class="btn_div">
		        <p>전체선택(N/all)</p>
		        <button type="button" class="delete_btn">선택회원 삭제</button>
		    </td>
		</tr>
	</tbody>
</table> 
<div id="pageBtn" class="text-center" style="margin-bottom: 30px;">
	<ul class="btn-group pagination">
	    <c:if test="${pageMaker.prev }">
    <li>
        <a id="prevPage" style="cursor: pointer;"><i aria-label="Previous"></i>&laquo;</a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li>
        <a id="nowPage" class="pages" style="cursor: pointer;"><i>${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a id="nextPage" style="cursor: pointer;"><i aria-label="Next"></i>&raquo;</a>
    </li>
    </c:if>
	</ul> 
</div>