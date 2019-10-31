<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
        #content h2 {
        	clear: both;
            display: block;
            margin: 50px auto 70px auto;
            width: 300px;
        }
		
		#content .imgDiv{
			width: 16%;
			height: auto;
			overflow: hidden;
			display: inline-block;
			margin: 0px;
			padding: 0px;
			border: 0px;
		}
		
		#content .imgDiv img{
			width: 100%;
		}
		
		#content .top10Div{
			border: 1px solid gray;
			display: inline;
			margin: 10px;
			overflow: auto;
		}

		#content .top10Div .photoImg{
			width: 20%;
			float: left;
			margin: 10px;
		}
		#content .top10Div strong{
			margin: 10px;	
			position: relative;
			top: 10px;		
			text-decoration: underline;
		}
		
		#content .top10Div span{
			margin: 10px;	
			position: relative;
			top: 11px;
			font-size: 12px;
		}
		
		#content .top10Div p{
			font-size: 13px;			
		}
		
		#content .top10Div .pDiv{
			width: 75%;
			float: right;
			position: relative;
			top: 20px;
			padding: 0px;
		}
		#content .heartImg{
			width: 12px;
			position: relative;
			top: -1px;
			left: -2px;
		}
		
		#content .empty_div{
			height: 150px;
			clear: both;
		}
		
		#content #reviewP{
			float: right;
			color: black;
			font-size: 13px;
			font-weight: bold;
			margin: 10px 50px 20px auto;
			text-decoration: none;
		}
		
		#content #reviewP:hover{
			color: darksalmon;
		}
		#content h4{
			display: block;
			margin: 5px auto;
			width: 60px;
		}
    </style>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	divHeight();
    });

    $(window).resize(function() {
    	divHeight();
    });
    function divHeight(){
		var width = $('.imgDiv').width();
		console.log('width: '+width);
		$('.imgDiv').css('height',width);
    }
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<div class="col-md-offset-2 col-md-8">
	    <h2>BEST PHOTO REVIEW</h2>
	    <a href="/review/custom" id="reviewP">커스텀샐러드 리뷰 더보기 ›</a>
	    <c:set var="i" value="0"/>
		<c:set var="j" value="6"/>
	    <c:forEach items="${bestList}" var="bestList" varStatus="status">
			<c:if test="${i%j==0 }">
				<div class="row col-md-12 col-sm-12 col-xs-12">
			</c:if>
			    <div class="imgDiv"><img src="/resources/imgs/review/${bestList.photoName}"/></div>
	    	<c:if test="${i%j==j-1 }">
				</div>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	
	<div class="empty_div">　</div>
    <h2>Top10 REVIEW</h2>
    <c:forEach items="${Top10}" var="Top10" varStatus="status">
		<div class="row col-md-11 col-sm-11 col-xs-11 top10Div">
			<h4>Top ${status.count }</h4>
			<strong>${Top10.userName }님의 리뷰</strong><span><img src="/resources/icon/heart.png" class="heartImg"/> ${Top10.recommend } </span>
		    <img src="/resources/imgs/review/${Top10.photoName}" class="photoImg"/> 
		    <div class="pDiv">
			<p>${Top10.reviewCon }</p>
		    </div>
		</div>
	</c:forEach>
	

	</div>
	<div class="empty_div">　</div>
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>