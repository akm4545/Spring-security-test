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
			<!-- 
				로그인 뷰의 자동로그인 checkbox <input> 태그에서는 아래와 같이 파라미터 name과 value를 설정해주면 됩니다. 
				스프링 부트에서는 파라미터명과 쿠키 이름을 바꿀 수 있도록 설정을 추가할 수 있는데 스프링 3.0에서는 컨텍스트에서 해당 설정을 할 수 없습니다. 
				나중에 커스터마이징을 하게 되면 바꿀 수 있습니다.
				* name="_spring_security_remember_me"
				* value="True"
			 -->
			<div class="custom-control custom-checkbox mb-1">
				<input type="checkbox" class="custom-control-input" name="remember-me" value="True" id="customCheck1">
				<label class="custom-control-label" for="customCheck1">로그인 유지</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">LOGIN</button>
			<c:if test="${param.err == true}"> <!-- 에러 메세지가 전달되는듯 함 -->
				<p style="color: red">ID와 Password를 확인해주세요.</p>
			</c:if>
			<p class="mt-5 mb-3 text-muted">shxrecord.tistory.com</p>
			<sec:csrfInput/> 
			<!-- CSRF 설정을 적용한 뒤부터는 모든 POST 방식의 데이터 전송에 토큰 값이 있어야 합니다. GET 방식에는 적용되지 않습니다. 만약 POST 전송 데이터에 유효한 Token값이 없다면 권한이 없는 페이지에 접근할 때와 동일하게 에러 페이지로 이동됩니다.  -->
		</form>
	</body>
</html>


<!-- 표현식이 지정한 권한에 맞을 때만 출력 -->
<%-- <sec:authorize access="isAnonymous()">
   로그인
   회원가입
</sec:authorize>

hasRole('role')	해당 권한이 있을 경우
hasAnyRole('role1,'role2')	포함된 권한 중 하나라도 있을 경우
isAuthenticated()	권한에 관계없이 로그인 인증을 받은 경우
isFullyAuthenticated()	권한에 관계없이 인증에 성공했고, 자동 로그인이 비활성인 경우
isAnonymous()	권한이 없는 익명의 사용자일 경우
isRememberMe()	자동 로그인을 사용하는 경우
permitAll	모든 경우 출력함
denyAll	모든 경우 출력하지 않음

현재 인증한 사용자의 정보를 가져오는 태그입니다. 스프링 Security 구조대로 짰다면 손쉽게 태그를 이용해 가져올 수 있습니다. 
아래와 같이 프로퍼티를 principal로 주고 변수에 담아주면 자바 코드에서 getProperty()를 실행한것과 동일합니다. 
즉 사용자 정보를 담고 있는 UserDetails 객체가 반환됩니다.

한줄로 사용자 객체를 받은 뒤에 EL 태그를 사용해서 간략하게 사용할 수 있습니다. 
그냥 이 객체를 세션에 저장해두고 가져다 쓰면 JSP에서의 코드는 더 간단해질 수 있겠지만 서버단의 로직에서는 중복이 발생하기 
때문에 그냥 프레임워크에서 설계해둔대로 사용하는 것이 가장 깔끔합니다.

user라는 변수에 객체를 저장해두겠다는 의미입니다. 
기본 Scope는 페이지 범위로 지정되고, 
범위를 더 넓힐 수는 있지만 어차피 세션에서 가지고 오는 
객체이기 때문에 굳이 그렇게 사용할 이유가 없을 것 같습니다. 

<s:authentication property="principal" var="user"/> 
타입 : ${user} <br>
ID : ${user.username} <br>
PW : ${user.password}
</s:authorize>
 --%>
 