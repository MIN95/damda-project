<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css" />
<jsp:include page="/resources/template/head.jsp"/>
<jsp:include page="/resources/template/mypage_head.jsp"/>
<style type="text/css">
	/*content area************************************/
	#content #content_content h3 {
		width: 150px;
	}

	#content #content_content small {
	    width: 220px;
	}

	/*pagination start*/
	#mypagepaging{
		text-align: center;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	#content #mypagepaging .pagination>li>a {
	    color: black;
	    cursor: pointer;
	}
	
	#content #mypagepaging .pagination>li>a:hover {
	    font-weight: bold;
	}
	/*pagination end*/
	
	#content #content_content table {
	    text-align: center;
	    margin-bottom: 20px;
	    border-top: 2px solid darksalmon;
	}
	
	#content #content_content table th {
	    text-align: center;
	    height: 50px;
	    border-bottom: 2px solid #cccccc;
	}

	#content #content_content table td {
	    border-bottom: 1px solid #cccccc;
	
	}
	
	#content #content_content table th:nth-child(1) {
	    width: 5%;
	}
	
	#content #content_content table th:nth-child(2) {
	    width: 80%;
	}
	
	#content #content_content table th:nth-child(3) {
	    width: 15%;
	}

	#content #content_content table td:nth-child(2) {
	    width: 20%;
	    padding: 10px;
	}
	
	#content #content_content table td:nth-child(3) {
	    text-align: left;
	}
	
	#content #content_content table img {
	    width: 100%;
	    height:20%;
	}
	
	#content #content_content table input[type="text"] {
	    border: 0px;
	    font-size: 17px;
		font-weight: bold;
		margin-left: 20px;
		cursor: pointer;
	}
      
	#content #content_content table span {
	     display: inline-block;
	     margin-left: 20px;
	     margin-bottom: 5px;
	     font-size: 12px;
	     margin-top: 0px;
	 }
      
	#content #content_content table p {
	    font-size: 13px;
	    margin-left: 20px;
	}
	
	#content #content_content table button {
	    font-size: 13px;
	    width: 100px;
	    height: 30px;
	    background-color: white;
	    border: 1px solid darksalmon;
	}

	#content #content_content table button:nth-child(1) {
	    color: darksalmon;
	}

   	#content #content_content a{
   		color: black;
   	}
   	
   	#content #content_content a:hover{
   		color: darksalmon;
   	}
</style>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<div id="content_content" class="col-md-6 col-md-offset-3">
		<h3>주문상세내역</h3>
		<small>지난 3년간의 주문 내역 조회가 가능합니다</small>
		<table>
			<thead>
				<tr>
					<th></th>		
					<th colspan="2" style="text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;상품정보</th>
					<th>선택</th>
				</tr>
			</thead>
		<tbody>
		  <c:set var="nouserdetailcnt" value="${0 }"/>
		  <c:forEach items="${map.nouserDetail }" var="nouserDetail" varStatus="status">
			<tr id="orderlisttr">
				<td></td>
				<td>
				  <c:if test="${nouserDetail.photoPath != null }">
					<a href="#"><img src="${nouserDetail.photoPath }" /></a>
				  </c:if>
				</td>
				<td>
			  	  <fmt:formatNumber value="${nouserDetail.itemPrice }" pattern="#,###" var="itemPrice"/>
			  	  <fmt:formatNumber value="${nouserDetail.cstmPrice }" pattern="#,###" var="cstmPrice"/>
			  	  <c:if test="${nouserDetail.itemName == null }">
			  	  	<c:set var="nouserdetailcnt" value="${nouserdetailcnt + 1 }"/>
					<a href="#"><input type="text" name="itemname" id="itemname" value="[custom] 샐러드 NO.${nouserdetailcnt }" readonly /></a>
					<span>${nouserDetail.cstmMatelist }</span>
					<p>금액&nbsp;:&nbsp;<c:out value="${cstmPrice }원"/></p>
				  </c:if>
				  <c:if test="${nouserDetail.cstmMatelist == null }">
					<a href="#"><input type="text" name="itemname" id="itemname" value="[salad] ${nouserDetail.itemName}" readonly /></a>
					<span></span>
					<p>금액&nbsp;:&nbsp;<c:out value="${itemPrice }원"/></p>
				  </c:if>
				</td>
				<td>
				  <c:if test="${nouserDetail.deliverstatus == 4}">
				  	<button type="button">배송중</button>
				  </c:if>
				  <c:if test="${nouserDetail.deliverstatus == 5}">
				  	<button type="button">배송완료</button>
				  	  <c:if test="${nouserDetail.itemName != null }">
				  	  	<c:if test="${map.reviewT == null }">
				  	  	  <button type="button" style="margin:10px 0px 0px 0px;" onclick="goReview('${mypageDetail.o_ordernum}',${mypageDetail.cstmtNum },${mypageDetail.itemNum })">리뷰쓰기</button>
				  	  	</c:if>
				  	  	<c:if test="${map.reviewT != null }">
				  	  	  <button type="button" style="margin:10px 0px 0px 0px;" onclick="goReview('${mypageDetail.o_ordernum}',${mypageDetail.cstmtNum },${mypageDetail.itemNum })">리뷰작성완료</button>
				  	  	</c:if>
				  	  </c:if>
				  </c:if>
				  <c:if test="${nouserDetail.deliverstatus == 6}">
				  	<button type="button">취소대기중</button>
				  </c:if>
				  <c:if test="${nouserDetail.deliverstatus == 7}">
				  	<button type="button">취소완료</button>
				  </c:if>
				  <c:if test="${nouserDetail.deliverstatus == 8}">
				  	<button type="button">환불대기중</button>
				  </c:if>
				  <c:if test="${nouserDetail.deliverstatus == 9}">
				  	<button type="button">환불완료</button>
				  </c:if>
				</td>
				</tr>
			  </c:forEach>
			</tbody>
		</table>	
</div>
<!-- 페이징 시작 -->
<div class="col-md-12 col-xs-12 col-sm-12" id="mypagepaging">
  <ul class="pagination">
  	<c:if test="${map.noticePager.curPage > 1 }">
  	  <li>
 	  	<a href="javascript:list('${map.noticePager.curPage - 1 }')" aria-label="Previous">
	  	  <span aria-hidden="true">&laquo;</span>
	  	</a>
  	  </li>
  	</c:if>
  	<c:forEach var="num" begin="${map.noticePager.blockBegin }" end="${map.noticePager.blockEnd }">
  	  <c:choose>
  	  	<c:when test="${num == map.noticePager.curPage }">
  	  	  <li><a>${num }</a></li>
  	  	</c:when>
  	  	<c:otherwise>
  	  	  <li><a href="javascript:list('${num }')">${num }</a></li>
  	  	</c:otherwise>
  	  </c:choose>
  	</c:forEach>
  	<c:if test="${map.noticePager.curPage < map.noticePager.totPage }">
  	  <li>
	  	<a href="javascript:list('${map.noticePager.curPage + 1 }')" aria-label="Next">
	  	  <span aria-hidden="true">&raquo;</span>
	  	</a>
  	  </li>
  	</c:if>
  </ul>
</div>
<!-- 페이징 끝 -->
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function() {
	  	//화면 조정
	    grid2();
	});

	
	$(window).resize(function() {
	    grid2();
	});
	
	function grid2() {
	    var windowWidth = $(window).width();
	
	    //md
	    if (windowWidth >= 992) {
	        $('#content_content table').css('margin-top', '8px');
	    } else {}
	
	    //sm
	    if (windowWidth >= 768 && windowWidth < 992) {
	        $('#content_content table').css('margin-top', '50px');
	    } else {}
	
	    //xs
	    if (windowWidth < 768) {
	        $('#content_content table').css('margin-top', '50px');
	    } else {}
	}

	/**************************************************************/
	//페이징
	function list(page){
		location.href = "${path}/mypage/detail/${map.mypageDetail[0].o_ordernum }?curPage="+page;
 	}
	/**************************************************************/
	//리뷰로 이동
	function goReview(ordernum,customnum,itemnum){
		if(customnum != "0"){
			location.href = "/mypage/detail/review?ordernum"+ordernum+"&customnum="+customnum;
		}else if(itemnum != "0"){
			location.href = "/mypage/detail/review?ordernum"+ordernum+"&itemnum="+itemnum;
		}
	}
</script>
</html>
