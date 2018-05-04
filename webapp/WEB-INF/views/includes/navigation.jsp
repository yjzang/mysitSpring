<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<div id="navigation">
			<ul>
				<li><a href="${pageContext.request.contextPath}/main">프로필</a></li>
				<li><a href="${pageContext.request.contextPath}/guest/getList">방명록</a></li>
				<li><a href="${pageContext.request.contextPath}/board/getList?page=0&page_set=0">게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/guest/ajaxList">AJAX방명록</a></li>
				<li><a href="${pageContext.request.contextPath}/fileupload/form">파일 업로드</a></li>
				<li><a href="${pageContext.request.contextPath}/gallery/form">갤러리</a></li>
			</ul>
		</div> <!-- /navigation -->