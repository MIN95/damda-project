<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
<style type="text/css">
	#content .table_div h2 {
        display: block;
        margin: 30px auto 10px auto;
        width: 120px;
    }

    #content .table_div h2+p {
        font-size: 15px;
        margin: 15px auto 50px auto;
        display: block;
        width: 190px;
    }
    
    #content #deliver {
        width: 150px;
    }

    #content table {
        font-size: 12px;
    }

    #content table tr th {
        text-align: center;
        border-top: 2px solid darksalmon;
        border-bottom: 1px;
    }
    #content table .info_td strong {
        position: relative;
        top: 30px;
        font-size: 15px;
        margin-top: 5;
    }
    #content table .info_td p {
        font-size: 13px;
        top:35px;
    }
	#content table .ea_td p {
	    width: 77px;
	    display: block;
	    margin: 0px auto;
	    font-size: 15px;
     	position: relative;
	}
    #content table .info_td p,
    #content table .price_td p {
        position: relative;
    }
    #content table .price_td p {
        font-size: 15px;
    }
    #content table .ed_td button {
        position: relative;
    }
    #content table .delete_td img {
        position: relative;
        width: 40px;
        cursor: pointer;
    }
    #content table .ea_td div {
        width: 77px;
        display: block;
        margin: 0px auto;
    }
    #content table .total_price {
        font-size: 15px;
        text-align: right;
    }
    /*전체선택*/
    #content table tr th:nth-child(1) {
        width: 5%;
    }
    /*상품정보*/
    #content table tr th:nth-child(2) {
        width: 55%;
    }
    /*수량*/
    #content table tr th:nth-child(3) {
        width: 18%;
    }
    /*상품금액*/
    #content table tr th:nth-child(4) {
        width: 17%;
    }
    /*삭제*/
    #content table tr th:nth-child(5) {
        width: 5%;
    }
    /*이미지 칸*/
    #content table .img_td {
        width: 15%;
    }
    /*이미지칸 이미지*/
    #content table .cartimg {
        width: 100%;
    }
    #content table .info_td {
        text-align: left;
    }
    #content table .checkbox_td,
    #content table .ea_td,
    #content table .price_td {
        text-align: center;
    }
    #content table tbody tr:last-child {
        border-bottom: 2px solid darksalmon;
    }
    /*checkbox_start*/
    #content input[type="checkbox"] {
        display: none;
    }
    #content input[type="checkbox"]+label {
        display: inline-block;
        width: 17px;
        height: 17px;
        background: white;
        cursor: pointer;
        border-radius: 3px;
        border: 1px solid #cccccc;
    }
    #content input[type="checkbox"]:checked+label {
        background: url(/resources/icon/check.png) darksalmon no-repeat center/15px 15px;
        border: 0px;
    }
    /*checkbox_end*/
    
    /*수랑버튼_start*/
    #content table button {
        background-color: white;
        border: 1px solid #cccccc;
        margin: 0px;
        width: 20px;
        height: 22px;
        line-height: 5px;
    }
    #content table .minus {
        position: relative;
        left: 4px;
    }
    #content table .plus {
        position: relative;
        left: -4px;
    }
    #content table input {
        border: 1px solid #cccccc;
        font-size: 12px;
        width: 30px;
        height: 22px;
        margin: 0px;
        text-align: center;
        position: relative;
    }
    /*수량버튼_end*/
    #content .btn_div {
        margin-bottom: 150px;
    }
    #content .btn_div div {
        display: inline-block;
        width: 5%;
        text-align: center;
        position: relative;
        top: 10px;
    }
    #content .btn_div p {
        display: inline-block;
        margin-right: 10px;
    }
    #content .btn_div button {
        border-radius: 0px;
    }
    #content .btn_div button:hover {
        background-color: darksalmon;
        color: white;
    }
    #content .btn_div input[type="submit"] {
        border-radius: 0px;
        background-color: darksalmon;
        color: white;
        float: right;
    }
    #content .btn_div input[type="submit"]:hover {
        font-weight: bold;
        border: 2px solid darksalmon;
    }
   	.order-form h2{
   		margin-bottom:40px;
	}
	.line{
		width: auto;
		height: 0px;
		border-bottom: 1px solid black;
	}
	.orderPic{
		width:100%;
		height:100%;
	}
	.tab { white-space: pre; }
	.basicInfo {font-weight:bold;}
	.priceAlign{text-align:right;}
	#listMore {
		height:20px;
	}
	#listMore>td {
		text-align:center;
		background-color: darksalmon;
		padding:0px;
	}
	#listMore>td>img {
		width: 20px;
	}
	.selectDel{
		display:inline-block;
		text-align:center;
		margin-top:30px;
		margin-bottom:20px;
		padding:10px 0px 10px 0px;
		border-radius: 5px;
		border:1px solid darksalmon;
	}
	.selectCharge{
		display:inline-block;
		text-align:center;
	}
	.selectAddr{
		display:inline-block;
		text-align:center;
	}
	.selectUser{
		display:inline-block;
		text-align:center;
	}
	.contentBox{
		display:inline-block;
		padding:20px 10px 20px 10px;
		width:100%;
		height: 100%;
	}
	.deliver-form{
		border-top: 2px solid darksalmon;
        border-bottom: 2px solid darksalmon;
        margin-bottom:150px;
	}
	
	.nomember{
		border-top: 2px solid darksalmon;
        border-bottom: 1px solid darksalmon;
        padding:50px 0px 50px 0px;
        margin-bottom:50px;
	}
	
	.payment{
		border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        padding:50px 0 230px 0;
        margin-bottom:50px;
	}
	
	.mycoupon{
		margin-top:10px;
	}
	
	.finalpay{
		margin-top:30px;
		padding:20px 0px;
		background-color:#fffbf0;
		display:inline-block;
		text-align:center;
		border: thin solid darksalmon;
	}
	
	.finalpay div:nth-child(1){
		border-right:thin solid darksalmon;
	}
	.finalpay div:nth-child(2){
		border-right:thin solid darksalmon;
	}
	
	.finalpay p+p{
		font-size:20px;
	}
	
	#mypoint{
		width:70px;
	}
	
   </style>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- ***********************************content start*********************************** -->
	<div class="container-fluid col-md-8 col-md-offset-2 order-form table_div">
		<h2>주문하기</h2>
	  	<p>주문할 상품을 확인해주세요.</p>
	  	<!-- 상품정보 출력 -->
	  	<table class="table" id="ordertable">
			<thead>
				<tr class="orderths">
					<th></th>
	         		<th colspan="2">상품정보</th>
					<th>수량</th>
					<th>상품금액</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			  <c:forEach items="${selectOrder }" var="selectOrder">
				<tr>
					<td class="img_td">
						<img alt="cartimg" src="/resources/imgs/s01.jpg" class="cartimg" />
					</td>
					<td colspan="2" class="info_td">
					  <c:if test="${selectOrder.itemname != null}">
						<strong>${selectOrder.itemname }</strong>
						<p>${selectOrder.itemcon }</p>
					  </c:if>
					  <c:if test="${selectOrder.cstmmatelist != null}">
					  	<strong>커스텀 샐러드</strong>
					  	<p>${selectOrder.cstmmatelist }</p>
					  </c:if>
					</td>
					<td class="ea_td">
						<p>${selectOrder.ea }</p>
	                </td>
					<td class="price_td">
					  <c:if test="${selectOrder.itemname != null}">
						<p class="itemno1">${selectOrder.itemprice * selectOrder.ea}</p>
						<c:set var="col_sum" value="${col_sum + (selectOrder.itemprice * selectOrder.ea)}"></c:set>
					  </c:if>
					  <c:if test="${selectOrder.cstmmatelist != null }">
					  	<p class="itemno1">${selectOrder.cstmprice * selectOrder.ea}</p>
					  	<c:set var="col_sum2" value="${col_sum2 + (selectOrder.cstmprice * selectOrder.ea)}"></c:set>
					  </c:if>
					</td>
				</tr>
			  </c:forEach>
			  	<tr id="listMore" >
			  		<td colspan="6">
			  			<img src="/resources/icon/bottum.png"/>
			  		</td>
			  	</tr>
			  	<tr id="priceCommas">
			  		<td>
			  			<c:out value="${col_sum +col_sum2}"/>
			  		</td>
			  		<td>
			  			<c:out value="${col_sum +col_sum2 + 2500}"/>
			  		</td>
			  	</tr>
			  	<tr>
	                <td class="total_price" colspan="6">
                    	상품구매금액 <strong class="price_strong"> </strong>+ 배송비 <strong class="delivery_strong"> </strong>= 합계 : <strong class="total_strong">207,000원</strong>
	                </td>
	            </tr>
	        </tbody>
		</table>
    	<!-- 상품정보 출력완료 -->
		<br>
		<!-- 가격시작 / 적립금, 쿠폰 사용, 최종 가격 -->
       		
      		<div class="payment">
      			<div class="col-md-12 mycoupon">
       			<div class="col-md-12">
	       		<label for="mycoupon" class="col-md-2 control-label">쿠폰</label>
			       		<select name="mycoupon">
						    <option value="">사용할 쿠폰을 선택해주세요.</option>
						    <option value="">배송비 할인</option>
						    <option value="">이벤트 응모</option>
						    <option value="">회원가입 쿠폰</option>
						</select>
		       		
				</div>
	       		
	       		 <div class="col-md-12">
				    <label for="mypoint" class="col-md-2 control-label">적립금</label>
				      <input type="text" id="mypoint"  maxlength="8">원 / <input type="checkbox" name="chk_info" value="">전액사용 [총  <strong>2,000</strong>원]
				    
				 </div>
      			</div>
			 
			<div class="col-md-12 col-sm-12 col-xs-12 finalpay">
				<div class="col-md-4 col-sm-4 col-xs-4">
					 <p>총 상품금액</p>
					 <p class="total_strong"> </p>
				 </div>
			
				<div class="col-md-4 col-sm-4 col-xs-4">
					 <p>총 할인금액</p>
					 <p>18,960원</p>
				 </div>
				 <div class="col-md-4 col-sm-4 col-xs-4">
					 <p>최종 결제금액</p>
					 <p>18,960원</p>
				 </div>
			</div> 
      		
      		</div>
      		
      <!-- 가격끝 -->
		<!-- 비회원 주문시 입력란 -->
       	<div id="nouserData">
       	<h2>주문정보</h2>
       		<p>추후 주문확인을 위한 정보를 입력해주세요.</p>
       		<div class="contentBox nomember">
				<form class="form-horizontal">
				  <div class="form-group">
				    <label for="userName" class="col-sm-2 control-label col-md-offset-3">이름</label>
				    <div class="col-sm-5 col-md-3">
				      <input type="text" class="form-control" id="nouserName" placeholder="이름">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="userPhone" class="col-sm-2 control-label col-md-offset-3">연락처</label>
				    <div class="col-sm-5 col-md-3">
				      <input type="tel" class="form-control" id="nouserPhone" placeholder="연락처">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="userPhone" class="col-sm-2 control-label col-md-offset-3">비밀번호</label>
				    <div class="col-sm-5 col-md-3">
				 <input type="password" class="form-control" id="nouserPw" placeholder="비밀번호">
				</div>
				  </div>
				   <div class="form-group">
				    <label for="userPhone" class="col-sm-2 control-label col-md-offset-3">비밀번호 확인</label>
				    <div class="col-sm-5 col-md-3">
				 <input type="password" class="form-control" id="nouserPw2" placeholder="비밀번호 확인">
				</div>
				  </div>
				 </form>
			</div>
       	</div>
       		
  		<!-- 비회원 주문시 입력끝 -->
       		
       	<h2 id="deliver">배송/픽업</h2>
				<br>
				<div class="col-md-12 deliver-form">
					<div class="col-md-8 col-md-offset-2 selectDel">
						<label class="radio-inline">
						<input type="radio" name="deliverOpt" value="1" checked>배송</label>
						<label class="radio-inline">
						<input type="radio" name="deliverOpt" value="0" >픽업</label>
					</div>
					<br/><br/><br/>
					<!-- 배송 선택시 폼 -->
					<div class="Deliver">
					<div class="col-md-8 col-md-offset-2">
						<h3>배송지 입력</h3>
						<div id="selectDel">
							<div class="col-md-12 selectAddr">
								<label class="radio-inline">
								<input type="radio" name="addrUpdate" id="addrupdate1" value="0" checked>기본 주소지</label>
								<!-- 주소록 주소 출력 -->
								<c:forEach items="${selectAddr }" var="selectAddr">
								<c:if test="${selectAddr.addrname != null}">
									<label class="radio-inline">
									<input type="radio" name="addrUpdate" value="${selectAddr.addridx}">${selectAddr.addrname}</label>
								</c:if>
								</c:forEach>
								<!-- 주소록 출력 완료 -->
								<label class="radio-inline">
								<input type="radio" name="addrUpdate" id="addrupdate2" value="-1">새 주소</label>
							</div>
							<div class="col-md-12 selectUser">
								<label class="radio-inline">
								<input type="radio" name="nouserData" value="1" checked>새 정보</label>
								<label class="radio-inline">
								<input type="radio" name="nouserData" value="0" >주문정보와 동일</label>
						</div>
						</div>
					<br><br>
					<div class="contentBox">
						<form class="form-horizontal" name="deliverform" id="deliverform">
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">이름</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="text" class="form-control" id="userName" placeholder="이름" value=" ${userInfo.username}">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="userPhone" class="col-sm-2 control-label">연락처</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="tel" class="form-control" id="userPhone" placeholder="연락처"  value="${userInfo.userphone }">
						    </div>
						  </div>
						  
						  <!-- 배송선택시 보이는 폼 -->
						  <div id="selectJuso">
						   <div class="form-group">
						    <label for="useraddr" class="col-sm-2 control-label" >주소</label>
						   		<div>
								    <div class="col-xs-4 col-sm-2 col-md-3">
									    <input type="text" class="form-control" id="userpostnum" name="userpostnum" placeholder="우편번호" maxlength="6" value="${userInfo.userpostnum }" >
									</div>
									 <div class="col-xs-2 col-sm-2 col-md-2">
								      <input type="button" name="findAddr" id="findAddr" class="btn btn-default" onClick="findJuso();" value="주소찾기" />
								    </div>
								    
								    <div class="col-xs-2 col-sm-2 col-md-2">
								      <input type="button" name="myAddr" id="myAddr" class="btn btn-default" onClick="myAddr();" value="주소록" />
								    </div>
								</div>
							</div>
							<div class="form-group">
									<div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
										<input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="주소" value="${userInfo.useraddr1 }" >
									</div>
							</div>
							<div class="form-group"> 	
								<div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
							     	 	<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소" value="${userInfo.useraddr2 }" >
							    	</div>
							  </div>
						  	</div>
						  	<!-- 배송선택시 보이는 폼 end-->
						  	<!-- 픽업 선택시 보이는 폼 -->
						  	<div id="selectPick">
						  	<div class="form-group">
						  		  <label for="userName" class="col-sm-2 control-label">점포선택</label>
								   <div class="col-sm-5 col-md-7">
								  	<select class="form-control">
									  <option>강남본점</option>
									  <option>서초점</option>
									</select>
								   </div>
						  	</div>
						  	
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">수령일</label>
						    <div class="col-sm-5 col-md-7">
						      <input type="date" class="form-control" id="deliveDate" placeholder="수령날짜">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">수령시간</label>
						    <div class="col-sm-5 col-md-7">
						      	<select class="form-control">
									  <option>09:30~10:30</option>
									  <option>10:30~11:30</option>
									  <option>11:30~12:30</option>
									  <option>12:30~13:30</option>
									  <option>13:30~14:30</option>
									  <option>14:30~15:30</option>
									  <option>15:30~16:30</option>
									  <option>16:30~17:30</option>
								</select>
						    </div>
						  </div>
					</div>
						<!-- 픽업 선택시 보이는 폼 end-->
						<div class="form-group">
						    <label for="useracc" class="col-sm-2 control-label">환불계좌</label>
						    <div class="col-sm-3 col-md-3">
						      	<select class="form-control">
									  <option value="">은행선택</option>
									  <option value="">국민은행</option>
									  <option value="">카카오뱅크</option>
									  <option value="">우리은행</option>
									  <option value="">SC제일은행</option>
									  <option value="">농협</option>
									  <option value="">하나은행</option>
									  <option value="">신한은행</option>
									  <option value="">기업은행</option>
									  <option value="">우체국</option>
									  <option value="">케이뱅크</option>
								</select>
						    </div>
						    
						    <div class="col-sm-5 col-md-6">
						      <input type="text" class="form-control" id="useracc" name="useracc" placeholder="환불계좌" value="${userInfo.useracc }">
						    </div>
						  </div>
						  
						 <div class="form-group">
						    <label for="userName" class="col-sm-2 control-label">결제방법</label>
						   
						  	<div class="col-sm-offset-1 col-sm-7 col-md-7 ">
						  		<div class="selectCharge">
									<label class="radio-inline">
									<input type="radio" name="optradio" checked>카드</label>
									<label class="radio-inline">
									<input type="radio" name="optradio">휴대폰결제</label>
									<label class="radio-inline">
									<input type="radio" name="optradio">무통장입금</label>
								</div>
						  	</div>
						</div>
						  
						<br><br><br>
						  <div class="form-group">
						    <div class="col-sm-offset-4 col-sm-4">
						      <button type="submit" class="btn btn-default">결제하기</button>
						    </div>
						  </div>
						</form>
						</div>
					</div>
					
					</div>
					
				</div>
			</div><!-- container end -->
<!-- ***********************************content end*********************************** -->
<!-- ***********************************footer*********************************** -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
	//날짜 기본값 오늘로 세팅
	var today = new Date().toISOString().substring(0, 10);

	
 	//주소찾기 팝업
   function findJuso(){
		var pop = window.open("<%="http://localhost:8080/order/"%>popup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
	}
		
   function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.deliverform.useraddr1.value = roadAddrPart1;
	document.deliverform.useraddr2.value = addrDetail;
	document.deliverform.userpostnum.value = zipNo;
   }

   //주소록 팝업
   function myAddr(){
	   var pop = window.open("<%="http://localhost:8080/order/"%>myaddr","addr","width=570,height=420, scrollbars=yes, resizable=no"); 	
			
	}

   function myAddrCallBack(addridx){
	
	}

   //json 연동
   function findElement(arr,propName, propValue){
		for(var i=0; i < arr.length; i++){
			if(arr[i][propName]==propValue){
				return arr[i]
			}
		}
	}
   	
   	$(document).ready(function() {
   		$('#findAddr').click(function(){
   			findJuso();
   		});

   		$('#myAddr').click(function(){
			myAddr();

   	   	});
		
		grid();
   		$('#deliveDate').val(today);
		$('#selectPick').hide();
		$('#nouserData').hide();
		$('.selectUser').hide();
		
   		//세션으로 회원/비회원 구분
   	   	var isuser = '<%=(String)session.getAttribute("isuser")%>';
   	 	var user;
   	 	var nouser;
   	   	if(isuser=="1"){
   	   	
   	   		user = '<%=(String)session.getAttribute("userid")%>';
   			//회원일시 적립금란 보임, 주문정보기입란 제거

   			

   	   	}else if(isuser=="0"){
   	   		nouser = '<%=(String)session.getAttribute("nousernum")%>';
   	  		//비회원 주문시 주문정보란 뜸
   	   		$('#nouserData').show();
			$('.selectAddr').hide();
   			$('.selectUser').show();
   	   		$('.payment').hide();
   	   	}
   	   	
		//배송지 입력 라디오 박스
		//회원
		$('input:radio[name=addrUpdate]').click(function(){
			if($('input[name=addrUpdate]:checked').val()=="0"){
				//회원 정보
				$('#userName').val('${userInfo.username}');
				$('#userPhone').val('${userInfo.userphone}');
				$('#userpostnum').val('${userInfo.userpostnum}');
				$('#useraddr1').val('${userInfo.useraddr1}');
				$('#useraddr2').val('${userInfo.useraddr2}');
				$('#useracc').val('${userInfo.useracc}');
			}else if($('input[name=addrUpdate]:checked').val()=="-1"){
				//input란 전부 리셋
				$('#userName').val('');
				$('#userPhone').val('');
				$('#userpostnum').val('');
				$('#useraddr1').val('');
				$('#useraddr2').val('');
				$('#useracc').val('');
			}else{
				
				var addridx = $('input[name=addrUpdate]:checked').val();

				var json = JSON.parse('${jsonList}');

				var x = findElement(json,"addridx",addridx);
				console.log(x["addrname"]);
				$('#userpostnum').val(x["userpostnum"]);
				$('#useraddr1').val(x["useraddr1"]);
				$('#useraddr2').val(x["useraddr2"]);
				
			}

		});
		
		//비회원 - 동일 누르면 위의 정보 입력됨
		$('input:radio[name=nouserData]').click(function(){
			if($('input[name=nouserData]:checked').val()=="1"){
				//새정보 이름, 연락처 비움
				$('#userName').val('');
				$('#userPhone').val('');
			}else if($('input[name=nouserData]:checked').val()=="0"){
				//정보 입력
				var name = $('#nouserName').val();
				var phone = $('#nouserPhone').val();
				$('#userName').val(name);
				$('#userPhone').val(phone);
			}

		});
		
		
		//배송/픽업 선택 라디오박스
   		$("input:radio[name=deliverOpt]").click(function(){
	   		if($('input[name=deliverOpt]:checked').val()=="1"){
	   			$('h3').text('배송지 입력');
	   			$('#selectJuso').show();
				$('#selectPick').hide();
	   	   	}else if($('input[name=deliverOpt]:checked').val()=="0"){
		   	   	$('h3').text('수령점포 선택');
		   	 	$('#selectJuso').hide();
				$('#selectPick').show();
				
				
	   	   	}
   		});

		/*****************************************************************/
		//합계가격 가리기
		$('#priceCommas').css('display','none');
		//콤마찍기
		var priceCommas = ($('#priceCommas td').eq(0).text());
		var beliverNpriceCommas = ($('#priceCommas td').eq(1).text());
   		function numberWithCommas(e) {
   	   		var regexp = /\B(?=(\d{3})+(?!\d))/g;
    		return e.toString().replace(regexp, ",");
		}
		var priceComma = numberWithCommas(priceCommas);
		var beliverNpriceComma = numberWithCommas(beliverNpriceCommas);
		$('.price_strong').text(priceComma+"원");
	
	
		//합계금액 5만원, 픽업 선택시 배송료 0원
		if(priceCommas>=50000){
			$('.delivery_strong').text("0원");
			$('.total_strong').text(priceComma+"원");
		}else{
			$('.delivery_strong').text("2,500원");
			$('.total_strong').text(beliverNpriceComma+"원");
		}
		
		
		/*****************************************************************/
   	});

   	$(window).resize(function() {
        grid();
    })
    
	function grid() {
		var windowWidth = $(window).width();
		//md
		if (windowWidth >= 992) {
		    $('td p').css('top', '40px');
		    $('.plus, .minus, td strong, .delete_img').css('top', '35px');
		    $('table input').css('top', '35px');
		    $('.info_td strong, .price_td p, .total_price').css('font-size', '15px');
		    $('.info_td p').css('font-size', '13px');
		}
		
		//sm
		if (windowWidth >= 768 && windowWidth < 992) {
		    $('.delete_img').css('top', '25px');
		    $('.plus, .minus, td p, td strong').css('top', '35px');
		    $('table input').css('top', '35px');
		    $('.info_td strong, .price_td p, .total_price').css('font-size', '14px');
		    $('.info_td p').css('font-size', '12px');
		    $('.btn_div').css('margin-bottom', '70px');
		}

		//xs
		if (windowWidth < 768) {
		    $('.delete_img').css('top', '1px');
		    $('.plus, .minus, td p, td strong').css('top', '7px');
		    $('table input').css('top', '7px');
		    $('.btn').addClass('btn-sm');
		    $('.info_td strong, .price_td p, .total_price').css('font-size', '13px');
		    $('.info_td p').css('font-size', '11px');
		    $('.btn_div').css('margin-bottom', '50px');
		}
	}
</script>
</html>