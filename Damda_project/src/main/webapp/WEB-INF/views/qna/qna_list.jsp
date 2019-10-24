<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/> 
    <style type="text/css">
	/*modal start***************************************************/
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
    /*modal end***************************************************/
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
    color: #333333;
    }
    #content .pagination>li>a:hover {
    font-weight: bold;
    }
    .item {
    margin-bottom: 0px;
    }
	/*for userSession*/
    .qnaSubWrap { 
    cursor: pointer;
    color: #333333;
    text-decoration: none;
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
               <br />
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
                        <th>answer</th>
                        <th><input type="checkbox" id="delCheckAll" class="custom-control-input"></th>
                     </tr>
                  </thead> 
                  <tbody id="qnaTbody">
                  </tbody>
               </table>
               </div>
                  <div class="col-md-12 col-sm-12 col-xs-12 text-right">
                     <button id="insertBtn" class="btn btn-default">글작성</button>
                     <button id="deleteBtn" class="btn btn-default">삭제</button>
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
                  <h4>msg</h4>
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
   <div class="modal" id="pwConfirmModal" style="display:none; z-index: 1050;">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-body text-center" id="confirmMessage">
               <br /> 
               <p>이 글은 비밀글입니다.</p> 
               <p>비밀번호를 입력하여 주세요.</p>
            <br />
               <input type="text" id="pwQna" name="pwQna">
               </div>
               <br />
               <div class="modal-footer" style="text-align: center;">
                   <button type="button" class="btn btn-default" id="pwConfirmOk">확인</button>
                   <button type="button" class="btn btn-default" id="pwConfirmCancel">취소</button>
               </div>
           </div>
       </div> 
   </div>
   <input type="hidden" id="pageInfo" value="1"/>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer**************************************** -->
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
    //셀렉트박스의 값이 바뀔때마다 해당 값의 리스트를 불러옴 (ajax)
    $('#qnakind').on('change',function(){
    	qnaKind = $('#qnakind').val();
    	page=1;
    	itemPagingList(qnaKind,page);
    	itemPagingBtn(qnaKind,page);
    });
    
    //글쓰기버튼 클릭 이동
    $('#insertBtn').on('click',function(){
    	window.location.href='/qna/insert';
    });
       
   //글 삭제시 전체 선택&해제(관리자)
   $(document).on('click', "#delCheckAll", function(){
	   $('.deleteCheck').prop('checked',function(){
	        return !$(this).prop('checked');
	    });
   });
    
   //전체삭제&삭제 버튼 클릭(ajax)
	$('#deleteBtn').on('click',function(){
	    $("#confirmMessage h4").text("선택한 항목을 삭제하시겠습니까?");
	    $("#confirmOk").show();
	    //클릭한 글의 qnaNum 넘기기
	   	qnaKind = $('#qnakind').val();
		var takeNum = [];
	    var qnaAll=0;
	    $('.deleteCheck').each(function(index){
	    	if($("#del"+index+"").is(":checked") == true){
  				qnaAll = $("#qnaNum"+index+"").attr("value"); 
   				takeNum.push(qnaAll);	
	    	}
	    });
	   	//삭제할 글을 선택하지 않았으면 경고창이 뜸
	    if(takeNum.length==0){ 
	    	$("#confirmMessage h4").text("선택한 항목이 없습니다");
	    	var myModal = $("#confirmModal");
	        myModal.modal("show").css('top', '35%');
	        $("#confirmOk").hide();
	        $("#confirmCancel").click(function(){
			    myModal.modal("hide");
			});
	        return false;
	    }
        var myModal = $("#confirmModal");
        myModal.modal("show").css('top', '35%');    
		$("#confirmOk").click(function(){
			myModal.modal("hide");
			var deleteData = {
                    "deleteList":takeNum
              }
			$.ajax({
				type:"POST",
				url:"/qna/deleteQnaList",
				data : deleteData,   
				dataType:"JSON", 
				success : function(data) {                 
				//데이터 지워진 tr 삭제
				if(data==1){
					alert("삭제성공");
					$('.ajaxTr').remove();
					page=$("#pageInfo").val();
					itemPagingBtn(qnaKind,page);
			        itemPagingList(qnaKind,page);
				}else{
					alert("삭제실패");
				}
				//클릭되어있는 페이지를 다시클릭
				},error : function(xhr, status, error) {
				   console.log("에러발생");
				}
		    });		
		});
		$("#confirmCancel").click(function(){
		    myModal.modal("hide");
		});
   });  
   //페이지 버튼누르면 해당페이지의 리스트를 불러옴
    $(document).on('click', ".hidden_btn", function(){
        pageString  = $(this).children("input[type=text]").val();
        page = parseInt(pageString);
    	$("#pageInfo").val(page);
        qnaKind = $('#qnakind').val();
        itemPagingBtn(qnaKind,page);
        itemPagingList(qnaKind,page);
     });
     
     //페이징 버튼 
     function itemPagingBtn(qnaKind,page) {
        $('#qnaPageDiv').remove();
        var pageMaker = {};
        var idx=1;
		var selectList=""
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
				var startPage = pageMaker.startPage;
				var endPage  = pageMaker.endPage;
				$("#buttonDiv").append('<div id="qnaPageDiv" class="row col-md-offset-4 col-md-4 col-sm-offset-2 col-sm-8 col-xs-12 text-center"><ul id="qnaPaging" class="pagination"></ul></div>');
                if(pageMaker.prev==true){
                	$("#qnaPaging").append('<li><a style="cursor:pointer" class="hidden_btn" aria-label="Previous">&laquo;</a><input type="text" value="'+(pageMaker.startPage-1)+'" hidden /></li>');
                }
                for(;startPage<=endPage;startPage++){
                  selectList='<li>'
                  selectList+='<a class="hidden_btn" id="hidden_btn'+idx+'" style="cursor:pointer">'+idx+'<input type="text" value="'+idx+'" hidden /></a>'
                  selectList+='</li>';
                  $("#qnaPaging").append(selectList);
                  idx++;
                }    
                if(pageMaker.next && pageMaker.endPage >0 ){
                  $("#qnaPaging").append('<li><a style="cursor:pointer" class="hidden_btn" aria-label="Next">&raquo;</a><input type="text" value="'+(pageMaker.endPage+1)+'" hidden /></li>');
                }
                page=$("#pageInfo").val();
                $(".hidden_btn").css("color","#333333");
            	$("#hidden_btn"+page+"").css("color","darksalmon");
             },error : function(xhr, status, error) {
                console.log("에러발생");
             }
          });    
     }
     //qna리스트가져오기
     //페이징 처리
      function itemPagingList(qnaKind,page) {
         $('.ajaxTr').remove();
         var values = {};
         var pwArray = [];
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
				$.each(values,function(index,List){   
	                selectList = '<tr class="ajaxTr">'
	                selectList += '<td>'+List.rownum+'</td>'
	                selectList += '<td>'+List.qnaKind+'문의</td>'
	                selectList += '<td><a id="qnaSub_'+index+'" href="/qna/detail?no='+List.qnaNum+'" class="qnaSubWrap">'+List.qnaSub+'</a></td>'
	                selectList += '<td>'+List.m_userId+'</td>'
	                selectList += '<td>'+List.qnaDate+'</td>'
	                selectList += '<td id="answerStatus'+index+'">'+List.answerStatus+'</td>'
	                selectList += '<td><input type="checkbox" name="deleteCheck" id="del'+index+'" class="deleteCheck custom-control-input"></td>'
	                selectList += '<input type="hidden" name="qnaNum'+index+'" id="qnaNum'+index+'" class="qnaNumWrap" value="'+List.qnaNum+'"/>'
	                selectList += '</tr>';
	                $("#qnaTbody").append(selectList);
	                pwArray.push(List.qnaPw);
	               });
	               	afterQna(pwArray); 
              }, error : function(xhr, status, error) { 
                 console.log("에러발생");
              }
           });   
     }
     
     //ajax로 qna리스트 가지고 온다음 실행될 function
	function afterQna(pwArray) {
		//자물쇠 띄우기
		for(var idx=0; idx<pwArray.length;idx++) {
			if(pwArray[idx]!=null) { 
	  			$("#qnaSub_"+idx+"").append("<img style='width:15px;heigth:15px;' src='/resources/icon/save_lock.png'>");
  	       	}
		}
		//미답변 색 바꾸기
  		$('.qnaSubWrap').each(function(index){
   	 		var answerTxt = $("#answerStatus"+index+"").text();
  	       	if(answerTxt=="미답변") {
  	       		$("#answerStatus"+index+"").css("color","darksalmon");
  	       	}
  	  	}); 
    	//세션따라 글 접근성에 제한두기
       	var user_ctg="${user_ctg}";
       	if(user_ctg!=""){
  	     if(user_ctg==2) {								//user(must input password)
  	     		$(".qnaSubWrap").removeAttr("href");
  	     		$(".qnaSubWrap").on("click",function(){
  	     			//글제목 클릭했을 때 공개글 or 비밀글 접근
					var selectId = $(this).attr('id');
	       			var splitIdx = selectId.indexOf("_"); 
	       			var index = selectId.substring(splitIdx+1);		
		     	   	var realPw = pwArray[index];
		     	   	var getQnaNum = $("#qnaNum"+index+"").val();	//hidden에서 qnaNum 구하기
		     	   	 		
  	     	  	    if(realPw==null) {  	    	
  	     	  	       	window.location.href="/qna/detail?no="+ getQnaNum;
  	     	  	    }else {
		  	     		var myModal = $("#pwConfirmModal");
		  	  	        myModal.modal("show").css('top', '35%');
			  	  	    $("#pwQna").val(""); 
			  	  	    $("#pwConfirmOk").on("click",function(){
			  	  	    	var inputPw = $("#pwQna").val(); 
			  	  	        if(realPw==inputPw){
			  	  	        	window.location.href="/qna/detail?no="+ getQnaNum;	
			  	  	        }else {
			  	  	        	myModal.modal("hide");
			  	  	        	$("#confirmMessage h4").text("비밀번호를 다시 입력해주세요");
			  	  	    		var myModalAlert = $("#confirmModal");
			  	  	       	 	myModalAlert.modal("show").css('top', '35%');
			  	  	        	$("#confirmOk").hide();
			  	  	        	$("#confirmCancel").click(function(){
			  	  	        		myModalAlert.modal("hide");
			  	  				});
			  	  	        	return false;
			  	  	        }
			  	  		}); 
		  	  	        	$("#pwConfirmCancel").on("click",function(){
			  	  		    	myModal.modal("hide"); 
			  	  			}); 
  	     	  	      }
  	     	  	
  	     		});
  	     	}   		
       	}else {									//guest(can't connect to detail page)
       		$(".qnaSubWrap").attr("href","/login/");
       	} 
		//admin일 때만 보이는 것 (삭제,답변여부)
		var user_ctg = "${user_ctg}";
		if(user_ctg!=""){ 
			if(user_ctg == 0 ||user_ctg == 1) {						
				$('table thead tr th:nth-child(6)').show();
				$('table tbody tr td:nth-child(6)').show();								
				$('table thead tr th:nth-child(7)').show();
				$('table tbody tr td:nth-child(7)').show(); 
			}else{
				$('table thead tr th:nth-child(6)').hide();
				$('table tbody tr td:nth-child(6)').hide();								
				$('table thead tr th:nth-child(7)').hide();
				$('table tbody tr td:nth-child(7)').hide();
				$('#deleteBtn').hide();
			} 
		}else{
			$('table thead tr th:nth-child(6)').hide();
			$('table tbody tr td:nth-child(6)').hide();								
			$('table thead tr th:nth-child(7)').hide();
			$('table tbody tr td:nth-child(7)').hide();
			$('#deleteBtn').hide();
		}
	}
</script>
</html>