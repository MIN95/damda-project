<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
        
<style type="text/css">

.addrList{
	display : inline-block;
	text-align:center;
	font-size: 15px;
}

thead th{
	text-align: center;
        border-top: 2px solid darksalmon;
        border-bottom: 1px;
}

thead th:nth-child(1){
	width:8%;
}

thead th:nth-child(2){
	width:20%;
}

thead th:nth-child(3){
	width:60%;
}

thead th:nth-child(4){
	width:12%;
}


tbody tr{
	text-align: center;
	border-top: 1px solid darksalmon;
    border-bottom: 1px solid darksalmon;
    
}


tbody tr>td:nth-child(3){

	
    
}
	
	.selectaddrbtn{
		text-align:center;
    	background-color:darksalmon;
    	color:white;
    }
    
    .selectaddrbtn:hover{
    	background-color:darksalmon;
    	color:white;
    }
    
  
    
    div{
    	text-align:center;
    }

</style>

</head>
<body>
 <div class="container-fluid col-xs-10 col-xs-offset-1 addr" >
 <br>
 <p id="noaddr"></p>
 <table class="addrList">
 	<thead>
 		<tr>
 			<th></th>
 			<th>별명</th>
 			<th colspan="4">주소</th>
 			<th></th>
 		</tr>
 	</thead>
 	
 	<tbody>
 	
 	<c:forEach items="${selectAddr }" var="selectAddr" >
 	<div class="form-check form-check-inline">
	 		<tr>
	 			<td>
	 				<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
	
	 			
	 			</td>
	 			<c:if test="${selectAddr.addrname != null}">
	 			<td>
	 			<label class="form-check-label" for="inlineRadio1">${selectAddr.addrname }
	 			
	 			</label>
	 			</td>
	 			
	 			</c:if>
	 			<td colspan="4">
	 				<c:if test="${selectAddr.useraddr1 != null}">
	 				<p>${selectAddr.useraddr1}<br/>${selectAddr.useraddr2}</p>
	 				</c:if>
	 			</td>
	 			<td>
	 				<input type="button" class="btn btn-lg btn-default" value="삭제" onclick="del(${selectAddr.addridx });">
	 			</td>
	 		</tr>
	 </div>
 	</c:forEach>
 	</tbody>
 
 </table>
 
 
 
 <div>
 	 <button type="button" class="btn btn-default addaddrbtn" id="addaddrbtn" onclick="location.href='/order/addaddr'">주소추가</button>
 	 <button type="button" class="btn btn-default selectaddrbtn" id="selectaddrbtn">주소선택</button>
  </div>
 
 </div>
 
 
<!-- 주소록 추가 모달 -->
    <div id="issuccess">${addr}</div>
    
	<!-- Modal err -->
	<div class="modal" id="addrModal" style="display: none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;" id="sub">비밀번호 오류.</p> 
		            <br/>
		            <p id="content">비밀번호를 정확히 입력해주세요.</p>
					<br />
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" id="Ok">확인</button>
		                <button type="button" class="btn btn-default" id="cancel">취소</button>
		            </div>
	       	 	</div>
	        </div>
	    </div>
	</div>
	
</body>

<script type="text/javascript">

function del(addridx){
	var myModal = $("#addrModal");
	$("#sub").text("주소 삭제");
	$("#content").text("주소를 삭제하시겠습니까?");
	$('#cancel').show();
	myModal.modal("show").css('top', '35%');
	
    $("#Ok").click(function(){
  		myModal.modal("hide");
  		location.href="/order/deleteAddr?idx="+addridx; 
    });

    $("#cancel").click(function(){
    	myModal.modal("hide");
    });

}

$(window).resize(function(){
    window.resizeTo(570,460);
});

function update(url){
	var ajaxOption = {
		url:url,
		async:true,
		type:"POST",
		dataType:"html",
		cache:false
	};

	$.ajax(ajaxOption).done(function(data){
		//content영역 삭제
		$("#addr").children().remove();
		//content영역 교체
		$("#addr").html(data);

	});
}

function ajaxTest(){
    $.ajax({
      type : "GET",
      url : "myaddr",
      dataType : "html",
      error : function() {
        alert('통신실패!!');
      },
      success : function(data) {
        $('.content').html(data);
      }

    });
  }


$(document).ready(function() {
	$('#cancel').hide();

	//주소록 추가 모달
	$('#issuccess').hide();
	var issuccess = $('#issuccess').text();
	var myModal = $("#addrModal");

	if(issuccess == "yes"){
		$("#sub").text("주소 추가 성공");
		$("#content").text("주소가 추가되었습니다.");
	  	myModal.modal("show").css('top', '35%');
  	    $("#Ok").click(function(){
  	  		myModal.modal("hide");
  	    });
	}else if(issuccess == "no"){
		$("#sub").text("주소 추가 실패");
		$("#content").text("주소는 5개까지 추가할 수 있습니다.");
		myModal.modal("show").css('top', '35%');
  	    $("#Ok").click(function(){
  	  		myModal.modal("hide");
  	    });
	};
	
});

</script>

</html>