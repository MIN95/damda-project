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
            width: 130px;
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
            background-color: darksalmon;
            color: white;
            margin-bottom: 3px;
        }

        #content #content_content table button:nth-child(2) {
            color: darksalmon;

        }

        #content #content_content .btn_div button {
            font-size: 15px;
            width: 150px;
            height: 40px;
            background-color: white;
            border: 1px solid darksalmon;
            float: right;
        }

        #content #content_content .btn_div button:nth-child(1) {
            background-color: darksalmon;
            color: white;
            margin-left: 10px;
        }

        #content #content_content .btn_div button:nth-child(2) {
            color: darksalmon;
        }
        
     	#content #content_content a{
     		color: black;
     	}
     	
     	#content #content_content a:hover{
     		color: darksalmon;
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

    all_check();

    price_setting();

    grid2();

    $('.compareItem').click(function(){
    	window.location.reload();
    });
    
    $('.okbtn').click(function(){
    	window.location.href='/mypage/cart';
    });

    $('#allselectbtn').click(function(){
    	//전체 장바구니 이동 버튼이므로 전체 선택 해주고 시작
    	$('input[type=checkbox]').prop('checked', true);
    });
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

//전체 선택
function all_check() {
    $('#all_chk').click(function() {
        if ($('#all_chk').is(':checked')) {
            $('input[type=checkbox]').prop('checked', true);
        } else {
            $('input[type=checkbox]').prop('checked', false);
        }
    });

}

//가격세팅
function price_setting() {
	 var stocks = [];

     $('.itemprice').each(function() {
         stocks.push(this.id);
     });

     for(var i=0; i<stocks.length; i++){
		var customNum = stocks[i].split('_');
    	  
         console.log('커스텀번호 '+i+'번째 : '+customNum[1]);
    	 total_price(customNum[1]);
     }

}

//가격
function total_price(num) {
    var num = num;

    //input의 val값구하기
    var input_msg = '#itemprice_' + num;
    var price = $(input_msg).val();


    //가격*수량의 문자열 길이
    var length = price.length;

    //3자리 마다 ,들어간 형식으로 변환된 가격
    var price_view = price_viewer(price, length);

    //class는 p영역
    var p_msg = '.itemprice_' + num;
    $(p_msg).html(price_view);
    console.log(price_view);
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
        totalPrice = backPrice + '원';

        //1,000원~100,000원 단위
    } else if (length > 3 && length <= 6) {
        frontPrice = price.substring(0, length - 3);
        backPrice = price.substring(length - 3, length);
        totalPrice = frontPrice + ',' + backPrice + '원';

        //1,000,000원~100,000,000원 단위
    } else if (length > 6 && length <= 9) {
        frontPrice = price.substring(0, length - 6);
        middlePrice1 = price.substring(length - 6, length - 3);
        backPrice = price.substring(length - 3, length);
        totalPrice = frontPrice + ',' + middlePrice1 + ',' + backPrice + '원';

        //1,000,000,000원 ~100,000,000,000단위
    } else if (length > 9 && length <= 12) {
        frontPrice = price.substring(length - 12, length - 9);
        middlePrice1 = price.substring(length - 9, length - 6);
        middlePrice2 = price.substring(length - 6, length - 3);
        backPrice = price.substring(length - 3, length);
        totalPrice = frontPrice + ',' + middlePrice1 + ',' + middlePrice2 + ',' + backPrice + '원';

    }

    return totalPrice;
}

//장바구니 중복확인
function compareCart() {
	//마이레시피 아이템 리스트
    var stocks = [];
    // CheckBox 검사
    if ($('input:checkbox[name="chk"]').is(":checked")) {

        $('input:checkbox[name="chk"]:checked').each(function() {
            //Check된 Check박스의 "Id"태그 얻기.
            stocks.push(this.id);
        });
        console.log('마이레시피: '+stocks);
    }

    //중복 검사 
    var check = false;
    
    //class의 id 담는 array 장바구니 리스트
    var itemArr = [];
    $('.itemNum').each(function() {
        itemArr.push(this.id);
    });
    console.log('장바구니 : '+itemArr);

    if(itemArr.length>0){
		//value담기
	    var cartItem = [];
	    for(var j = 0; j< itemArr.length; j++){
	        var msg = '#' + itemArr[j];
	        var itemNum = $(msg).val();
	        console.log(itemNum);
	        cartItem.push(itemNum);
		}
		console.log('장바구니 커스텀넘버: '+cartItem);
	
		//중복제거
	    for (var i = 0; i<cartItem.length; i++) {
	        var arrlen = stocks.length;
	        console.log(arrlen);
	        for (var j = 0; j<arrlen; j++) {
	            if (cartItem[i] == stocks[j]) {
	                check = true;
	            	stocks = stocks.slice(0, j).concat(stocks.slice(j+1, arrlen));
	            }
	        }
	    }
	    console.log('마이레시피 중복 제거: '+stocks);
	    console.log('중복검사: '+check);
    }
    
    //중복 모달 띄우기
    if (check == true) {
    	$('#cartMoveModal2').modal('show');
    }else if(check == false){
    	$('#cartMoveModal').modal('show');
    }

    for(var i =0; i<stocks.length; i++){
    	$.ajax({
        	url:'/mypage/insertcustom?customnum='+stocks[i],
    		type:'post',
    		data:"",
    		success: function(data){
            	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
            }
    	});
    }

}

//장바구니 담기
function insertCart(customNum){
	//class의 id 담는 array
    var itemArr = [];
    
    //아이디 담기
    $('.itemNum').each(function() {
        itemArr.push(this.id);
    });
    console.log('장바구니 커스텀 id배열 : '+itemArr);

    var length = $('.itemNum').length;

    //중복 검사 
    var check = false;
    
    //중복검사
    for (var i = 0; i < length; i++) {
        var msg = '#' + itemArr[i];
        var itemNum = $(msg).val();
        console.log('장바구니 커스텀 아이템 번호: '+itemNum);
        if (customNum == itemNum) {
            console.log('중복 아이템 ');
            check = true;
        }else if (customNum != itemNum){
            console.log('중복 없음');
        }
    }
	
     console.log(check);
	     
     if(check == true){
	         //중복확인 장바구니 이동 모달
		$('#compareModal').modal('show');
     }else if (check == false){
	     	$.ajax({
				url:"/mypage/insertcustom?customnum="+customNum,
				type:'post',
				data:"",
				success: function(data){
			       	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
					//상품 장바구니 담고 장바구니 이동 모달
					$('#cartMoveModal').modal('show');
			       }
			});
	}
	
}

//삭제
function deleteRecipe(customNum){
    $.ajax({
		url:"/mypage/deleterecipe?customnum="+customNum,
		type:'post',
		data:"",
		success: function(data){
        	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
        	window.location.reload();
        }
	});
}

//선택삭제
function select_delete() {

    // CheckBox 검사
    if ($('input:checkbox[name="chk"]').is(":checked")) {

        var stocks = [];

        $('input:checkbox[name="chk"]:checked').each(function() {
            //Check된 Check박스의 "Id"태그 얻기.
            stocks.push(this.id);
        });

        console.log(stocks);
        
        var length = stocks.length;
        console.log(length);
       
        for (var i = 0; i < length; i++) {
            if(stocks[i] > 0){
	            console.log(stocks[i]);
	            $.ajax({
	            	url:'/mypage/deleterecipe?customnum='+stocks[i],
	        		type:'post',
	        		data:"",
	        		success: function(data){
	                	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
	                	window.location.reload();
	                }
	        	});
            }
        }
    }
}
</script>
</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
<div id="cartList_div">
	<c:forEach items="${cartList }" var="cartList">
		<input type="hidden" id="itemNum${cartList.c_customNum }" value="${cartList.c_customNum }" class="itemNum">
	</c:forEach>
</div>

 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <a href="/mypage/"><p>주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
                    </li>
                    <li class="active_menu">
                        <a href="/mypage/myrecipe"><p class="active_menu">마이 레시피</p></a>
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
				<h3>마이 레시피</h3><small>나만의 커스텀 샐러드 레시피 목록입니다.</small>
                <table>
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk" />
                                <label for="all_chk"></label>
                            </th>
                            <th colspan="2">상품정보</th>
                            <th>선택</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${List}" var="List">
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" id="${List.mr_customNum }" />
                                <label for="${List.mr_customNum }"></label>
                            </td>
                            <td>
                                <a href="#"><img src="${List.photoPath }" /></a>
                            </td>
                            <td>
                                <a href="#"><input type="text" name="itemname" id="itemname${List.mr_customNum }" value="[custom]샐러드 No.${List.mr_customNum }" readonly /></a>
                                <span>${List.cstmMatelist }</span>
                                <p class="itemprice_${List.mr_customNum }">원</p>
                                <input type="hidden" class="itemprice" id="itemprice_${List.mr_customNum }" value="${List.cstmPrice }" readonly />
                            </td>
                            <td>
                                <button type="button" onclick="insertCart(${List.mr_customNum });">장바구니 담기</button>
                                <button type="button" onclick="deleteRecipe(${List.mr_customNum });">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="btn_div">
                    <button type="button" class="btn" data-toggle="modal" data-target="#allCartModal" id="allselectbtn">전체 장바구니 담기</button>
                    <button type="button" class="btn" data-toggle="modal" data-target="#deleteModal">선택삭제</button>
                </div>

                <div class="col-md-offset-3 col-md-9 col-sm-offset-4 col-sm-6 col-xs-offset-2 col-xs-8">
                    <ul class="pagination">
				        <li><a href = "/mypage/myrecipe?p=0" aria-label="Previous">&laquo;</a></li>
				        
				        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
				        <c:choose>
				        <c:when test="${p <= 0 }">
				        <li class="disabled"><a href="#">‹</a></li>
				        </c:when>
				        <c:otherwise>
				        <li><a href = "/mypage/myrecipe?p=${p-1 }">‹</a></li>	        
				        </c:otherwise>
				        </c:choose>
				        
				        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
				        <c:forEach var="i" begin="0" end="${totalpage}">
				        <li><a href = "/mypage/myrecipe?p=${i }">${i+1 }</a></li>
				        </c:forEach>
				        
				        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
				        <c:choose>
				        <c:when test="${p >= totalpage }">
				        <li class="disabled"><a href="#">›</a></li>
				        </c:when>
				        <c:otherwise>
				        <li><a href = "/mypage/myrecipe?p=${p+1 }">›</a></li>
				        </c:otherwise>
				        </c:choose>
				        
				        <li><a href = "/mypage/myrecipe?p=${totalpage }" aria-label="Next">&raquo;</a></li>
				    </ul>
                </div>
                
                <div id="empty_div">　</div>
            </div>
<!-- Modal start -->
    <div class="modal fade" id="allCartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    전체상품을  장바구니에 담으시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="compareCart();">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="cartMoveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <button type="button" class="btn btn-default compareItem" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary okbtn">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="cartMoveModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                    중복상품을 제외하고 장바구니에 담았습니다.<br />
                    지금 확인하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default compareItem" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary okbtn">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                </div>
                <div class="modal-body">
                    <br /><br />
                   선택하신 상품을 삭제하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" onclick="select_delete();" data-dismiss="modal">확인</button>
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
                    장바구니로 이동하시겠습니까?
                    <br /><br /><br />
                </div>
                <div class="modal-footer">
                    <div class="m_btn_div">
                        <button type="button" class="btn btn-default" data-dismiss="modal" >취소</button>
                        <button type="button" class="btn btn-primary okbtn" data-dismiss="modal" id="compareOk">확인</button>
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