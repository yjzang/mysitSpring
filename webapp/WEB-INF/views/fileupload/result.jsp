<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<title>Mysite</title>

</head>

<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#submit{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;}
</style>
<body>
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="content">
			<div style="margin:50px auto; width:500px;">
				<h1 style="margin-bottom:20px">Upload completed</h1>
				<div class="result-images">
					<img src="${pageContext.request.contextPath}/upload/${vo.saveName}" style="width:500px"><br>
				</div>
				<div class="result-images">
					<img src="${pageContext.request.contextPath}/upload/${vo2.saveName}" style="width:500px"><br>
				</div>
				<div class="result-images">
					<img src="${pageContext.request.contextPath}/upload/${vo3.saveName}" style="width:500px"><br>
				</div>
				<p>
					<a href="${pageContext.request.contextPath}/fileupload/form"> 다시 업로드 하기 </a>
				</p>
			</div>
		</div>


		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
</body>
</html>		
		
