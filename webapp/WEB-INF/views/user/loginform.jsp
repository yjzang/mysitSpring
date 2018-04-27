<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<title>Insert title here</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#fail{color:red; line-height : 150%;}
	#submit{font-family: 'Jeju Hallasan', serif;}
</style>

<script type="text/javascript">
		<c:if test="${param.state=='write_logoff'||param.state=='mod_logoff'||param.state=='del_logoff'}">
			alert("로그인이 필요한 서비스입니다.");
		</c:if>
</script>

<body>

	<div id="container">
		
	
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>
	
		
		<div id="wrapper">
			<div id="content">
				<div id="user">
					
					<form id="login-form" name="loginform" method="post" action="${pageContext.request.contextPath}/user/login">
					
						<input type="hidden" name="state" value=${param.state==null?"":param.state} /> 
						<input type="hidden" name="no" value=${param.no==null?"":param.no} /> 
						
						
						<label class="block-label" for="email">이메일</label> 
						<input id="email" name="email" type="text" value=""> 

						<label class="block-label">패스워드</label> 
						<input name="password" type="password" value="">
						
						
								<c:if test="${param.result=='fail'}">	
								<P id="fail">로그인에 실패했습니다. <br> 다시 입력해 주세요</P>
								</c:if>
	
						<input type="submit" id="submit" value="로그인" >
					</form>
					
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
	</div>
	<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>