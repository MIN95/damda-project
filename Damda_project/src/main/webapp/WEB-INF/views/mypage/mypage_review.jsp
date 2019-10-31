<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css" />
<jsp:include page="/resources/template/head.jsp"/>
<jsp:include page="/resources/template/mypage_head.jsp"/>
<style type="text/css">
        /*content area************************************/
        #content #content_content h3 {
            width: 100px;
        }

        #content #content_content small {
            width: 200px;
            display: block;
            margin-right: auto;
            margin-left: auto;
        }

        #content #content_content .item_info {
            padding: 10px;
        }

        #content #content_content .item_info strong {
            margin-left: 10px;

        }

        #content #content_content .item_info p {
            width: 60%;
            display: inline-block;
            font-size: 12px;
            margin-top: 5px;
            margin-left: 10px;
        }

        #content #content_content .form-group p {
            display: inline-block
        }

        #content #content_content .reviewbtn {
            border-radius: 0px;
            background-color: darksalmon;
            color: white;
            float: right;
            position: relative;
            top: -20px;
        }
        
		#content #content_content .addImg{
			width: 100%;
		}
		
		#content #content_content .addImg img{
			width: 100%;
		}
		
        .wrap span {
            float: right;
            position: relative;
            top: -20px;
            left: -10px;
        }

        #counter {
            border-radius: 0.5em;
            padding: 0 .5em 0 .5em;
            font-size: 0.90em;
        }

        /*modal***************************************************/
        #content .modal .modal-title {
            color: darksalmon;
        }

        #content .modal .modal-dialog {
            width: 400px;
        }

        #content .modal .modal-body {
            text-align: center;
        }

        #content .modal .modal-footer {
            background-color: #f7f7f9;

        }

        #content .modal .m_btn_div {
            width: 250px;
            display: block;
            margin: 0px auto;
        }

        #content .modal .btn {
            border-radius: 0px;
            width: 120px;
            border: 1px solid #f1d0bd;
        }

        #content .modal .btn-primary {
            background-color: #f1d0bd;
        }

        #content .modal .btn-default {
            background-color: white;
        }

        #content .modal .btn:hover {
            border: 1px solid darksalmon;
            background-color: darksalmon;
            color: white;
        }
        
</style>
<script type="text/javascript">
	$(document).ready(function() {
		textArea();

		//이미지 미리보기
	 	$("#reviewPhoto").on('change', function() {
	        var filename = $('#reviewPhoto').val().split('/').pop().split('\\').pop();  // 파일명만 추출
	        console.log(filename);
	        // 썸네일 추출한 파일명 삽입(값이 있어야 src에 업로드한 파일이 삽입됨)
	       
	  		if(this.files && this.files[0]) {
	  			var reader = new FileReader;
	  			reader.onload = function(data) {
	  				$("#addReviewPhoto").attr("src", data.target.result);  
	  			}
	          }
	          reader.readAsDataURL(this.files[0]); 
	     });
	});

	//글자수 확인
	function textArea() {
        $(function() {
            $('#reviewcontent').keyup(function(e) {
                var content = $(this).val();
                $('#counter').html(content.length);
            });
            $('#reviewcontent').keyup();
        });
    }

	//글자수에 따른 이벤트
    function textCheck(num) {
        var content_length = $('#reviewcontent').val().length;
        console.log('아이템 번호: ' + num);
        console.log('글자수 : ' + content_length);
        if (content_length < 50) { //글자수 모자르다 모달띄우기
            $('#textModal').modal('show');
        } else if (content_length >= 50) { //입력처리하기
            reviewSubmit(num);
        }
    }

    //리뷰등록 ajax
    function reviewSubmit(num){
        console.log('리뷰등록할거야');
        var reviewcontent = $('#reviewcontent').val();
        if(reviewcontent.length == 0){
        	reviewcontent = '';
        }
        var formData = new FormData();
        formData.append("photofile", $("#reviewPhoto")[0].files[0]);
        formData.append("reviewCon", reviewcontent);
        formData.append("r_itemNum", num);
        
        console.log('reviewcontent : '+reviewcontent);
        console.log('formData : '+formData);
        console.log('num : '+num);
		
       	 $.ajax({
    		url:"/mypage/detail/review",
    		type:'post',
    		processData: false,
            contentType: false,
            data: formData,
    		success: function(data){
            	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
            }
    	}); 

      	var itemNum = $('#itemNum').val();
     	if(itemNum != null){
	        window.location.href="/mypage/detail/${itemInfo.o_ordernum }";
      	}else if(itemNum == null){
	        window.location.href="/mypage/detail/${customInfo.o_ordernum }";
        }
    }
/* 
		if(num<99991){//아이템일때
             console.log('아이템일때');
	       	 $.ajax({
	    		url:"/mypage/detail/review",
	    		type:'post',
	    		processData: false,
                contentType: false,
                data: formData,
	    		success: function(data){
	            	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
	            }
	    	}); 
		    	
        }else if(num>=99991){//커스텀일때
             console.log('커스텀일때');
        	 $.ajax({
	    		url:"/mypage/detail/review",
	    		type:'post',
	    		processData: false,
                contentType: false,
                data: formData,
	    		success: function(data){
	            	console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
	            }
	    	}); 
        }  
    }
        */

  
</script>
</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li class="active_menu">
                        <a href="/mypage/"><p class="active_menu">주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
                    </li>
                    <li>
                        <a href="/mypage/myrecipe"><p>마이 레시피</p></a>
                    </li>
                    <li>
                        <a href="/mypage/qna"><p>문의 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/userinfo"><p>개인 정보 수정</p></a>
                    </li>
                </ul>
            </div>
            
            
			<div id="content_content" class="col-md-6">
                <h3>리뷰작성</h3><small>받아보신 상품 리뷰를 작성해주세요.</small>
                <div class="line_div" style="margin-top: 5px; border-top: 2px solid darksalmon;">　</div>
                
                <c:set var="itemInfo" value="${itemInfo}" />
				<c:if test="${not empty itemInfo}">
	                <div class="img_div" style="width: 20%; display: inline-block; float: left;"><img src="/resources/imgs/${itemInfo.photoCtg }/${itemInfo.photoName }" style="width: 100%;"/></div>
	                <div class="form-group item_info">
	                    <strong>${itemInfo.itemName }</strong><br />
	                    <input type="hidden" name="itemNum" id="${itemInfo.itemNum }" value="${itemInfo.itemNum }" />
	                    <p>
	                       	 수량: ${itemInfo.o_ea }개<br/>
	                    </p>
	                    <input type="hidden" id="itemNum" value="${itemInfo.itemNum }"/>
	                </div>			
				</c:if>

				<c:set var="customInfo" value="${customInfo}" />
				<c:if test="${not empty customInfo}">
	                <div class="img_div" style="width: 20%; display: inline-block; float: left;"><img src="/resources/imgs/${customInfo.photoCtg }/${customInfo.photoName }" style="width: 100%;"/></div>
	                <div class="form-group item_info">
	                    <strong>[커스텀] 샐러드 No.${customInfo.cstmtNum }</strong><br />
	                    <input type="hidden" name="customNum" id="${customInfo.cstmtNum }" value="${customInfo.cstmtNum }" />
	                    <p>
	                      	  수량: ${customInfo.o_ea }개<br />
	           				 ${customInfo.cstmMatelist }
	                    </p>
	                </div>			
				</c:if>

                <div class="line_div" style="margin-top: 5px; border-top: 2px solid darksalmon; clear: both;">　</div>
                
                <div class="form-group wrap">
                	<div class="addImg">
	                	<img id="addReviewPhoto" src=""/>                	
                	</div>
                    <textarea class="form-control" id="reviewcontent" rows="12" style="resize: none;"></textarea>
                    <span id="counter">###</span>
                </div>
                
                <div class="form-group">
                    <label for="reviewPhoto">파일 업로드</label>
                    <input type="file" name="reviewPhoto" id="reviewPhoto" />
                    <p class="help-block">포토리뷰 작성시 더 많은 포인트를 얻을 수 있습니다</p>
                    
	                <c:set var="itemInfo" value="${itemInfo}" />
					<c:if test="${not empty itemInfo}">
	                    <button class="btn btn-lg reviewbtn" onclick="textCheck(${itemInfo.itemNum});">리뷰등록하기</button>
	                </c:if>
	                
	                <c:set var="customInfo" value="${customInfo}" />
					<c:if test="${not empty customInfo}">
	                    <button class="btn btn-lg reviewbtn" onclick="textCheck(${customInfo.cstmtNum});">리뷰등록하기</button>
					</c:if>				
                </div>

                <div class="empty_div" style="height: 100px;">　</div>
            </div>


            <!-- Modal start -->
            <div class="modal fade" id="textModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">알림메세지</h4>
                        </div>
                        <div class="modal-body">
                            <br /><br />
                            작성글 50자 미만으로 포인트 적립 제한이 있을 수 있습니다.<br />
                            그래도 등록하시겠습니까?
                            <br /><br /><br />
                        </div>
                        <div class="modal-footer">
                            <div class="m_btn_div">
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                <c:set var="itemInfo" value="${itemInfo}" />
								<c:if test="${not empty itemInfo}">
	                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="reviewSubmit(${itemInfo.itemNum});">확인</button>
				                </c:if>
                                <c:set var="customInfo" value="${customInfo}" />
								<c:if test="${not empty customInfo}">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="reviewSubmit(${customInfo.cstmtNum});">확인</button>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal end -->

<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>