<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
    font-family: 'Noto Sans KR', sans-serif;
    background-color: whitesmoke;
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
    .qnaSubWrap { 
    cursor: pointer;
    color: #333333;
    text-decoration: none;
    }
    </style>
</head>
<body>
   <!-- ***********************************content start*********************************** -->
   <div class="container-fluid text-center">
       <div class="row">
          <div class="col-md-offset-1 col-md-10">
            <div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
               <br />
               <table class="table text-center">
                  <thead>
                     <tr>
                        <th>No</th>
                        <th>Category</th>
                        <th>Subject</th>
                        <th>Writer</th>
                        <th>answer</th>
                        <th>Date</th>
                     </tr>
                  </thead> 
                  <tbody id="qnaTbody">
                  <tr id="qnaNone" style="display: none">
                  	<td colspan="6">
	            		<p style="margin-top: 30px">문의내역이 존재하지 않습니다</p>
                  	</td>
            	  </tr>
                  </tbody>
               </table>
               </div>
            	<div id="buttonDiv" class="col-md-12 col-sm-12 col-xs-12"> 			
            </div>
         </div>
      </div>
   </div>
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
</body>
  <script type="text/javascript">
 	 $(document).ready(function(){
     resized2();                  
  	//페이징버튼 가져오기
  	var m_userNum =  <%=request.getParameter("m_userNum")%>;
    var qnaKind = "마이페이지";
  	var page=1;    
     itemPagingBtn(m_userNum,page);
     itemPagingList(m_userNum,page);
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
    //페이지 버튼누르면 해당페이지의 리스트를 불러옴
    $(document).on('click', ".hidden_btn", function(){
    	m_userNum =  <%=request.getParameter("m_userNum")%>;
        pageString  = $(this).children("input[type=text]").val();
        page = parseInt(pageString);
        $("#pageInfo").val(page);
        itemPagingBtn(m_userNum,page);
        itemPagingList(m_userNum,page);
     });
     
     //페이징 버튼 
     function itemPagingBtn(m_userNum,page) {
        $('#qnaPageDiv').remove();
        var pageMaker = {};
        var idx=1;
        var sendData = {
           "qnaKind" : "마이페이지",
           "m_userNum" : m_userNum,
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
	                  selectList+='<a class="hidden_btn" id="hidden_btn'+idx+'" style="cursor:pointer">'+idx+'<input type="text" value="'+idx+'" hidden /></a>'
	                  selectList+='</li>';
	                  $("#qnaPaging").append(selectList);
	                  idx++;
	               }    
	               if(pageMaker.next && pageMaker.endPage >0 ){
	                  $("#qnaPaging").append('<li><a style="cursor:pointer" class="hidden_btn" aria-label="Next">&raquo;</a><input type="text" value="'+(pageMaker.endPage+1)+'" hidden /></li>');
	               }
	               page=$("#pageInfo").val();
	                $(".hidden_btn").css("color","black");
	            	$("#hidden_btn"+page+"").css("color","darksalmon");
             },
              error : function(xhr, status, error) {
                console.log("에러발생");
             }
          });    
     }
     //qna리스트가져오기
     //페이징 처리
      function itemPagingList(m_userNum,page) {
         $('.ajaxTr').remove();
         var pwArray = [];
         var values = {};
         var sendData = {
            "qnaKind" : "마이페이지",
            "m_userNum" : m_userNum,
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
	                selectList += '<td>'+List.qnaKind+'문의</td>'
	                selectList += '<td><a id="qnaSub_'+index+'" class="qnaSubWrap" style="cursor:pointer;">'+List.qnaSub+'</a></td>'
	                selectList += '<td>'+List.m_userId+'</td>'
	                selectList += '<td id="answerStatus'+index+'">'+List.answerStatus+'</td>'
// 	                selectList += '<input type="hidden" name="qnapw'+(index+1)+'" id="qnapw'+(index+1)+'" class="qnapwWrap" value="'+List.qnaPw+'"/>'
	                selectList += '<td>'+List.qnaDate+'</td>'
	                selectList += '<input type="hidden" name="qnaNum'+index+'" id="qnaNum'+index+'" class="qnaNumWrap" value="'+List.qnaNum+'"/>'
	                selectList += '</tr>'; 
	                $("#qnaTbody").append(selectList);
	                pwArray.push(List.qnaPw);
	               });
					afterQna(pwArray);
              },
               error : function(xhr, status, error) { 
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
      	//비밀글 or 공개글 보기
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
  	        	myModal.modal("show").css('top', '25%');
	  	    	$("#pwQna").val(""); 
	  	    	$("#pwConfirmOk").on("click",function(){
		  	    	var inputPw = $("#pwQna").val(); 
		  	        if(realPw==inputPw){
		  	        	window.location.href="/qna/detail?no="+ getQnaNum;	
		  	        }else {
		  	        	myModal.modal("hide");
		  	        	$("#confirmMessage h4").text("비밀번호를 다시 입력해주세요");
		  	    		var myModalAlert = $("#confirmModal");
		  	       	 	myModalAlert.modal("show").css('top', '25%');
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
			if($(".ajaxTr").text()==""){
				$("#qnaNone").show();
			}else {
				$("#qnaNone").hide();
			}
        	
     	}
</script>
</html>