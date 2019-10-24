<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소추가</title>
<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.css" />

<style type="text/css">
.addr{
	margin-top:30px;

}

p{
	margin-bottom:20px;
}

</style>

</head>
<body>

<div class="container-fluid col-xs-10 col-xs-offset-1 addr">
<p>주소와 지칭할 별명을 입력해주세요.</p>
<form class="form-horizontal" action="addmyaddr" name="addaddrform" id="addaddrform" method="post">
<div class="form-group">
    <label for="addrname" class="col-sm-2 control-label" >별명</label>
  	
	<div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
   	 	<input type="text" class="form-control" id="addrname" name="addrname" placeholder="별명" >
   	</div>
	
  </div>
  <div class="form-group">
    <label for="useraddr" class="col-sm-2 control-label" >주소</label>
   		<div>
		    <div class="col-xs-4 col-sm-2 col-md-3">
			    <input type="text" class="form-control" id="userpostnum" name="userpostnum" placeholder="우편번호" maxlength="6">
			</div>
			 <div class="col-xs-2 col-sm-2 col-md-2">
		      <input type="button" name="findAddr" id="findAddr" class="btn btn-default" onClick="findJuso();" value="주소찾기" />
		    </div>
		    
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
			<input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="주소">
		</div>
	</div>
	<div class="form-group"> 	
		<div class="col-sm-5 col-md-7 col-sm-offset-2 col-md-offset-2">
	   	 	<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소" >
	   	</div>
	 </div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-4 col-xs-offset-4 col-xs-4 col-md-offset-4 col-md-4">
	      <button type="submit" class="btn btn-default addbtn" id="addbtn">추가하기</button>
	   	<button type="button" class="btn btn-default" onclick="location.href='/order/myaddr'">취소</button>
	    </div>
	  </div>
	  
	  
</form>
 
 
</div>



</body>
<script type="text/javascript">


$(window).resize(function(){
    window.resizeTo(570,460);
});


//주소찾기 팝업
function findJuso(){
	var pop = window.open("<%="http://localhost:8080/order/"%>popup","addaddr","width=570,height=420, scrollbars=yes, resizable=yes"); 	
}
	
function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
document.addaddrform.useraddr1.value = roadAddrPart1;
document.addaddrform.useraddr2.value = addrDetail;
document.addaddrform.userpostnum.value = zipNo;
}


$(document).ready(function() {
	$('#findAddr').click(function(){
			findJuso();
		});
	
	//주소록 추가 모달
	$('#issuccess').hide();
	var issuccess = $('#issuccess').text();
	var myModal = $("addrModal");
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