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
 	font-family: 'Noto Sans KR', sans-serif;
 	width: 100%;
 	white-space: pre-wrap; /* CSS3*/
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-all; /* Internet Explorer 5.5+ */ 
 	}
	#answerWrap2 {
	width: 100%;
	} 
 	#answerWrap2 #answerPre { 
 	background-color: #E7F2FB;
 	display: none;  
 	}
 	th {
	background-color: #eee;
 	}
 	#qnaTab table tbody a:link {
    text-decoration: none;
    color: #363636;
    }
    #qnaTab table tbody a:hover {
    color: #ccc;
    } 
    #qnaTab table tbody :visited {
    color: #363636; 
    } 
    #qnaTab #answerTxt {
    resize: none;
    border: none;
    width: 100%;
    background-color: #E7F2FB;
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
				<table class="table text-left table-bordered">
				<thead>	
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3" style="text-align: center;">Subject</th>
						<th id="qnaSubTh" class="col-md-10 col-sm-10 col-xs-9">${qnaVo.qnaSub }</th>
					</tr>
					<tr>
						<th style="text-align: center;">Writer</th>
						<th>${qnaVo.m_userId }</th>
					</tr>
					<tr>
						<th style="text-align: center;">Date</th>
						<th>${qnaVo.qnaDate }</th>
					</tr>
					<tr>
						<th style="text-align: center;">Category</th>
						<th>
						<select id="qnaKind" class="selectpicker" style="background-color:#eee;" disabled="disabled"> 
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
						<td colspan="2" class="col-md-12">
							<div class="col-md-12 text-left" >
							<pre style="height:300px;margin:17px auto;">${qnaVo.qnaCon }</pre>
							</div>
							<form id="qnaAnswer" method="POST">
								<div id="answerWrap2" class="col-md-12 col-sm-12 col-xs-12">
								<pre id="answerPre"><textarea id="answerTxt" name="answerCon" rows="15" placeholder="답변을 작성해주세요">${qnaVo.answerCon }</textarea></pre>
								</div>
								<input type="hidden" id="qnaNum" name="qnaNum" value="${qnaVo.qnaNum}" />
								<input type="hidden" id="answerNotice" name="answerNotice" value="${qnaVo.answerNotice}">
								<input type="hidden" id="answerStatus" name="answerStatus" value="${qnaVo.answerStatus}">
								<input type="hidden" id="userEmail" name="m_userEmail" value="${qnaVo.m_userEmail}">
								<input type="hidden" id="qnaDate " name="qnaDate" value="${qnaVo.qnaDate}">
							</form>  
						</td>
					</tr>
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3" style="text-align: center;">첨부파일</th>
						<th class="col-md-10 col-sm-10 col-xs-9">
						<form id="filePathSend"  action="/qna/delete" method="post">
						<input type="hidden" id="qnaNum" name="qnaNum" value="${qnaVo.qnaNum}" />
						<c:forEach items="${FileList}" var="FileList" varStatus="status">
							<div>
							<a id="fileDown" href="/qna/download?no=${qnaVo.qnaNum}&filePath=${FileList.photoPath}">
								<span class="attachedFile">
								<img alt="attached" style='width:15px;heigth:15px;' src="/resources/icon/attach-clip.png">
								<c:out value="${FileList.originalName }" />
								</span>
							</a>
							</div>
							<input type="hidden" id="filePath${status.index }" class="filePath" name="filePath" value="${FileList.photoPath }"/>
						</c:forEach>
						</form>
						</th>
					</tr>
					<tr id="answerAlarm" style="display: none;">
						<th style="text-align: center;">답변알림</th>
						<th><label for="answerNoticeF">이메일로 알람받기</label><input type="checkbox" id="answerNoticeF" value="0" style="width: 15px;margin-left: 5px;"></th>
					</tr> 
				</tbody>
			</table>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<button id="updateBtn" class="btn btn-default">수정</button>
				<button id="deleteBtn" class="btn btn-default">삭제</button>
				<button id="answerInsertBtn" class="btn btn-default">답변등록</button>
				<button id="answerUpdateBtn" class="btn btn-default">답변수정</button>
			</div>
			<div id="answerWrap3" class="col-md-12 col-sm-12 col-xs-12 text-right">
				<a href="/qna/" id="updateBtn" class="btn btn-default" style="margin-top:10px;">목록</a>
			</div> 
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
 		//작성자만 글 수정,삭제가능
 		var wirteNum = "${qnaVo.m_userNum}";
 		var nowNum = "${userNum}";
 		if(wirteNum!=nowNum){  
 			$("#updateBtn").css('display','none');
 			$("#deleteBtn").css('display','none');
 		}
 		//답변이 달렸으면 보이게
 		var answerChk = $('#answerPre').text();
 		if(answerChk!="") { 
 			$('#answerPre').css("display","block");
 			$("#answerTxt").attr("disabled",true);
 			$("#answerTxt").css("cursor","default");
 		}
 		var user_ctg = "${user_ctg}"
 		if(user_ctg==0||user_ctg==1){							//관리자세션
 			$('#updateBtn').css('display','none');
 			$('#deleteBtn').css('display','none');
 			$('#answerPre').css("display","block");
 			var answerNotice = "${qnaVo.answerNotice}";
 			if(answerNotice=="1") {
 				$("#answerNoticeF").prop("checked", true);
 			}
 			$('#answerAlarm').show(); 
 			if(answerChk=="") {
 				$('#answerUpdateBtn').css('display','none');
 			}else{
 				$('#answerInsertBtn').css('display','none');
 			}
 		}else if(user_ctg==2){									//회원세션
 			$('#answerInsertBtn').css('display','none');
 			$('#answerUpdateBtn').css('display','none');	
 		}
 		if(user_ctg=="") {										//비회원
 			$('#updateBtn').css('display','none'); 
 			$('#deleteBtn').css('display','none');
 			$('#answerInsertBtn').css('display','none');
 			$('#answerUpdateBtn').css('display','none');
 		}
 		var selectVal = "${qnaVo.qnaKind}"
 		$("#qnaKind").val(selectVal);
 		var qnaStyle = "${qnaVo.qnaStyle}";
 		if(qnaStyle==0) {
 			$("#qnaSubTh").append("<img style='width:15px;heigth:15px;' src='/resources/icon/save_lock.png'>");
 		}
		//첨부파일 다운로드 실패		
 		var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage); 
        }
 		
 	});//////////////////////////////////document.ready end
 	
 	$(window).resize(function() {
        resized2();
    });
	//user계정일땐 문의글과 답글만 볼 수 있음(작성돼있을 시)
	//관리자 계정일 땐 문의글 아래에 답글 작성,수정가능 
	$("#answerInsertBtn").on("click",function(){
		if($("#answerTxt").val()!=""){
			$("#qnaAnswer").submit();			
		}else {
			$('#confirmMessage h4').text("답변을 등록해주세요");
			$("#confirmCancel").hide();
			myModal.modal("show").css('top', '35%');
		 	$("#confirmOk").click(function(){
		    	myModal.modal("hide");
		    });
		}
	});
	//답변수정
	$("#answerUpdateBtn").on("click",function(){
		$("#answerTxt").removeAttr("disabled");
		$("#answerTxt").css("cursor","text");
		$("#answerTxt").focus();
		$("#answerInsertBtn").show();
		$("#answerUpdateBtn").hide();
	});

 	//답글관련페이지에서 안보여야할 부분
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#qnaTab').css('font-size','13px');
            }else{
            	$('#qnaTab').css('font-size','14px');
            }
    }
 	
 	//수정페이지로 이동
 	var qnaNum = "${qnaVo.qnaNum}"
 	$('#updateBtn').on('click',function(){
 		location.href = "/qna/update?no="+qnaNum;
 	});
 	//삭제페이지로 이동
 	var myModal = $("#confirmModal");
 	$('#deleteBtn').on('click',function(){
 		$('#confirmMessage h4').text("글을 삭제하시겠습니까?");
		myModal.modal("show").css('top', '35%');
		$("#confirmCancel").show();
	 	$("#confirmCancel").click(function(){
	    	myModal.modal("hide");
	    });
	 	$("#confirmOk").click(function(){
	    	myModal.modal("hide");
	    	$('#filePathSend').submit();
	    });
 	});
 	</script>
</html>
