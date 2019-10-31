<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
		#content table {
			font-size: 12px;
		}
		
		#content table .delete_img{
			width: 25px;
			cursor: pointer;
		}
		
		#content table .reviewImg{
			width: 80%;
			display: block;
			margin: 10px auto;
		}	
		
		#content table .bestBtn{
			cursor: pointer;
			border: 1px solid darksalmon;
			background-color: white;
			font-size: 10px;
		}
		
		#content table .bestBtn:hover{
			background-color: darksalmon;
			color: white;
		}
		
		#content table th:nth-child(1){
			width: 7%;
		}
		
		#content table th:nth-child(2){
			width: 20%;
		}
		
		#content table th:nth-child(3){
			width: 25%;
		}
		
		#content table th:nth-child(4){
			width: 10%;
		}
		
		#content table th:nth-child(5){
			width: 15%;

		}
		
		#content table th:nth-child(6){
			width: 10%;

		}
		
		#content table th:nth-child(7){
			width: 7%;
		}
		
		#content table th:nth-child(8){
			width: 6%
		}

		#content table td:nth-child(3){
			width: 20%;
		}
		
		#content table td:nth-child(4){
			width: 5%
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

</style>

<script type="text/javascript">
$(document).ready(function() {
	console.log("관리자 리뷰페이지 List");
	table_content();
	reviewCon_sub();
	bestSetting();
});

//리뷰 테이블 클릭이벤트
function table_content() {
    $("tbody tr").click(function() {
        console.log('클릭이벤트');
        $(this).parents(".custom-table").find(".toggler1").removeClass("toggler1");
        $(this).parents("tbody").find(".toggler").addClass("toggler1");
        //$(this).parents(".custom-table").find(".fa-minus-circle").removeClass("fa-minus-circle");
        //$(this).parents("tbody").find(".fa-plus-circle").addClass("fa-minus-circle");
    });
}

//review content -> sub 출력해오기
function reviewCon_sub() {
    var length = $('tbody').length + 1;

    for (var i = 1; i < length; i++) {
        var p_class = ".tbody_p" + i;
        var p_id = $(p_class).attr('id');
        var p = '#' + p_id;
        var td = '.' + p_id;
        var p_val = $(p).text().trim();
        if(p_val.length>10){
        	p_val = p_val.substring(0, 10) + '...';
        }
        $(td).text(p_val);
    }
} 

//페이징 이벤트
function onClickPage(page) {
	//allitem, custom
	var item = $('.itemalign').val();
	console.log('item: '+item);
	
   	var select_val = $('.reviewalign').val();
    console.log('select value: '+select_val);

   if(item == 'allitem'){
	   $.ajax({
			url:"/admin/allitem?select="+select_val+'&p='+page,
			type:'get',
			data:"",
			success: function(data){
	        	console.log('success');
	        	$('#review_div').load('/admin/allitem?select='+select_val+'&p='+page); 
	        	goTop();
	        }
		});
   }else if(item == 'custom'){
	   $.ajax({
			url:"/admin/custom?select="+select_val+'&p='+page,
			type:'get',
			data:"",
			success: function(data){
	        	console.log('success');
	        	$('#review_div').load('/admin/custom?select='+select_val+'&p='+page); 
	        	goTop();
	        }
		});
	}
}

//화면상단이동
function goTop(){
	$('html').scrollTop(0);
}

//엑스표시로 리뷰 삭제
function deleteReview(num){
	//allitem, custom
	var item = $('.itemalign').val();
	console.log('item: '+item);
	
   	var select_val = $('.reviewalign').val();
    console.log('select value: '+select_val);

    var page = $('#page').val();
    console.log('page: '+ page);
	
    $.ajax({
		url:"/admin/reviewdelete?reviewnum="+num,
		type:'post',
		data:"",
		success: function(data){
        	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
        	//window.location.reload();
       	  if(item == 'allitem'){
        	$('#review_div').load('/admin/allitem?select='+select_val+'&p='+page); 
          }else if(item == 'custom'){
        	$('#review_div').load('/admin/custom?select='+select_val+'&p='+page); 
       	  }
        }
	});
}

function bestPick(num){
	//allitem, custom
	var item = $('.itemalign').val();
	console.log('item: '+item);
	
   	var select_val = $('.reviewalign').val();
    console.log('select value: '+select_val);

    var page = $('#page').val();
    console.log('page: '+ page);

    var msg = '#bestBtn'+num
    var bestCheck = $(msg).val();
    console.log('bestCheck: '+bestCheck);
    if(bestCheck == 0){
	 $.ajax({
			url:"/admin/reviewpick?reviewnum="+num,
			type:'post',
			data:"",
			success: function(data){
	        	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
	        	//window.location.reload();
	       	  if(item == 'allitem'){
	        	$('#review_div').load('/admin/allitem?select='+select_val+'&p='+page); 
	          }else if(item == 'custom'){
	        	$('#review_div').load('/admin/custom?select='+select_val+'&p='+page); 
	       	  }
	        }
		});
    }else if(bestCheck == 1){
    	$.ajax({
			url:"/admin/reviewpickcancel?reviewnum="+num,
			type:'post',
			data:"",
			success: function(data){
	        	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
	        	//window.location.reload();
	       	  if(item == 'allitem'){
	        	$('#review_div').load('/admin/allitem?select='+select_val+'&p='+page); 
	          }else if(item == 'custom'){
	        	$('#review_div').load('/admin/custom?select='+select_val+'&p='+page); 
	       	  }
	        }
		});
    }

    bestSetting();
}

function bestSetting(){

	var bestBtnId=[];
	$('input[name=bestBtn]').each(function(){
		bestBtnId.push(this.id);
	});

    console.log('bestBtnId id배열 : '+bestBtnId);

    var length = $('input[name=bestBtn]').length;
    console.log('length: '+length);
    
    //중복검사
    for (var i = 0; i < length; i++) {
        var msg = '#' + bestBtnId[i];
        var msg2 = '.' + bestBtnId[i];
        var bestCheck = $(msg).val();
        console.log(bestCheck);
        if(bestCheck==1){
			$(msg2).css('background-color','darksalmon').css('color','white');
		}
		//.css('border','1px solid darksalmon').css('font-size','10px')
		//else if(bestCheck==0){
		//	$(msg2).css('background-color','white').css('color','gray').css('border','1px solid darksalmon').css('font-size','10px');
		//}
    } 
	
}
</script>
<input type="hidden" name="page" id="page" value="${page }"/>

	    <table class="table custom-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>상품명</th>
	                <th colspan="2">제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>추천수</th>
	                <th>베스트</th>
	                <th>삭제</th>
	            </tr>
	        </thead>
	        
	        <c:forEach items="${reviewList}" var="reviewList" varStatus="status">
                <c:set var="photoCtg" value="${reviewList.photoCtg }"/>
			    <tbody>
		        	<tr>
		                <td>${reviewList.reviewNum }</td>
		                <c:set var="itemName" value="${reviewList.itemName }"/>
		                <c:if test="${not empty itemName}">
		                <td>${itemName }</td>
		                </c:if>
		                <c:if test="${empty itemName}">
		                <td>[커스텀]샐러드 No.${reviewList.r_customNum }</td>
		                </c:if>
		                <td class="${reviewList.reviewNum }">제목 </td>
		                <c:if test="${not empty photoCtg}">
		                <td><img src="/resources/icon/imgadd.png" class="clipImg"/></td>
		                </c:if>
		                <c:if test="${empty photoCtg}">
		                <td>　</td>
		                </c:if>
		                <td>${reviewList.userName }</td>
		                <td>${reviewList.date }</td>
		                <td>${reviewList.recommend }</td>
		                <td>
		                	<button class="bestBtn${reviewList.reviewNum } bestBtn" onclick="bestPick(${reviewList.reviewNum });">베스트</button>
		                	<input type="hidden" name="bestBtn" id="bestBtn${reviewList.reviewNum }" value="${reviewList.adminSelect }"/>
		                </td>
		                <td>
		                	<img alt="deleteimg" src="/resources/icon/x.png" class="delete_img" onclick="deleteReview(${reviewList.reviewNum });" />
		                </td>
		            </tr>
		            <tr class="toggler">
		                <td colspan='9'>
		                <c:if test="${not empty photoCtg}">
		                    <img src="/resources/imgs/${photoCtg}/${reviewList.photoName}" class="reviewImg"/>
		                </c:if>
		                    <p id="${reviewList.reviewNum }" class="tbody_p${status.count }">
		                       	 ${reviewList.reviewCon }
		                    </p>
		                </td>
		            </tr> 
			    </tbody>
	        </c:forEach>
	    </table>
	    
	    
	    
	    <div class="col-md-offset-4 col-md-5 col-sm-offset-4 col-sm-5 col-xs-offset-2 col-xs-8">
	        <ul class="pagination">
		        <li><a onclick = "onClickPage(0);" aria-label="Previous">&laquo;</a></li>
		        
		        <!-- 현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
		        <c:choose>
		        <c:when test="${p <= 0 }">
		        <li class="disabled"><a href="#">‹</a></li>
		        </c:when>
		        <c:otherwise>
		        <li><a onclick = "onClickPage(${p-1 });">‹</a></li>	        
		        </c:otherwise>
		        </c:choose>
		        
		        <!-- 해당하는 페이지로 갈 수 있는 버튼 -->
		        <c:forEach var="i" begin="0" end="${totalpage}">
		        <li><a onclick = "onClickPage(${i });">${i+1 }</a></li>
		        </c:forEach>
		        
		        <!-- 현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
		        <c:choose>
		        <c:when test="${p >= totalpage }">
		        <li class="disabled"><a href="#">›</a></li>
		        </c:when>
		        <c:otherwise>
		        <li><a onclick = "onClickPage(${p+1 });">›</a></li>
		        </c:otherwise>
		        </c:choose>
		        
		        <li><a onclick = "onClickPage(${totalpage });" aria-label="Next">&raquo;</a></li>
		    </ul>
	    </div>

