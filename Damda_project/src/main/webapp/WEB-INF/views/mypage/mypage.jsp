<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            width: 110px;
        }

        #content #content_content small {
            width: 240px;
        }

        #content #content_content table {
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-collapse: collapse;
        }

        #content #content_content table th:nth-child(2) {
            border-bottom: 1px solid #cccccc;
        }

        #content #content_content table td,
        #content #content_content table th {
            padding: 10px;
        }

        #content #content_content table th a {
            display: inline-block;
            color: #343434;
            font-size: 17px;
            text-decoration: none;
            width: 100%;
        }

        #content #content_content table th a:hover {
            color: darksalmon;
        }

        #content #content_content table th a img {
            width: 15px;
            float: right;
            position: relative;
            top: 7px;
            left: 25px;
        }

        .mypagetable {
        	width:100%;
        }
        #content #content_content table img {
            width: 15%;
            float: left;
            margin-right: 20px;
        }
        
        #td2table>img {
        	height:120px;
        }
        
        #content #content_content label {
            font-size: 11px;
            font-weight: 100;
            width: 50px;
        }

        #content #content_content input {
            font-weight: bold;
            border: 0px;
            margin-bottom: 10px;
        }

        #content #content_content .date_h4 {
            margin-top: 20px;
            color: darksalmon;
        }
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
	  <a href="/mypage/"><p class="active_menu">주문 내역</p></a>
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
  <h3>주문내역</h3>
  <small>지난 3년간의 주문 내역 조회가 가능합니다</small>
  <div>
  	<c:set var="mypageindex" value="${0 }"/>
  	<c:forEach items="${map.mypage }" var="mypage">
	  <h4 class="date_h4">${mypage.orderdate }</h4>
	  <table class="mypagetable">
	  	<tr>
		  <th></th>
		  <th>
		  	<a href="/mypage/detail/${mypage.o_ordernum }">
		  	  <c:if test="${mypage.itemName != null }">
			  	[salad]&nbsp;${mypage.itemName }&nbsp;...
		  	  </c:if>
			  <c:if test="${mypage.itemName == null }">
			  	<c:set var="mypageindex" value="${mypageindex+1}"/>
			  	[custom]&nbsp;샐러드&nbsp;NO.${mypageindex }&nbsp;...
		  	  </c:if>
			<img src="/resources/icon/rigth.png">
		  </a>
		</th>
		<th></th>
	  </tr>
	  <tr>
		<td></td>
		<td id="td2table">
		  <img src="${mypage.photoPath }" />
		  <label for="oderNum">주문번호</label>
		  <input type="text" name="oderNum" id="oderNum" value="${mypage.o_ordernum }" readonly>
		  <br />
		  <label for="price">결제금액</label>
		  <input type="text" name="price" id="price" value="${mypage.allprice }원" readonly>
		  <br />
		  <label for="deliverStatus">주문상태</label>
		  <c:if test="${mypage.deliverstatus == 1 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="입금대기중" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 2 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="입금완료" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 3 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="주문완료" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 4 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="배송중" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 5 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="배송완료" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 6 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="환불처리중" readonly>
		  </c:if>
		  <c:if test="${mypage.deliverstatus == 7 }">
		  	<input type="text" name="deliverStatus" id="deliverStatus" value="환불완료" readonly>
		  </c:if>
		</td>
		<td></td>
	  </tr>
	</table>
	<br/>
	</c:forEach>
  </div>
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
	$(document).ready(function(){
		var mytablesize = $('.mypagetable').size();
		var mytabletr;
		var mytabletd;
		var price;
		var priceArray = new Array();
		for(var i=0; i<mytablesize; i++){
			mytabletr = $('.mypagetable').children().eq(i);
			mytabletd = mytabletr.children().eq(1);
			price = mytabletd.children().eq(1).children().eq(5).val();
			commaprice = addComma(price);
			mytabletd.children().eq(1).children().eq(5).val(commaprice);
		}
	});
	/* 3자리수마다 콤마 시작*/
	function addComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	//paging클릭시 이동
	function list(page){
		location.href = "${path}/mypage/?curPage="+page;
 	}
</script>
</html>