<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date,java.text.SimpleDateFormat"%>
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
	
	#content .modal .modal-footer {
		margin: 0 auto;
		text-align: center;
	}
/*modal end***************************************************/
   	#joinbtn ,#backBtn{
		width: 100px;
		height: 30px;
		background-color: white;
		border: 1px solid darksalmon;
		color: darksalmon;
   	}
   	    .join-form {
    	border-top: 2px solid darksalmon;
        border-bottom: 2px solid darksalmon;
    }
    
    .join-form .form-group:first-child {
    	padding-top:50px;
    } 
    
    .join-form .form-group:last-child {
    	padding-bottom:30px; 
    }
    
    .join-form label{
    	text-align:center;
    }   
   </style>
</head>
<body>
   <jsp:include page="/resources/template/header.jsp"/>
   
   <!-- 현재 년도 가져오기 -->
   <%
   		Date date = new Date();
   		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-mm-dd");
   		String strdate = simpleDate.format(date);
   		Calendar cal = Calendar.getInstance();
   		
   %>

    <!-- ***********************************content start*********************************** -->
    <div class="row">
        <div id="content" class="col-md-12">        
        	<br/>
			<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12">
			<h2>Dam da.&nbsp;&nbsp;STAFF등록</h2> 
			<br/><br/>	 
					<form class="form-horizontal join-form" action="/login/insertUser" name="joinform" id="joinform" method="post">
					<div class="form-group">
					    <div class="col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-xs-8 col-sm-6 col-md-6">
					    <label for="username">이름</label>
					      <input type="text" class="form-control" id="username" name="username" placeholder="이름" maxlength="15" required>
					    </div>
					  </div>
					  <div class="form-group">
						    <div class="col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-xs-8 col-sm-6 col-md-6">
					    		<label for="userid">아이디</label>
								<input type="text" class="form-control" id="userid" name="userid" placeholder="영문, 숫자 5-20자" maxlength="20" oninput="idchk()" required >
								<p id="resultchk"></p>
							</div>
					    </div> 
					  <div class="form-group">
					    <div class="col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-xs-8 col-sm-6 col-md-6">
					    <label for="userpw" class="control-label">비밀번호</label>
					      <input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호" maxlength="20" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-xs-offset-2 col-sm-offset-3 col-md-offset-3 col-xs-8 col-sm-6 col-md-6">
					    <label for="userpwchk" class="control-label">비밀번호 확인</label>
					      <input type="password" class="form-control" id="userpwchk" placeholder="비밀번호 확인" maxlength="20" required>
					      <p id="pwchk"> </p> 
					    </div>
					  </div>								  
					  <div class="form-group">    
					    <div class="col-sm-offset-1 col-sm-10 col-xs-12 text-center">
					      <button type="button" id="joinbtn">등록하기</button>
					    </div>
					  </div>
					</form>
					<button type="button" id="backBtn" style="margin-bottom: 100px;margin-top:10px;float: right;">뒤로가기</button>			
			</div>			
        </div>
    </div>
  	<!-- Modal confirm -->
	<div class="modal" id="confirmModal"
		style="display: none; z-index: 1050;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body text-center" id="confirmMessage">
					<br /> <br />
					<h4>
						<p>msg</p>
					</h4>
					<br /> <br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="confirmOk"
						style="color: darksalmon; background-color: #fff">확인</button>
					<button type="button" class="btn btn-default" id="confirmCancel"
						style="color: darksalmon; background-color: #fff">취소</button>
				</div>
			</div>
		</div>
	</div>
    <!-- ***********************************footer*********************************** -->
    
   <jsp:include page="/resources/template/footer.jsp"/>

   <script type="text/javascript">		
	$(document).ready(function(){
		$('#username').focus();
		//뒤로가기 
		$("#backBtn").on("click",function(){
			location.replace("/admin/usermanage"); 
		});
		//모달 닫기버튼
		var myModal = $("#confirmModal");
		$("#confirmCancel").click(function() {
			myModal.modal('hide');
		}); 
	});/////////////////////////////////////////////////////////////document.ready end
	$("userid").keyup(function(){
		validation();
		idchk(); 
	});
	$('#userpwchk').keyup(function(){	
		var userPw = $('#userpw').val();
		var userPwChk = $('#userpwchk').val();
		passwordCheck(userPw,userPwChk); 
	});
	$("#joinbtn").on("click",function(){
		var userName = $("#username").val();
		var userId = $('#userid').val();
		var userPw = $('#userpw').val();
		var userPwChk = $('#userpwchk').val();
		var myModal = $("#confirmModal"); 
		if(userName==""||userId==""||userPw==""||userPwChk=="") {
			myModal.modal("show").css('top', '35%');
			$("#confirmMessage p").text("빈칸을 입력해주세요");
			$("#confirmOk").click(function() {
				myModal.modal('hide');
			}); 
			return;
		}else{
			if(userPw!=""){
				alert(userPw);
				if(userPw!=userPwChk) {
					passwordCheck(userPw,userPwChk);
					return;
				}
			}
		}
		
		$("#joinform").submit();
	});
		//비밀번호 입력 후 확인을 마치면 일치 확인

	//유효성 검사 
	function validation(){
		//조건식
		var idCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
		var nameCheck = RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}$/);
		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

		//아이디 체크
		$('#userid').keyup(function(){			
			if(!idCheck.test($.trim($("#userid").val()))){ 
				$('#userid').val($('#userid').val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
			}
		});
		return;
	}
	
	//비밀번호 일치여부 확인
	function passwordCheck(userPw,userPwChk){
		if(userPw!=userPwChk){
			$('#pwchk').css('color','red');
			$('#pwchk').text('비밀번호가 일치하지 않습니다.');
			return false;
		}else {
			$('#pwchk').css('color','blue');
			$('#pwchk').text('비밀번호가 일치합니다.');
			
		}
		 
	};
	   
	//아이디 중복체크
	function idchk(){
		var userid = $('#userid').val();		
		var idlen = $('#userid').val().length;
		if(idlen<5){
			$('#resultchk').css('color','black');
			$('#resultchk').text('5글자 이상 입력해주세요');
			return;
		}else{
			$.ajax({ 
				data:{
					userid:userid
				}, 
				url : "/login/checkId",
				success: function(data){
					if(data==1){
						$('#resultchk').css('color','red');
						$('#resultchk').text('사용할 수 없는 아이디입니다');
						return false;
					}else if(data==0){
						$('#resultchk').css('color','blue');
						$('#resultchk').text('사용가능한 아이디입니다');
					}
	
				}
	
			});
		}
	};
	
   </script>
</body>
</html>
