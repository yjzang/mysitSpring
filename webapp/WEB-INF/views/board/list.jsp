
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>


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
	#fail{color:red;}
	#submit{font-family: 'Jeju Hallasan', serif;}
</style>
<script type="text/javascript">

	<c:if test="${param.result=='fail'}">
		alert("글쓴이만 삭제가 가능합니다.");
	</c:if>
	<c:if test="${param.result=='succ'}">
		alert("해당 글이 삭제되었습니다.");
	</c:if>
	<c:if test="${param.result=='search_fail'}">
		alert("찾는 글이 없습니다.");
	</c:if>
	<c:if test="${param.result=='search_empty'}">
		alert("검색어를 입력하세요");
	</c:if>
</script>							 
			
			
<body>

	<div id="container">
		
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>

			
		<div id="content">
			<div id="board">
				<form id="search_form" action="${pageContext.request.contextPath}/board/getList?page=0&page_set=0" method="post">
					<input type="text" id="kwd" name="kwd" value="" placeholder="제목으로 검색하세요">
					<input id="submit" type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>		
	
			
			<c:forEach items="${list}"	var="vo" >
				
					<tr>
						<td>${vo.no}</td>
						<td><a href="${pageContext.request.contextPath}/board/viewText?no=${vo.no}&hit=${vo.hit}&page=${requestScope.vo.page}&page_set=${requestScope.vo.page_set}&kwd=${kwd}"> ${vo.title}</a></td>
						<td>${vo.name}</td>
						<td>${vo.hit}</td>
						<td>${vo.date}</td>
						<td>
							<c:if test="${authVO.no==vo.user_no}">
								<a href="${pageContext.request.contextPath}/board/delete?no=${vo.no}&page=${requestScope.vo.page}&page_set=${requestScope.vo.page_set}" class="del">삭제</a>
							</c:if>
						</td>
					</tr>
					
			</c:forEach>	
			
				</table>
				
				<div class="pager">
					<ul>
						<c:if test="${vo.page_set>=5}">
						<li><a href="${pageContext.request.contextPath}/board/getList?page_set=${vo.page_set-5}&page=4" >◀</a></li>
						</c:if>
						
						<c:forEach var="i" begin="0" end="4">
						<li class = ${vo.page==i?"selected":""}><a href="${pageContext.request.contextPath}/board/getList?page=${i}&page_set=${vo.page_set}">${(vo.count/10)>=(vo.page_set+i)?(vo.page_set+i+1):""}</a></li>
						</c:forEach>
						
						<c:if test="${vo.count/10>vo.page_set+5}">
						<li><a href="${pageContext.request.contextPath}/board/getList?page_set=${vo.page_set+5}&page=0" >▶</a></li>
						</c:if>
					</ul>
				</div>				
				<div class="bottom">
					<c:if test="${authVO.no!=null}">
						<a href="${pageContext.request.contextPath}/board/writeform?page=${vo.page}&page_set=${vo.page_set}" id="new-book">글쓰기</a>
					</c:if>
				</div>				
			</div>
		</div>
		
		
		<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
		
		
	</div>
</body>
</html>