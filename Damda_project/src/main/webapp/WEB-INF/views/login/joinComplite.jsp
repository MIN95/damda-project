<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/resources/template/head.jsp"/>
	<style type="text/css">
	
	.complite{
		text-align:center;
		margin-top:50px;
		margin-bottom:150px;
	}
	
	p{
		margin-bottom:50px;
	}
	
	.table{
		margin-bottom:50px;
	}
	
    .loginbtn{
    	background-color:darksalmon;
    	color:white;
    }
   
    .loginbtn:hover{
    	background-color:darksalmon;
    	color:white;
    }
	</style>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<jsp:include page="/resources/template/header.jsp"/>
	
	<div class="row complite">
	
		<div class="col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
			
		<h2>회원가입이 완료되었습니다.</h2>
		<p>이제 Dam da.의 신선함과 특별한 혜택을 누려보세요!</p>
			
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>${userInfo.userid}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userInfo.username}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${userInfo.userbirth}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${userInfo.userphone}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${userInfo.useraddr1} ${userInfo.useraddr2}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${userInfo.useremail}</td>
				</tr>
			
			</table>
		
		
		<button type="button" class="btn btn-default loginbtn" onclick="location.href='/login/'">로그인하기</button>
		
		</div>
		
		
		
		
	</div>
	
	<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>