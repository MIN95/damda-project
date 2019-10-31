<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css" />
<jsp:include page="/resources/template/head.jsp"/>
<jsp:include page="/resources/template/mypage_head.jsp"/>
 <script type="text/javascript">

 //비밀번호 일치여부 확인
	function passwordCheck(){
		var userPw = $('#userpw').val();
		var userPwChk = $('#userpw2').val();

		if(userPw!=userPwChk){
			$('#pwchk').text('비밀번호가 일치하지 않습니다.');
			$('#pwchk').css('color','red');
			$('#editpwbtn').attr('disabled',true);
		}else {
			$('#pwchk').text('비밀번호가 일치합니다.');
			$('#pwchk').css('color','green');
			$('#editpwbtn').attr('disabled',false);
		}
		
	};
	
 $(document).ready(function(){
	$('#editpw').hide();
	$('#userpw').attr("disabled",true);
	$('#userpw2').attr("disabled",true);
	$('#nowpw').removeAttr("disabled"); 
	$('#editpwbtn').attr('disabled',true);


	
	//비밀번호 입력 후 확인을 마치면 일치 확인
	$('#userpw').focus(function(){
		$('#userpw2').blur(function(){

			passwordCheck();

		});
	});

	$('#userpw2').focus(function(){
		$('#userpw').blur(function(){

			passwordCheck();

		});
	});

	 
	//잘못된 비밀번호 입력시 오류메세지
		$('#incorrectPw').hide();
		var incorrect = $('#incorrectPw').text().trim();
		
		
		if(incorrect == "incorrect"){
			var myModal = $("#editErrModal");
	  		myModal.modal("show").css('top', '35%');
	  	    $("#editErrOk").click(function(){
	  	  		myModal.modal("hide");
	  	    });
		}else if(incorrect == "correct"){
			$('#chkpw').hide();
			$('#chkpwbtn').attr('disabled',true);
			$('#editpw').show();
			$('#nowpw').attr('disabled',true);
			
			$('#editpwbtn').removeAttr("disabled");
			$('#userpw').removeAttr("disabled"); 
			$('#userpw2').removeAttr("disabled"); 

			
		}


 })

 
</script>

<style type="text/css">
        /*content area************************************/
        #content #content_content h3 {
            width: 150px;
        }

        #content #content_content small {
            width: 240px;
        }

        

        #content #content_content input {
            
            margin-bottom: 10px;
        }

        #content #content_content .date_h4 {
            margin-top: 20px;
            color: darksalmon;
        }

        
        /*수정 form css************************/
        
        #chkpwbtn{
	        text-align:center;
        }
        
        #editpw label{
        	text-align:right;
        }
        
        
        
</style>

</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <a href="/mypage/"><p>주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
                    </li>
                    <li>
                        <a href="/mypage/myrecie"><p>마이 레시피</p></a>
                    </li>
                    <li>
                        <a href="/mypage/qna"><p>문의 내역</p></a>
                    </li>
                    <li class="active_menu">
                        <a href="/mypage/userinfo"><p class="active_menu">개인 정보 수정</p></a>
                    </li>
                </ul>
            </div>
            
            
            <div id="content_content" class="col-md-6">
               	<h3>비밀번호수정</h3><small>비밀번호를 입력해주세요.</small>
                <!-- 내용 입력 -->
                <div>
                <div id="chkpw" > 
                	<form class="form-horizontal" name="chkpw" action="chkpw" method="post">
                		<div class="form-group">
				    		<label for="userpw" class="col-sm-3 control-label col-md-offset-2">현재 비밀번호</label>
							<div class="form-group col-sm-5 col-md-5">
							    <input type="password" class="form-control" id="nowpw" name="nowpw" placeholder="Password"/>
							</div>
							<div class="col-md-2"> 
								<button id="chkpwbtn" type="submit" class="btn btn-default">확인</button>
							</div>
						</div>
	                </form>
                </div>
                 <div id="editpw"> 
                	<form class="form-horizontal" name="editpw" action="editpw" method="post">
                	<div>
	                	<div class="form-group">
	                	<label for="userpw" class="col-sm-3 col-md-3 control-label col-sm-offset-1 col-md-offset-2">변경할 비밀번호</label>
							<div class="col-sm-5 col-md-5">
								 <input type="password" class="form-control" id="userpw" name="userpw" placeholder="Password"/></div>
						</div>
					</div>
					<div>
						<div class="form-group"> 	
						<label for="userpw" class="col-sm-3 col-md-3  control-label col-sm-offset-1 col-md-offset-2">비밀번호 확인</label>
							<div class="col-sm-5 col-md-5">
						     	  <input type="password" class="form-control" id="userpw2" name="userpw2" placeholder="Password"/>
						    </div>
						  </div>
						 
					</div>
						<div class="col-sm-6 col-md-6 col-sm-offset-4 col-md-offset-5"> 
							<p id="pwchk"> </p>
						</div>
						  <div class="form-group">
				    		<div class="col-sm-offset-5 col-sm-4 col-xs-offset-5 col-xs-4 col-md-offset-6 col-md-4">
							<button id="editpwbtn" type="submit" class="btn btn-default">확인</button>
							</div>
						 </div>
					</form>		
					</div>
               	 </div>
               </div>
                
               
                <!-- 내용 끝 -->
            
            </div>

<!-- 비밀번호 틀렸을 시 -->
 	<div id="incorrectPw">${incorrect}</div>
	<!-- Modal err -->
	<div class="modal" id="editErrModal" style="display: none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;">비밀번호 오류.</p> 
		            <br/>
		            <p>비밀번호를 정확히 입력해주세요.</p>
					<br />
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" id="editErrOk">확인</button>
		            </div>
	       	 	</div>
	        </div>
	    </div>
	</div>
	
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>