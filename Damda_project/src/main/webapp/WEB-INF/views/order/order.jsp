<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                      <select name="mycoupon" id="couponlist">
                      <option value="">사용할 쿠폰을 선택해주세요.</option>
                      <option value="1">배송비 할인</option>
                      <option value="2">이벤트 응모</option>
                      <option value="3">회원가입 쿠폰</option>
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
                <p>0원</p>
             </div>
             <div class="col-md-4 col-sm-4 col-xs-4">
                <p>최종 결제금액</p>
                <p class="total_strong"></p>
             </div>
         </div> 
            
            </div>
            
      <!-- 가격끝 -->
      <!-- 비회원 주문시 입력란 -->
          <div id="nouserData">
          <h2>주문정보</h2>
             <p>추후 주문확인을 위한 정보를 입력해주세요.</p>
             <div class="contentBox nomember">
            <form class="form-horizontal" name="deliverform" method="post" action="orderdata">
              <div class="form-group">
                <label for="nousername" class="col-sm-2 control-label col-md-offset-3">이름</label>
                <div class="col-sm-5 col-md-3">
                  <input type="text" class="form-control" id="nousername" name="nousername" placeholder="이름">
                </div>
              </div>
               <div class="form-group">
                <label for="nouserphone" class="col-sm-2 control-label col-md-offset-3">연락처</label>
                <div class="col-sm-5 col-md-3">
                  <input type="tel" class="form-control" id="nouserphone" name="nouserphone" placeholder="연락처" maxlength="13"  >
                </div>
              </div>
               <div class="form-group">
                <label for="orderpw" class="col-sm-2 control-label col-md-offset-3">비밀번호</label>
                <div class="col-sm-5 col-md-3">
             <input type="password" class="form-control" id="orderpw" name="orderpw" placeholder="비밀번호">
            </div>
              </div>
               <div class="form-group">
                <label for="orderpw2" class="col-sm-2 control-label col-md-offset-3">비밀번호 확인</label>
                <div class="col-sm-5 col-md-3">
             <input type="password" class="form-control" id="orderpw2" name="orderpw2" placeholder="비밀번호 확인">
            <p id="pwchk"> </p>
            </div>
              </div>
         </div>
          </div>
             
        <!-- 비회원 주문시 입력끝 -->
             
          <h2 id="deliver">배송/픽업</h2>
            <br>
            <div class="col-md-12 deliver-form form-horizontal"  >
               <div class="col-md-8 col-md-offset-2 selectDel">
                  <label class="radio-inline">
                  <input type="radio" name="delivertype" value="1" checked>배송</label>
                  <label class="radio-inline">
                  <input type="radio" name="delivertype" value="2" >픽업</label>
               </div>
               <br/><br/><br/>
               <!-- 배송 선택시 폼 -->
               <div class="Deliver">
               <div class="col-md-8 col-md-offset-2">
                  <h3>배송지 입력</h3>
                  <div id="selectDel">
                     <div class="col-md-12 selectAddr" id="selectAddr">
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
               <div class="contentBox" id="deliverform" >
                    <div class="form-group">
                      <label for="receivername" class="col-sm-2 col-md-2 control-label">이름</label>
                      <div class="col-sm-5 col-md-7">
                        <input type="text" class="form-control" id="receivername" name="receivername" placeholder="이름" value=" ${userInfo.username}" required/>
                      </div>
                    </div>
                     <div class="form-group">
                      <label for="receiverphone" class="col-sm-2 col-md-2 control-label">연락처</label>
                      <div class="col-sm-5 col-md-7">
                        <input type="tel" class="form-control" id="receiverphone" name="receiverphone" placeholder="연락처"  value="${userInfo.userphone }" maxlength="13" required/>
                      </div>
                    </div>
                    
                    <!-- 배송선택시 보이는 폼 -->
                    <div id="selectJuso">
                     <div class="form-group">
                      <label for="useraddr" class="col-sm-2 control-label" >주소</label>
                           <div>
                            <div class="col-xs-4 col-sm-2 col-md-3">
                               <input type="text" class="form-control" id="deliverpostnum" name="deliverpostnum" placeholder="우편번호" maxlength="6" value="${userInfo.userpostnum }" class="usedel" />
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
                              <input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="주소" value="${userInfo.useraddr1 }" class="usedel">
                           </div>
                     </div>
                     <div class="form-group">    
                        <div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
                                 <input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소" value="${userInfo.useraddr2 }" class="usedel" required/>
                            </div>
                       </div>
                       </div>
                       <!-- 배송선택시 보이는 폼 end-->
                       <!-- 픽업 선택시 보이는 폼 -->
                       <div id="selectPick">
                       <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">점포선택</label>
                           <div class="col-sm-5 col-md-7">
                             <select class="form-control" class="usepick" name="pickup">
                             <option value="강남">강남본점</option>
                             <option value="서초">서초점</option>
                           </select>
                           </div>
                       </div>
                       
                    <div class="form-group">
                      <label for="userName" class="col-sm-2 control-label">수령일</label>
                      <div class="col-sm-5 col-md-7">
                        <input type="date" class="form-control" id="deliverdate" name="deliverdate" placeholder="수령날짜" class="usepick">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="userName" class="col-sm-2 control-label">수령시간</label>
                      <div class="col-sm-5 col-md-7">
                           <select class="form-control" class="usepick">
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
                           <select class="form-control" name="bank" id="bank">
                             <option value="">은행선택</option>
                             <option value="국민은행">국민은행</option>
                             <option value="카카오뱅크">카카오뱅크</option>
                             <option value="우리은행">우리은행</option>
                             <option value="SC제일은행">SC제일은행</option>
                             <option value="농협">농협</option>
                             <option value="하나은행">하나은행</option>
                             <option value="신한은행">신한은행</option>
                             <option value="기업은행">기업은행</option>
                             <option value="우체국">우체국</option>
                             <option value="케이뱅크">케이뱅크</option>
                        </select>
                      </div>
                     
                         <input type="hidden" class="form-control" id="co_couponnum" name="co_couponnum" placeholder="쿠폰값" value="1">
                     <input type="hidden" class="form-control" id="price" name="price" placeholder="총가격"/>
                     
                        <input type="hidden" class="form-control" id="bankset" name="bankset" placeholder="은행" value="${userInfo.userbank }">
                      <div class="col-sm-5 col-md-6">
                        <input type="text" class="form-control" id="refundaccount" name="refundaccount" placeholder="환불계좌" value="${userInfo.useracc }" required/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="refundaccowner" class="col-sm-2 control-label">예금주</label>
                      <div class="col-sm-5 col-md-7">
                        <input type="text" class="form-control" id="refundaccowner" name="refundaccowner" placeholder="이름" value=" ${userInfo.useraccowner}"  required/>
                      </div>
                    </div>
                    
                   <div class="form-group">
                      <label for="userName" class="col-sm-2 control-label">결제방법</label>
                     
                       <div class="col-sm-offset-1 col-sm-7 col-md-7 ">
                          <div class="selectCharge">
                           <label class="radio-inline">
                           <input type="radio" name="ordertype" value="1" checked>카드</label>
                           <label class="radio-inline">
                           <input type="radio" name="ordertype" value="2" >무통장입금</label>
                           <label class="radio-inline">
                           <input type="radio" name="ordertype" value="3" >핸드폰결제</label>
                        </div>
                       </div>
                  </div>
                    
                  <br><br><br>
                    <div class="form-group">
                      <div class="col-sm-offset-4 col-sm-4">
                        <button type="button" class="btn btn-default" id="paybtn">결제하기</button>
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
   document.deliverform.deliverpostnum.value = zipNo;
   }

   //주소록 팝업
   function myAddr(){
      var pop = window.open("<%="http://localhost:8080/order/"%>myaddr","addr","width=570,height=420, scrollbars=yes, resizable=no");    
         
   }

   function myAddrCallBack(addrname, postnum, addr1, addr2){
      document.deliverform.useraddr1.value = addr1;
      document.deliverform.useraddr2.value = addr2;
      document.deliverform.deliverpostnum.value = postnum;
   
   }

  
   //json 연동
   function findElement(arr,propName, propValue){
      for(var i=0; i < arr.length; i++){
         if(arr[i][propName]==propValue){
            return arr[i]
         }
      }
   }

 //비밀번호 일치여부 확인
   function passwordCheck(){
      var userPw = $('#orderpw').val();
      var userPwChk = $('#orderpw2').val();

      if(userPw!=userPwChk){
         $('#pwchk').text('비밀번호가 일치하지 않습니다.');
         $('#pwchk').css('color','red');
      }else {
         $('#pwchk').text('비밀번호가 일치합니다.');
         $('#pwchk').css('color','green');
      }
      
   };
   
   //핸드폰 번호 하이픈 자동입력
   function autoHypenPhone(nowNum){
         nowNum=nowNum.replace(/[^0-9]/g, '');
         var phoneNum="";
            if(nowNum.length < 4){
               return nowNum;
         }else if(nowNum.length < 7){
               phoneNum += nowNum.substr(0,3);
               phoneNum += '-';
               phoneNum += nowNum.substr(3);
               return phoneNum;
         }else if(nowNum.length < 11){
               phoneNum += nowNum.substr(0,3);
               phoneNum += '-';
               phoneNum += nowNum.substr(3,3);
               phoneNum += '-';
               phoneNum += nowNum.substr(6);
               return phoneNum;
         }else{
               phoneNum += nowNum.substr(0,3);
               phoneNum += '-';
               phoneNum += nowNum.substr(3,4);
               phoneNum += '-';
               phoneNum += nowNum.substr(7);
               return phoneNum;
            }
         return nowNum
      };
      
      $(document).ready(function() {

         //비밀번호 입력 후 확인을 마치면 일치 확인
      $('#orderpw').focus(function(){
         $('#orderpw2').blur(function(){
            passwordCheck();
         });
      });

      //비밀번호 입력 후 확인을 마치면 일치 확인
      $('#orderpw2').focus(function(){
         $('#orderpw1').blur(function(){
            passwordCheck();
         });
      });

      $('#nouserphone').keyup(function(){
         //입력한 핸드폰 번호
         var   nowNum=$('#nouserphone').val();
            nowNum=$.trim(autoHypenPhone(nowNum));
            $('#nouserphone').val(nowNum);
       });

      $('#receiverphone').keyup(function(){
         //입력한 핸드폰 번호
         var   nowNum=$('#receiverphone').val();
            nowNum=$.trim(autoHypenPhone(nowNum));
            $('#receiverphone').val(nowNum);
       });

       
      
         $('#findAddr').click(function(){
            findJuso();
         });

         $('#myAddr').click(function(){
         myAddr();

            });
      
      grid();
         $('#deliverdate').val(today);
      $('#selectPick').hide();
      $('#nouserData').hide();
      $('.selectUser').hide();
      $('#myAddr').hide();
      
         //세션으로 회원/비회원 구분
            var isuser = '<%=(String)session.getAttribute("isuser")%>';
          var user;
          var nouser;
            if(isuser=="1"){
            
               user = '<%=(String)session.getAttribute("userid")%>';
            //회원일시 적립금란 보임, 주문정보기입란 제거
         //회원정보에서 계좌이름 가져와서 세팅
         var bankname=$('#bankset').val();
         $('#bank').val(bankname).prop("selected",true);
         $('#myAddr').show();

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
            console.log(x["userpostnum"]);
            $('#deliverpostnum').val(x["userpostnum"]);
            $('#useraddr1').val(x["useraddr1"]);
            $('#useraddr2').val(x["useraddr2"]);
            
         }

      });
      
      //비회원 - 동일 누르면 위의 정보 입력됨
      $('input:radio[name=nouserData]').click(function(){
         if($('input[name=nouserData]:checked').val()=="1"){
            //새정보 이름, 연락처 비움
            $('#receivername').val('');
            $('#receiverphone').val('');
         }else if($('input[name=nouserData]:checked').val()=="0"){
            //정보 입력
            var name = $('#nousername').val();
            var phone = $('#nouserphone').val();
            $('#receivername').val(name);
            $('#receiverphone').val(콜);
         }

      });
      
      
      //배송/픽업 선택 라디오박스
         $("input:radio[name=delivertype]").click(function(){
            if($('input[name=delivertype]:checked').val()=="1"){
               $('h3').text('배송지 입력');
               $('#selectJuso').show();
            $('#selectPick').hide();

            $('.selectAddr').show();

            //픽업 input란 
            $('.usepick').attr("disabled",true);
            
               }else if($('input[name=delivertype]:checked').val()=="2"){
                  $('h3').text('수령점포 선택');
                $('#selectJuso').hide();
            $('.selectAddr').hide();
                $('#selectPick').show();

            $('.usedel').attr("disabled",true);
            
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
   
      //총금액을 hidden에 넣어준다
      //합계금액 5만원, 픽업 선택시 배송료 0원
      if(priceCommas>=50000){
         $('.delivery_strong').text("0원");
         $('.total_strong').text(priceComma+"원");
         
      }else{
         $('.delivery_strong').text("2,500원");
         $('.total_strong').text(beliverNpriceComma+"원");
      
      }
      
      
      /*****************************************************************/

      //결제
      
      var addr = $('#useraddr1').val() +" "+ $('#useraddr1').val();
      var cash;
      if(priceCommas>=50000){
         cash=priceCommas.toString().trim();
      }else{
         cash=beliverNpriceCommas.toString().trim();
      }

      $('#price').val(cash);
      
      $('#paybtn').click(function(){
         makeOrdernum();
         if($('input[name=ordertype]:checked').val()=="1"){
            var IMP = window.IMP;
            IMP.init('imp55502640');
            IMP.request_pay({
               pg: 'kakao',
               pay_method: 'card',
               merchant_uid: 'merchant_' + new Date().getTime(),
               name: 'Dam da. 결제안내',
               amount: cash,
               buyer_name: $('#userName').val(),
               buyer_tel: $('#userPhone').val(),
               buyer_addr: addr,
               buyer_postcode: $('#userpostnum').val(),
               
               }, function (rsp) {
               console.log(rsp);
               if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  msg += '고유ID : ' + rsp.imp_uid;
                  msg += '상점 거래ID : ' + rsp.merchant_uid;
                  msg += '결제 금액 : ' + rsp.paid_amount;
                  msg += '카드 승인번호 : ' + rsp.apply_num;
                  
                  formsend();
               } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
               }
               //alert(msg);
               });

               
         }//if
         
   
      });
      
      });

   
         
      function formsend(){
         document.deliverform.submit();
      }
      
      function makeOrdernum(){
      var d= new Date();
      var ordernum =d.getFullYear()+""+(d.getMonth() + 1)+""+d.getDate()+""
                  +d.getHours()+""+d.getMinutes()+""+d.getSeconds();

      //alert(ordernum);
      $('#ordernum').val(ordernum);
   
         
      }

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