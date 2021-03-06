<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>mysite</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#submit{font-family: 'Jeju Hallasan', serif;}
</style>
<body>
	<div id="container">
		
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>

		
		
		<div id="content">
			<div id="board">
				<form class="board-form" method="post" action="${pageContext.request.contextPath}/board/modify">
					<input type="hidden" name="no" value= "${vo.no}" >
					<input type="hidden" name="page" value= "${pagerVO.page}" >
					<input type="hidden" name="page_set" value= "${pagerVO.page_set}" >
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value="${vo.title}" ></td>
						</tr>
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content">${vo.content}</textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
						<a href="${pageContext.request.contextPath}/board/getList?page=${pagerVO.page}&page_set=${pagerVO.page_set}">취소</a>
						<input id="submit" type="submit" value="수정">
					</div>
				</form>				
			</div>
		</div>
	</div>	
		<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>