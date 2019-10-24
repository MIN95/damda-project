<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script type="text/javascript">
// 	$(document).ready(function() {
// 		//셀렉트박스 이것만 밖으로 뺌
// 		$('#customTable').hide();
// 		$('.selectcustom, .vegetable, .topping').hide();
// 		$('#pagination').hide();
// 		var selected = $('.selectall').val();
		
// 		all_check();

//         price_setting();

//         check_info();

//         ctg_setting();
        
// 	 });
        //페이징(이전버튼과 다음 버튼 활성화 )
		function fn_prev(page, range, rangeSize){
			var page = ((range-2)*rangeSize)+1;
			var range = range-1;
			var url="/admin/";
			url = url+"?page="+page;
			url = url+"&range="+range;
			location.href=url;
		}
		function fn_next(page, range, rangeSize){
			var page = parseInt((range*rangeSize))+1;
			var range = parseInt(range)+1;
			var url = "/admin/";
			url= url+"?page="+page;
			url = url+"&range="+range;
			location.href=url;
		}
		//페이징 번호클릭(제이쿼리로 클릭하면 이동)
		function fn_pagination(page,range,rangeSize,searchType,keyword){			
			var url="/admin/";
			url = url+"?page="+page;//넘어간페이지번호//이것만 비동기로 넘기면 될듯
			url = url+"&range="+range;//범위?			
			location.href=url;
		}
    </script>
</head>
<body>
<div id="customTable">
				<table class="table custom">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="all_chk3" />
                                <label for="all_chk3"></label>
                            </th>
                            <th>재료번호</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>카테고리</th>
                        </tr>

                    </thead>
                    <tbody>
                        
                        <c:forEach items="${matelist}" var="matelist">
	                        <tr>
	                            <td>
	                                <input type="checkbox" name="chk2" id="custoumNum${matelist.matenum }" />
	                                <label for="custoumNum${matelist.matenum }"></label>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <input class="matenum" type="text" name="matenum${matelist.matenum}" id="matenum${matelist.matenum}" value="${matelist.matenum}" readonly />
	                                </a>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <img id="thImg" src="${matelist.photoPath }" />
	                                </a>
	                            </td>
	                            <td>
	                                <a href="detail/${matelist.matenum}">
	                                    <input type="text" name="mateName${matelist.matenum}" id="mateName${matelist.matenum}" value="${matelist.mateName }" readonly />
	                                </a>
	                            </td>
	                            <td>
	                                <p class="customprice${matelist.matenum}">원</p>
	                                <input type="text" name="customprice${matelist.matenum}" id="customprice${matelist.matenum}" value="${matelist.mateprice }" readonly hidden />
	                            </td>
	                            <td>
	                                <p class="customstatus${matelist.matenum}">상태</p>
	                                <input type="text" name="customstatus${matelist.matenum }" id="customstatus${matelist.matenum }" value="${matelist.salestatus }" readonly hidden />
	                            </td>
	                            <td>
	                                <p class="customCtg${matelist.matenum }">카테</p>
	                                <input type="text" name="customCtg${matelist.matenum }" id="customCtg${matelist.matenum }" value="${matelist.matectg }" readonly hidden />
	                            </td>
	                        </tr>
                        </c:forEach>
                         <tr>
                            <td>
                                <input type="checkbox" id="all_chk4" />
                                <label for="all_chk4"></label>
                            </td>
                            <td colspan="6" class="btn_div" id="btn_div2">
                                <p>전체선택(n/all)</p>
                                <button type="button" class="delete_btn">선택상품 삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

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