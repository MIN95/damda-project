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
    height: 45px;
    width:200px;
    margin: 0 auto;
    }
    #pgnameWrap h3 {
    margin: 0px;
    padding: 5px;
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
    #mateTab {
    width:100%;
    }
   #mateTab .picSize img{
   width: 100%;
   height: 100%;
   cursor: pointer;
   }
   #imgTd{
   	width:300px;
   	height:100px;
   }
   #mateTab select {
   width:100%;
   } 
   #mateTab th {
   text-align:center;
   line-height:48px;
   height:70px;
   width:200px;
   font-size:15px;
   }
   #mateTab td {
   text-align:center;
   line-height:45px;
   height:70px;
   width:200px;
   }
   #mateTab td input{
   	text-align:center;
   }
   #ctgTh{
   	   text-align:center;
	   line-height:45px;
	   height:70px;
	   width:200px;
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
   #thImg{
   	width:100%;
   	height:100%;
   }
   #deImg{
   	width:490px;
   	height:490px;
   }
   .ImgBtn{
		display:none;
	}
   #mateDetail{
   	margin:0px auto;
   }
   #ImgBtn{
   	margin:0px auto;
   	display:none;
   }
   #mateContent{
   	text-align:center;
   	margin:0px auto;;
   }
   #buttonSet{
   	margin-bottom:5%;
   }
</style>
    <script type="text/javascript">
    $(document).ready(function(){
       $('select').hide();
       $('#vegeSelect').hide();
       $('#toppingSelect').hide();
       resized2();
      if($('#mateImgde').val()==null){
		$('#mateImgde').remove();
          }
      if($('#mateImgth').val()==null){
          $('#mateImgth').remove();
          }
      $('select').hide();
      $('#submitbtn').on('click',function(){
    	   	 var mateName = $('#mateName').val();
 	   		var matePrice =$('#mateprice').val();
 	   		var mateCtg =$('#customSelect').val();
 	   		if(mateName == '' || matePrice==''||mateCtg=='0'){
 				$('#modalContent').text("내용 입력을 확인해주세요.");
 				$('#modalok').hide();
 	   			$("#modalcancel").text("확인");
 	   	        return ;
 	   		}else{
 	   			$('#modalContent').text("재료 내용을 변경하시겠습니까?");
 				$('#modalok').show();
 	   			$("#modalcancel").text("취소");
 	   	    }
         });
      var numberCheck = function() {
			var temp = document.getElementById('input').value;
			if(isNaN(temp) == true) {
				$('#modalContent').text("가격을 숫자로 입력해주세요.");
				$('#modalok').hide();
	   			$("#modalcancel").text("확인");
			}
		};
    });
function inNumber(){
	if(event.keyCode<48 || event.keyCode>57){
		event.returnValue=false;
		}
}
	$(function(){
	 //관리자 수정버튼
	 
    $('#resetbtn,#submitbtn').hide();
    $('.ImgBtn').hide();
    $('#editbtn').click(function(){
    	$('h3').text("커스텀 재료 수정");
  	 	 $('#editbtn,#deletebtn').hide();//수정삭제돌아가기hide
  		 $('#resetbtn,#submitbtn').show();//등록취소show
  		 $('#mateprice, #mateName').removeAttr('readonly');
  		 $('#salestatus, #customSelect').show();
  		$('#vegeSelect').hide();
        $('#toppingSelect').hide();
         $('#matectg,#matestatus').hide();
         $('.ImgBtn').show();
     });
    $('#resetbtn').click(function(){
    	$('h3').text("커스텀 재료");
        $('#editbtn, #deletebtn').show();
        $('#resetbtn, #submitbtn').hide();
        $('mateprice, #mateName').attr('readonly');
        $('#salestatus, #customSelect').hide();
        $('#vegeSelect').hide();
        $('#toppingSelect').hide();
        $('#matectg,#matestatus').show();
        $('.ImgBtn').hide();
    })
})
function ctgChange(e){
	if(e.value=="1"){//vege
		$('#ctgTh').css("line-height","80px");
		$('#vegeSelect').show();
		$('#toppingSelect').hide();
		$('#vegeSelect').removeAttr("name").attr({name : "matectg"});
	}
	if(e.value=="2"){//topping
		$('#ctgTh').css("line-height","80px");
		$('#vegeSelect').hide();
		$('#toppingSelect').show();
		$('#toppingSelect').removeAttr("name").attr({name : "matectg"});
	}
	if(e.value=="3"){//sauce
		$('#ctgTh').css("line-height","45px");
		$('#customSelect').removeAttr("name").attr({name : "matectg"});
		$('#vegeSelect').hide();
		$('#toppingSelect').hide();
	}
	if(e.value=='0'){
        $('#vegeSelect').hide();
	    $('#toppingSelect').hide();
	    $('#customSelect').removeAttr("name").attr({name : "matectg"});
		}
}

 </script>
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
                     <h3>커스텀 재료</h3>
               </div>
               <br />
         </div>
         <form id="Edit" enctype="multipart/form-data" method="post">
         <input type="hidden" name="method" value="put" id="method"/>
         <div id="mateTab" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered table-sm">
            <!-- <p id="${mateone[0].mateName}"></p> -->
				<thead> 
					<tr>
						<td id="imgTd" rowspan="6">
							<div class="picSize" class="form-group " style="width:200px">
                              	<img class="inputImg" id="thImg" name="photoPath" src="${mateone[0].photoPath }"/>
                             	<div class="d-flex justify-content-center ImgBtn">
							      <span class="btn btn-default btn-file">
									   썸네일 이미지 찾기 <input type="file" class="img" id="mateImgth" name="file" />
									   <script>
									   $('#mateImgth').change(function(){
										   if(this.files && this.files[0]){
											   var reader = new FileReader;
											   reader.onload = function(data){
												   $('#thImg').attr("src",data.target.result);
												   $('#thImg').show();
												   }
											   reader.readAsDataURL(this.files[0]);
											   }
										   });	
									   </script>
									</span>
					    		</div>    
							</div>
                        </td>
                        </tr>
                         <tr>
                  <th>재료번호</th>
                  <td>
                  	 <input type="text" id="matenum" name="matenum" value="${mateone[0].matenum }" readonly="readonly">
                  </td>
               </tr>
                        <tr> 
                       <th >재료명</th>
                        <td colspan="2">
                           <input type="text" id="mateName" name="mateName" value="${mateone[0].mateName }" readonly="readonly">
                        </td>
                     </tr>
                     <tr>
                       <th>재료가격</th>
                       <td colspan="2">
                            <input type="text" id="mateprice" name="mateprice" value="${mateone[0].mateprice }" readonly="readonly">
                        </td>
                     </tr>
                     <tr id="ctgTr">
               		<th id="ctgTh">재료 카테고리</th>
               		<td id="ctgTd">
						<p id="matectg">               		
               			<c:set target="${mateone[0]}" property="matectg" var="ctg" value="${mateone[0].matectg }" />
									<c:choose>
									    <c:when test="${ctg eq '1-1'}">
											<c:out value="야채-씁쓸한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-2'}">
											<c:out value="야채-아삭한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-3'}">
											<c:out value="야채-순한 맛" />
										</c:when>
										<c:when test="${ctg eq '1-4'}">
											<c:out value="야채-매운 맛" />
										</c:when>
										<c:when test="${ctg eq '2-1'}">
											<c:out value="토핑-고기/햄/생선" />
										</c:when>
										<c:when test="${ctg eq '2-2'}">
											<c:out value="토핑-과일/치즈" />
										</c:when>
										<c:when test="${ctg eq '2-3'}">
											<c:out value="토핑-견과류" />
										</c:when>
										<c:when test="${ctg eq '3'}">
											<c:out value="소스" />
										</c:when>
									</c:choose>
            				</p>
	               			<select name="customSelect" id="customSelect" onchange="ctgChange(this)">
						    	<option value="0">카테고리를 선택해주세요</option>
						    	<option name="1" value="1">야채</option>
						    	<option name="2" value="2">토핑</option>
						    	<option name="3" value="3">소스</option>
							</select>
							<select name="vegeSelect" id="vegeSelect">
								<option value="1-1">씁쓸한 맛</option>
								<option value="1-2">아삭한 맛</option>
								<option value="1-3">순한 맛</option>
								<option value="1-4">매운 맛</option>
							</select>
							<select name="toppingSelect" id="toppingSelect">
								<option value="2-1">고기/햄/생선</option>
								<option value="2-2">과일/치즈</option>
								<option value="2-3">견과류</option>
							</select>
	               		</td>
               			</tr>
                     <tr>
	               		<th>판매 상태</th>
               		<td ><p id="matestatus">
               			<c:set target="${mateone[0]}" property="salestatus" var="status" value="${mateone[0].salestatus}" />
									<c:choose>
									    <c:when test="${status eq '0'}">
											<c:out value="판매중" />
										</c:when>
										<c:when test="${status eq '1'}">
											<c:out value="판매중지" />
										</c:when>
									</c:choose>
               			</p>
               			<select name="salestatus" id="salestatus">
               				<option value="0">판매중</option>
               				<option value="1">판매중지</option>
               			</select>
               		</td>
               		</tr>
             </tr> 
            </thead>
            <tbody>
            <tr>
               <td colspan="3" style="padding:0px" id="mateContent">
            	<div class="mateDetail">
					<img class="inputImg" name="photoPath" id="deImg" src="${mateone[1].photoPath }"/>
				</div>
				<div class="d-flex justify-content-center ImgBtn">
					      <span class="btn btn-default btn-file">
							   디테일 이미지찾기 <input type="file" class="img" id="mateImgde" name="file2" />
							   <script>
							   $('#mateImgde').change(function(){
								   if(this.files && this.files[0]){
									   var reader = new FileReader;
									   reader.onload = function(data){
										   $('#deImg').attr("src",data.target.result);
										   $('#deImg').show();
										   }
									   reader.readAsDataURL(this.files[0]);
									   }
								   });	
							   </script>
							</span>
					    </div>    
              		</td>            
            	</tr>
            </tbody>
         </table>
         </div>
         <!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
         <div id="buttonSet" class="col-md-12 col-sm-12 col-xs-12 text-right">
            <button type="button" onclick="editbtn" id="editbtn" class="btn btn-default">수정</button>
            <button type="button" id="backbtn" onclick="location.href='/admin/'" class="btn btn-default">목록으로</button>
         	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#DeleteModal" id="deletebtn">삭제</button>
         	<button type="button" data-toggle="modal" data-target="#myModal" id="submitbtn" class="btn btn-default">등록</button>
         	<button type="reset"  id="resetbtn" class="btn btn-default">취소</button>
         </div>
         <!--------------------------------------------------------------------------------------------------------------------->
   		<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">커스텀 재료 삭제</h4>
		      </div>
		      <div class="modal-body">
		       	삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" onclick="location.href='/admin/delete/${mateone[0].matenum }'"class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">커스텀 재료 등록</h4>
		      </div>
		      <div class="modal-body" id="modalContent">
		       	재료를 등록하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="modalcancel" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="submit" id="modalok"  class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>		
	</form>
      </div>
   </div>
   </div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    	
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>