<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<jsp:include page="/resources/template/head.jsp"/>
<style type="text/css">
	#title{
		margin-top: 3%;
        margin-bottom: 3%;
	}
	#title>h1 {
        width: 50%;
        text-align: center;
		margin: 0px auto;
		padding-bottom: 3%;
   	}
   	#custommargin {
   		margin:0px 0px 750px 0px;
   	}
  /* 재료 시작 */
	.custommate{
		border-bottom: 1px solid #ededed;
		margin:0px 0px 30px 0px;
	}
	#ctg{
		width:100%;
	}
	/* 카테고리탭 크기 조정 시작 */
   	#ctglist>li {
		width:33.3%;
   	}
   	#ctglist>li>a {
   		text-align: center;
   		font-weight: bold;
   		color: black;
   	}
   	#ctglist li.active a,
	#ctglist li.active a:focus,
	#ctglist li.active a:hover{
		border-top: 3px solid darksalmon;
		border-right:3px solid #ededed;
	    border-left:3px solid #ededed;
		color:black;
		border-bottom:3px solid white;
		border-radius:20px 20px 0px 0px;
	}
   	/* 카테고리탭 크기 조정 끝 */
   	/* 부카테고리 <야채> 조정 시작 */
   	#vegetasteselect {
   		margin:0px 0px 0px 5px;
   	}
   	#vegetasteselect .selectctgbtn1{
   		background-color:white;
   		border:1px solid white;
    	border-bottom:1px solid #ededed;
    	font-size:12px;
    	font-weight:bold;
    	color:black;
    	width:24%;
    	height:25px;
   	}
   	.customselect {
   		font-size:12px;
   	}
   	/* 부카테고리 조정 끝 */
   	/* 부카테고리 <토핑> 조정 시작 */
   	#toppingselect {
   		margin:0px 0px 0px 20px;
   	}
   	#toppingselect .selectctgbtn2{
    	background-color:white;
    	border:1px solid white;
    	border-bottom:1px solid #ededed;
    	font-size:12px;
    	font-weight:bold;
    	color:black;
    	width:32%;
    	height:25px;
    }
    .select {
    	font-size:12px;
    }
    .selectcheck {
    	font-size:12px;
    }
   	/* 부카테고리 조정 끝 */
	/*이미지 조정*/
	.selectimg{
		width:100%;
		height:80px;
		border:1px solid white;
		cursor: pointer;
		border-radius:5px 5px 5px 5px;
	}
	/*체크박스 센터 조정*/
	.selectcheck{
		margin:5px 0px 5px 0px;
		text-align :center;
	}
	.selectcheck .check_box {
		display: none;
	}
  /* 재료 끝 */
  /* 그릇 시작 */
	.customplate{
		margin:0px 0px 50px 0px;
		height:100%;
	}
	#plateSize {
		text-align: center;
	}
	.customplate #plate {
		margin:20px 0px 0px 0px;
		border-top:1px solid #ededed;
		height:500px;
	}
	.customplate #plate>div{
		height:100%;
	}
	#plate img {
		height:100%;
		width:100%;
	}
	/* 이미지 합치기 */
	#plate {
		position: relative;
	}
	#plateimg1 {
		position: absolute;
		top: 0px;
		left: 0px;
	}
	.plateimg2-1 {
		position: absolute;
		top: 0px;
		left: 0px;
		margin-top: 30px;
		margin-left: 50px;
		height:85%;
		width:85%;
	}
	.plateimg2-2 {
		position: absolute;
		top: 0px;
		left: 0px;
		margin-top: 60px;
		margin-left: 70px;
		height:70%;
		width:70%;
	}
	#plateimg3 {
		position: absolute;
		top: 0px;
		left: 0px;
		margin-top: 30px;
		margin-left: 50px;
		height:87%;
		width:87%;
	}
	#plateimg4 {
		position: absolute;
		top: 0px;
		left: 0px;
		margin-top: 50px;
		margin-left: 50px;
		height:87%;
		width:87%;
	}
  /* 그릇 끝 */
  /* 합계 시작 */
    .summaryTitle {
    	height:50px;
    	border-bottom: 3px dashed darksalmon;
    }
    .summaryTitle>p {
    	text-align: center;
    	line-height: 25px;
    	font-weight: bold;
    	font-size: 20px;
    }
    .summaryContent {
    	border-bottom: 3px dashed darksalmon;
    }
    .summaryContent>div {
    	height:40px;
    	line-height: 40px;
    }
    .customsummaryth {
    	border-bottom: 2px dashed #ededed;
    }
    .customsummaryth>div {
    	margin:0px 0px 0px 20px;
    	font-size: 16px;
    	font-weight: bold;
    }
    .summaryContent .customsummarytd {
    	border-bottom: 1px solid #ededed;
		margin:0px 0px 0px 10px;
    	height:40px;
    }
    .summaryContent .customsummarytd>div:nth-child(3) {
    	text-align: right;	
	}
	/* 재료체크박스 클릭시 myrecipe로 담김 시작 */
	.summaryContent .customsummarytd2 {
		height:65px;
		border-bottom:1px solid #ededed;
	}
	.summaryContent .customsummarytd2>div:nth-child(1) {
		margin:0px 0px 0px 10px;
		height:30px;
	}
	.summaryContent .customsummarytd2>div:nth-child(1)>span {
		border-bottom: 1px solid darksalmon;
		display:inline-block;
		float:left;
		height:30px;
	}
	.summaryContent .customsummarytd2>div:nth-child(1)>p {
		float:right;
		cursor: pointer;
	}
	.summaryContent .customsummarytd2>div:nth-child(2) {
		height:30px;
		display: inline-block;
		float:left;
	}
	/*updown button start*/
	.summaryContent .customsummarytd2>div:nth-child(2)>div:nth-child(1){
		display: inline-block;
		float: left;
	}
	.summaryContent .customsummarytd3>div:nth-child(1) {
		margin:0px 0px 0px 10px;
		height:40px;
		border-bottom: 1px solid #ededed;
	}
	.summaryContent .customsummarytd3>div:nth-child(1)>span:nth-child(2) {
		float:right;
	}
	.summaryContent .customsummarytd3>div:nth-child(1)>span:nth-child(2)>span {
		margin:0px 0px 0px 10px;
		cursor: pointer;
	}
	.updownbuttons {
		float:right;
		height:20px;
		width:88px;
	}
	.updownbuttons>button:nth-child(1) {
		height:18px;
		width:20px;
		background-color: white;
		border:1px solid black;
		margin:10px 0px 0px 0px;
		line-height: 15px;
		display: inline-block;
		float: left;
	}
	.updownbuttons>input {
		height:18px;
		width:35px;
		float: left;
		margin:10px 0px 0px 0px;
		text-align: center;
	}
	.updownbuttons>button:nth-child(3) {
		height:18px;
		width:20px;
		background-color: white;
		border:1px solid black;
		margin:10px 0px 0px 0px;
		line-height: 15px;
		float: left;
	}
	/*updown button end*/
	.summaryContent .customsummarytd2>div:nth-child(3) {
		text-align: right;
		float:left;
		height:18px;
		line-height: 15px;
		margin:-10px 0px 0px 0px; 
	}
	/* 재료체크박스 클릭시 myrecipe로 담김 끝 */
	#summarytotal>div:nth-child(1) {
		font-weight: bold;
		color: darksalmon;
		font-size: 16px;
	}
	#summarytotal>div:nth-child(2) {
		text-align: right;
	}
	#summarybtn_save .save{
    	width:100%;
    	height:30px;
    	font-size:14px;
    	font-weight:bold;
    	border:2px solid #f6bf9f;
    	border-radius:5px 5px 5px 5px;
    	background-color:white;
    	margin:0 auto;
    	margin-bottom:5%;
    }
    #summarybtn_save .save:hover{
    	background-color: #f6bf9f;
    	color:white;
    }
  /* 합계 끝 */
</style>
</head>
<body>
<!-- ***********************************header start*********************************** -->
<jsp:include page="/resources/template/header.jsp"/>
<!-- ***********************************content start*********************************** -->
	<!-- sub start -->
	<div class="container">
	  <div class="col-md-6 col-md-offset-3" id="title">
	  	<br/>
		<h1> CUSTOM SALAD </h1>
	  </div>
	</div>
	<br/>
	<!-- sub end -->
	<!-- content start -->
	<div id="custommargin">
	<div class="col-md-10 col-md-offset-1 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1" id="customcontent">
	  <div class="col-md-3 custommate">
	  	<div class="tab" id="ctg">
	  	  <ul class="nav nav-tabs" id="ctglist">
	  	  	<li class="active" id="vege"><a href="#vegetab" data-toggle="tab">야채</a></li>
			<li id="toppping"><a href="#toppingtab" data-toggle="tab">토핑</a></li>
			<li id="sauce"><a href="#saucetab" data-toggle="tab">소스</a></li>
	  	  </ul>
	  	  <div class="tab-content tab" id="ctgdiv"><!-- move page -->	
	  	  	<div role="tabpane1" class="tab-pane fade in active" id="vegetab">
	  	  	  <br/>
	  	  	  <div class="selectctg" id="vegetasteselect">
	  	  	  	<button class="selectctgbtn1" name="taste" id="vege1">씁쓸한 맛</button>
				<button class="selectctgbtn1" name="taste" id="vege2">아삭한 맛</button>
				<button class="selectctgbtn1" name="taste" id="vege3" >순&nbsp;한 맛</button>
				<button class="selectctgbtn1" name="taste" id="vege4">매&nbsp;운 맛</button>
	  	  	  </div>
	  	  	  <br/>
	  	  	  <c:set var="customindex1" value="${0 }"/>
	  	  	  <c:set var="customindex2" value="${0 }"/>
	  	  	  <c:set var="customindex3" value="${0 }"/>
	  	  	  <c:set var="customindex4" value="${0 }"/>
			  <c:forEach items="${customSelect}" var="customSelect" varStatus="status">
  	  	  	  	<!-- 하나 시작 -->
			  	<c:if test="${fn:substring(customSelect.matectg,0,1) eq 1 }">
  	  	  	  	  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '1-1' }">
			  	  	<c:set var="customindex1" value="${customindex1+1 }"/>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '1-2' }">
			  	  	<c:set var="customindex2" value="${customindex2+1 }"/>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '1-3' }">
			  	  	<c:set var="customindex3" value="${customindex3+1 }"/>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '1-4' }">
			  	  	<c:set var="customindex4" value="${customindex4+1 }"/>
			  	  </c:if>
  	  	  	  	  <!-- ------------------------------------- -->
  	  	  	  	  <c:if test="${customSelect.matectg == '1-1' }">
  	  	  	  	  	<c:if test="${customindex1%3 eq 0 }">
  	  	  	  	  	  <div class="row">
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-2' }">
  	  	  	  	  	<c:if test="${customindex2%3 eq 0 }">
  	  	  	  	  	  <div class="row">
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-3' }">
  	  	  	  	  	<c:if test="${customindex3%3 eq 0 }">
  	  	  	  	  	  <div class="row">
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-4' }">
  	  	  	  	  	<c:if test="${customindex4%3 eq 0 }">
  	  	  	  	  	  <div class="row">
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <!-- ------------------------------------- -->
  	  	  	  	  <c:if test="${customSelect.matectg == '1-1' }">
  	  	  	  	    <div class="col-md-4 col-sm-4 col-xs-4 bitterVege">
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-2' }">
  	  	  	  	    <div class="col-md-4 col-sm-4 col-xs-4 crunchyVege">
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-3' }">
  	  	  	  	    <div class="col-md-4 col-sm-4 col-xs-4 mildVege">
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-4' }">
  	  	  	  	    <div class="col-md-4 col-sm-4 col-xs-4 spicyVege">
  	  	  	  	  </c:if>
  	  	  	  	  <!-- ------------------------------------- -->
  	  	  	      	<div class="customselect">
  	  	    	  	  <img src="${customSelect.photoPath }" alt="" id="imgitem${status.count }" class="selectimg " onclick="imgclick(${status.count})" >
			 	  	  <div class="selectcheck">
			  		  	<input type="checkbox" id="vegecb${status.count }" name="vegechk" class="check_box">
			  		  	<label for="vegecb${status.count }" id="${customSelect.mateprice }" itemctg="${customSelect.matectg }">${customSelect.mateName }</label>
		  	  	  	  </div>
		  	  	  	  <div style="display:none" id="detailimg${status.count }"></div>
  	  	  	      	</div>
  	  	  	  	  <!-- ------------------------------------- -->
  	  	  	  	  <c:if test="${customSelect.matectg == '1-1' }">
  	  	  	  	  	</div>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-2' }">
  	  	  	  	  	</div>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-3' }">
  	  	  	  	  	</div>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-4' }">
  	  	  	  	  	</div>
  	  	  	  	  </c:if>
  	  	  	  	  <!-- ------------------------------------- -->
  	  	  	  	  <c:if test="${customSelect.matectg == '1-1' }">
  	  	  	  	  	<c:if test="${customindex1%3 eq 0 }">
  	  	  	  	  	  </div>
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-2' }">
  	  	  	  	  	<c:if test="${customindex2%3 eq 0 }">
  	  	  	  	  	  </div>
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-3' }">
  	  	  	  	  	<c:if test="${customindex3%3 eq 0 }">
  	  	  	  	  	  </div>
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <c:if test="${customSelect.matectg == '1-4' }">
  	  	  	  	  	<c:if test="${customindex4%3 eq 0 }">
  	  	  	  	  	  </div>
  	  	  	  	  	</c:if>
  	  	  	  	  </c:if>
  	  	  	  	  <!-- ------------------------------------- -->
			  	</c:if>
  	  	  	  	<!-- 하나 끝 -->
		  	  </c:forEach>
	  	  	</div>
  	  	    <div role="tabpane2" class="tab-pane fade" id="toppingtab">
  	  	      <br/>
  	  	      <div class="selectctg" id="toppingselect">
			    <button class="selectctgbtn2" id="maintopping" >고기/햄/생선</button>
	      	  	<button class="selectctgbtn2" id="subtopping">과일/치즈</button>
	   		  	<button class="selectctgbtn2" id="nuts">견과류</button>
  			  </div>
  			  <br/>
	  		  <c:set var="customindex1" value="${0 }"/>
	  		  <c:set var="customindex2" value="${0 }"/>
	  		  <c:set var="customindex3" value="${0 }"/>
		  	  <c:forEach items="${customSelect}" var="customSelect" varStatus="status">
			  	<!-- 시작 -->
			  	<c:if test="${fn:substring(customSelect.matectg,0,1) eq 2}">
			  	  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '2-1' }">
			  	  	<c:set var="customindex1" value="${customindex1+1 }"/>
			  	  </c:if>
		  	  	  <c:if test="${customSelect.matectg == '2-2' }">
			  	  	<c:set var="customindex2" value="${customindex2+1 }"/>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-3' }">
			  	  	<c:set var="customindex3" value="${customindex3+1 }"/>
			  	  </c:if>
			  	  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '2-1' }">
		  		  	<c:if test="${customindex1%3 eq 0 }">
			  	  	  <div class="row">
			  	  	</c:if>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-2' }">
		  		  	<c:if test="${customindex2%3 eq 0 }">
			  	  	  <div class="row">
			  	  	</c:if>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-3' }">
		  		  	<c:if test="${customindex3%3 eq 0 }">
			  	  	  <div class="row">
			  	  	</c:if>
			  	  </c:if>
			  	  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '2-1' }">
			  	  	<div class="col-md-4 col-sm-4 col-xs-4 meatsitem">
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-2' }">
			  	  	<div class="col-md-4 col-sm-4 col-xs-4 fruitsitem">
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-3' }">
			  	  	<div class="col-md-4 col-sm-4 col-xs-4 nutsitem">
			  	  </c:if>
			  	  <!-- ------------------------------------- -->
		  	  	  	<div class="select">
		  	  	  	  <img src="${customSelect.photoPath }" alt="" id="imgitem${status.count }" class="selectimg" onclick="imgclick(${status.count})">
	  	  	  		  <div class="selectcheck">
		  	  	  	  	<input type="checkbox" id="vegecb${status.count }" name="topchk" class="check_box">
		  	  	  	 	<label for="vegecb${status.count}" id="${customSelect.mateprice }" itemctg="${customSelect.matectg }">${customSelect.mateName }</label>
		  	  	  	  </div>
	  	  		  	</div>
		  		  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '2-1' }">
		  	  	  	</div>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-2' }">
		  	  	  	</div>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-3' }">
		  	  	    </div>
			  	  </c:if>
			  	  <!-- ------------------------------------- -->
			  	  <c:if test="${customSelect.matectg == '2-1' }">
		  		  	<c:if test="${customindex1%3 eq 0 }">
			  	  	  </div>
			  	  	</c:if>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-2' }">
		  		  	<c:if test="${customindex2%3 eq 0 }">
			  	  	  </div>
			  	  	</c:if>
			  	  </c:if>
			  	  <c:if test="${customSelect.matectg == '2-3' }">
		  		  	<c:if test="${customindex3%3 eq 0 }">
			  	  	  </div>
			  	  	</c:if>
			  	  </c:if>
			  	  <!-- ------------------------------------- -->
			  	</c:if>
			  	<!-- 끝 -->
	    	  </c:forEach>
  	  	  	</div>
  	  	  	<div role="tabpane3" class="tab-pane fade" id="saucetab">
 	  	      <br/>
			  <c:set var="customindex" value="${0 }"/>
			  <c:forEach items="${customSelect}" var="customSelect" varStatus="status">
				<!-- 시작 -->
				<c:if test="${fn:substring(customSelect.matectg,0,1) eq 3}">
				  <c:set var="customindex" value="${customindex+1 }"/>
		  		  <c:if test="${customindex%3 eq 0 }">
			  	  	<div class="row">
			  	  </c:if>
		   		  <div class="col-md-4 col-sm-4 col-xs-4">
		  	  		<div class="select">
			  	  	  <img src="${customSelect.photoPath }" alt="" id="imgitem${status.count }" class="selectimg" onclick="imgclick(${status.count})">
			  	  	  <div class="selectcheck">
			  	  	  	<input type="checkbox" id="vegecb${status.count }" name="saucechk" class="check_box">
			  	  	  	<label for="vegecb${status.count}" id="${customSelect.mateprice }" itemctg="${customSelect.matectg }">${customSelect.mateName }</label>
			  	  	  </div>
			  	  	</div>
				  </div>
			  	  <c:if test="${customindex%3 eq 0 }">
		  		  	</div>
		  	  	  </c:if> 
				</c:if>
				<!-- 끝 -->
			  </c:forEach>
   		  	</div>
  	  	  </div>
  	  	  <!-- 재료 끝 -->
	  	</div>
	  </div>
	  <!-- 그릇시작 -->
	  <div class="col-md-6 col-sm-12 col-xs-12 customplate">
	  	<div class = "col-md-12 col-xs-12" id="plateSize">
		  <input type="radio" id="size1" class="check_box size" checked="checked" name="radiobox" value="small" onclick="sizeSelect(1)">
	      <label for="size1" id="0">small</label>
	      <input type="radio" id="size2" class="check_box size" name="radiobox" value="middle" onclick="sizeSelect(2)">
	      <label for="size2" id="500">middle</label>
		  <input type="radio" id="size3"class="check_box size" name="radiobox" value="big" onclick="sizeSelect(3)">
		  <label for="size3" id="1000">big</label>
		</div>
		<!-- 이미지 겹치는 곳 시작 -->
	  	<div class="col-md-12 col-xs-12" id="plate">
	  	  <div>
	  	  	<div id="plateimg1">
		  	  <img src="/resources/imgs/plate.png" alt="">
		  	</div>
	  	  	<div class="plateimg2-1">
		  	  <img src="/resources/ingredientnum/custom_rucola_b.png" alt="">
		  	</div>
	  	  	<div class="plateimg2-2">
		  	  <img src="/resources/ingredientnum/custom_chicory_b.png" alt="">
		  	</div>
		  </div>
	  	</div>
	  	<!-- 이미지 겹치는 곳 끝 -->
	  </div>
	  <!-- 그릇끝 -->
	  <!-- 합계 시작 -->
	  <div class="col-md-3 col-sm-12 col-xs-12 customsum">
	  	<div class="col-md-12 com-xs-12" id="summary">
	      <div class="summaryTitle">
			<p>My recipe</p>
	  	  </div>
	  	  <div class="summaryContent">
	  	  	<div class="customsummaryth">
	  	  		<div>크&nbsp;&nbsp;기</div>
	  	  	</div>
	  	  	<div class="customsummarytd" id="platesizechk">
	  	  		<div class="col-md-4 col-sm-4 col-xs-4">small</div>
	  	  		<div class="col-md-4 col-sm-4 col-xs-4"></div>
	  	  		<div class="col-md-4 col-sm-4 col-xs-4"><span>0</span>원</div>
	  	  		<div style="display:none"></div>
	  	  	</div>
	  	  	<div class="customsummaryth" id="platevege">
	  	  		<div>야&nbsp;&nbsp;채</div>
	  	  	</div>
	  	  	<div class="customsummaryth" id="platetopping">
	  	  		<div>토&nbsp;&nbsp;핑</div>
	  	  	</div>
	  	  	<div class="customsummaryth" id="platesauce">
	  	  		<div>소&nbsp;&nbsp;스</div>
	  	  	</div>
	  	  	<div id="summarytotal">
	  	  		<div class="col-md-8 col-sm-8 col-xs-8">총 상품금액&nbsp;〉</div>
	  	  		<div class="col-md-4 col-sm-4 col-xs-4" id="totalp"><span>0</span>원</div>
	  	  	</div>
	  	  </div>
	  	  <!-- 저장,리셋,담기 시작 -->
	  	  <br/><br/>
	      <div class="col-md-12 col-xs-12 nextBtn" id="summarybtn_save"><!-- 버튼기능아직없음-->
		  	<button class="col-xs-12 save" type="button" id="saveMy">마이레시피로 저장</button>
	  	  	<button class="col-xs-12 save" type="button" id="saveCart">장바구니에 담기</button>
	  	  	<button class="col-xs-12 save" type="button" id="Allcancel">
		  	  <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
		  	</button>
		  </div>
		  <!-- 저장,리셋,담기 끝 -->
	    </div>
	  </div>
	  <!-- 합계 끝 -->
	</div>
	</div>
	<!-- content end -->
<!-- ***********************************content end*********************************** -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		//사이즈에 따른 변화
		resized2();
		/* **************************************************************** */
		
		/* **************************************************************** */
		/* 야채 부카테고리에 따른 이미지 보이기 시작 */
		//기본 설정값 >> 씁쓸한맛 선택
		$('.crunchyVege').css('display','none');
		$('.mildVege').css('display','none');
		$('.spicyVege').css('display','none');
		//버튼 클리되면 css 바꾸기
		$('#vege1').css('border-bottom','2px solid darksalmon');

		//씁쓸한 맛 클릭 시
		$('#vege1').click(function(){
			$('.selectctgbtn1').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.bitterVege').css('display','');
			$('.crunchyVege').css('display','none');
			$('.mildVege').css('display','none');
			$('.spicyVege').css('display','none');
		});
		//아삭한 맛 클릭 시
		$('#vege2').click(function(){
			$('.selectctgbtn1').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.bitterVege').css('display','none');
			$('.crunchyVege').css('display','');
			$('.mildVege').css('display','none');
			$('.spicyVege').css('display','none');
		});
		//순한 맛 클릭 시
		$('#vege3').click(function(){
			$('.selectctgbtn1').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.bitterVege').css('display','none');
			$('.crunchyVege').css('display','none');
			$('.mildVege').css('display','');
			$('.spicyVege').css('display','none');
		});
		//매운 맛 클릭 시
		$('#vege4').click(function(){
			$('.selectctgbtn1').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.bitterVege').css('display','none');
			$('.crunchyVege').css('display','none');
			$('.mildVege').css('display','none');
			$('.spicyVege').css('display','');
		});
		/* 야채 부카테고리에 따른 이미지 보이기 끝 */
		/* **************************************************************** */
		/* 토핑 부카테고리에 따른 이미지 보이기 시작 */
		//기본 설정값 >> 고기/햄/생선 선택
		$('.fruitsitem').css('display','none');
		$('.nutsitem').css('display','none');
		//버튼 클리되면 css 바꾸기
		$('#maintopping').css('border-bottom','2px solid darksalmon');

		//고기/햄/생선 클릭 시
		$('#maintopping').click(function(){
			$('.selectctgbtn2').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.meatsitem').css('display','');
			$('.fruitsitem').css('display','none');
			$('.nutsitem').css('display','none');
		});
		//과일/치즈 클릭 시
		$('#subtopping').click(function(){
			$('.selectctgbtn2').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.meatsitem').css('display','none');
			$('.fruitsitem').css('display','');
			$('.nutsitem').css('display','none');
		});
		//고기/햄/생선 클릭 시
		$('#nuts').click(function(){
			$('.selectctgbtn2').css('border-bottom','1px solid #ededed');
			$(this).css('border-bottom','2px solid darksalmon');
			$('.meatsitem').css('display','none');
			$('.fruitsitem').css('display','none');
			$('.nutsitem').css('display','');
		});
		
		/* 토핑 부카테고리에 따른 이미지 보이기 끝 */
		/* **************************************************************** */
		/* 리셋 시작 */
		$('#Allcancel').click(function(){
   			$('.customsummarytd2').remove();
   			$('#totalp').text('0원');
   			$('input[type="checkbox"]').attr("checked",false);
   			$('#size1').prop("checked",true);
   			sizeSelect(1);
   			$('.selectimg').css('background-color','white');
   		});
		/* 리셋 끝 */
		/* **************************************************************** */
	}); /* document end ---------------------- */

	/****************사이즈 조정 시작*******************/
	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#plate').css('height','350px');
            }else if(windowWidth < 1000){
            	$('#plate').css('height','550px');
            }else{
            	$('#plate').css('height','600px');
            }
    }
    /*****************사이즈 조정 끝*******************/
    
	var arraylist=[];//장바구니
	var arraynum=[]; //수량

	/* 이미지 클릭 시 체크박스 체크되기 시작*/
	function imgclick(num) {
		var inputid="#vegecb"+num;
		var imgitem = "#imgitem"+num;
		var labelfor = "label[for='vegecb"+num+"']";
		var labelitemctg=$(labelfor).attr('itemctg');//item price

		//야채 카테고리임
		if(labelitemctg.substring(0,1) == "1"){
			if($(inputid).is(":checked")){
				$(inputid).prop("checked",false);
				$(imgitem).css('background-color','white');
				var vegechk = $('input:checkbox[name=vegechk]:checked').length;
				//그릇에 이미지 제거
			}else{
				$(inputid).prop("checked",true);
				$(imgitem).css('background-color','#ededed');
				//체크된 개수
				var vegechk = $('input:checkbox[name=vegechk]:checked').length;
				if(vegechk > 3){
					alert('3개 넘어감');
					$(imgitem).css('background-color','white');
					$(inputid).prop("checked",false);
				}
				//그릇에 이미지 쌓아짐
				startAjax(num);
			}
		//소스 카테고리임	
		}else if(labelitemctg.substring(0,1) == "3"){
			if($(inputid).is(":checked")){
				$(inputid).prop("checked",false);
				$(imgitem).css('background-color','white');
				var vegechk = $('input:checkbox[name=vegechk]:checked').length;
				//그릇에 이미지 제거
				startAjax(num);
			}else{
				$(inputid).prop("checked",true);
				$(imgitem).css('background-color','#ededed');
				//체크된 개수
				var saucechk = $('input:checkbox[name=saucechk]:checked').length;
				if(saucechk > 3){
					alert('3개 넘어감');
					$(imgitem).css('background-color','white');
					$(inputid).prop("checked",false);
				}
				//그릇에 이미지 쌓아짐
				startAjax(num);
			}
		//토핑 카테고리임
		}else{
			if($(inputid).is(":checked")){
				$(inputid).prop("checked",false);
				$(imgitem).css('background-color','white');
				//그릇에 이미지 제거
			}else{
				$(inputid).prop("checked",true);
				$(imgitem).css('background-color','#ededed');
				//체크된 개수
				var topchk = $('input:checkbox[name=topchk]:checked').length;
				if(topchk > 5){
					alert('5개 넘어감');
					$(imgitem).css('background-color','white');
					$(inputid).prop("checked",false);
				}
				//그릇에 이미지 쌓아짐
				startAjax(num);
			}
		}
		//myrecipe에 쌓아짐
		item_click(num);
	}
	/* 이미지 클릭 시 체크박스 체크되기 끝*/
	
	/* 그릇 쌓아짐 시작 */
	/* function plateImgPlus(customMap,num){
		var customMap = customMap;
		console.log(customMap);
		 $.each(customMap, function(photoPath, value){
             alert(photoPath +" : " + value);        
         });
	} */
	/* 그릇 쌓아짐 끝 */
	
	function startAjax(num){
		var customMap = {};
		var data = {"matenum": num};
		$.ajax({
			url:"/custom/",
			type:"POST",
			data:data,
			cache : false,
			dataType: "text",
			traditional : true,
			success:function(data){
				console.log(data);
				customMap = data;
				console.log(customMap.photoPath);
				/* plateImgPlus(customMap,num); */
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	/* 야채 아이템 체크시 myrecipe에 추가 끝 */
	function item_click(num){
		var id="#vegecb"+num;
	   	if($(id).is(":checked")){
	 		var idarray = id.split('#');
			var inputId = idarray[1];
	   		var labeltext =$('label[for='+inputId+']').text(); //item name
			var labelid = $('label[for='+inputId+']').attr('id');//item price
			var pricecomma = addComma(labelid);
  			var itemctg = $('label[for='+inputId+']').attr('itemctg');

	  		if(itemctg.substring(0,1) == "1"){
		  		var vegecount = $('.vegecount');
		  		var vegediv1 = '<div class="customsummarytd3 vegecount" id="'+num+'"><div><span>';
		  		var vegediv2 = '</span><span>'+pricecomma+'원<span onclick="delitem('+num+')">X</span></span></div>';
		  		var vegediv3 = '<div style="display:none;">';
		  		var vegediv4 = '원</div></div>';
		  		/* var vegediv1 = '<div class="customsummarytd2 vegecount" id="'+num+'"><div><span>';
		  		var vegediv2 = '</span><p onclick="delitem('+num+')">X</p></div><div class="col-md-8 col-sm-8 col-xs-8"></div><div class="col-md-4 col-sm-4 col-xs-4"><span>';
		  		var vegediv3 = '</span>원</div><div style="display:none;">';
		  		var vegediv4 = '원</div></div>' */
		  		/* $('#platevege').after(vegediv1+labeltext+vegediv2+pricecomma+vegediv3+labelid+vegediv4); */
		  		$('#platevege').after(vegediv1+labeltext+vegediv2+vegediv3+labelid+vegediv4);
		  		totalprice();
    		}
			if(itemctg.substring(0,1) == "2"){
				var toppingdiv1 = '<div class="customsummarytd2" id="'+num+'"><div><span>';
		   		var toppingdiv2 = '</span><p onclick="delitem('+num+')">X</p></div><div class="col-md-8 col-sm-8 col-xs-8"><div>개수 : </div><div class="updownbuttons">';
		   		var toppingdiv3 = '<button onclick="pricedown('+num+')">-</button><input type="text" value="1" readonly="readonly" id="itemea" name="itemea"/><button onclick="priceup('+num+')">+</button></div></div>';
		   		var toppingdiv4 = '<div class="col-md-4 col-sm-4 col-xs-4"><span>';
				var toppingdiv5 = '</span>원</div><div style="display:none;">';
				var toppingdiv6 = '원</div><input type="hidden" id="originalprice'+num+'" value="'+labelid+'"/></div>';
				$('#platetopping').after(toppingdiv1+labeltext+toppingdiv2+toppingdiv3+toppingdiv4+pricecomma+toppingdiv5+labelid+toppingdiv6);
				totalprice();
			}if(itemctg.substring(0,1) == "3"){
				var saucecount = $('.saucecount')
				var saucediv1 = '<div class="customsummarytd3 saucecount" id="'+num+'"><div><span>';
				var saucediv2 = '</span><span>'+pricecomma+'원<span onclick="delitem('+num+')">X</span></span></div>';
		  		var saucediv3 = '<div style="display:none;">';
		  		var saucediv4 = '원</div></div>';
				/* var saucediv1 = '<div class="customsummarytd3 saucecount" id="'+num+'"><div><span>';
		  		var saucediv2 = '</span><p onclick="delitem('+num+')">X</p></div><div class="col-md-8 col-sm-8 col-xs-8"></div><div class="col-md-4 col-sm-4 col-xs-4"><span>';
		  		var saucediv3 = '</span>원</div><div style="display:none;">';
		  		var saucediv4 = '원</div></div>'; */
				$('#platesauce').after(saucediv1+labeltext+saucediv2+saucediv3+labelid+saucediv4);
				totalprice();
			}
		}else if($(id).is(":checked")==false){//체크해제됐을때
			$('div[id="'+num+'"]').remove();
			arraylist.splice(arraylist.indexOf(num),1);
			arraynum.splice(arraynum.indexOf(num),1); 
		}
   	}
   	/* 야채 아이템 체크시 myrecipe에 추가 끝 */
	
	/* X버튼 누를 시 없어짐 시작 */
	function delitem(num) {
		var id="#vegecb"+num;
		var imgitem = "#imgitem"+num
		$('div[id="'+num+'"]').remove();
		$(id).prop("checked",false);
		$(imgitem).css('background-color','white');
	}
	/* X버튼 누를 시 없어짐 끝 */

	/* 합계 변동 시작 */
   	function totalprice(){
   		var priceSplit1 = $('.customsummarytd>div:nth-child(4)').text().split("원");//각 가격
   		var priceSplit2 = $('.customsummarytd2>div:nth-child(4)').text().split("원");//각 가격
   		var priceSplit3 = $('.customsummarytd3>div:nth-child(2)').text().split("원");//각 가격
   		var priceSplitNumber1 = [];
   		var priceSplitNumber2 = [];
   		var priceSplitNumber3 = [];
   		var totalp1=0;//0
   		var totalp2=0;//0
   		var totalp3=0;//0
   		
   		for(var i=0;i<priceSplit1.length-1;i++){	
   			priceSplitNumber1.push(Number(priceSplit1[i]));
   			totalp1+=priceSplitNumber1[i];
   		}
   		for(var i=0;i<priceSplit2.length-1;i++){	
   			priceSplitNumber2.push(Number(priceSplit2[i]));
   			totalp2+=priceSplitNumber2[i];
   		}
   		for(var i=0;i<priceSplit3.length-1;i++){	
   			priceSplitNumber3.push(Number(priceSplit3[i]));
   			totalp3+=priceSplitNumber3[i];
   		}
   		var realtotalp = totalp1+totalp2+totalp3;
   		realtotalp = addComma(realtotalp);
   		$('#totalp').text(realtotalp+"원");
   	}
   	/* 합계 변동 시작 */
	
	/* -버튼 클릭시 시작 */
	function pricedown(num){
		//아이템 개수 가져오기
		var td2id = '#' + num;
		var itemeas = td2id + ">div:nth-child(2)>div:nth-child(2)>input";
		var itemea = $(itemeas).val();
		if(itemea == "1"){
			return false;
		}
		itemea *= 1;
		itemea = itemea - 1;
		$(itemeas).val(itemea);
		var cnt = $(itemeas).val();
		var originalprices="#originalprice"+num;
		var originalprice = $(originalprices).val();
		originalprice *= 1;
		var realprice = originalprice * cnt;
		//값 저장
		var saveprice = td2id + ">div:nth-child(4)";
		$(saveprice).text(realprice+"원");
		realprice = addComma(realprice);
		$('div[id="'+num+'"]>div:nth-child(3)>span').text(realprice);
		totalprice();
	}
	/* -버튼 클릭시 끝 */
	/* +버튼 클릭시 시작 */
	function priceup(num){
		//아이템 개수 가져오기
		var td2id = '#' + num;
		var itemeas = td2id + ">div:nth-child(2)>div:nth-child(2)>input";
		var itemea = $(itemeas).val();
		itemea *= 1;
		itemea = itemea + 1;
		$(itemeas).val(itemea);
		var cnt = $(itemeas).val();
		var originalprices= '#originalprice'+num;
		var originalprice = $(originalprices).val();
		originalprice *= 1;
		var realprice = originalprice * cnt;
		//값 저장
		var saveprice = td2id + ">div:nth-child(4)";
		$(saveprice).text(realprice+"원");
		realprice = addComma(realprice);
		$('div[id="'+num+'"]>div:nth-child(3)>span').text(realprice);
		totalprice();
	}
	/* +버튼 클릭시 끝 */
	
	/* 그릇선택시 바뀜 시작 */
	function sizeSelect(num){
		var sizeId="#size"+num;
		var sizeidarray = sizeId.split('#');
   		var sizeInput = sizeidarray[1];//size1
   		var labeltext =$('label[for='+sizeInput+']').text();//small
		var plateprice;

		if($(sizeId).is(":checked")){
			//사이즈에 따른 가격 배정
			if(labeltext == "small"){
				plateprice = 0;
			}else if(labeltext == "middle"){
				plateprice = 500;
			}else if(labeltext == "big"){
				plateprice = 1000;
			}
			$('#platesizechk>div:nth-child(4)').text(plateprice+"원");
			plateprice = addComma(plateprice);
			$('#platesizechk>div:nth-child(1)').text(labeltext);
			$('#platesizechk>div:nth-child(3)').text(plateprice+"원");
			
			totalprice();
		}
	}
	/* 그릇선택시 바뀜 끝 */
	
	/* 3자리수마다 콤마 시작*/
	function addComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	/* 3자리수마다 콤마 끝*/
</script>
</html>