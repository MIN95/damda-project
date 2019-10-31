<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
		#content h3{
			width: 140px;
			display: block;
			margin: 50px auto;
		}
		
		#content table{
			border-top: 2px solid darksalmon;
			border-bottom: 2px solid darksalmon;			
		}
		
		#content select{
			border: 0px;		
		}
		
		#content .empty_div{
			height: 50px;
		}
		
        #content .pagination>li>a {
            color: black;
        }

        #content .pagination>li>a:hover {
            font-weight: bold;
        }
        
        #content #empty_div{
			height: 150px;
			clear: both;
		}
    </style>
	<script type="text/javascript">
	//itemalign ajax
	function itemAlign() {
		//allitem, custom
		var item = $('.itemalign').val();
		console.log('item: '+item);
		
	   	var select_val = $('.reviewalign').val();
	    console.log('select value: '+select_val);

	   if(item == 'allitem'){
		   $.ajax({
				url:"/admin/allitem?select="+select_val,
				type:'get',
				data:"",
				success: function(data){
		        	//console.log('success');
		        	$('#review_div').load('/admin/allitem?select='+select_val); 
		        }
			});
	   }else if(item == 'custom'){
		   $.ajax({
				url:"/admin/custom?select="+select_val,
				type:'get',
				data:"",
				success: function(data){
		        	//console.log('success');
		        	$('#review_div').load('/admin/custom?select='+select_val); 
		        }
			});
		}
	}

	</script>
</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<!-- content start -->
	<h3>리뷰관리</h3>
	<div class="col-md-offset-2 col-md-8">
	<select class="col-md-offset-7 col-md-2 col-sm-offset-7 col-sm-2 col-xs-offset-7 col-xs-2 itemalign" onchange="itemAlign();">
		<option value="allitem">완제품</option>
		<option value="custom">커스텀</option>
	</select>
    <select class="col-md-offset-1 col-md-2 col-sm-3 col-xs-3 reviewalign" onchange="itemAlign();">
        <option value="reviewnum">최근등록순</option>
        <option value="recommend">좋아요많은순</option>
        <option value="adminselect">관리자추천</option>
    </select>
    <div class="empty_div">　</div>
    <div id="review_div">
		<jsp:include page="adminReviewList.jsp"/>
    </div>
	</div>
	
	<div id="empty_div">　</div>
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>