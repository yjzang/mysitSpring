<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<title>Mysite</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif; text-align : center;}
	
</style>
<body>
	<div id="container">
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>

		<div id="wrapper">
			<div id="content">
				<div id="site-introduction" style="margin : 0 auto;" text-align : center;>
						<img style="width: 300px" id="profile" src="${pageContext.request.contextPath}/assets/images/profile2.png" />
						<h2 id="main">  <br>&emsp;&emsp;&emsp;&emsp; 환영합니다 ,<br/> <br>&emsp; &emsp;&emsp;&emsp;&emsp;&emsp; &emsp; ${authVO.name==null?"손":(authVO.name)}님 <br/></h2>
					
						
						<br>
						
						<br>
					<p>	<br>
						<a href="${pageContext.request.contextPath}/guest" >방명록</a>에 글 남기기
						<br>
					</p>
				</div>
			</div>
		</div>
		
		<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div>
</body>
</html>