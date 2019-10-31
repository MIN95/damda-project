<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!--  font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <style type="text/css">
    #content #MOVE_TOP_BTN{
    	width:10%;
    	height:10%;
    }
    footer .logo-part{
    	height:25%;
    }
	input{
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
    .eventDate>*{
    	z-index:99;
    }
    .evnetDatediv{
    	width:100%;
    }
    .eventDatediv {
    	display:flex;
    	text-align:center;
    	width:100%;
    }
    .eventDatediv input{
    	width:30%;
    	border:1px solid #ededed;
		margin:0px auto;
		text-align:center;
    }
    #eventText> textarea{
    	height:500px;
    }
    .ui-datepicker{ font-size: 10px; width: 200px; }
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
	
	.eventBTN{
		margin-bottom:15%;
	}
	#eventInsert #eventImg{
		width:100%;
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
   #eventdateSta{
   	border:none;
   }
   #eventdateEnd{
   	border:none;
   }
   .EventDetail th{
   	text-align:center;
   	margin:0px auto;
   }
   .EventDetail td input{
   	text-align:center;
   }
   #eventdateDetail{
	   	text-align:center;
   }
	#sta{
		width:15%;
		margin:0px auto;
		text-align:center;
	}
	#end{
		width:15%;
		margin:0px auto;
		text-align:center;
	}
	.EVENTDETAIL{
		margin-bottom:6%;
	}
    @media only screen and (max-width: 767px){
    	#pgnameWrap h3{
    		font-size:15px;
    		font-weight:bold;
    	}
    	.ui-datepicker{ font-size: 8px; width: 250px; }
		.ui-datepicker select.ui-datepicker-month{ width:50%; font-size: 12px; }
		.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 12px; }
		.eventDatediv {
	    	width:100%;
	    	font-size:12px;
	    	display:flex;
	    }
	    .eventDatediv p{
	    	width:100%;
	    }
	    .eventDatediv input{
	    	width:100%;
	    	border:1px solid #ededed;
	    	text-align:center;
	    }
	     #eventInsert #eventImg{
	    	width:100%;
	    }
	    #eventdateDetail{
		   	text-align:center;
		   	width:100%;
		   }
		#eventdatePicker{
		   	text-align:center;
		   	width:100%;
		   }
		   #sta{
		width:100%;
		padding:0px auto;
		text-align:center;
	}
	#end{
		width:50%;
		paddding:0px auto;
		text-align:center;
	}
	
    }
 </style>
 
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
   
   <div class="container-fluid text-center">
    <div class="row">
       <div class="col-md-offset-2 col-md-8 EVENTDETAIL">
         <div class="col-md-12 col-sm-12 col-xs-12">
          <br /><br />
			<div id="pgnameWrap">
			  <h3>이벤트</h3>
			</div>
			<br />
         </div>
         <form id="eventEdit" enctype="multipart/form-data" method="post">
         <input type="hidden" name="method" value="put" id="method"/>
         <!-- form이 지원하지않는 put이나 delete로 메소드타입 변경 가능 -->
         <div id="eventInsert" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <!-- <p id="${eventone}"></p> -->
            <table class="table text-left table-bordered EventDetail">
            <thead>
               <tr>
               <form action="/event/" method="delete">
	               	<th class="col-md-2 col-sm-2 col-xs-3">글번호</th>
	               	  <td class="col-md-10 col-sm-10 col-xs-9">
	                     <input type="text" id="eventnum" name="eventnum" value="${eventone[0].eventnum }" readonly="readonly">
	                  </td>
	           </form>
               </tr>   
               <tr>
                  <th class="col-md-2 col-sm-2 col-xs-3">제목</th>
                  <td class="col-md-10 col-sm-10 col-xs-9">
                     <input type="text" id="eventsub" name="eventsub" value="${eventone[0].eventsub }" readonly="readonly">
                  </td>
               </tr>
               <tr>
                  <th>개최기간</th>
                  <td id="when">
                  	<div class="col-md-12 col-sm-12 col-xs-12 eventDatediv">
                  		<p name="eventdate" id="eventdateDetail" readonly="readonly">
                  			<p id="sta">${eventone[0].eventdateSta }</p><input type="hidden" name="eventdateSta" id="datepicker" readonly="readonly" value="${eventone[0].eventdateSta }">~<p id="end">${eventone[1].eventdateEnd }</p><input type="hidden" name="eventdateEnd" id="datepicker2" readonly="readonly" value="${eventone[1].eventdateEnd }">
                  		</p>
                  	</div>
                  </td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td colspan="2" id="eventText" class="col-md-12 text-left">
                  	<div class="col-md-12 col-xs-12">
                  		 <%if(session.getAttribute("user_ctg")!=null){
		int user_ctg = (int)session.getAttribute("user_ctg");
		if(user_ctg == 0 || user_ctg == 1) {
		%>
                  		<div id="fileImg">
                  			<img src="${eventone[0].photoPath}" id="eventBImg" style="width:100%;"/>
                  		</div>
                  		<%} } %>
                  		<div id="fileImg2">
                  			<img src="${eventone[1].photoPath }" id="eventCImg" style="width:100%;"/>
                  		</div>
                  		<textarea class="col-md-12 col-sm-12 col-xs-12" readonly="readonly" type="hidden" name="eventcontent" id="eventcontent" >${eventone[0].eventcontent }
                  		</textarea>
                  	</div>
                  </td>
               </tr>
			<tr id="BannerImgBox">
				  <th class="col-md-2 col-sm-2 col-xs-3">배너이미지</th>
						<th class="col-md-10 col-sm-10 col-xs-9">
				  			<span class="btn btn-default btn-file">이미지찾기<input type="file" class="img" id="eventBanner" name="file"/>
				  			<script>
								$('#eventBanner').change(function(){
									if(this.files && this.files[0]){
										var reader = new FileReader;
										reader.onload=function(data){
											$('#eventBImg').attr("src",data.target.result);
											$('#eventBImg').show();	
											}
										}
									reader.readAsDataURL(this.files[0]);
								});
				  			</script>
				  			</span>
				 		</th>
				  </tr>
				  <tr id="ContentImgBox">
				  <th class="col-md-2 col-sm-2 col-xs-3">내용이미지</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
				  		<span class="btn btn-default btn-file">
				  		이미지 찾기<input type="file" class="img" id="eventContentImg" name="file2"/>
				  		
				  			<script>
								$('#eventContentImg').change(function(){
									if(this.files && this.files[0]){
										var reader = new FileReader;
										reader.onload=function(data){
											$('#eventCImg').attr("src",data.target.result);
											$('#eventCImg').show();	
											}
										}
									reader.readAsDataURL(this.files[0]);
								});
				  			</script>	
				  		</span>	
				  	</th>
				  </tr>
            </tbody>
         </table>
         </div>
        
         <!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
         <div class="col-md-12 col-sm-12 col-xs-12 center eventBTN">
         	<button type="button" onclick="location.href='/event/'" id="backbtn" class="btn btn-default">목록으로</button>
         	 <%if(session.getAttribute("user_ctg")!=null){
		int user_ctg = (int)session.getAttribute("user_ctg");
		if(user_ctg == 0 || user_ctg == 1) {
		%>
         	<button type="button" onclick="editbtn" id="editbtn" class="btn btn-default">수정</button>
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
		        <h4 class="modal-title" id="myModalLabel">이벤트 삭제</h4>
		      </div>
		      <div class="modal-body">
		       	삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" onclick="location.href='/event/delete/${eventone[0].eventnum}'" id="deleteFile" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">이벤트 등록</h4>
		      </div>
		      <div class="modal-body" id="modalContent">
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="modalcancel" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="submit" id="modalok"  class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		<%
	}
	}
	%>
         </form>
         
      </div>
      
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
 $(document).ready(function(){
	 $('#BannerImgBox').hide();
	if($('#eventBanner').val()==null){
		$('#eventBanner').remove();
		$('#BannerImgBox').hide();
	 }
	 if($('#eventContentImg').val()==null){
	    $('#eventContentImg').remove();
	    $('#ContentImgBox').hide();
	 }
	 $('#ContentImgBox').hide();
	 $('#BannerImgBox').hide();
	 //이미지박스 숨기기
	 var Bimg = $('#eventBImg').attr("src").split("_");
	 var Cimg = $('#eventCImg').attr("src").split("_");
	 if(Bimg[2]==""){
			$('#eventBImg').hide();
	 }
	 if(Cimg[2]==""){
		    $('#eventCImg').hide();
	 }
	
	 
	 $('#submitbtn').on('click',function(){
	   		var eventsub = $('#eventsub').val();
	   		var enddate = $('#datepicker2').val();
	   		var Ban = $('#eventBImg').attr("src");
	   		var Con = $('#eventCImg').attr("src");
	   		if(eventsub == '' ||enddate==''||Ban==""||Con==""){
				$('#modalContent').text("내용 입력을 확인해주세요.");
				$('#modalok').hide();
	   			$("#modalcancel").text("확인");
	   	        return ;
	   		}else{
	   			$('#modalContent').text("이벤트 내용을 변경하시겠습니까?");
				$('#modalok').show();
	   			$("#modalcancel").text("취소");
	   	    }
     });
     
     if($('#eventcontent').val()!=""){
		$('#eventcontent').attr("type","text");
     }   

 });
 function SubmitEvent(){
	 $("#insertbtn").click(function(){
		$("#eventEdit").submit();
	 });
 } 
 $(function(){
	$('#resetbtn,#submitbtn').hide();
	$('#editbtn').click(function(){//수정클릭
		$('#editbtn,#deletebtn,#backbtn').hide();//수정삭제돌아가기hide
		$('#resetbtn,#submitbtn').show();//등록취소show
		$('#eventsub, #eventdate, #eventcontent').removeAttr('readonly');
		$('#datepicker').attr("type","text");
		$('#datepicker2').attr("type","text");
		$('#sta').hide();
		$('#end').hide();
		$('#ContentImgBox').show();
		$('#BannerImgBox').show();
	});
	$('#resetbtn').click(function(){
		$('#editbtn,#deletebtn,#backbtn').show();
		$('#resetbtn,#submitbtn').hide();
		$('#eventsub, #eventdate, #eventcontent').attr('readonly');
		$('#datepicker').attr("type","hidden");
		$('#datepicker2').attr("type","hidden");
		$('#sta').show();
		$('#end').show();
		$('#ContentImgBox').hide();
		$('#BannerImgBox').hide();
	});
 });
 $(function() {
	  $( "#datepicker,#datepicker2" ).datepicker({
		  showButtonPanel: true,
		  closeText: '닫기',
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
		    
	  });
	});
 </script>
</html>
