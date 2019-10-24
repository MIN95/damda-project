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

        /*checkbox_start*/
        #content #content_content input[type="checkbox"] {
            display: none;
        }

        #content #content_content input[type="checkbox"]+label {
            display: inline-block;
            width: 17px;
            height: 17px;
            background: white;
            cursor: pointer;
            border-radius: 3px;
            border: 1px solid #cccccc;
        }

        #content #content_content input[type="checkbox"]:checked+label {
            background: url(/resources/icon/check.png) darksalmon no-repeat center/15px 15px;
            border: 0px;
        }

        /*checkbox_end*/

        /*pagination start*/
        #content #content_content .pagination {
            margin-bottom: 50px;
        }

        #content #content_content .pagination>li>a {
            color: black;
        }

        #content #content_content .pagination>li>a:hover {
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
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
	<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
		<h2>마이페이지</h2>
		<ul>
			<li class="active_menu">
				<a href="/mypage/" class="active_menu"><p>주문 내역</p></a>
			</li>
			<li>
				<a href="/mypage/jjim"><p>찜</p></a>
			</li>
			<li>
				<a href="/mypage/myrecipe"><p>마이 레시피</p></a>
			</li>
			<li>
				<a href="/mypage/qna"><p>문의 내역</p></a>
			</li>
			<li>
				<a href="/mypage/userinfo"><p>개인 정보 수정</p></a>
			</li>
		</ul>
	</div>
	<div id="content_content" class="col-md-6">
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
		  <c:forEach items="${map.mypageDetail }" var="mypageDetail" varStatus="status">
			<tr id="orderlisttr">
				<td></td>
				<td>
				  <c:if test="${mypageDetail.photopath == null }">
					<a href="#"><img src="/resources/imgs/s01.jpg" /></a>
				  </c:if>
				  <c:if test="${mypageDetail.photopath != null }">
					<a href="#"><img src="${mypageDetail.photopath }" /></a>
				  </c:if>
				</td>
				<td>
			  	  <fmt:formatNumber value="${mypageDetail.price }" pattern="#,###" var="price"/>
			  	  <c:if test="${mypageDetail.itemname == null }">
					<a href="#"><input type="text" name="itemname" id="itemname" value="커스텀 샐러드" readonly /></a>
					<span>${mypageDetail.cstmmatelist }</span>
					<p>금액&nbsp;:&nbsp;<c:out value="${price }원"/></p>
				  </c:if>
				  <c:if test="${mypageDetail.cstmmatelist == null }">
					<a href="#"><input type="text" name="itemname" id="itemname" value="${mypageDetail.itemname}" readonly /></a>
					<span></span>
					<p>금액&nbsp;:&nbsp;<c:out value="${price }원"/></p>
				  </c:if>
				</td>
				<td>
				  <c:if test="${mypageDetail.deliverstatus == 4}">
				  	<button type="button">배송중</button>
				  </c:if>
				  <c:if test="${mypageDetail.deliverstatus == 5}">
				  	<button type="button">배송완료</button>
				  	<button type="button" style="margin:10px 0px 0px 0px;" onclick="">리뷰쓰기</button>
				  </c:if>
				  <c:if test="${mypageDetail.deliverstatus == 6}">
				  	<button type="button">취소대기중</button>
				  </c:if>
				  <c:if test="${mypageDetail.deliverstatus == 7}">
				  	<button type="button">취소완료</button>
				  </c:if>
				  <c:if test="${mypageDetail.deliverstatus == 8}">
				  	<button type="button">환불대기중</button>
				  </c:if>
				  <c:if test="${mypageDetail.deliverstatus == 9}">
				  	<button type="button">환불완료</button>
				  </c:if>
				</td>
				</tr>
			  </c:forEach>
			</tbody>
		</table>		
		<!-- 페이징 시작 -->
		<div class="col-md-offset-3 col-md-9 col-sm-offset-4 col-sm-6 col-xs-offset-2 col-xs-8">
			<ul class="pagination">
			  <c:if test="${map.noticePager.curPage > 1}">
				<li>
    				<a href="javascript:list('${map.noticePager.curPage - 1 }')" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
    				</a>
				</li>
			  </c:if>
			  <c:forEach var="num" begin="${map.noticePager.blockBegin }" end="${map.noticePager.blockEnd}">
				<c:choose>
	  		  	  <c:when test="${num == map.noticePager.curPage }">
					<li><span>${num}</span></li>
		  		  </c:when>
		  		  <c:otherwise>
		  			<li><a href="javascript:list('${num }')">${num}</a></li>
	  		      </c:otherwise>
		  	  	</c:choose>
			  </c:forEach>
			  <c:if test="${map.noticePager.curPage < map.noticePager.totPage}">
				<li>
				    <a href="javascript:list('${map.noticePager.curPage + 1 }','${map.noticePager.totPage }')" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				    </a>
				</li>
			  </c:if>
			</ul>
		</div>
	</div>
	<div></div>
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
	
</script>
</html>
