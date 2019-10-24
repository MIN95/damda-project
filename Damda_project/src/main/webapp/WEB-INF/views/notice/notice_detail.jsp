<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
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
 	#previewImg{
 		margin:10px auto 40px auto;
 		width:90%;
 		height:300px;
 	}
 	#previewImg img{
 		width:100%;
 		height:100%;
 	}
 	pre {
	 	border: 0px;
	 	font-family: 'Noto Sans KR', sans-serif;
	 	color: #333333;
	 	width: 100%;
	 	white-space: pre-wrap; /* CSS3*/
		white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
		white-space: -pre-wrap; /* Opera 4-6 */
		white-space: -o-pre-wrap; /* Opera 7 */
		word-wrap: break-all; /* Internet Explorer 5.5+ */ 
 	}
 	#pgTransition img {
	 	width: 12px;
	 	height: 8px;
 	}
 	#pgTransition a {
 		color: rgb(0,0,0);
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
				<table class="table text-left table-bordered">
				<thead>
					<tr style="display:none;">
						<th class="col-md-2 col-sm-2 col-xs-3">BBSNUM</th>
						<th class="col-md-10 col-sm-10 col-xs-9">${noticeDetail.bbsnum}</th>
					</tr>
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3">Subject</th>
						<th class="col-md-10 col-sm-10 col-xs-9">${noticeDetail.bbssub}</th>
					</tr>
					<tr>
						<th>Writer</th>
						<th>${noticeDetail.bbswriter }</th>
					</tr>
					<tr>
						<th>Date</th>
						<th>${noticeDetail.bbsdate }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" class="col-md-12">
						<div id="previewImg"><img /></div>
						<div class="col-md-12 text-left"><pre>${noticeDetail.bbscon }</pre></div>
						</td>
					</tr>
					<tr id="writeNotice">
						<th class="col-md-2 col-sm-2 col-xs-3">첨부파일</th>
						<th class="col-md-10 col-sm-10 col-xs-9"><a href="#"><img alt="attached" src="resources/icon/attach-clip.png"></a></th>
					</tr>
				</tbody>
			</table>
			</div>
			 	<%
			 	if(session.getAttribute("user_ctg")!=null){
					int user_ctg = (int)session.getAttribute("user_ctg");
				  	if(user_ctg == 0 || user_ctg == 1) { 
				%>
				<div class="col-md-12 col-sm-12 col-xs-12 text-right">
					<a href="/notice/update/${noticeDetail.bbsnum}" id="updateBtn" class="btn btn-default">수정</a>
					<a id="deleteBtn" class="btn btn-default">삭제</a>
				</div>
				<%	} 
				}%>
			<div id="pgTransition" class="col-md-12 col-sm-12 col-xs-12 text-left">
			<br />
			<table class="table table-bordered">
			<c:if test="${noticePrevDetail.bbssub!=null }">
				<tr>
					<th class="col-md-2 col-sm-2 col-xs-3"><img alt="prev" src="/resources/icon/prev_top.png">&nbsp;&nbsp;이전글</th>
					<td class="col-md-10 col-sm-10 col-xs-9"><a href="/notice/detail/${noticeDetail.bbsnum-1}">${noticePrevDetail.bbssub }</a></td>
				</tr>
			</c:if>
			<c:if test="${noticeNextDetail.bbssub!=null }">
				<tr>
					<th class="col-md-2 col-sm-2 col-xs-3"><img alt="next" src="/resources/icon/next_bottom.png">&nbsp;&nbsp;다음글</th>
					<td class="col-md-10 col-sm-10 col-xs-9"><a href="/notice/detail/${noticeDetail.bbsnum+1}">${noticeNextDetail.bbssub }</a></td>	
				</tr>
			</c:if>
			</table>
			<br /><br /><br />
			</div>
		</div>
	</div>
	</div>
	<!-- Modal confirm -->
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
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();	
 		//이미지 넣을 공간 안보이게 미리 설정
 		$('#previewImg').css('display','none');
 		//첨부파일 공간 안보이게 미리 설정
 		$('#writeNotice').css('display','none');
 		//삭제확인모달
 		$('#deleteBtn').click(function(){
			var myModal = $('#confirmModal');
 	  		myModal.modal('show').css('top', '35%');
 	  		$('#confirmOk').click(function(){
				location.href='/notice/delete/${noticeDetail.bbsseq}';	
		  	  	myModal.modal('hide');
	  	    });
	 	    $('#confirmCancel').click(function(){
	 	  		myModal.modal('hide');
	 	    });
 	 	});

 		/*********************************************************************/
 	 	//반복문 이용
 		var noticePhotoDetail = '${noticePhotoDetail}';
 		//포토경로,글경로
 		var photopath = '';
 		var writepath = '';
 		//포토 오리지널 이름,글 오리지널 이름
 		var photooriginalname = '';
 		var writeoriginalname = '';
 		//포토 이름,글 이름
 		var photoname = '';
 		var writename = '';
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
 		var nameArr = new Array();
 		if('${noticePhotoDetail.size()}' == 2){
 			var photonames = '${noticePhotoDetail[0].photoname}';
 			var writenames = '${noticePhotoDetail[1].photoname}';
 			var photonamesEx = photonames.substring(photonames.lastIndexOf("."));
 			var writenamesEx = writenames.substring(writenames.lastIndexOf("."));
 			//그림인지 글인지 구분
 			if(photonamesEx == ".jpg" || photonamesEx == ".png"){
 				photopath = '${noticePhotoDetail[0].photopath}';
 				photooriginalname = '${noticePhotoDetail[0].originalname}';
 				photoname = '${noticePhotoDetail[0].photoname}';
 				writepath = '${noticePhotoDetail[1].photopath}';
 				writeoriginalname = '${noticePhotoDetail[1].originalname}';
 				writename = '${noticePhotoDetail[1].photoname}';
	 		}else{
	 			photopath = '${noticePhotoDetail[1].photopath}';
 				photooriginalname = '${noticePhotoDetail[1].originalname}';
 				photoname = '${noticePhotoDetail[1].photoname}';
 				writepath = '${noticePhotoDetail[0].photopath}';
 				writeoriginalname = '${noticePhotoDetail[0].originalname}';
 				writename = '${noticePhotoDetail[0].photoname}';
		 	}
 		}
	 	//추출한 이미지파일 삽입
 		if(photopath != ""){
 			$('#previewImg').css('display','');
	 		$('#previewImg img').attr('src', photopath);
			// 추출한 그림 파일명 삽입
			$("#userfile").val(photooriginalname);
	 	}
		//추출한 글 파일명 삽입
	 	if(writename != ""){
	 		$('#writeNotice').css('display','');
	 		$('#writeNotice>th:nth-child(2)>a').text(writeoriginalname);
	 		$('#writeNotice>th:nth-child(2)>a').attr('href','/notice/download/'+writename);
		}	
	 	/*********************************************************************/
 	});
 	
 	$(window).resize(function() {
        resized2();
    });

    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#noticeTab').css('font-size','13px');
            }else{
            	$('#noticeTab').css('font-size','14px');
            }
    }
</script>
</html>