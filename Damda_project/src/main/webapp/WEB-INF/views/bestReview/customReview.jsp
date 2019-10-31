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
            width: 250px;
        }
		
		#content #empty_div{
			height: 150px;
			clear: both;
		}
		
		#content ul {
            padding-left: 15px;
        }

        #content li {
            font-size: 11px;
        }

        #content select {
            border: 0px;
            float: right;
            font-size:12px;
            margin: 20px auto;
        }

        #content table {
            font-size: 13px;
            border-bottom: 1px solid darksalmon;
            border-top: 2px solid darksalmon;
        }

        #content table tr:nth-child(2n-1) {
            text-align: center;
        }

        #content table tr:nth-child(2n) {
            text-align: left;
        }

        #content table tr th {
            text-align: center;
        }

        #content table tr th:nth-child(1) {
            width: 10%;
        }

        #content table tr th:nth-child(2) {
            width: 45%;
        }

        #content table tr th:nth-child(3) {
            width: 15%;
        }

        #content table tr th:nth-child(4) {
            width: 20%;
        }

        #content table tr th:nth-child(5) {
            width: 5%;
            text-align: left;
        }

        #content table tr td:nth-child(3) {
            width: 5%;
        }
        #content table tr td:nth-child(7) {
            width: 5%;
        }
        
        #content table tr td:nth-child(2){
        	text-align: left;
        }

		#content table .subTd{
			height: 52px;
			line-height: 52px;
		}
		
		#content table .subTd td{
			line-height: 30px;
		}
		
        #content  table img {
            width: 60%;
            display: block;
            margin: 10px auto;
        }

        #content table p {
        	width: 80%;
            display: block;
            margin: 10px auto;
        }
        
 		#content table a{
 			text-decoration: none;
 			color: black;
 			font-weight: bold;
 		}
 		
        #content table .toggler {
            display: none;
        }

        #content table .toggler1 {
            display: table-row;
        }

		#content table .clipImg{
			width: 15px;
		}
        #content .list_div{
        	margin-bottom: 50px;
        }

        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }
        
    </style>
    
    <script type="text/javascript">
  	//itemalign ajax
	function itemAlign() {
		//allitem, custom
	   	var select_val = $('.reviewalign').val();
	    console.log('select value: '+select_val);
	    
	   $.ajax({
			url:"/review/customlist?select="+select_val,
			type:'get',
			data:"",
			success: function(data){
	        	//console.log('success');
	        	$('#review_div').load('/review/customlist?select='+select_val); 
	        }
		});

	}
    </script>
</head>
<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<div class="col-md-offset-2 col-md-8">
	    <h2>CUSTOM REVIEW</h2>
	    <select class="col-md-offset-10 col-md-2 col-sm-offset-9 col-sm-3 col-xs-offset-9 col-xs-3 reviewalign" onchange="itemAlign();">
	        <option value="reviewnum">최근등록순</option>
	        <option value="recommend">좋아요많은순</option>
	    </select>
		<div id="review_div">
			<jsp:include page="customReviewList.jsp"/>
		</div>

	</div>
	<div id="empty_div">　</div>
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>