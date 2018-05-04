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
	#submit{font-family: 'Jeju Hallasan', serif;
			text-align : center;	}
	#file{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;}
</style>
<body>
	
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="wrapper">
			<div id="content">
				<div id="guestbook">
					
					<form method="post" action="${pageContext.request.contextPath }/fileupload/upload" enctype="multipart/form-data">
						<table>
							<tr>
								<td>첨부파일</td>
								<td><input type="file" name="file" id="file" ></td>
								
							</tr>
							
							<tr>
								<td>첨부파일</td>
								<td><input type="file" name="file2" id="file" ></td>
								
							</tr><tr>
								<td>첨부파일</td>
								<td><input type="file" name="file3" id="file" ></td>
								
							</tr>
							</table>
							
								<br>
								<div  id="submit"><input type="submit" value="파일 업로드" id = "submit" style="width:200px;height:30px"></div>
						
					</form>
					
					
				</div><!-- /guestbook -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
	
	
	
</body>
</html>		
		
