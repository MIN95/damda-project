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
			<tbody >
				<c:forEach items="${eventlist}" var="eventlist">
					<tr class="eventTR">
						<td class="eventTD">
							<div class="col-md-12 col-xs-12 eventIMG">
								<a href="/event/detail/${eventlist.eventnum }"><img src="${eventlist.photoPath }" class="banner" alt="" /></a>
							</div>
						</td>
						<td class="eventTD"><p class="when" id="eventdate" name="eventdate">${eventlist.eventdateSta}</br>~</br>${eventlist.eventdateEnd }</p></td>
					</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
	<div class="row col-md-12 col-xs-12" id="pagination">
	<!-- pagination{s} -->
				<nav aria-label="Page navigation" id="pagination">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item">
							<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
							<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item">
							<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
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
    })
    function fn_prev(pate, range, rangeSize){
        var page = ((range-2)*rangeSize)+1;
        var range = range-1;
        var url="/event";
        url=url+"?page="+page;
        url=url+"&range="+range;
        location.href=url;
    }
    function fn_next(page, range, rangeSIze){
        var page = parseInt((range*rangeSize))+1;
        var range = parSeInt(range)+1;
        var url="/event/";
        url= url+"?page="+page;
        url= url+"&range="+range;
        location.href=url;
     }
    function fn_pagination(page, range, rangeSize, searchType, keyword){
        var url="/event/";
        url=url+"?page="+page;
        url=url+"&range="+range;
        location.href=url;
        }
    
    </script>
</html>
