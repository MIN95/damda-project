<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 관리자만 접근가능한 페이지 공지사항 등록 & 수정 페이지 -->
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
<style type="text/css">
    input,#contentNotice {
    border:0px;
    width: 100%;
    resize: none;
    }
    .btn-file {
    position: relative;
    overflow: hidden;
    margin-left:25px;
   }
   .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
   } 
   #thumbnail2 {
   	text-overflow: ellipsis;
   	white-space: nowrap; 
   }
   .realDetailShow {
   	text-overflow: ellipsis;
	white-space: nowrap; 
    overflow: hidden;
    width: 50%;	
   }
   #registerTab .picSize img{
   	width: 100%;
   	height: 40%;
   	cursor: pointer;
   }
   #registerTab select {
   width:100%;
   } 

   #registerTab th {
   text-align:center;
   }
   #registerTab #itemCon {
   width: 100%;
   border: none;
   }
   .select button { 
   display: inline-block; 
   padding: .4em .8em; 
   color: darksalmon; 
   font-size: inherit; 
   line-height: normal; 
   vertical-align: middle; 
   background-color: #fdfdfd; 
   cursor: pointer; 
   border: 1px solid #ebebeb; 
   border-bottom-color: #e2e2e2; 
   border-radius: .25em; 
   }
   .picSize {
   margin: 0 auto;
   text-align: center;
   }
   .deletePic {
   width:20px;
   heigth:20px;
   background-color:#eee;
   display:inline-block; 
   cursor: pointer;
   position:relative;
   float: right;
   right: 18%;
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
            <h3>상품등록</h3>
                <br />
             </div>
         <form id ="thumbnailForm" method="post" enctype="multipart/form-data"style="padding:0px;margin:0px;">
         <div id="registerTab" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered table-sm" >
            <thead> 
               <tr>
                  <td rowspan="5">
                     <div class="picSize" class="form-group" style="width:200px">                                                   
                                 <img alt="thumbnail" id="realThumb" style="max-width: 100%" src="/resources/imgs/${List.photoCtg }/${List.photoName }" border='0' onclick='document.all.thumbnail.click()'>
                                <input type="file" id="thumbnail" name="thumbnail" style="display: none"> 
                                 <input type="text" id="thumbnail2" name="thumbnail2" readonly="readonly"> 
                                 <input type="hidden" id="photoNames" name="photoNameList" value="${List.photoName }">
                                 <input type="hidden" name="photoPathList" value="${List.photoPath }">
                                 <input type="hidden" id="photoStatus0" name="photoStatusList" value="nothing"> 
                     </div>
                        </td>                 
                        <th>상품카테고리</th>
                        <td colspan="2">    
                           <select name="photoCtg" id="photoCtg" > 
                           <option value="salad">샐러드</option> 
                           <option value="dessert">간식</option> 
                           <option value="beverage">음료</option> 
                        </select>
                  </td> 
                     <tr> 
                       <th>상품명</th>
                        <td colspan="2">
                            <input type="text" id="itemName" name="itemName" value="${List.itemName }">
                        </td>
                     </tr>
                     <tr>
                        <th>요약설명</th>
                        <td colspan="2">
                           <input type="text" id="itemCon" name="itemCon" value="${List.itemCon }">
                        </td>
                     </tr>
                     <tr>
                       <th>판매가</th>
                       <td colspan="2">
                            <input type="text" id="itemPrice" name="itemPrice" value="${List.itemPrice }">
                        </td>
                     </tr>
                  <tr>
                  <th>재고</th>
                  <td colspan="2">
                     <input type="text" id="itemStock" name="itemStock" value="${List.itemStock}">
                  </td>
                  </tr>        
            </thead>
            <tbody>
            <tr>
               <td colspan="3" style="padding:0px">
                 <div id="picSize2Wrap"style="height:100%" >
                     <div id="showPic" style="height:500px"></div>
						<c:forEach items="${imgList}" var="imgList" varStatus="status">
                      		<img id="realDetail_${status.count}" class="realDetails .img-fluid" style="width:100%;height:auto;margin:0 auto" src="/resources/imgs/${imgList.photoCtg }/${imgList.photoName }"/>
					  		<input type="hidden" id="photoNames" name="photoNameList" value="${imgList.photoName }">
					  		<input type="hidden" name="photoPathList" value="${imgList.photoPath }">
					  		<input type="hidden" id="photoStatus${status.count}" name="photoStatusList" value="nothing">
                   		</c:forEach>
                    </div>
                    <input type="hidden" id="itemNum" name="itemNum" value="">
                    <input type="hidden" id="existPhotoLength" name="existPhotoLength" value="">
               </td>            
            </tr>
            <tr>
               <th colspan="3" class="text-center">
                  <div id="uploadWrap" style="margin:0 auto">
                     <div id="defaultFile" class="form-group select" >     
               			<div style="margin-right:20px;display:inline-block"><h4><span>첨부파일추가</span></h4></div> 
                     	<button type="button" id="photoAddBtn_0" style="display:inline-block;color:#eee;background-color:darksalmon">+</button>         
                     </div>
                     	<c:forEach items="${imgList}" var="imgList" varStatus="status">
                     		<div id="realDetailName_${status.count }" >
                     			<p  id="realDetailName_${status.count }"class="realDetailShow form-group" style="display:inline-block;padding:0px">${imgList.photoName }</p>
                     			<span class="deletePic" id="deletePic_${status.count }" >x</span>
                     		</div>
                   		</c:forEach>
                  	</div> 
              	  </th> 
           	 	</tr>  
            </tbody>
         </table>
         </div>
         
         <!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
         <div class="col-md-12 col-sm-12 col-xs-12 text-right">
            <button type="button" id="okBtn" class="btn btn-default">등록</button>
            <button type="button" id="cancelBtn" class="btn btn-default">취소</button>
            <br /><br /><br />
         </div>
         </form>
         <!--------------------------------------------------------------------------------------------------------------------->
      </div> 
   </div> 
   </div>
      <!-- Modal confirm -->
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
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
    $(document).ready(function(){
      resized2();
      //no 구하기
      var urlParam =  getParameters('no');
      $("#itemNum").val(urlParam);
      var imgCheck = $('.realDetails').length;
      $("#existPhotoLength").val(imgCheck);
      //썸네일(없으면 기본이미지) 
      var thumb = '${List}';
      var thumbVal = '${List.photoName}';
      if(thumb==null || $('#thumbnail2').val()==null) { 
         $('#realThumb').attr("src","/resources/imgs/picupload.jpg");  
      }    
      //디테일 이미지
      var imgListSize = "${imgList.size()}";
      var imgList = "${imgList}";
      var thumbName = "${List.originalName}";
      if(imgList!=null) {
         $('#showPic').css('display','none'); 
         $('#thumbnail2').val(thumbName);
         $('.detailAppend').remove();
      }
      var selectVal = "${List.photoCtg}";
      $("#photoCtg").val(selectVal);  
    });//(document).ready end/////////////////////////////////////////////////////////
    
    $(window).resize(function() {
        resized2();
    });
    //창크기 줄였을 때 attribute 크기 조절********************************************
    function resized2() {
        var windowWidth = $(window).width();
        if(windowWidth < 670) {
          $('#picSize').css('width','150px');         
        }else{    
           $('#picSize').css('width','200px'); 
        }
    }
     //resized2() end********************************************************************
	function getParameters(paramName) {
    // 리턴값을 위한 변수 선언
	    var returnValue;
	    // 현재 URL 가져오기
	    var url = location.href;
	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
	    }
	}
       
    //디테일이미지 삭제
	$('.deletePic').on('click', function(){
		var selectId = $(this).attr('id');
        var idx = selectId.indexOf("_");  
        var cnt = selectId.substring(idx+1);
        var lastBtn = $('.deletePic:first').attr('id');
        $("#photoStatus"+cnt).val("remove");
	    if(selectId==lastBtn) {
	    	$('#showPic').css('display','block');
	    }
        $('#realDetailName_'+cnt).remove();
        $('#realDetail_'+cnt).remove();
    });
      //파일첨부박스 클릭한거 삭제
    
      var fileCount = 0;
      var uploadOrder = 1;
    $("#uploadWrap button:first").on('click', function(){
        //파일업로드 개수제한 append된게 4번째면 추가불가
       fileCount = $("#uploadWrap div:last").index();
       if(fileCount<5){    
           //상세-파일업로드 박스 추가      
           var source = '<div id="appendDiv" class="form-group select" style="padding:0px">'
               source += '<input class="fileInput" name="photoOrder_'+uploadOrder+'" type="file" style="width:51%;display:inline-block">';
               source += '<button type="button" class="delBtn" id="photoDeleteBtn_'+uploadOrder+'" style="display:inline-block">x</button>';
               source += '</div>';
           $('#uploadWrap').append(source);
          //상세-썸네일 띄울곳 append 
          var source2 = '<img id="photoAddAppend_'+uploadOrder+'" class="detailAppend form-group" alt="detail" src="" style="display:none;width:100%;padding:0px">';
          $('#picSize2Wrap').append(source2);
          uploadOrder++;
       } 
     $("#uploadWrap .delBtn").on('click', function(){
        var selectId = $(this).attr('id');
        var idx = selectId.indexOf("_"); 
        var uploadOrder = selectId.substring(idx+1);
        $("#photoDeleteBtn_"+uploadOrder).closest("#appendDiv").remove();
        $("#photoAddAppend_"+uploadOrder).remove();
      });    
	     $('.fileInput').on('change',function(){
	       	var selectName = $(this).attr('name');
	       	var idx = selectName.indexOf("_");  
	       	var uploadOrder = selectName.substring(idx+1);
	       	if(this.files && this.files[0]) {
	         $("#photoAddAppend_"+uploadOrder).css('display','inline-block');
	           var reader = new FileReader;
	           reader.onload = function(data) {
	             	$("#photoAddAppend_"+uploadOrder).attr("src", data.target.result);        
	           } 
	              	reader.readAsDataURL(this.files[0]);
	           }
			var imgCheck = $('.delBtn').length;
	       	if(imgCheck!=0) {
	            $('#showPic').css('display','none');
	         }
	   });
    });
    
     
     
   $("#thumbnail").on('change', function() {
      var filename = $('#thumbnail').val().split('/').pop().split('\\').pop();  // 파일명만 추출
      // 썸네일 추출한 파일명 삽입(값이 있어야 src에 업로드한 파일이 삽입됨)
      $('#thumbnail2').val(filename);
      if(this.files && this.files[0]) {
         var reader = new FileReader;
         reader.onload = function(data) {
        	$("#photoStatus0").val("change");
            $(".picSize img").attr("src", data.target.result);  
         }
      }else{
        	$("#photoStatus0").val("remove");
            $(".picSize img").attr("src", "/resources/imgs/picupload.jpg");
      } 
        reader.readAsDataURL(this.files[0]);
   });
     //폼 유효성체크(가격,재고 숫자만 기입가능)
      $('#itemPrice,#itemStock').on({
         'keydown' : function() {
              var inputCon = $(this).val();
              $(this).parent().children(".onlyNumber").remove();
              if(isNaN(inputCon)== true && inputCon!=""){
                 $(this).parent().append('<span class="onlyNumber" style="color:red">숫자만 입력이 가능합니다</span>'); 
              }else{
                 $(this).parent().children(".onlyNumber").remove();
              }      
         },
         'click' : function() {
            var inputCon = $(this).val();
            $(this).parent().children(".onlyNumber").remove();
            if(isNaN(inputCon)== true && inputCon!=""){
               $(this).parent().append('<span class="onlyNumber" style="color:red">숫자만 입력이 가능합니다</span>'); 
            }else{
               $(this).parent().children(".onlyNumber").remove();
            }   
         }
      });

   //등록하시겠습니까 alert창 (모달)
   var myModal = $("#confirmModal");
   $("#okBtn").on('click', function(e) { 
      $("#confirmOk").css('visibility','visible');
      $("#confirmCancel").text("취소");
      e.preventDefault();
      $('#confirmMessage h4').text("상품을 수정하시겠습니까?");
      myModal.modal("show").css('top', '35%');
      $("#confirmOk").click(function(){
      //폼 유효성 검사
         var itemName = $('#itemName').val();
         var itemPrice = $('#itemPrice').val();
         var itemStock = $('#itemStock').val();
         if(itemName == ''|| itemPrice=='' || itemStock=='') {
            $('#confirmMessage h4').text("내용을 입력하세요");
            myModal.modal("show").css('top', '35%');
            $("#confirmOk").css('visibility','hidden');
            $("#confirmCancel").text("확인");
            return ;
         }else{
	         var thumbnailConfirm = $('#thumbnail');
	         var detailConfirm = $('.fileInput');
	         if(thumbnailConfirm.val()==""){
	        	 thumbnailConfirm.remove();
	         }else if(detailConfirm.val()=="") {
	        	 detailConfirm.remove();
	         }
            $("#thumbnailForm").submit();
         }
      });
   });
   
    $("#confirmCancel").click(function(){
      myModal.modal("hide");
    });
    
   //폼 유효성 검사
   function confirmForm() {
      var itemName = $('#itemName').val();
      var itemPrice = $('#itemPrice').val();
      var itemStock = $('#itemStock').val();
      if(itemName == ''|| itemPrice=='' || itemStock==''){
         $('#confirmMessage h4').text("내용을 입력하세요");
         myModal.modal("show").css('top', '35%');
      }
   } 
 </script>
</html>