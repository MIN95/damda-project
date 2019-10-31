<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
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
    text-align:center;
    margin: 0px;
    padding: 5px;
    }
    footer .logo-part{
    	height:30%;
    }
    #eventtable{
    	margin-top:3%;
    }
    .eventTH, .eventTD{
    	text-align:center;
    	border:2px solid #ededed;
    }
	#eventtable *{
		text-align:center;
	}
	.banner{
		width:800px;
		height:300px;
		margin:2% auto;
	}
	#eventinputbtn{
			border:1px solid dimgray;
			background-color:salmon;
			border-radius:50px 50px 50px 50px;		
			width:100%;
			color:white;
			font-size:20px;
		}
	#EventInputBtnBox{
		
			margin-top:8%;
			margin-bottom:15%;
	}
	#pagination{
		text-align:center;
		margin:2% auto;
	}
	@media only screen and (max-width:1200px){
		
		#eventinputbtn{
			border:1px solid dimgray;
			background-color:salmon;
			border-radius:50px 50px 50px 50px;		
			width:100%;
			margin:20% auto;
			color:white;
			font-size:20px;
		}
	    .eventTD{
			font-size:15px;
			height:50%;
		}
		.eventTD p{
			margin:0px auto;
		}
		.eventHEAD{
			display:none;
		}
		.eventTR > .eventTD{
			display:flex;
		}
		.banner{
			width:100%;
			height:300px;
		}
	}	
    </style>
    
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
   <div class="row col-md-12">
		<div class="col-md-12 col-sm-12 col-xs-12">
          <br /><br />
			<div id="pgnameWrap">
			  <h3>이벤트</h3>
			</div>
			<br />
         </div>
		<table id="eventtable" class="col-md-8 col-md-offset-2 col-xs-12">
			<thead class="eventHEAD">
				<th class="col-md-8 eventTH">이벤트</th>
				<th class="col-md-4 eventTH">개최기간</th>
			</thead>
			<tbody ><!-- 
				<c:forEach items="${eventlist}" var="eventlist">
					
				</c:forEach>	
				-->		
			</tbody>
		</table>
	</div>
	<div class="row col-md-12 col-xs-12" id="pagination">
	<!-- pagination{s} -->
			<div id="paginationBox">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					    <li value="1"><a href="#" >1</a></li>
					    <li value="2"><a href="#" >2</a></li>
					    <li value="3"><a href="#" >3</a></li>
					  </ul>
					</nav>
			</div>
	</div>	
	<%if(session.getAttribute("user_ctg")!=null){
		int user_ctg = (int)session.getAttribute("user_ctg");
		if(user_ctg == 0 || user_ctg == 1) {
	%>
	<div class="row" id="EventInputBtnBox">
		<div class="col-md-2 col-md-offset-5 col-xs-4 col-xs-offset-4" id="btnbox">
			<button type="button" id="eventinputbtn" onclick="location.href='input' ">이벤트 등록</button>					
		</div>
	</div>
	<%
	}
	}
	%>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
    $(document).ready(function(){
    	var user_ctg = "<%=session.getAttribute("user_ctg") %>";
		if(user_ctg == 0 || user_ctg == 1){
			$('#eventinputbtn').show();
		}
		var num=1;
		var idx = num;
		eventpaging(idx);
    })
	
	//ctg에 따른 페이징
	$("li").click(function(){
			$(".eventTR").remove();
		 	var num = $(this).val();
		 	if(num==0){
				num=1;
			}
		 	idx=num;
		 	eventpaging(idx);
		});
	//페이징
	function eventpaging(idx){
		var values = {};
		$.ajax({
			url:"/event/list",
			type:"GET",
			dataType:"json",
			async:true,
			data:{ 	"idx" :idx
				},
			error:function(){
				alert("통신실패");
				},
			success:function(data){
				console.log("성공"+data);
				values = data;
				var temp="";
			    $.each(values, function(index,eventlist){
			    	temp='<tr class="eventTR">'+
			    	'<td class="eventTD"><div class="col-md-12 col-xs-12 eventIMG">'+
			    	'<a href="/event/detail/'+eventlist.eventnum+'"><img src="'+eventlist.photoPath+'" class="banner" alt=""/></a></div></td>'+
			    	'<td class="eventTd"><p class="when" id="eventdate" name="eventdate">'+eventlist.eventdateSta+'</br>~</br>'+eventlist.eventdateEnd+'</p></td></tr>';
			    	$('#eventtable tbody').append(temp);
				})
			}
		});
	 }
    </script>
</html>
