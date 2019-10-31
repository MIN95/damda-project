<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
        <style type="text/css">
        #content {
            margin: 20px 0px;
        }

        #content #itemimg {
            width: 100%;
        }

        #content .content_header p {
            display: inline-block;
        }

        #content .content_header .first_p {
            width: 40%;
        }

		#content .content_header #item_info {
            padding: 0px;
            margin-left: 40px;
        }
        
        #content .content_header #item_info #ea {
            height: 22px;
        }

        #content .content_header h3:nth-child(8),
        #content .content_header h3:nth-child(9),
        #content .content_header h3:nth-child(10) {
            display: inline-block;

        }

        #content .content_header .item_info:nth-child(7) button {
            background-color: white;
            border: 1px solid #cccccc;
            margin: 0px;
            width: 20px;
            height: 22.4px;
            line-height: 10px;
        }

        #content .content_header .minus {
            position: relative;
            left: 4px;
        }

        #content .content_header .plus {
            position: relative;
            left: -5px;
        }

        #content .content_header #ea {
            border: 1px solid #cccccc;
            font-size: 12px;
            width: 30px;
            height: 22px;
            margin: 0px;
            text-align: center;
            cursor: default;
        }
        
        #content .content_header button:nth-child(1) {
            background-color: darksalmon;
            border-radius: 0px;
        }

        #content .content_header button:nth-child(2) {
            border-radius: 0px;
            margin: 0px 10px;
            background-color: white;
            border: 1px solid #cdcdcd;
        }

        #content .content_header button img {
            width: 25px;
            position: relative;
            top: -2px
        }

        #content .line_div {
            margin-bottom: 50px;
            border-bottom: 1px solid #cdcdcd;
        }
        
        #content .content_content {
            z-index: -1;
        }

        #content .content_content img {
            width: 100%;
        }

        #content .content_bottom_info {
            margin-top: 20px;
            margin-bottom: 30px;
        }

        #content .content_bottom_info div {
            background-color: #eeeeee;
            border-top: 1px solid #cdcdcd;
            border-bottom: 1px solid #cdcdcd;
            border-right: 1px solid #cdcdcd;
            height: 40px;
            line-height: 40px;
            text-align: center;
            overflow: hidden;
        }


        #content .content_bottom_info div:nth-child(1),
        #content .content_bottom_info div:nth-child(6) {
            border: 0px;
            border-bottom: 1px solid #cdcdcd;
            background-color: white;
        }

        #content .content_bottom_info div:nth-child(2) {
            border-left: 1px solid #cdcdcd;
        }

        #content .content_bottom_info div h4 {
            margin: 0px;
        }

        /*상세내용 하단 정보 숨겨두기*/
        .content_change,
        .content_refund,
        .content_review {
            display: none;
        }

        /*리뷰*******************************************/
        #content .content_review ul {
            padding-left: 15px;
        }

        #content .content_review li {
            font-size: 11px;
        }

        #content .content_review select {
            border: 0px;
            float: right;
            font-size:12px;
        }

        #content .content_review table {
            font-size: 13px;
            border-bottom: 1px solid darksalmon;
            border-top: 2px solid darksalmon;
        }

        #content .content_review table tr:nth-child(2n-1) {
            text-align: center;
        }

        #content .content_review table tr:nth-child(2n) {
            text-align: left;
        }

        #content .content_review table tr th {
            text-align: center;
        }

        #content .content_review table tr th:nth-child(1) {
            width: 10%;
        }

        #content .content_review table tr th:nth-child(2) {
            width: 45%;
        }

        #content .content_review table tr th:nth-child(3) {
            width: 15%;
        }

        #content .content_review table tr th:nth-child(4) {
            width: 20%;
        }

        #content .content_review table tr th:nth-child(5) {
            width: 10%;
        }

        #content .content_review table tr td:nth-child(3) {
            width: 5%;
        }
        #content .content_review table tr td:nth-child(7) {
            width: 5%;
        }
        
        #content .content_review table tr td:nth-child(2){
        	text-align: left;
        }

        #content .content_review table img {
            width: 60%;
            display: block;
            margin: 10px auto;
        }

        #content .content_review table p {
        	width: 80%;
            display: block;
            margin: 10px auto;
        }
        
 		#content .content_review table a{
 			text-decoration: none;
 			color: black;
 			font-weight: bold;
 		}
 		
        #content .content_review table .toggler {
            display: none;
        }

        #content .content_review table .toggler1 {
            display: table-row;
        }

		#content .content_review table .clipImg{
			width: 15px;
		}
        #content .list_div{
        	margin-bottom: 50px;
        }
  		#content .list_div p{
  			font-size: 12px;
  			color: black;
  		}
        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }

        /*gird()***********************************************/
        #content .content_header .md_div {
            margin: 40px 0px;
        }

        #content .content_header .md_h3 {
            display: inline-block;
        }

        #content .content_header .md_btn {
            margin: 20px 0px;
            height: 70px;
        }

        #content .content_header .sm_div {
            margin: 20px 0px;

        }

        #content .content_header .xs_div {
            margin: 10px 0px;
        }

        .md_divline2 {
            display: none;
        }
        /*modal***************************************************/
        #content .modal .modal-title {
            color: darksalmon;
        }

        #content .modal .modal-dialog {
            width: 400px;
        }

        #content .modal .modal-body {
            text-align: center;
        }

        #content .modal .modal-footer {
            background-color: #f7f7f9;

        }

        #content .modal .m_btn_div {
            width: 250px;
            display: block;
            margin: 0px auto;
        }

        #content .modal .btn {
            border-radius: 0px;
            width: 120px;
            border: 1px solid #f1d0bd;
        }

        #content .modal .btn-primary {
            background-color: #f1d0bd;
        }

        #content .modal .btn-default {
            background-color: white;
        }

        #content .modal .btn:hover {
            border: 1px solid darksalmon;
            background-color: darksalmon;
            color: white;
        }
        
        #content #empty_div{
			height: 150px;
			clear: both;
		}
        
	</style>
    <script type="text/javascript">
    
    $(document).ready(function() {
    	//그리드 적용
        grid();

        //테이블 내용 클릭시 보였다 안보이기
        //table_content();

      	//합계 계산
        ea();

        //처음 값 세팅
        price(1);

		//웹브라우저 확인(파이어폭스만 적용됨.. 익스플로러는 다시 찾아볼 것)
        var agent = navigator.userAgent.toLowerCase();
        if (agent.indexOf("firefox") != -1){        	
			$('#ea').css('position','relative');
			$('#ea').css('top','-1px');
        }

        //모달에서 버튼 클릭이벤트
        item_modal();

        //장바구니 중복검사
        compareCart();

        //위시리스트 중복검사
        compareCart2();
    });

    $(window).resize(function() {
        grid();
    });

    function grid() {
        var windowWidth = $(window).width();

        //md
        if (windowWidth >= 992) {
            $('.item_info').addClass('md_div');
            $('.price_h3').addClass('md_h3');
            $('.btn-lg').addClass('md_btn');
            $('.md_divline1').removeClass('md_divline2');
            $('.content_bottom_info div').css('font-size', '13px');
            $('.btn').addClass('btn-lg');
            $('.btn img').css('width', '25px');
        } else {
            $('.item_info').removeClass('md_div');
            $('.price_h3').removeClass('md_h3');
            $('.btn-lg').removeClass('md_btn');
            $('.md_divline1').addClass('md_divline2');
            $('.btn').removeClass('btn-lg');
        }

        //sm
        if (windowWidth >= 768 && windowWidth < 992) {
            $('.item_info').addClass('sm_div');
            $('.md_divline1').addClass('md_divline2');
            $('table').css('font-size', '12px');
            $('.content_bottom_info div').css('font-size', '12px');
            $('.btn').addClass('btn-default');
            $('.btn img').css('width', '20px');
        } else {
            $('.item_info').removeClass('sm_div');
            $('.md_divline1').removeClass('md_divline2');
            $('table').css('font-size', '13px');
            $('.btn').removeClass('btn-default');
        }

        //xs
        if (windowWidth < 768) {
            $('.item_info').addClass('xs_div');
            $('.md_divline1').addClass('md_divline2');
            $('table').css('font-size', '11px');
            $('.content_bottom_info div').css('font-size', '11px');
            $('h4').css('margin-top', '50px');
            $('.btn').addClass('btn-sm');
            $('.btn img').css('width', '15px');
        } else {
            $('.item_info').removeClass('xs_div');
            $('.md_divline1').removeClass('md_divline2');
            $('h4').css('margin-top', '0px');
            $('.btn').removeClass('btn-sm');
        }
    }

    //하단 정보 div
    function list_tab(id) {
        for (var i = 1; i < 5; i++) {
            var list_val = '#list_val' + i;
            var tab_con = '#tab_con' + i;
            $(list_val).hide();
            $(tab_con).css('background-color', '#eeeeee');
        }
        var list_val = '#list_val' + id;
        var tab_con = '#tab_con' + id;
        $(list_val).show();
        $(tab_con).css('background-color', '#cdcdcd');
    }

  //수량추가 가격계산
    function ea() {
        var ea = $('#ea').val();

        $('.minus').click(function() {
            if (ea > 1) {
                $('#ea').val(--ea);
            }
            price(ea);
        });

        $('.plus').click(function() {
            $('#ea').val(++ea);
            price(ea);
        });

    }

    //상단 상품가격, 하단 수량에따른 총가격계산
    function price(ea) {
        var price = $('#itemPrice').val();
        var length1 = price.length;
        var total = price * ea + '';
        var length2 = total.length;

        var itemPrice = price_viewer(price, length1);
        $('.itemPrice').html(itemPrice);

        var totalPrice = price_viewer(total, length2);
        $('.content_header h3:nth-child(9)').html(totalPrice);
    }

    //가격뷰어
    function price_viewer(price, length) {
        var frontPrice;
        var middlePrice1;
        var middlePrice2;
        var backPrice;
        var totalPrice;

        //100원 단위
        if (length >= 0 && length <= 3) {
            backPrice = price.substring(length - 3, length);
            totalPrice = backPrice + ' 원';

            //1,000원~100,000원 단위
        } else if (length > 3 && length <= 6) {
            frontPrice = price.substring(0, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + backPrice + ' 원';

            //1,000,000원~100,000,000원 단위
        } else if (length > 6 && length <= 9) {
            frontPrice = price.substring(0, length - 6);
            middlePrice1 = price.substring(length - 6, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + middlePrice1 + ',' + backPrice + ' 원';

            //1,000,000,000원 ~100,000,000,000단위
        } else if (length > 9 && length <= 12) {
            frontPrice = price.substring(length - 12, length - 9);
            middlePrice1 = price.substring(length - 9, length - 6);
            middlePrice2 = price.substring(length - 6, length - 3);
            backPrice = price.substring(length - 3, length);
            totalPrice = frontPrice + ',' + middlePrice1 + ',' + middlePrice2 + ',' + backPrice + ' 원';

        }

        return totalPrice;
    }

    //select box 이벤트
    function select_event() {
        //hidden val
	    var no = $('#reviewalign').val();
	    //console.log(" >>> reviewalign : " + reviewalign);
	    var no = $('#no').val();
	    //console.log(" >>> no : " + no);
	    
       //select val
       var select_val = $('.reviewalign').val();
       //console.log('select value: '+select_val);
       
       $.ajax({
			url:"/item/detail?no="+no+"&align="+reviewalign,
			type:'get',
			data:"",
			success: function(data){
	        	//console.log('success');
	        	$('#review_div').load('/item/review?no='+no+'&align='+select_val); 
	        }
		});
    }  
    
  	//모달에서 버튼 클릭이벤트
    function item_modal(){

		//장바구니 모달
    	$('#cartok1').click(function(){
        	var no = $('#no').val();
        	//console.log(no);
        	var ea = $('#ea').val();
        	//console.log(ea);
        	var userNum = $('#userNum').val();
        	//console.log(userNum);
 		 	$.ajax({
 				url:'/item/detail?no='+no+'&ea='+ea+'&usernum='+userNum,
 				type:'post',
 				data:'',
 				success: function(data){
 					//console.log('success');
 		        }
 			});
        });
        
    	$('#cartok2').click(function(){
			location.href = '/mypage/cart';
        });

        //찜 모달
		$('#jjimok1').click(function(){//회원 찜목록담기 확인
			var no = $('#no').val();
        	//console.log(no);
 		 	$.ajax({
 				url:'/item/insertwish?no='+no,
 				type:'post',
 				data:'',
 				success: function(data){
 					//console.log('success');
 		        }
 			});
 		 	 compareCart2();
        });
    	$('#jjimok2, #jjimok3').click(function(){//담은후 찜으로 이동, 중복인경우
			location.href = '/mypage/jjim';
        });

    	//비회원 모달
    	$('#noUser_cartok').click(function(){
    		var no = $('#no').val();
        	//console.log(no);
        	var ea = $('#ea').val();
        	//console.log(ea);
        	
 		 	$.ajax({
 				url:'/item/detailnouser?no='+no+'&ea='+ea,
 				type:'post',
 				data:'',
 				success: function(data){
 		        	//console.log('success');
 		        }
 			});
        });
    	
    	$('#userok').click(function(){
			location.href='/login/';
       	});

       	//장바구니 중복 모달
       	$('#compareOk').click(function(){
    		var no = $('#no').val();
        	//console.log(no);
        	var ea = $('#ea').val();
        	//console.log(ea);

        	$.ajax({
 				url:'/item/cartUpdate?no='+no+'&ea='+ea,
 				type:'post',
 				data:'',
 				success: function(data){
 		        	//console.log('success');
 		        }
 			});
        });

        $('#compareItem').click(function(){
        	$('#cartList_div').load(window.location.reload());
	       	compareCart();
        });

        $('#wishReload').click(function(){
        	window.location.reload();
        	 compareCart2();
        });
    };

    //장바구니 중복확인
    function compareCart() {
        //현재 아이템 번호
        var no = $('#no').val();
        
        //class의 id 담는 array
        var itemArr = [];
        
        //id의 value 담는 array
        var itemArr2 = [];

        //중복 검사 
        var check = false;
        
        //아이디 담기
        $('.itemNum').each(function() {
            itemArr.push(this.id);
        });
        //console.log('cart id배열 : '+itemArr);

        var length = $('.itemNum').length;

        //중복검사
        for (var i = 0; i < length; i++) {
            var msg = '#' + itemArr[i];
            var itemNum = $(msg).val();
            //console.log(itemNum);
            if (no == itemNum) {
                //console.log('중복 아이템 있음');
                check = true;
            }
        }
        //console.log(check);
        
        //중복 모달 띄우기
        if (check == true) {
            $('.addCart').attr('data-target', '#compareModal');
        }

    }
    
    //위시리스트 중복확인
    function compareCart2() {
        //현재 아이템 번호
        var no = $('#no').val();
        
        //class의 id 담는 array
        var itemArr = [];

        //중복 검사 
        var check = false;
        
        //아이디 담기
        $('.wishItemNum').each(function() {
            itemArr.push(this.id);
        });
        //console.log('wish id배열 : '+itemArr);

        var length = $('.wishItemNum').length;

        //중복검사
        for (var i = 0; i < length; i++) {
            var msg = '#' + itemArr[i];
            var itemNum = $(msg).val();
            //console.log(itemNum);
            if (no == itemNum) {
                //console.log('중복 아이템 있음');
                check = true;
            }
        }
        //console.log(check);
        
        //중복 모달 띄우기
        if (check == true) {
            $('.addWish').attr('data-target', '#jjimModal3');
        }

    }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
<input type="hidden" id="reviewalign" value="${reviewalign }"/>
<!-- 현재 아이템번호 -->
<input type="hidden" id="no" value="${no }"/>
<input type="hidden" id="userNum" value="<%=session.getAttribute("userNum")%>"/>


<div id="cartList_div">
	<c:forEach items="${cartList }" var="cartList">
		<input type="hidden" id="itemNum${cartList.c_itemNum }" value="${cartList.c_itemNum }" class="itemNum">
	</c:forEach>
</div>

<div id="wishList_div">
	<c:forEach items="${wishList }" var="wishList">
		<input type="hidden" id="wishItemNum${wishList.w_itemNum }" value="${wishList.w_itemNum }" class="wishItemNum">
	</c:forEach>
</div>

	<!--header-->
	<div class="col-md-12 col-sm-12 content_header">
	    <div class="col-md-offset-2 col-md-4 col-sm-4">
	        <img alt="itemimg" id="itemimg" src="/resources/imgs/${List.photoCtg }/${List.photoName}" />
	    </div>
	    <div class="col-md-4 col-sm-7 col-xs-offset-1 col-xs-10" id="item_info">
	        <h3>${List.itemName }</h3>
	        <p>${List.itemCon }</p>
	        <div class="item_info">
	            <p class="first_p">판매가</p>
	            <p class="second_p itemPrice"> 원</p>
	            <input type="hidden" name="itemPrice" id="itemPrice" value="${List.itemPrice }" />
	        </div>
	        <div class="item_info">
	            <p class="first_p">판매단위</p>
	            <p class="second_p">1개</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">배송구분</p>
	            <p class="second_p">픽업/택배배송</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">원산지</p>
	            <p class="second_p">국내</p>
	        </div>
	        <div class="item_info">
	            <p class="first_p">구매수량</p>
	            <button class="minus">-</button>
	            <input type="text" readonly name="ea" id="ea" value="1" />
	            <button class="plus">+</button>
			</div>
            <h3 class="price_h3">총 상품금액 : &nbsp;</h3>
            <h3>총가격오는곳</h3>
            <input type="hidden" name="totalPrice" id="totalPrice"/>
            
	        <div class="btn_div">
	        	<c:set var="itemStock" value="${List.itemStock }"/>
	          	<c:if test="${itemStock != 0 }">
	          	<%//회원일 때
	          	if(session.getAttribute("user_ctg")!=null){ %>
	          	<button type="button" class="btn btn-lg addCart" data-toggle="modal" data-target="#cartModal1">
	                &nbsp;&nbsp;&nbsp;<img src="/resources/icon/cart.png" />장바구니 담기 &nbsp;&nbsp;</button>
	            <button type="button" class="btn btn-lg addWish" data-toggle="modal" data-target="#jjimModal1"><img src="/resources/icon/jjim.png" />찜&nbsp;</button>
	            <%}//비회원일 때
	          	else {%>
	            <button type="button" class="btn btn-lg addCart" data-toggle="modal" data-target="#Nouser_cartModal">
	                &nbsp;&nbsp;&nbsp;<img src="/resources/icon/cart.png" />장바구니 담기 &nbsp;&nbsp;</button>
	            <button type="button" class="btn btn-lg" data-toggle="modal" data-target="#userModal"><img src="/resources/icon/jjim.png" />찜&nbsp;</button>
	            <%} %>
	          	</c:if>
	          	<c:if test="${itemStock == 0 }">
		          	<button type="button" class="btn btn-lg addCart" data-toggle="modal" data-target="#itemStockModal">
	                &nbsp;&nbsp;&nbsp;<img src="/resources/icon/cart.png" />장바구니 담기 &nbsp;&nbsp;</button>
		            <button type="button" class="btn btn-lg addWish" data-toggle="modal" data-target="#itemStockModal"><img src="/resources/icon/jjim.png" />찜&nbsp;</button>      	
	          	</c:if>
	        </div>
	    </div>
	</div>
	
	<div class="line_div col-md-12 col-sm-12 col-xs-12">　</div>
	
	<!--content-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_content">
	    <!--이미지 첨부로 내용이 추가되는 영역-->
	    <c:forEach items="${imgList}" var="imgList">
	    	<img src="/resources/imgs/${imgList.photoCtg }/${imgList.photoName}">
	    </c:forEach>
	</div>
	
	<!--bottom-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_bottom_info">
	    <div class="col-md-2 md_divline1">
	        <p>
	            　
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(1)" id="tab_con1">
	        <p>
	            배송안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(2)" id="tab_con2">
	        <p>
	            교환 및 반품 안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(3)" id="tab_con3">
	        <p>
	            취소 및 환불 안내
	        </p>
	    </div>
	    <div class="col-md-2 col-sm-3 col-xs-3" onclick="list_tab(4)" id="tab_con4">
	        <p>
	            	고객후기(${reviewCount })
	        </p>
	    </div>
	    <div class="col-md-2 md_divline1">
	        <p>
	            　
	        </p>
	    </div>
	</div>
	
	<!--delivery-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_delivery list_div" id="list_val1">
	    <h4 class="engfont">DELIVERY</h4>
	      <p>
                <span style="color:#f00"><b>※ 필독 ※ 주문 전 아래 공지사항을 확인후 주문 부탁드립니다.</b></span><br/><br/>
                [국내 일반 배송]<br/>
배송업체 : 우체국택배<br/>
배송비용 : 2,500원 / 실결제 금액 50,000원 이상 시 무료배송 <br/>
배송기간 : 1일 ~ 3일<br/><br/>

주문시 유의사항<br/>
- 이벤트(세일)기간내 주문의 경우에는 기본 배송일 이상 소요되며, 이벤트 종료 이후 순차 배송됩니다.<br/>
- 공급처 사정으로 인하여 지연 및 품절이 발생될 수 있습니다. <br/>
- '주문폭주', '인기상품'의 경우 기본 배송기간 이상 소요됩니다.<br/>
- 기본 배송기간 이상 소요되는 상품이거나, 품절된 상품은 개별 연락 드리겠습니다.<br/><br/>

[해외배송]<br/>
1. 주문서 작성 : 주문서 작성 시 해외배송 여부에 "예"로 체크<br/>
2. 문의 게시판 : 주문서 넣은 후 문의 게시판에 받아보실 해외 주소, 연락처 기재<br/>
3. 배송비 측정 : 지역과 무게 확인 후 해외배송비 측정하여 답변<br/>
4. 상품 준비 및 배송 : 결제가 완료되면 상품이 준비되는 대로 발송<br/><br/>

[통관과 관세]<br/>
담다는 EMS 우체국 배송을 사용하고 있으며 한국에서 직접 배송하고 있습니다.<br/>
국가 세관의 규정에 따르면, 배송 과정에서 나라별로 관세가 발생할 수 있으며 관세는 고객님 부담입니다.<br/>
상세 문의사항은 EMS 우체국 고객센터 1588-1300을 이용해주시거나 거주하시는 지역 우체국에 문의바랍니다.<br/>
반송 과정에서 발생되는 모든 비용 (반품 배송비, 통관비용 및 관세)은 구매자가 부담하며 환불 시 차감됩니다.
            </p>
	
	</div>
	<!--delivery end-->
	
	
	<!--change-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_change list_div" id="list_val2">
	    <h4 class="engfont">CHANGE</h4>
	  <p>
                [교환∙반품시 유의사항]<br/>
단순 변심의 경우 수령일로부터 7일 이내까지 교환∙반품이 가능합니다(교환∙반품비 고객님 부담).<br/>
상품 하자, 오배송의 경우 수령일로부터 1주일 이내, 그 사실을 알 수 있었던 날로부터 7일 이내까지 교환∙반품이 가능합니다(교환∙반품비 무료(담다 부담)). <br/>
네이버페이 결제주문은 동일상품/동일옵션 교환만 가능합니다.<br/><br/>

단, 다음의 경우에는 교환∙반품 가능기간에도 불구하고 거절될 수 있습니다. <br/>
- 고객님의 책임 있는 사유로 제품이 멸실 또는 훼손된 경우<br/>
- 고객님의 사용 또는 일부 소비에 의하여 제품의 가치가 현저히 감소한 경우<br/>
- 시간의 경과에 의하여 재판매가 곤란할 정도로 제품의 가치가 현저히 감소한 경우<br/>
- 고객님의 주문에 따라 개별적으로 생산되는 제품의 경우<br/><br/>

[교환∙반품 방법] <br/>
*동봉된 교환∙반품 카드를 참조하세요<br/><br/>

교환∙반품 가능기간 이내에 “스타일난다 게시판 또는 고객센터 접수” 후 “교환∙반품 신청서”와 함께 아래 반품 주소로 보내주셔야 합니다<br/>
(미접수, 신청서 미동봉시 별도의 확인 시간이 소요될 수 있습니다). <br/><br/>

보내주실 때 바코드가 붙어있는 폴리백에 넣어 받아보신 그대로 포장 후 우체국 택배를 이용하여 착불로 보내주세요. <br/>
교환∙반품 배송비는 단순 변심의 경우 고객님 부담, 상품 하자 및 오배송의 경우 난다 부담입니다. 배송비를 입금하시는 경우 꼭 주문자 성함으로 입금해 주시기 바랍니다.<br/><br/> 

반품 주소 : 인천광역시 계양구 계산 4동 계양 우체국 사서함 1117호 ㈜담다<br/>
타택배 반품주소 : 인천광역시 연수구 송도동 10-79 스타일난다 물류센터<br/>
(반품 배송비 고객 선불부담)<br/>
타 택배 이용시 일반 반품주소(사서함 1117호)를 이용하시면 재반송되며 반송 택배비 역시 고객님 부담이니 이 부분 꼭 참고 바랍니다. <br/><br/>

교환 및 반품 접수, 상품문의처 : 0502-707-8888
            </p>
	</div>
	<!--change end-->
	
	
	<!--refund-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_refund list_div" id="list_val3">
	    <h4 class="engfont">REFUND</h4>
	    <p>
                [취소 안내]<br/>
입금 전 취소, 배송 전 취소 모두 마이페이지에서 고객님이 직접 취소가 가능합니다. <br/>
금액 취소 처리 건이 있으시면 고객센터나 문의 게시판에 꼭 남겨주세요.<br/><br/>
                
[카드 취소]<br/>
카드 부분 취소불가 <br/>
- 부분배송 받아보시는 상품 금액만큼을 따로 재결제 혹은 입금해주시면 카드 전체 취소 처리해드립니다. <br/>
- 가맹점을 통해 취소가 되므로 처리 시일은 최대 7일 정도 소요됩니다. <br/><br/>

(카드사 프로모션할인결제)<br/>
- 구매하신 상품중 일부만 취소하시는 경우 상품금액만 따로 재결제 혹은 입금해주시면 카드전체취소 처리해드립니다. <br/>
- 가맹점을 통해 취소되므로 처리시일은 최대 7일정도 소요됩니다.<br/><br/>

[환불]<br/>
환불은 요청하신 날로부터 1~2일 후 계좌로 환불됩니다.<br/><br/>

[휴대폰 취소]<br/>
- 휴대폰은 당월 취소만 가능합니다, <br/>
- 부분취소는 불가하여 일부구매하는 상품금액을 입금해주시거나 개인결제창으로 재결제해주시면 휴대폰 전체취소로 처리가능합니다.
            </p>
	</div>
	<!--refund end-->
	
	
	<!--review-->
	<div class="col-md-offset-2 col-md-8 col-sm-12 content_review list_div" id="list_val4">
		<h4 class="engfont">REVIEW</h4>
	    <ul class="col-md-10">
	        <li>
	            	상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
	        </li>
	        <li>
	            	배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 1:1 문의에 남겨주세요.
	        </li>
	    </ul>
	    <select class="col-md-2 reviewalign" onchange="select_event();" value="${reviewalign}">
	        <option value="reviewnew">최근등록순</option>
	        <option value="reviewbest">좋아요많은순</option>
	    </select>
	    <div id="review_div">
		    <jsp:include page="d_list.jsp"/>
	    </div>
	</div>
	<!--review end-->
	
	<div id="empty_div">　</div>
	
<!-- Modal start -->
 <!-- cartModal -->
    <div class="modal fade" id="cartModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    장바구니에 담으시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cartModal2" data-dismiss="modal" id="cartok1">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="cartModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    해당상품을 장바구니에 담았습니다.<br />
                    지금 확인하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="compareItem">취소</button>
                        <button type="button" class="btn btn-primary" id="cartok2">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jjimModal -->
    <div class="modal fade" id="jjimModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    찜목록에 담으시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#jjimModal2" data-dismiss="modal" id="jjimok1">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="jjimModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    해당상품을 찜목록에 담았습니다.<br />
                    지금 확인하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="wishReload">취소</button>
                        <button type="button" class="btn btn-primary" id="jjimok2">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="jjimModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                     찜목록에 이미 상품이 있습니다.<br />
                     찜목록으로 이동하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="jjimok3">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 비회원 모달 -->
        <div class="modal fade" id="Nouser_cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    장바구니에 담으시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cartModal2" data-dismiss="modal" id="noUser_cartok">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                   회원전용 서비스 입니다.<br />
                    로그인/회원가입 페이지로 이동하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="userok">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 장바구니 중복 모달 -->
     <div class="modal fade" id="compareModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    장바구니에 이미 상품이 있습니다. <br />
                    그래도 담으시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cartModal2" data-dismiss="modal" id="compareOk">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal fade" id="itemStockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    준비된 재고가 모두 소진되었습니다. <br />
                    빠른시일내에 준비하겠습니다.
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Modal end -->
	

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>