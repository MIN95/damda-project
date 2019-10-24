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
 	pre {
 	border: 0px;
 	background-color:#fff;
 	font-family: 'Noto Sans KR', sans-serif;
 	width: 100%;
 	white-space: pre-wrap; /* CSS3*/
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-all; /* Internet Explorer 5.5+ */ 
 	}
 	input,#contentQna {
 	border:0px;
 	width: 100%;
 	resize: none;
 	}
 	#qnaTab img {
 	width: 13px;
 	height: 15px;
 	} 
 	#qnaTab tbody textarea {
 	margin-top: 2%; 
 	margin-bottom: 2%;
 	}
 	#qnaTab .form-group {
 	width: 35%;
 	height: 5px;
 	margin-top: -7px;
 	}
 	#qnaTab  textarea {
 	border: none;
 	}
 	#qnaTab table th {
 	cursor:default;
 	}
 	#qnaTab #userfile {
 	cursor: default;
 	}
 	.radio {
 	margin: 0 auto;
 	}
 	#pgTransition img {
 	width: 12px; 
 	height: 8px;
 	}
 	#pgTransition a {
 	color: rgb(0,0,0);
 	}
 	#qnaNotice {
 	padding: 0;
 	margin-left: 20px;
 	}
 	#qnaNotice li{
 	font-size: 13px;
 	list-style: none;
 	}
 	#fileNameDiv {
 	width:100px; 
 	overflow:hidden; 
 	text-overflow:ellipsis; 
 	white-space:nowrap;
 	display: inline-block;
 	float: left;
 	}
 	th {
 	background-color: #eee;
 	}
 	#uploadBtn {
 	color:#fff;
 	position: absolute;
 	top:670px;
 	right: 20px;
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
			</div>
			<div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
				<br /><br />
				<form id="qnaForm" method="post" enctype="multipart/form-data" style="padding:0px;margin:0px;">
				<input type="hidden" id="qnaNum" name="qnaNum" value="${qnaVo.qnaNum}" />
				<input type="hidden" id="qnaStyle" name="qnaStyle" value="0" />
				<input type="hidden" id="answerNotice" name="answerNotice" value="0" />
				<table class="table text-left table-bordered">
				<thead>	
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3" style="text-align: center;">Subject</th>
						<th class="col-md-10 col-sm-10 col-xs-9">
							<input type="text" id="qnaSub" name="qnaSub" value="${qnaVo.qnaSub }" placeholder="제목을 입력해주세요" style="background-color: #eee">
						</th>
					</tr>
					<tr>
						<th style="text-align: center;">Writer</th>
						<th><input type="text" id="m_userId" value="${qnaVo.m_userId }" style="background-color: #eee;cursor:default" readonly="readonly"/></th>
					</tr>
					<tr>
						<th style="text-align: center;">Date</th>
						<th>2019-08-19</th>
					</tr>
					<tr>
						<th style="text-align: center;">Category</th>
						<th>
						<select id="qnaKind" class="selectPicker" name="qnaKind" style="background-color: #eee"> 
							<option value="">선택</option> 
							<option value="상품">상품문의</option> 
							<option value="배송">배송문의</option> 
							<option value="취소/변경">취소/변경문의</option> 
							<option value="교환/반품">교환/반품문의</option> 
							<option value="기타">기타문의</option> 
						</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" class="col-md-12 text-left">
						 <pre><textarea id="qnaCon" name="qnaCon" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;">${qnaVo.qnaCon }</textarea></pre>
						 <ul id="qnaNotice">
						 	<li>· 문의 내용을 구체적으로 작성해주세요. 정확하고 빠른 답변에 도움이 됩니다.</li>
 							<li>· 주민등록번호를 포함한 고객님의 소중한 개인정보는 사이트에 노출되지 않으나 꼭 필요한 경우가 아닌 경우 기재를 삼가해주시길 바랍니다.</li>
 							<li>· 파일은 최대 3개까지 첨부 가능합니다.</li>
						 </ul>
						</td> 
					</tr>
					<tr>
						<th style="text-align: center;">첨부파일</th>
						<th id="fileAdd" >
							<c:forEach items="${FileList}" var="FileList" varStatus="status">
								<div id="divWrap"> 
									<span class="attachedFile">
									<img alt="attached" style='width:15px;heigth:15px;' src="/resources/icon/attach-clip.png">
									${FileList.originalName }
									<span class="fileDelBtn" style="cursor:pointer;">x</span>
									</span>
								</div>
								<input type="hidden" id="fileStatus${status.index }" class="fileStatus" name="fileStatus" value="0"/>
								<input type="hidden" id="filePath${status.index }" class="filePath" name="filePath" value="${FileList.photoPath }"/>
							</c:forEach>
							<button type="button" id="uploadBtn" class="glyphicon fa fa-upload btn" ></button>
						</th>
					</tr>
					<tr>
						<th style="text-align: center;">
							공개여부
						</th>
						<th>
							<div class="radio">
							  <label for="conceal" style="padding: 0px">
							    <input type="radio" name="qnaStyleF" id="conceal" style="width: 20px;margin-left: 37px" value="0" checked>
							    비밀글
							  </label> 
							  &nbsp;&nbsp;&nbsp;&nbsp;
							  <label for="reveal" style="padding: 0px">
							    <input type="radio" name="qnaStyleF" id="reveal" style="width: 20px;margin-left: 37px"  value="1" >
							    공개글
							  </label>
							</div>
						</th>
					</tr>
					<tr>
						<th style="text-align: center;">비밀번호</th>
						<th><input type="text" id="qnaPw" name="qnaPw" value="${qnaVo.qnaPw}"  style="background-color: #eee"></th>
					</tr>
					<tr>
						<th style="text-align: center;">답변알림</th>
						<th><label for="answerNoticeF">이메일로 알람받기</label><input type="checkbox" id="answerNoticeF" value="0" style="width: 15px;margin-left: 5px;"></th>
					</tr>
				</tbody>
			</table>
			</form>
			</div>
			<!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
			<div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<button type="button" id="insertBtn" class="btn btn-default">등록</button>
				<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
			</div>
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
               <div class="modal-footer" style="text-align:center">
                   <button type="button" class="btn btn-default" id="confirmOk">확인</button>
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
		//수정시 오늘날짜로 바꾸기
		var today = getToday();
		$("#currentDate").text(today);
		var qnaStyle = "${qnaVo.qnaStyle}"
		if(qnaStyle==1){
			$("input:radio[name='qnaStyleF']:radio[value='1']").prop("checked", true);
		}
		var answerNotice = "${qnaVo.answerNotice}"
		if(answerNotice==1) {
			$("#answerNoticeF").click();
		}
		var selectVal = "${qnaVo.qnaKind}"
	 	$("#qnaKind").val(selectVal);
		//qna공개여부선택(히든안에 담긴 값 바꿔주기)
	    if($('input:radio[id="conceal"]').is(":checked")){
	    	$('#qnaStyle').val('0');
	    }
	    if($('input:radio[id="reveal"]').is(":checked")){
	    	$('#qnaStyle').val('1');
	    }
	    //체크박스 선택할 때마다 히든안에 담긴 값 바꿔주기
    	if($('input:checkbox[id=answerNoticeF]').is(':checked')==true){
    		$('#answerNotice').val('1');    		
    	}else{
    		$('#answerNotice').val('0');   
    	} 
		
    	if($('input:radio[id=reveal]').is(':checked')==true) {
	    	$("#qnaPw").attr('disabled', true);
	    	$("#qnaPw").attr('placeholder','');
	    	$("#qnaPw").val('');
	    	$('.lengthLimit').remove();
	    }
	    if($('input:radio[id=conceal]').is(':checked')==true) {
	    	$("#qnaPw").removeAttr('disabled');
	    	$("#qnaPw").attr('placeholder','비밀번호를 입력해주세요');
	    	
	    }
	});////////////////////////////////////////////////////////////////////////////document ready end
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            }else{    
            	
          }
    }
  	//오늘 날짜 구하기
    function getToday() { 
    	var today = new Date();
    	return today.getFullYear() + "-" + ("0"+(today.getMonth()+1)).slice(-2) + "-" + ("0"+today.getDate()).slice(-2);
    }
    //목록으로가는 버튼
 	$('#cancelBtn').on('click',function(){
 		window.location.replace('/qna/'); 
 	});
 	
    //업로드 버튼을 누르면 파일인풋이 추가됨()
 	var idx=0;
 	var limit=0;
    $("#uploadBtn").on('click',function(){
    	limit = $('.fileDelBtn').length;    		
		if($("#fileInput"+idx).val()==""){ 
		   $("#fileInput"+idx).remove();
		}
       if(limit<3){
         $('#fileAdd').append('<input id="fileInput'+idx+'" class="fileCnt" type="file" name="qnaFile'+idx+'" style="display:none" />');          
          $("#fileInput"+idx).trigger("click");
          }
          $("#fileInput"+idx).on('change', function() {
            if(this.files && this.files[0]) {
               var file = this.files[0];
               fileName = file.name;
               var filename = $("#fileInput"+idx).val();  // 파일명만 추출
               $("#fileAdd").append('<span style="display:block"><img alt="attached" style="width:15px;heigth:15px;" src="/resources/icon/attach-clip.png">'+fileName+'<span class="fileDelBtn" style="cursor:pointer;"> x</span></span>');
               idx++;  
            }
        });    
    });
    
    //폼유효성 체크(문의유형선택,비밀번호체크,제목,내용)
    var myModal = $("#confirmModal");
    $("#insertBtn").on('click',function(){
	    	if($('#qnaKind').val()==""){
	    		$('#confirmMessage h4').text("문의유형을 선택해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
	    	if($('#qnaSub').val()==""){
	    		$('#confirmMessage h4').text("제목을 입력해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
	    	if($('#qnaCon').val()==""){
	    		$('#confirmMessage h4').text("내용을 입력해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
		    if($('input:radio[id=conceal]').is(':checked')==true) {
		    	if($("#qnaPw").val()==""){
		    		$('#confirmMessage h4').text("비밀번호를 입력해주세요");
		    		myModal.modal("show").css('top', '35%');
		    		return;
		    	}
		    }    	
	    	$("#qnaForm").submit();
    });
    //모달닫기
    $("#confirmOk").click(function(){
    	myModal.modal("hide");
    });
    $('#qnaPw').on({
        'keydown' : function() {
             $(this).parent().children(".lengthLimit").remove();             
             if($(this).val().length > 12 ||$(this).val().length <4) {
            	 $(this).parent().append('<span class="lengthLimit" style="color:red">비밀번호는 4자이상 12자이내로 작성해주세요</span>');
             }else{
            	 $(this).parent().children(".lengthLimit").remove(); 
             }
        },
        'click' : function() {
           $(this).parent().children(".lengthLimit").remove();
           if($(this).val().length > 12 ||$(this).val().length <4) {
          	 $(this).parent().append('<span class="lengthLimit" style="color:red">비밀번호는 4자이상 12자이내로 작성해주세요</span>');
           }else{
          	 $(this).parent().children(".lengthLimit").remove(); 
           }
        }
     });
    
    //qna공개여부선택
    $('#conceal').on('click',function(){
    	$('#qnaStyle').val('0');
    });
    $('#reveal').on('click',function(){
    	$('#qnaStyle').val('1');
    });
    $('#answerNoticeF').on('click',function(){
    	if($('input:checkbox[id=answerNoticeF]').is(':checked')==true){
    		$('#answerNotice').val('1');    		
    	}else{
    		$('#answerNotice').val('0');  
    	}
    });
    
    $('input:radio[name=qnaStyleF]').on('click',function(){
	    if($('input:radio[id=reveal]').is(':checked')==true) {
	    	$("#qnaPw").attr('disabled', true);
	    	$("#qnaPw").attr('placeholder','');
	    	$("#qnaPw").val('');
	    	$('.lengthLimit').remove();
	    }
	    if($('input:radio[id=conceal]').is(':checked')==true) {
	    	$("#qnaPw").removeAttr('disabled');
	    	$("#qnaPw").attr('placeholder','비밀번호를 입력해주세요');
	    	
	    }
    });
  //첨부파일 삭제
    $(document).on('click', '.fileDelBtn', function(){
    	var index = $(".fileDelBtn").index(this);
    	$(this).parents('#divWrap').remove();
    	$(".fileCnt:eq(" + index + ")").remove();
     	$('.fileStatus').eq(index).val('1');  	
    });
    
    $('input:radio[name=qnaStyleF]').on('click',function(){
	    if($('input:radio[id=reveal]').is(':checked')==true) {
	    	$("#qnaPw").attr('disabled', true);
	    	$("#qnaPw").attr('placeholder','');
	    	$("#qnaPw").val('');
	    	$('.lengthLimit').remove();
	    }
	    if($('input:radio[id=conceal]').is(':checked')==true) {
	    	$("#qnaPw").removeAttr('disabled');
	    	$("#qnaPw").attr('placeholder','비밀번호를 입력해주세요');
	    	
	    }
    });
    //폼유효성 체크(문의유형선택,비밀번호체크,제목,내용)
    var myModal = $("#confirmModal");
    $("#insertBtn").on('click',function(){
	    	if($('#qnaKind').val()==""){
	    		$('#confirmMessage h4').text("문의유형을 선택해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
	    	if($('#qnaSub').val()==""){
	    		$('#confirmMessage h4').text("제목을 입력해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
	    	if($('#qnaCon').val()==""){
	    		$('#confirmMessage h4').text("내용을 입력해주세요");
	    		myModal.modal("show").css('top', '35%');
	    		return;	
	    	}
	    	var pwlength = $("#qnaPw").val().length;
		    if($('input:radio[id=conceal]').is(':checked')==true) {
		    	if($("#qnaPw").val()==""){
		    		$('#confirmMessage h4').text("비밀번호를 입력해주세요");
		    		myModal.modal("show").css('top', '35%'); 
		    		return;
		    	}else if(pwlength > 12 || pwlength < 4) {
		    		$('#confirmMessage h4').text("비밀번호를 다시 작성해주세요");
		    		myModal.modal("show").css('top', '35%');
		    		return;
		    	}
		    }    	
	    	$('#qnaForm').submit();
    });
    
    //모달닫기
    $("#confirmOk").click(function(){
    	myModal.modal("hide");
    });
 </script>
</html>