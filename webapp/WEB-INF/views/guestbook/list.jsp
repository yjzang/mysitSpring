<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.vo.GuestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/assets/css/guestbook.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<title>방명록</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;}
	#submit{font-family: 'Jeju Hallasan', serif;}
</style>
<body>

	<div id="container">
		
	<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>

		
		
		<div id="wrapper">
			<div id="content">
				<div id="guestbook">
					
					<form action="${pageContext.request.contextPath}/guest/add" method="post">
						
						<table>
							<tr>
								<td>이름</td><td><input type="text" name="name" /></td>
								<td>비밀번호</td><td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td colspan=4><textarea name="content" id="content"></textarea></td>
							</tr>
							<tr>
								<td colspan=4 align=right><input id="submit" type="submit" VALUE=" 확인 " /></td>
							</tr>
						</table>
					</form>
					<ul>
						<li>
						<c:forEach items="${list}" var="vo">
							<table>
								<tr>
									<td>${vo.no}</td>
									<td>${vo.name}</td>
									<td>${vo.date}</td>
									
									<td><a href="${pageContext.request.contextPath}/guest/deleteform?no=${vo.no}">삭제</a></td>
								</tr>
								<tr>
									<td colspan=4>
									<pre id="content">${vo.content}</pre>
									</td>
								</tr>
							 </table>
							<br>
						 </c:forEach>
						</li>
					</ul>
					
				</div><!-- /guestbook -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
	
	<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
	</div> <!-- /container -->

</body>
</html>