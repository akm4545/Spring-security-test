<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<style>
			html,body {
				height: 100%;
			}
			
			body {
				display: -ms-flexbox;
				display: flex;
				-ms-flex-align: center;
				text-align: center;
				align-items: center;
				padding-top: 40px;
				padding-bottom: 40px;
				background-color: #f5f5f5;
			}
			
			.form-signin {
				width: 100%;
				max-width: 330px;
				padding: 15px;
				margin: auto;
			}
			
			.form-signin .checkbox {
				font-weight: 400;
			}
			
			.form-signin .form-control {
				position: relative;
				box-sizing: border-box;
				height: auto;
				padding: 10px;
				font-size: 16px;
			}
			
			.form-signin .form-control:focus {
				z-index: 2;
			}
			
			.form-signin input[type="email"] {
				margin-bottom: -1px;
				border-bottom-right-radius: 0;
				border-bottom-left-radius: 0;
			}
			
			.form-signin input[type="password"] {
				margin-bottom: 10px;
				border-top-left-radius: 0;
				border-top-right-radius: 0;
			}
		</style>
	</head>
	<body>
		<form name="f"class="form-signin" action="<c:url value='/login'/>" method="POST">
			<img src="/resources/img/spring.png" style="width: 200px; height: 95px">
			<h1 class="h3 mb-3 font-weight-normal"></h1>
			<input type="text" name="userid" class="form-control" placeholder="ID" required autofocus>
			<input type="password" name="userpw" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">LOGIN</button>
			<c:if test="${param.err == true}"> <!-- 에러 메세지가 전달되는듯 함 -->
				<p style="color: red">ID와 Password를 확인해주세요.</p>
			</c:if>
			<p class="mt-5 mb-3 text-muted">shxrecord.tistory.com</p>
		</form>
	</body>
</html>