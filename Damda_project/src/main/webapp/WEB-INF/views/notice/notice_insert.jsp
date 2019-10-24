<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
 	#pgnameWrap {
	 	border:thin solid rgb(200,200,200);
	 	height: 45px;
	 	width:125px;
	 	margin: 0 auto;
 	}
 	#pgnameWrap h3 {
	 	margin: 0px;
	 	padding: 7px;
 	}
 	#noticeTab img {
	 	width: 13px;
	 	height: 15px;
 	}
 	#noticeTab tbody textarea {
	 	margin-top: 2%; 
	 	margin-bottom: 2%;
 	}
 	#noticeTab .form-group {
	 	width: 35%;
	 	height: 5px;
	 	margin-top: -7px;
	 	display: inline-block;
	 	float: left;
 	}
 	#noticeTab .delFiles{
 		float: left;
 		line-height: 20px;
 		width:3%;
 	}
 	#noticeTab #userfile {
 		cursor: default;
 	}
 	#previewImg{
 		margin:10px auto 40px auto;
 		width:90%;
 		height:300px;
 	}
 	#previewImg>img{
 		width:100%;
 		height:100%;
 	}
 	/*placeholder color change*/
 	.placeholderColor::-webkit-input-placeholder {
 		color:darksalmon;
 	}
 	#placeholderColor>textarea::-webkit-input-placeholder {
 		color:darksalmon;
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
			<div id="pgnameWrap">
			  <h3>공지사항</h3>
			</div>
			<br />
		  </div>
		  <div id="noticeTab" class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<form action="/notice/insert" method="POST" id="serarchForm" name="serarchForm" enctype="multipart/form-data">
			  <table class="table text-left table-bordered">
				<thead>
				  <tr id="updatebbsseq">
					<th class="col-md-2 col-sm-2 col-xs-3">번호</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <input type="text" id="bbsseq" name="bbsseq" value="${noticeUpdate.bbsseq }"/>
					</th>
				  </tr>	
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">제목</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <input class="insertUrl" type="text" id="bbssub" name="bbssub" placeholder="제목을 입력해주세요" maxlength="40"/>
					  <input class="updateUrl" type="text" id="bbssub" name="bbssub" placeholder="제목을 입력해주세요" maxlength="40" value="${noticeUpdate.bbssub }"/>
					</th>
				  </tr>
				  <tr>
					<th>작성자</th>
					<th>
						<input class="insertUrl" type="text" id="bbswriter" name="bbswriter" value="<%=session.getAttribute("username")%>" readonly="readonly"/>
						<input class="updateUrl" type="text" id="bbswriter" name="bbswriter" value="${noticeUpdate.bbswriter }" readonly="readonly"/>
					</th>
				  </tr>
				  <tr>
					<th>작성일</th>
					<th>
						<%
						//현재날짜 계산
						Date today=new Date(); 
						SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
						%>
						<input type="text" id=bbsdate" name="bbsdate" value="<%=date.format(today) %>" readonly="readonly"/>
					</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td colspan="2" class="col-md-12 text-left" id="bbscontd">
					 <div id="previewImg"><img /></div>
					 <textarea class="insertUrl" id="contentNotice" name="bbscon" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;" placeholder="내용을 입력해 주세요" maxlength="1999"></textarea>
					 <textarea class="updateUrl" id="contentNotice" name="bbscon" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;" placeholder="내용을 입력해 주세요" >${noticeUpdate.bbscon} </textarea>
					</td>
				  </tr>
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">이미지</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <div class="form-group">
						<input id="fileImgInput" name="fileImgInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);" accept=".jpg,.png">
					    <div class="bootstrap-filestyle input-group">
						  <input type="text" id="userfile" class="form-control" name="userfile" disabled="disabled">
						  <span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileImgInput" class="btn btn-default ">
							  <span class="glyphicon fa fa-upload"></span>
							</label>
						  </span>
						</div>
					  </div>
					  <button type="button" id="photoclose" class="close delFiles" aria-label="Close" onclick="closebutton('photofile')">
  						<span aria-hidden="true">&times;</span>
					  </button>
					</th>
				  </tr>
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">글</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <div class="form-group">
						<input id="fileWriteInput" name="fileWriteInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					    <div class="bootstrap-filestyle input-group">
						  <input type="text" id="userwritefile" class="form-control" name="userwriterfile" disabled="disabled">
						  <span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileWriteInput" class="btn btn-default ">
							  <span class="glyphicon fa fa-upload"></span>
							</label>
						  </span>
						</div>
					  </div>
					  <button type="button" id="writeclose" class="close delFiles" aria-label="Close" onclick="closebutton('writefile')">
  						<span aria-hidden="true">&times;</span>
					  </button>
					</th>
				  </tr>
				  <tr id="clonenamefile">
				  	<td>
				  	  <input type="text" id="cloneuserfile" name="cloneuserfile"/>
				  	</td>
				  	<td>
				  	  <input type="text" id="cloneuserwritefile" name="cloneuserwritefile"/>
				  	</td>
				  </tr>
				</tbody>
			  </table>
   		    </div>
   		  	<!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
		  	  <div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<button type="button" id="okBtn" onclick="confirmOK()" class="btn btn-default">등록</button>
				<button type="reset" id="cancleBtn" class="btn btn-default">취소</button>
		  	  </div>
		  	<!--------------------------------------------------------------------------------------------------------------------->
		  </form>
		</div>
	  </div>
	</div>
	<br/><br/><br/>
	<!-- Modal confirm -->
	<div class="modal" id="rightfile" style="display: none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body" id="confirmMessage">
	            	<h4>그림 첨부만 가능합니다.</h4>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" id="confirmCancel">확인</button>
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
 		//이미지 넣을 공간 안보이게 미리 설정
 		$('#previewImg').css('display','none');
 		//파일첨부 close 안보이게 미리 설정
 		$('.delFiles').css('display','none')
 		//clone값들 안보이게
 		$('#clonenamefile').css('display','none');
 		//location에 따른 변화
	 	var url = window.location.pathname;
	 	var location = url.substring(url.lastIndexOf("/")+1);
	 	if(location=='notice.insert'){
 			$( 'input' ).removeAttr( 'value' );	
 			$('#contentNotice').val('');
	 	}else if(location=='notice.update'){
	 		$( 'input' ).removeAttr( 'placeholder' );
	 	}

	 	//취소 클릭시 전 페이지로 이동
	 	$('#cancleBtn').click(function(){
	 		history.back();
	 	});
	 	/*********************************************************************/
	 	
	 	/*********************************************************************/
	 	//이미지 첨부파일 이름 추출
	 	$("#fileImgInput").on('change', function(){  // 값이 변경되면
	 		//이미지 첨부파일 이름 추출
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}

			//이미지 첨부파일에 jpg,png아닐경우
			var ispng = filename.substring(filename.lastIndexOf('.'));
			if(ispng == ".jpg" || ispng == ".png"){
				// 추출한 파일명 삽입
				$("#userfile").val(filename);
				//사진 지울 수 있게 X표시
				$('#photoclose').css('display','');
				//이미지 value clone
				$("#cloneuserfile").val(filename);
			}else {
				if(window.FileReader){
					//oter browser
					$('#fileImgInput').val('');
				}else {
					//ie일때
					$('#fileImgInput').replaceWith($("#fileImgInput").clone(true));
				}
				//모달띄우기
				var myModal = $('#rightfile');
				myModal.modal("show").css('top', '35%');

				$("#confirmCancel").click(function(){
		 	  		myModal.modal("hide");
		 	    });
			}
		});
		
	 	//글 첨부파일 이름 추출
	 	$("#fileWriteInput").on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
			
			//이미지 첨부파일에 jpg,png아닐경우
			var notpng = filename.substring(filename.lastIndexOf('.'));
			if(notpng == ".jpg" || notpng == ".png"){
				if(window.FileReader){
					//oter browser
					$('#fileWriteInput').val('');
				}else {
					//ie일때
					$('#fileWriteInput').replaceWith($("#fileWriteInput").clone(true));
				}
				//모달띄우기
				var myModal = $('#rightfile');
				$('#rightfile>div>div>div:nth-child(1)>h4').text("글 첨부만 가능합니다.");
				myModal.modal("show").css('top', '35%');

				$("#confirmCancel").click(function(){
		 	  		myModal.modal("hide");
		 	    });
			}else {
				// 추출한 파일명 삽입
				$("#userwritefile").val(filename);
				//글 파일 지울 수 있게 X표시
				$('#writeclose').css('display','');
				//글 value clone
				$("#cloneuserwritefile").val(filename);
			}
		});
	 	/*********************************************************************/
	 	
	 	/*********************************************************************/
		//이미지 미리보기
		var imgInput = $('#fileImgInput');
		function readURL(imgInput) {
			if (imgInput.files && imgInput.files[0]) { 
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
				reader.onload = function (e) {
					$("#previewImg").css("display","");
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#previewImg img').attr('src', e.target.result);
				}
				reader.readAsDataURL(imgInput.files[0]); 
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()--
		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#fileImgInput").change(function(){
			 //alert(this.value); //선택한 이미지 경로 표시
            readURL(this);
        });
	 	/*********************************************************************/

	 	/*********************************************************************/
        //url에 따라 다르게 보이기
        var url=window.location.pathname;
        if(url.indexOf("insert")!=-1){
			$(".insertUrl").css("display","");
			$(".insertUrl").prop("disabled",false);
			$(".updateUrl").css("display","none");
			$(".updateUrl").attr("disabled","disabled");
			//시퀀스값 넘어가지도 않고 화면에 안보임
			$("#bbsseq").attr("disabled","disabled");
			$("#updatebbsseq").css("display","none");
			document.serarchForm.action = "/notice/insert";
        }else if(url.indexOf("update")!=-1){
        	$(".updateUrl").css("display","");
        	$(".updateUrl").prop("disabled",false);
        	$(".insertUrl").css("display","none");
			$(".insertUrl").attr("disabled","disabled");
			//id없애기
			$(".insertUrl").prop("id",false);
			//시퀀스값 넘어가지만 화면엔 안보임
			$("#bbsseq").prop("disabled",false);
			$("#updatebbsseq").css("display","none");
			
			//반복문 이용
	 		var noticePhotoDetail = '${noticePhotoDetail}';
	 		//포토경로,글경로
	 		var photopath = '';
	 		var writepath = '';
	 		//포토이름,글이름
	 		var photooriginalname = '';
	 		var writeoriginalname = '';
	 		//첨부파일이 하나밖에 없을 때
	 		if('${noticePhotoDetail.size()}' == 1){
		 		var names = '${noticePhotoDetail[0].photoname}';
		 		var namesEx = names.substring(names.lastIndexOf("."));
		 		if(namesEx == ".jpg" || namesEx == ".png"){
					photopath = '${noticePhotoDetail[0].photopath}';
					photooriginalname = '${noticePhotoDetail[0].originalname}';
					photoname = '${noticePhotoDetail[0].photoname}';
		 		}else {
		 			writepath = '${noticePhotoDetail[0].photopath}';
					writeoriginalname = '${noticePhotoDetail[0].originalname}';
					writename = '${noticePhotoDetail[0].photoname}';
			 	}
		 	}
	 		//변수 담을 배열
	 		var pathArr = new Array();
	 		var originalnameArr = new Array();
	 		if('${noticePhotoDetail.size()}' == 2){
	 			var photonames = '${noticePhotoDetail[0].photoname}';
	 			var writenames = '${noticePhotoDetail[1].photoname}';
	 			var photonamesEx = photonames.substring(photonames.lastIndexOf("."));
	 			var writenamesEx = writenames.substring(writenames.lastIndexOf("."));
	 			//그림인지 글인지 구분
	 			if(photonamesEx == ".jpg" || photonamesEx == ".png"){
	 				photopath = '${noticePhotoDetail[0].photopath}';
	 				photooriginalname = '${noticePhotoDetail[0].originalname}';
	 				writepath = '${noticePhotoDetail[1].photopath}';
	 				writeoriginalname = '${noticePhotoDetail[1].originalname}';
		 		}else{
		 			photopath = '${noticePhotoDetail[1].photopath}';
	 				photooriginalname = '${noticePhotoDetail[1].originalname}';
	 				writepath = '${noticePhotoDetail[0].photopath}';
	 				writeoriginalname = '${noticePhotoDetail[0].originalname}';
			 	}
		 	}
		 		
	 		if(photopath != ""){
		 		//추출한 이미지파일 삽입
	 			$('#previewImg').css('display','');
		 		$('#previewImg img').attr('src', photopath);
				// 추출한 그림 파일명 삽입
				$("#userfile").val(photooriginalname);
				$('#photoclose').css('display','');
				//이미지 value clone
				$("#cloneuserfile").val(photooriginalname);
		 	}
		 	if(writepath != ""){
		 		//추출한 글 파일명 삽입
				$("#userwritefile").val(writeoriginalname);
				$('#writeclose').css('display','');
				//글 value clone
				$("#cloneuserwritefile").val(writeoriginalname);
			}
			document.serarchForm.action = "/notice/update/${noticeUpdate.bbsseq}";
		 	/*********************************************************************/
		}
    });
 	/*********************************************************************/
 	//제목,글 비어있으면 다시 입력받게 하기
	function confirmOK(){
		//class remove
		$('#bbssub').removeClass('placeholderColor');
		$('#placeholderColor').attr('id','bbscontd');
		//제목 비어있으면 false || 40자 넘어가지 않기
		if($('#bbssub').val()==""){
			$('#bbssub').focus();
			$('#bbssub').addClass('placeholderColor');
        	var offset = $('#pgnameWrap').offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
			return false;	
		}
		if($('#contentNotice').val()==""){
			$('#contentNotice').focus();
			$('#bbscontd').attr('id','placeholderColor');
			var offset = $('#pgnameWrap').offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
			return false;
		};
		//입력값이 다 있으면 submit되게
		var serarchForm = document.getElementById('serarchForm');
		document.serarchForm.submit();
	}

 	/*********************************************************************/
 	//close 버튼
 	function closebutton(e){
		if(e == 'photofile'){
			if(window.FileReader){
				//oter browser
				$('#fileImgInput').val('');
				$('#userfile').val('');
				//이미지 가리기
				$('#previewImg').css('display','none');
		 		$('#previewImg img').removeAttr('src')
				//이미지 value clone
				$("#cloneuserfile").val('');
			}else {
				//ie일때
				$('#fileImgInput').replaceWith($("#fileImgInput").clone(true));
				$('#userfile').val('');
				//이미지 value clone
				$("#cloneuserfile").val('');
			}
		}else{
			if(window.FileReader){
				//oter browser
				$('#fileWriteInput').val('');
				$('#userwritefile').val('');
				//글 value clone
				$("#cloneuserwritefile").val('');
			}else {
				//ie일때
				$('#fileWriteInput').replaceWith($("#fileImgInput").clone(true));
				$('#userwritefile').val('');
				//글 value clone
				$("#cloneuserwritefile").val('');
			}
		}
 	}

 	/*********************************************************************/
    //사이즈에 따른
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#noticeTab .form-group').css('width','250px');
            }else{    
            	$('#noticeTab .form-group').css('width','35%');
          }
    }
 </script>
</html>