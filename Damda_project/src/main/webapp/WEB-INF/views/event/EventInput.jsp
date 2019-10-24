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
    #pgnameWrap {
    height: 45px;
    width:200px;
    margin: 0 auto;
    }
    #pgnameWrap h3 {
    margin: 0px;
    padding: 5px;
    }
    footer .logo-part{
    	height:25%;
    }
	#eventsub{
	    border:0px;
	    width: 100%;
	    resize: none;
    }
    .eventDate>*{
    	z-index:99;
    }
    .eventDatediv p{
    	display:inline-block;
    	width:100%;
    }
    .eventDatediv input{
    	display:inline-block;
    	width:30%;
    	border:1px solid #ededed;
    	text-align:center;
    }
    #eventContent{
    	width:100%;
    	height:100px;
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
   .EVENTINPUT{
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
	    }
	    .eventDatediv p{
	    	display:flex;
	    	width:100%;
	    }
	    .eventDatediv input{
	    	display:flex;
	    	width:30%;
	    	border:1px solid #ededed;
	    	text-align:center;
	    }
	    #eventInsert #eventImg{
	    	width:100%;
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
       <div class="col-md-offset-2 col-md-8 EVENTINPUT">
          <div class="col-md-12 col-sm-12 col-xs-12">
          <br /><br />
			<div id="pgnameWrap">
			  <h3>이벤트 등록</h3>
			</div>
			<br />
         </div>
         <form id="eventINPUT" enctype="multipart/form-data" action="/event/" method="post">
         <div id="eventInsert" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered">
            <thead>   
               <tr>
                  <th class="col-md-2 col-sm-2 col-xs-3">제목</th>
                  <th class="col-md-10 col-sm-10 col-xs-9">
                     <input type="text" id="eventsub" name="eventsub" value="" placeholder="제목을 입력해주세요">
                  </th>
               </tr>
               <tr>
                  <th>개최기간</th>
                  <th id="when">
                  	<div class="col-md-10 col-sm-10 col-xs-9 eventDatediv">
                  		<p name="eventdate" id="eventdate">
	                  		<input type="text" id="datepicker" name="eventdateSta" eadonly="readonly" value=""> ~ <input type="text" name="eventdateEnd" id="datepicker2" readonly="readonly" value="">
                  		</p>
                  	</div>
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
               		<td colspan="2" id="eventText" class="col-md-12 text-left">
               			<div class="col-md-12 col-xs-12">
               				<div id="fileImg">
                  				<img src="" id="eventBImg" style="width:100%;"/>
                  			</div>
                  		</div>
               		</td>
               </tr>
               <tr>
                  <td colspan="2" id="eventText" class="col-md-12 text-left">
                  	<div class="col-md-12 col-xs-12">
                  		<div id="fileImg2">
                  			<img src="" id="eventCImg" style="width:100%;"/>
                  		</div>
                  		<textarea class="col-md-12 col-sm-12 col-xs-12" type="text" name="eventcontent" id="eventcontent"></textarea>
                  	</div>
                  </td>
               </tr>
				  <tr>
				  <th class="col-md-2 col-sm-2 col-xs-3">배너이미지</th>
						<th class="col-md-10 col-sm-10 col-xs-9  bannerName">
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
				  <tr>
				  <th class="col-md-2 col-sm-2 col-xs-3">내용이미지</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
				  		<span class="btn btn-default btn-file">
				  		이미지 찾기<input type="file" class="img" id="eventContent" name="file2"/>
				  			<script>
								$('#eventContent').change(function(){
									if(this.files && this.files[0]){
										var reader = new FileReader;
										reader.onload=function(data){
											$('#eventCImg').attr("src",data.target.result);
											$('#eventCImg').show();	
											$('#eventContent').next().text($('#eventCImg').attr("src"));
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
         	<button type="button" id="backbtn" onclick="location.href='/event/'" class="btn btn-default">목록으로</button>
         	<button type="button" id="okBtn"  data-toggle="modal" data-target="#myModal" class="btn btn-default">등록</button>
         </div>
         <!--------------------------------------------------------------------------------------------------------------------->
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">이벤트 게시글 등록</h4>
		      </div>
		      <div class="modal-body" id="modalContent">
		       	내용을 등록하시겠습니까?
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
      
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
 $(document).ready(function(){
	 $('#eventBImg').hide();
	 $('#eventCImg').hide();
	 $('#okBtn').on('click',function(){
	   	 var eventsub = $('#eventsub').val();
	   		var enddate = $('#datepicker2').val();
	   		var Ban = $('#eventBImg').attr("src");
	   		var Con = $('#eventCImg').attr("src");
	   		if(eventsub == '' ||enddate==''){
				$('#modalContent').text("내용입력을 확인해주세요.");
				$('#modalok').hide();
	   			$("#modalcancel").text("확인");
	   	        return ;
	   		}else if(Ban==""||Con==""){
	   			$('#modalContent').text("배너사진과 내용사진의 첨부를 확인해주세요.");
				$('#modalok').hide();
	   			$("#modalcancel").text("확인");
	   	        return ;
			}else{
	   			$('#modalContent').text("이벤트 내용을  등록하시겠습니까?");
				$('#modalok').show();
	   			$("#modalcancel").text("취소");
	   	    }
     });
	 $("#eventBanner").on('change', function() {
	      var filename = $('#eventBanner').val().split('/').pop().split('\\').pop();  // 파일명만 추출
	      // 썸네일 추출한 파일명 삽입(값이 있어야 src에 업로드한 파일이 삽입됨)
	      $('#eventBImg').val(filename);
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('#eventBImg').attr("src",data.target.result);
					$('#eventBImg').show();	 
				}
	        }
	        reader.readAsDataURL(this.files[0]);
	   });
     
	});
 function SubmitEvent(){
	 $("#insertBtn").click(function(){
		$("#eventINPUT").submit();
	 });
 }
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
	  var currentDate = new Date();  
	  $("#datepicker, #datepicker2").datepicker("setDate",currentDate);
	  var eventdate = $('#datepicker').val()+"~"+$('#datepicker2').val();
	});
 </script>
</html>
