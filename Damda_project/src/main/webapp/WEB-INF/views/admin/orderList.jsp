<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
    #pgname-wrap {
	    /* border:thin solid rgb(200,200,200); */
	    height: 45px;
	    width:125px;
	    margin: 0 auto;
    }
    #pgname-wrap h3 {
	    margin: 0px;
	    padding: 7px;
    }
    #listselects>select{
    	float:left;
    }
    #wtdeliverstauts{
    	margin:0px 12px 0px 0px;
    }
    /* table start */
    #liketh>div {
    	border-top: 2px solid darksalmon;
    }
    #notice-tab #liketh {
    	font-weight: bold;
    }
    #notice-tab #liketh>div {
    	line-height: 45px;
    	height: 45px;
    	border-bottom: 1px solid rgb(200,200,200);
    }
    #notice-tab .liketd>div{
    	line-height: 45px;
    	height: 45px;
    	border-top: 1px solid rgb(200,200,200);
    	cursor: pointer;
    }
    #notice-tab .listleft {
    	text-align: left;
    }
    #notice-tab .listright {
    	text-align: right;
    }
    #notice-tab .listdetail {
    	display: none;
    }
    #notice-tab .listdetail>div {
    	border-top: 1px solid rgb(200,200,200);
    }
    #notice-tab .listdetail>div>div {
    	margin:10px 0px 10px 15px;
    	text-align: left;
    }
    .listdetail>div>div>span{
    	clear:both;
    	padding:0;
		color:darksalmon;
		display: inline-block;
		float: left;
    }
    .listdetail>div>div>p{
		float: left;
    }
    .listdetail>div>div>p2{
		float: left;
    }
    /* table end */
    /* paging start */
    .pagination {
            margin-bottom: 50px;
    }
    .pagination>li>a {
        color: black;
    }
    .pagination>li>a:hover {
        font-weight: bold;
	}
	/* paging end */
    </style>
</head>
<body>
<!-- ***********************************header start*********************************** -->
<jsp:include page="/resources/template/header.jsp"/>
<!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
	  <div id="content" class="row">
		<div class="col-md-offset-1 col-md-10">
		  <div class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<div id="pgname-wrap">
			  <h3>주문목록</h3>
			</div>
			<br />
		  </div>
		  <div id="notice-tab" class="col-md-12 col-sm-12 col-xs-12">
			<br />
			<div class="row">
				<div class="col-md-3 col-md-offset-1 col-xs-3 col-sm-3" id="listselects">
					<select id="wtdeliverstauts" name="wtdeliverstauts" onchange="wtdeliver(this.value)">
						<option value="%">배송상태</option>
						<option value="1">입금대기중</option>
						<option value="2">입금완료</option>
						<option value="3">주문완료</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<option value="6">환불대기중</option>
						<option value="7">환불완료</option>
					</select>
				</div>
			</div>
			<br />
			<div class="row" id="foreachprev">
				<div class="col-md-10 col-md-offset-1" id="liketh">
					<div class="col-md-1 col-sm-2 col-xs-2 listleft">No</div>
					<div class="col-md-5 col-sm-4 col-xs-3">주문자명</div>
					<div class="col-md-4 col-sm-4 col-xs-4">주문번호</div>
					<div class="col-md-2 col-sm-2 col-xs-3 listright">배송상태</div>
				</div>
			</div>
			<!-- 1 -->
			<div class="orderlistforEach">
			<c:forEach items="${map.adorderList }" var="adorderList" varStatus="status">
			  <div class="row">
				<div class="col-md-10 col-md-offset-1 liketd td-${status.count }" onclick="liketd(${status.count})">
					<div class="col-md-1 col-sm-2 col-xs-2 listleft">${adorderList.orderlistnum }</div>
					<c:if test="${adorderList.username != null }">
					  <div class="col-md-5 col-sm-4 col-xs-3">${adorderList.username }</div>
					</c:if>
					<c:if test="${adorderList.username == null}">
					  <div class="col-md-5 col-sm-4 col-xs-3">${adorderList.nousername }</div>
					</c:if>
					<div class="col-md-4 col-sm-4 col-xs-4">${adorderList.o_ordernum }</div>
					<div class="col-md-2 col-sm-2 col-xs-3 listright">
					  <select class="changedeliver" name="changedeliver">
						<option value="0">배송상태</option>
						<option value="1" <c:if test="${adorderList.deliverstatus==1}"> selected </c:if>>입금대기중</option>
						<option value="2" <c:if test="${adorderList.deliverstatus==2}"> selected </c:if>>입금완료</option>
						<option value="3" <c:if test="${adorderList.deliverstatus==3}"> selected </c:if>>주문완료</option>
						<option value="4" <c:if test="${adorderList.deliverstatus==4}"> selected </c:if>>배송중</option>
						<option value="5" <c:if test="${adorderList.deliverstatus==5}"> selected </c:if>>배송완료</option>
						<option value="6" <c:if test="${adorderList.deliverstatus==6}"> selected </c:if>>환불대기중</option>
						<option value="7" <c:if test="${adorderList.deliverstatus==7}"> selected </c:if>>환불완료</option>
					  </select>
					</div>
				</div>
				<div class="col-md-10 col-md-offset-1 listdetail">
				  <div>
				  	<fmt:formatNumber value="${adorderList.allprice }" pattern="#,###" var="allprice"/>
					<div>
						<span>수령자〉</span>
						<p class="userid">${adorderList.receivername }</p>
						<br/>
						<span>핸드폰〉</span>
						<p class="receiverphone">${adorderList.receiverphone }</p>
						<br/>
						<c:if test="${adorderList.itemName != null }">
				  	  	  <span>샐러드〉</span>
				  	  	  <p class="itemname">${adorderList.itemName }</p>
				  	  	</c:if>
				  	  	<c:if test="${adorderList.cstmMatelist != null}">
				  	  	  <span>커스텀〉</span>
				  	  	  <p2 class="customname">${adorderList.cstmMatelist }</p2>
				  	  	  <br/><br/>
				  	  	</c:if>
				  	  	<span>합계가격〉</span>
				  	  	<p class="allprice">${allprice }원</p>
				  	  	<br/>
				  	  	<span>주문날짜〉</span> 
				  	  	<p class="orderdate">${adorderList.orderdate }</p> 
				  	  	<br/>
				  	  	<span>환불계좌〉</span> 
				  	  	<p class="refundaccount">${adorderList.bank}: ${adorderList.refundaccount }</p> 
				  	  	<br/>
				  	  	<span>계좌주〉</span> 
				  	  	<p class="refundaccowner">${adorderList.refundaccowner}</p> 
				  	  	<br/>
			  	  	</div>
			  	  </div>
				</div>
			  </div>
			</c:forEach>
			</div>
			<div id="beforelist"></div>
		  </div>
        </div>
      </div>
      <br />
      <div class="row"></div>
      <div class="row">
        <form action="/admin/orderlist" method="GET">
          <div class="col-md-2 col-md-offset-8 col-sm-4 col-sm-offset-8 col-xs-5 col-xs-offset-7" id="kang">
       	  	<div class="input-group" id="listsearch">
              <input type="text" class="form-control" placeholder="Search" name="searchnum">
              <div class="input-group-btn">
              	<button class="btn btn-default" type="submit">검색</button>
              </div>
          	</div>
 	      </div>
        </form>
   	  </div>
   	  <br />
      <!-- 페이징 시작 -->
      <div id="listpaging">
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
	<br /><br />
   </div>
<!-- ***********************************content end*********************************** -->
<!-- ***********************************footer*********************************** -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		resized2();

		$('.changedeliver').change(function(){
			var ordernum = $(this).parent().prev().text();
			var deliverstatus = $(this).find('option:selected').val();
			changedeliver(deliverstatus,ordernum);
		});	
 	});//document.ready function end**************************************************************    

	function liketd(count){
		$('.listdetail').slideUp();
		var liketd = ".td-"+count;
		if(!$(liketd).next().is(":visible")){
			$(liketd).next().slideDown();
		}
	}

	//비동기식 변경
	function changedeliver(deliverstatus,ordernum) {
		if(deliverstatus.value == "0"){return false;}
		$.ajax ({
			type : "POST",
			url : "/admin/changedeliver",
			dataType : "json",
			data : "param1="+deliverstatus+"&param2="+ordernum,
			success : function(){
			},
			error : function() {
			}
		});
	}
	
	//비동기식 찾기
 	function wtdeliver(deliverstatus){
		$.ajax({
			type : "POST",
			url : "/admin/wtdeliver",
			dataType : "json",
			data : {param :deliverstatus},
			success : function(wtmap){
				changdata(wtmap);
			},
			error : function(){
				alert('오류');
			} 
		});
 	}

 	function changdata(wtmap) {
		//테이블 지우기
		$('.orderlistforEach').remove();
		$.each(wtmap.wtdeliver,function(index){
			var wtdeliver = wtmap.wtdeliver[index];

			var table = '<div class="orderlistforEach"><div class="row">';
			//첫번째 요소 시작
			table += '<div class="col-md-10 col-md-offset-1 liketd td-'+index+'" onclick="liketd('+index+')">';
			table += '<div class="col-md-1 col-sm-2 col-xs-2 listleft">'+wtdeliver.orderlistnum+'</div>';
			if(wtdeliver.username != null){
				table += '<div class="col-md-5 col-sm-4 col-xs-3">'+wtdeliver.username+'</div>';
			}else {
				table += '<div class="col-md-5 col-sm-4 col-xs-3">'+wtdeliver.receivername+'</div>';
			}
			table += '<div class="col-md-4 col-sm-4 col-xs-4">'+wtdeliver.o_ordernum+'</div>';
			//selectbox 시작
			table += '<div class="col-md-2 col-sm-2 col-xs-3 listright"><select>';
			var deliver1,deliver2,deliver3,deliver4,deliver5,deliver6,deliver7;
			if(wtdeliver.deliverstatus == "1"){
				deliver1 = 'selected';
			}else if(wtdeliver.deliverstatus == "2"){
				deliver2 = 'selected';
			}else if(wtdeliver.deliverstatus == "3"){
				deliver3 = 'selected';
			}else if(wtdeliver.deliverstatus == "4"){
				deliver4 = 'selected';
			}else if(wtdeliver.deliverstatus == "5"){
				deliver5 = 'selected';
			}else if(wtdeliver.deliverstatus == "6"){
				deliver6 = 'selected';
			}else if(wtdeliver.deliverstatus == "7"){
				deliver7 = 'selected';
			}
			table += '<option>배송상태</option>';
			table += '<option '+deliver1+'>입금대기중</option>';
			table += '<option '+deliver2+'>입금완료</option>';
			table += '<option '+deliver3+'>주문완료</option>';
			table += '<option '+deliver4+'>배송중</option>';
			table += '<option '+deliver5+'>배송완료</option>';
			table += '<option '+deliver6+'>환불대기중</option>';
			table += '<option '+deliver7+'>환불완료</option>';
			table += '</select></div></div>';
			//첫번째 요소 끝
			//두번째 요소 시작
			table += '<div class="col-md-10 col-md-offset-1 listdetail"><div><div>';
			table += '<span>수령자〉</span><p class="userid">'+wtdeliver.receivername+'</p><br/>';
			if(wtdeliver.itemName != null){
				table += '<span>샐러드〉</span><p class="itemname">'+wtdeliver.receivername+'</p><br/>';
			}
			if(wtdeliver.cstmMatelist != null){
				table += '<span>커스텀〉</span><p class="customname">'+wtdeliver.cstmMatelist+'</p><br/>';
			}
			table += '<span>합계가격〉</span><p class="allprice">'+wtdeliver.allprice+'</p><br/>';
			table += '<span>주문날짜〉</span><p class="orderdate">'+wtdeliver.orderdate+'</p><br/>';
			table += '</div></div></div>';
			//두번째 요소 끝
			table += '</div></div>';
			//넣기
			$('#beforelist').before(table);
		})
		//페이징 text변경
		$('#listpaging').children().children().remove();
		var wtnoticePager = wtmap.wtnoticePager;
		var table2 = '';
		if(wtnoticePager.curPage > 1){
			table2 += '<li><a href="javascript:list('+wtnoticePager.curPage - 1+')" aria-label="Previous">';
			table2 += '<span aria-hidden="true">&laquo;</span></a></li>';
		}
		for(var j = wtnoticePager.blockBegin; j<=wtnoticePager.blockEnd; j++){
			if(j = wtnoticePager.curPage){
				table2 += '<li><a>'+j+'</a></li>';
			}else {
				table2 += '<li><a href="javascript:list('+j+')">'+j+'</a></li>';
			}
		}
		if(wtnoticePager.curPage < wtnoticePager.totPage){
			table2 += '<li><a href="javascript:list('+wtnoticePager.curPage + 1+')" aria-label="Next">';
			table2 += '<span aria-hidden="true">&raquo;</span></a></li>';
		}
		$('.pagination').append(table2);
 	}
 	/*******************************************************************/
 	//창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
 	$(window).resize(function() {
     	resized2();
 	});
 	function resized2() {
     	var windowWidth = $(window).width();
       	if(windowWidth < 540) {
   			$('#notice-tab').css('font-size','12px');
   			/*검색폰트,크기 조정*/
   			$('#listsearch').css('margin','0px 15px 0px 0px');
   			$('#listsearch>input').css('height','25px');
   			$('#listsearch>input').css('font-size','12px');
   			$('#listsearch>div>button').css('height','25px');
   			$('#listsearch>div>button').css('font-size','12px');
   			$('#listsearch>div>button').css('line-height','10px');
   			/*페이징폰트,크기 조정*/
   			$('.pagination').css('font-size','12px');
       	}else{
       		$('#notice-tab').css('font-size','14px');
       		/*검색폰트,크기 조정*/
   			$('#listsearch').css('margin','0px 0px 0px 0px');
   			$('#listsearch>input').css('height','30px');
   			$('#listsearch>input').css('font-size','14px');
   			$('#listsearch>div>button').css('height','30px');
   			$('#listsearch>div>button').css('font-size','14px');
   			$('#listsearch>div>button').css('line-height','12px');
   			/*페이징폰트,크기 조정*/
   			$('.pagination').css('font-size','14px');
       	}
 	}
</script>
</html>