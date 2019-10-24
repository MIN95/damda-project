<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/> 
    <style type="text/css">
    #qnaNotice {
    background-color: #eeeeee;
    }
    #qnaNotice #subBack {
    background-color: #ffe09c;
    color:#ffffff;
    border-radius: 8px;
    width:160px;
    margin: 30px auto;
    padding: 10px;
    }
    #qnaTab th {
    text-align: center;
    }
    #qnaTab #contentPw {
    cursor: pointer;
    }
    #qnaTab .lock {
    width: 20px;
    height: 18px;
    }
    #qnaTab tbody a:link {
    text-decoration: none;
    color: #363636;
    }
    #qnaTab tbody a:hover {
    color: #eee;
    }
    #qnaTab tbody :visited {
    color: #363636;
    }
    #categoryWrap {
    margin-top: 20px;
    }
    #searchDesk div {
    padding: 0px;
    }
    #deleteBtn {
    cursor: pointer;
    }
    #pgBtn #pgBack {
    display: none;
    }
    #pgBtn a {
    color: #363636;
    cursor: pointer;
    }
    [name=deleteCheck],#delCheckAll {
    width: 20px; 
    height: 20px;
    }
    #confirmMessage h4 {
    font-size: 1.7rem; 
    }
    #content .pagination>li>a {
    color: black;
    }
    #content .pagination>li>a:hover {
    font-weight: bold;
    }
    .item {
    margin-bottom: 0px;
    }
    </style>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
   <div class="container-fluid text-center">
       <div class="row">
          <div class="col-md-offset-1 col-md-10">
             <div class="col-md-12 col-sm-12 col-xs-12">
               <br /><br />
                  <h3>Q&A</h3>
               <br />
            </div>
            <div id="qnaNotice" class="col-md-12 col-sm-12 col-xs-12">
            <div id="subBack">안내 및 유의사항</div>
            * 주문 후 배송전/후 상품추가 및 타상품교환은 불가합니다.<br /> 
            * 추가,변경(교환)을 원하신다면 취소/반품후 새주문서 작성 부탁드립니다.<br /> 
            * 결제완료 순으로 배송되며, 세일로 결제가 늦어질 경우 조기품절이 될 수 있습니다.<br /> 
            <br /> 
            * 기본배송기간 : 1일~3일<br /> 
            * 이벤트(세일)기간 내 주문의 경우에는 기본배송일 이상 소요되며, 이벤트 종료 이후 순차 배송됩니다.<br />
            <br /><br /> 
            </div>
            <div id="categoryWrap" class="col-md-12 col-sm-12 col-xs-12 text-right">
               <select id="qnakind" class="selectpicker"> 
                  <option value="전체">전체</option> 
                  <option value="상품">상품문의</option> 
                  <option value="배송">배송문의</option> 
                  <option value="취소/변경">취소/변경문의</option> 
                  <option value="교환/반품">교환/반품문의</option> 
                  <option value="기타">기타문의</option> 
               </select>
            </div>
            <div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
               <br />
               <table class="table text-center">
                  <thead>
                     <tr>
                        <th>No</th>
                        <th>Category</th>
                        <th>Subject</th>
                        <th>Writer</th>
                        <th>Date</th>
                     </tr>
                  </thead> 
                  <tbody id="qnaTbody">
                  </tbody>
               </table>
               </div>
                  <div class="col-md-12 col-sm-12 col-xs-12 text-right">
                     <button id="insertBtn" class="btn btn-default">글작성</button>
                  </div>
            	<div id="buttonDiv" class="col-md-12 col-sm-12 col-xs-12"> 
				
            </div>
         </div>
      </div>
   </div>
   <!-- 삭제 Modal confirm -->
   <div class="modal" id="confirmModal" style="display: none; z-index: 1050;">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-body" id="confirmMessage">
                  <h4>선택한 항목을 삭제하시겠습니까?</h4>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-default" id="confirmOk">확인</button>
                   <button type="button" class="btn btn-default" id="confirmCancel">취소</button>
               </div>
           </div>
       </div>
   </div>
   <!-- ----------------------------------------------------------------------------------- -->
   <!-- qna 비밀번호 Modal confirm -->
   <div class="modal" id="pwconfirmModal" style="display:none; z-index: 1050;">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-body text-center" id="confirmMessage">
               <br />
               <p>이 글은 비밀글입니다.</p> 
               <p>비밀번호를 입력하여 주세요.</p>
            <p>관리자는 확인버튼만 누르시면 됩니다.</p>
            <br />
               <label for="pwQna">password</label>&nbsp;&nbsp;&nbsp;<input type="text" id="pwQna" name="pwQna">
               </div>
               <br />
               <div class="modal-footer">
                   <button type="button" class="btn btn-default" id="pwconfirmOk">확인</button>
                   <button type="button" class="btn btn-default" id="pwconfirmCancel">취소</button>
               </div>
           </div>
       </div>
   </div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
  <script type="text/javascript">
 	 $(document).ready(function(){
       resized2();                  
  	//페이징버튼 가져오기
    var qnaKind = $('#qnakind').val();
  	var page=1; 
     itemPagingBtn(qnaKind,page);
     itemPagingList(qnaKind,page);
    });//document.ready function end***************************************************************************
    
   $('#contentPw').click(function(){
       var pwModal = $("#pwconfirmModal");
        pwModal.modal("show").css('top', '35%');
        $("#pwconfirmOk").click(function(){
           console.log('글 접근 가능');/********************************************글삭제로직  */
        });
        $("#pwconfirmCancel").click(function(){
            pwModal.modal("hide");
        });
   });

   //글 삭제시 전체 선택&해제(관리자)
   $('#delCheckAll').click( function() {
       $( 'table tbody tr td:last-child [name=deleteCheck]' ).prop( 'checked', this.checked );
     });
   
   //전체삭제&삭제 버튼 클릭
   $('#deleteBtn').click(function(){
       var myModal = $("#confirmModal");
           myModal.modal("show").css('top', '35%');
        $("#confirmOk").click(function(){
           console.log('체크한 글 비동기로 지우기');/********************************************글삭제로직  */
        });
        $("#confirmCancel").click(function(){
            myModal.modal("hide");
        });
   });
    //창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
    $(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();          
            if(windowWidth < 540) {
               $('#qnaTab').css('font-size','12px');
            }else{
               $('#qnaTab').css('font-size','14px');
               
            }
    }
    //글쓰기버튼
    $('#insertBtn').on('click',function(){
    	window.location.href='/qna/insert';
    });
    
    
    $('#qnakind').on('change',function(){
    	qnaKind = $('#qnakind').val();
    	page=1;
    	itemPagingList(qnaKind,page);
    	itemPagingBtn(qnaKind,page);
    });
    
    $(document).on('click', ".hidden_btn", function(){
        pageString  = $(this).children("input[type=text]").val();
        page = parseInt(pageString);
        qnaKind = $('#qnakind').val();
        console.log(qnaKind);
        itemPagingBtn(qnaKind,page);
        itemPagingList(qnaKind,page);
     });
     
     //페이징 버튼 
     function itemPagingBtn(qnaKind,page) {
        $('#qnaPageDiv').remove();
        var pageMaker = {};
        var idx=1;
        var sendData = {
           "qnaKind" : qnaKind,
           "page" : page
        };
        $.ajax({
           type:"GET",
           url:"/qna/pagingBtn",
           data : sendData,   
           dataType:"JSON", 
           success : function(data) {                 
              pageMaker=data;
              console.log("버튼가져오기 마지막페이지"+pageMaker.endPage);
				var selectList=""
				var startPage = pageMaker.startPage;
				var endPage  = pageMaker.endPage;
				$("#buttonDiv").append('<div id="qnaPageDiv" class="row col-md-offset-4 col-md-4 col-sm-offset-2 col-sm-8 col-xs-12 text-center"><ul id="qnaPaging" class="pagination"></ul></div>');
               if(pageMaker.prev==true){
                 $("#qnaPaging").append('<li><a style="cursor:pointer" class="hidden_btn" aria-label="Previous">&laquo;</a><input type="text" value="'+(pageMaker.startPage-1)+'" hidden /></li>');
               }
	                for(;startPage<=endPage;startPage++){
	                  selectList='<li>'
	                  selectList+='<a class="hidden_btn" style="cursor:pointer">'+idx+'<input type="text" value="'+idx+'" hidden /></a>'
	                  selectList+='</li>';
	                  $("#qnaPaging").append(selectList);
	                  idx++;
	               }    
	               if(pageMaker.next && pageMaker.endPage >0 ){
	                  $("#qnaPaging").append('<li><a style="cursor:pointer" class="hidden_btn" aria-label="Next">&raquo;</a><input type="text" value="'+(pageMaker.endPage+1)+'" hidden /></li>');
	               }
             },
              error : function(xhr, status, error) {
                console.log("에러발생");
             }
          });    
     }
     //qna리스트가져오기
     //페이징 처리
      function itemPagingList(qnaKind,page) {
         $('.ajaxTr').remove();
         var values = {};
         var sendData = {
            "qnaKind" : qnaKind,
            "page" : page
         };
         $.ajax({
            type:"GET",
            url:"/qna/pagingList",
            data : sendData,   
            dataType:"JSON",   
            success : function(data) { 
               values = data;
               console.log(values); 
				$.each(values,function(index,List){   
	                selectList = '<tr class="ajaxTr">'
	                selectList += '<td>'+List.rownum+'</td>'
	                selectList += '<td>'+List.qnaKind+'</td>'
	                selectList += '<td><a id="qnaNum" href="/qna/detail?no='+List.qnaNum+'" class="qnaSubWrap">'+List.qnaSub+'</a></td>'
	                selectList += '<td>'+List.m_userId+'</td>'
	                selectList += '<td>'+List.qnaDate+'</td>'
	                selectList += '<input type="hidden" name="qnapw'+(index+1)+'" id="qnapw'+(index+1)+'" class="qnapwWrap" value="'+List.qnaPw+'"/>'
	                selectList += '</tr>'; 
	                $("#qnaTbody").append(selectList);
	               })
	               
	             //자물쇠 띄우기 
	        		$('.qnapwWrap').each(function(index){
	        			console.log($(this).val()!="null");
	        	       	if($(this).val()!="null") {
	        			$("tbody tr:eq("+index+") td:eq(2)").append("<img style='width:15px;heigth:15px;' src='/resources/icon/save_lock.png'>");
	        	       }
	        	  	}); 
              },
               error : function(xhr, status, error) { 
                 console.log("에러발생");
              }
           });   
     }
</script>
</html>