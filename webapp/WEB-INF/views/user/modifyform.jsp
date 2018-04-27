<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<title>회원정보 수정</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
</style>
<body>

	<div id="container">
		
		
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>

		
		<div id="wrapper">
			<div id="content">
				<div id="user">
	
					<form id="join-form" name="modifyform" method="post" action="${pageContext.request.contextPath}/user/modify">

						<input id="no" name="no" type="hidden" value="${vo.no}" />
						
						<label class="block-label" for="name">이름</label>
						<input id="name" name="name" type="text" value="${vo.name}" />
						
						<label class="block-label" for="email">이메일</label>
						<input id="email" name="email" type="text" value="${vo.email}" readonly="readonly"/>
						<strong></strong>
						
						<label class="block-label">패스워드</label>
						<input name="password" type="password" value="" />
						
						<fieldset>
							<legend>성별</legend>
							
							<label>여</label> <input type="radio" name="gender" value="female" ${ vo.gender=="female"?"checked":""} >
							<label>남</label> <input type="radio" name="gender" value="male" ${ vo.gender=="male"?"checked":""} >
						
						</fieldset>
						
						<input type="submit" value="수정완료">
						
					</form>
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div> <!-- /container -->

</body>
</html>
