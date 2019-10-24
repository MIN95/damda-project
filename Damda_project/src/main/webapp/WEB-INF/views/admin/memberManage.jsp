<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp" />
<style type="text/css">
/*modal start***************************************************/
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

#content .modal .modal-footer {
	margin: 0 auto;
	text-align: center;
}
/*modal end***************************************************/
#content {
	margin-top: 50px;
}

#content #admin_list input[type="radio"] {
	position: relative;
	top: 2px;
}

#content #admin_list label {
	margin-right: 20px;
	font-weight: 100;
}

#content #admin_list select {
	font-size: 14px;
	width: 150px;
}

#content #admin_list .select_div {
	margin-bottom: 20px;
}

/*checkbox_start*/
#content #admin_list input[type="checkbox"] {
	display: none;
}

#content #admin_list input[type="checkbox"]+label {
	display: inline-block;
	width: 17px;
	height: 17px;
	background: white;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid #cccccc;
}

#content #admin_list input[type="checkbox"]:checked+label {
	background: url(/resources/icon/check.png) darksalmon no-repeat center/15px
		15px;
	border: 0px;
}

/*checkbox_end*/
#content #admin_list table {
	border-top: 2px solid darksalmon;
	border-bottom: 2px solid darksalmon;
	font-size: 12px;
}

#content #admin_list table th {
	height: 32px;
}

/*체크박스*/
#content #admin_list th:nth-child(0) {
	width: 1%;
}
/*회원번호*/
#content #admin_list th:nth-child(2) {
	width: 7%;
}

/*ID*/
#content #admin_list th:nth-child(3) {
	width: 9%;
}

/*이름*/
#content #admin_list th:nth-child(4) {
	width: 7%;
}

/*생일*/
#content #admin_list th:nth-child(5) {
	width: 9%;
}

/*E-mail*/
#content #admin_list th:nth-child(6) {
	width: 7%;
}

/*연락처*/
#content #admin_list th:nth-child(7) {
	width: 8%;
}

/*주소*/
#content #admin_list th:nth-child(8) {
	width: 16%;
}

/*계좌번호*/
#content #admin_list th:nth-child(9) {
	width: 16%;
}

/*구매금액*/
#content #admin_list th:nth-child(10) {
	width: 7%;
}

/*적립금*/
#content #admin_list th:nth-child(11) {
	width: 7%;
}

/*등급*/
#content #admin_list th:nth-child(12) {
	width: 6%;
}

#content  #admin_list table .update_btn {
	width: 40px;
	height: 20px;
	background-color: white;
	border: 1px solid darksalmon;
	color: darksalmon;
}

#content #admin_list table .delete_btn, #registerAdmin {
	width: 100px;
	height: 30px;
	background-color: white;
	border: 1px solid darksalmon;
	color: darksalmon;
}

#content #admin_list .addbtn_div {
	margin: 10px auto;
	width: 350px;
	float: right;
	margin-bottom: 80px;
}

#content #admin_list .add_btn {
	border: 1px solid darksalmon;
	background-color: darksalmon;
	color: white;
	width: 150px;
	height: 40px;
	font-size: 17px;
	display: inline-block;
	margin-left: 10px;
}

#content #admin_list table a {
	color: black;
	text-decoration: none;
}

#content #admin_list table input {
	border: 0px;
	width: 100%;
}

#content #admin_list table .btn_div p {
	display: inline-block;
	margin-right: 10px;
}

/* km  */
/*아이템페이지 버튼 */
#content .pagination>li>a {
	color: black;
}

#content .pagination>li>a:hover {
	font-weight: bold;
}

.item {
	margin-bottom: 0px;
}

.loadTr .markAdd {
	margin-left: 2px;
}
</style>
</head>
<body>
	<jsp:include page="/resources/template/header.jsp" />
	<!--start-->
	<div id="admin_list"
		class="col-md-offset-1 col-md-10 col-sm-12 col-xs-12">
		<div class="col-md-12 col-sm-12 col-xs-12"
			style="margin-bottom: 10px; padding: 0;">
			<select id="selectCtg" name="category">
				<option id="user" value="2">회원</option>
				<option id="admin" value="1">관리자</option>
			</select> <select id="selectGrade" name="userGrade" style="margin-left: 3px;">
				<option value="all">all</option>
				<option value="family">family</option>
				<option value="silver">silver</option>
				<option value="gold">gold</option>
				<option value="vip">vip</option>
			</select>
			<button type="button" id="registerAdmin"
				style="float: right; display: none;">관리자등록</button>
		</div>
		<div id="userTable">
			<!--  load table through by jquery  -->
		</div>
	</div>
	<!--Delete Modal confirm -->
	<div class="modal" id="confirmModal"
		style="display: none; z-index: 1050;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body text-center" id="confirmMessage">
					<br /> <br />
					<h4>
						<p>msg</p>
					</h4>
					<br /> <br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="confirmOk"
						style="color: darksalmon; background-color: #fff">확인</button>
					<button type="button" class="btn btn-default" id="confirmCancel"
						style="color: darksalmon; background-color: #fff">취소</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="pageInfo" value="1" />
	<!-- ------------------------------------------------------------------------------------------------------- -->
	<!--end-->
	<jsp:include page="/resources/template/footer.jsp" />
</body>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var user_ctg = "${user_ctg}"
		if (user_ctg != null) {
			if (user_ctg == 0) {
				$("#registerAdmin").show();
			}
		}
		$("#selectCtg").change();
		var myModal = $("#confirmModal");
		$("#confirmCancel").on("click", function() {
			myModal.modal("hide");
		});
	});
	//관리자 등록(페이지이동)
	$("#registerAdmin").on('click', function() {
		window.location.href = "/admin/adminregister";
	});
	//회원 등급 셀렉트박스 등장+모든 회원 불러오기
	$("#selectCtg").on('change', function() {
		var page = 1;
		selectCtg = $("#selectCtg").val();
		selectGrade = "all";
		if (selectCtg == 2) {
			$("#selectGrade").css("display", "inline-block");
			selectUser(selectCtg, selectGrade, page);
		} else {
			$("#selectGrade").css("display", "none");
			selectUser(selectCtg, selectGrade, page);
		}
		check_info();
	});
	//회원등급에 따라 회원 불러오기
	$("#selectGrade").on('change', function() {
		page = 1;
		selectCtg = $("#selectCtg").val();
		selectGrade = $("#selectGrade").val();
		selectUser(selectCtg, selectGrade, page);
	});
	//회원리스트 가져오기  
	function selectUser(selectCtg, selectGrade, page) {
		$('#userTable').load('callUserList', {
			'category' : selectCtg,
			'userGrade' : selectGrade,
			'page' : page
		}, function() {
			check_info();
			gradeChk();
			all_check();
		});
	}
	//페이지 클릭
	$(document).on('click', "#pageBtn a", function() {
		selectCtg = $("#selectCtg").val();
		selectGrade = $("#selectGrade").val();
		if ($(this).attr("id") == "prevPage") {
			page = "${pageMaker.startPage}" - 1;
		} else if ($(this).attr("id") == "nowPage") {
			page = $(this).text();
		} else if ($(this).attr("id") == "nextPage") {
			page = "${pageMaker.endPage }" + 1;
		}
		$("#pageInfo").val(page);
		selectUser(selectCtg, selectGrade, page);

	});

	//회원 선택삭제 or 전체삭제
	$(document).on('click', '.delete_btn', function() {
		$("#confirmCancel").show();
		var deleteList = [];
		var userNum = 0;
		$('input[name=chk]').each(function(index) {
			if ($(this).is(":checked") == true) {
				userNum = $(this).parents("td").next().text();
				deleteList.push(userNum);
			}
		});
		var delCount = deleteList.length;
		if (delCount > 0) {
			myModal = $("#confirmModal");
			myModal.modal("show").css('top', '35%');
			$("#confirmMessage p").text(delCount + "명의 회원을 정말 삭제하시겠습니까?");
			$("#confirmOk").click(function() {
				myModal.modal("hide");
				selectCtg = $("#selectCtg").val();
				selectGrade = $("#selectGrade").val();
				page = $("#pageInfo").val();
				var deleteUser = {
					"deleteList" : deleteList
				}
				$.ajax({
					type : "POST",
					url : "/admin/deleteUserList",
					data : deleteUser,
					dataType : "JSON",
					success : function(data) {
						if (data == 1) {
							alert("삭제성공");
							selectUser(selectCtg, selectGrade, page);
						} else {
							alert("삭제실패");
						}
						//클릭되어있는 페이지를 다시클릭
					},
					error : function(xhr, status, error) {
						console.log("에러발생");
					}
				});
			});
		} else {
			myModal = $("#confirmModal");
			myModal.modal("show").css('top', '35%');
			$("#confirmCancel").hide();
			$("#confirmMessage p").text("선택한 항목이 없습니다");
			$("#confirmOk").on("click", function() {
				myModal.modal("hide");
			});
		}
	});
	//선택 개수, 전체 개수
	$(document).on('click', 'input[name=chk]', function() {
		check_info();
	});
	function check_info() {
		var chk_length = $('input[name=chk]:checkbox:checked').length;
		var td_length = $('tbody tr').length - 1; //맨아래 버튼행 빼고 계산
		var str = '전체선택 (' + chk_length + '/' + td_length + ')';
		$('.btn_div p').html(str);
	}

	//전체 선택
	function all_check() {
		$('#all_chk1').click(function() {
			if ($('#all_chk1').is(':checked')) {
				$('input[name=chk], #all_chk2').prop('checked', true);
			} else {
				$('input[name=chk], #all_chk2').prop('checked', false);
			}
		});
		$('#all_chk2').click(function() {
			if ($('#all_chk2').is(':checked')) {
				$('input[name=chk], #all_chk1').prop('checked', true);
			} else {
				$('input[name=chk], #all_chk1').prop('checked', false);
			}
		});

		$('#all_chk3').click(function() {
			if ($('#all_chk3').is(':checked')) {
				$('input[name=chk2], #all_chk4').prop('checked', true);
			} else {
				$('input[name=chk2], #all_chk4').prop('checked', false);
			}
		});

		$('#all_chk4').click(function() {
			if ($('#all_chk4').is(':checked')) {
				$('input[name=chk2], #all_chk3').prop('checked', true);
			} else {
				$('input[name=chk2], #all_chk3').prop('checked', false);
			}
		});

		$('input[type=checkbox]').click(function() {
			check_info();
		});
	}
	//회원등급따라 아이콘 달아주기,버튼 색 바꾸기
	function gradeChk() {
		var tdLength = $("tr").length;
		$('.loadTr')
				.each(
						function(index) {
							var userGrade = $("table tbody tr:eq(" + index
									+ ") td:last");
							if (userGrade.text() == "vip") {
								userGrade
										.append('<i class="markAdd fas fa-trophy" style="color:#FF8138;"></i>');
							} else if (userGrade.text() == "gold") {
								userGrade
										.append('<i class="markAdd fas fa-award" style="color:#E5AE00;"></i>');
							} else if (userGrade.text() == "silver") {
								userGrade
										.append('<i class="markAdd fas fa-award" style="color:#D0D2D1;"></i>');
							} else if (userGrade.text() == "family") {
								userGrade
										.append('<i class="markAdd fas fa-award" style="color:#DA8A67;"></i>');
							} else if (userGrade.text() == "staff") {
								userGrade
										.append('<i class="markAdd fas fa-crown" style="color:#E5AE00;"></i>');
							}
						})
		page = $("#pageInfo").val();
		$("#pageBtn a").css("color", "#333333");
		$('.pages').each(function(index, item) {
			var clickPage = $(item).text();
			console.log(clickPage);
			if (page == clickPage) {
				$(item).css("color", "darksalmon");
			}
		});
	}
</script>
</html>