<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script type="text/javascript">
    $(document).ready(function() {
    	table_content();
    	reviewCon_sub();
    });

    //리뷰 테이블 클릭이벤트
    function table_content() {
        $("tbody tr").click(function() {
            console.log('클릭이벤트');
            $(this).parents(".custom-table").find(".toggler1").removeClass("toggler1");
            $(this).parents("tbody").find(".toggler").addClass("toggler1");
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
            if(p_val.length>30){
            	p_val = p_val.substring(0, 30) + '...';
            }
            $(td).text(p_val);
        }
    }

	//페이징 이벤트
	function onClickPage(page) {
	   	var select_val = $('.reviewalign').val();
	    console.log('select value: '+select_val);

	   $.ajax({
			url:"/review/customlist?select="+select_val+'&p='+page,
			type:'get',
			data:"",
			success: function(data){
	        	console.log('success');
	        	$('#review_div').load('/review/customlist?select='+select_val+'&p='+page); 
	        	goTop();
	        }
		});

	}

	//화면상단이동
	function goTop(){
		$('html').scrollTop(0);
	}
    </script>
	   <table class="table custom-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th colspan="2">제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th colspan="2">좋아요</th>
	            </tr>
	        </thead>
	        
	        <c:forEach items="${reviewList}" var="reviewList" varStatus="status">
                <c:set var="photoCtg" value="${reviewList.photoCtg }"/>
		        <tbody>
		            <tr class="subTd">
		                <td>${reviewList.reviewNum }</td>
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
		                	<a>
		                		<span id="like${reviewList.reviewNum }" onclick="likeEvent(${reviewList.reviewNum });">♡</span>
		                		<input type="hidden" id="likeColor_${reviewList.reviewNum }" class="likeColor" value="${reviewList.like_status }" readonly="readonly"/>
		                	</a>
		                </td>
		            </tr>
		            <tr class="toggler">
		                <td colspan='7'>
		                <c:if test="${not empty photoCtg}">
		                    <img src="/resources/imgs/${photoCtg}/${reviewList.photoName}" />
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

