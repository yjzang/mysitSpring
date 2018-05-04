<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="${pageContext.request.contextPath }/assets/css/gallery.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"	rel="stylesheet" type="text/css">
<style>


	.card {
		border: 1px solid black; 
		float: left; 
		
		margin-right: 5px; 
		margin-bottom: 5px; 
	}
	
	
	.cardImg {
		width: 100%; 
		max-width:128px; 
		vertical-align: middle"
	} 
</style>

<script type="text/javascript" src="/jqueryex/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

<title>Mysite</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;}
	#submit{font-family: 'Jeju Hallasan', serif;}
	#btn_align{text-align:center;}
</style>
<body>
	
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="wrapper">
			<div id="content">
				
				<div id="gallery">
					<form method="post" action="${pageContext.request.contextPath }/gallery/upload" enctype="multipart/form-data" >
						<table>
							<tr>
								<td>첨부파일</td>
								<td>	<input type="hidden" name="userNo" value="${authVO.no}">
										<input type="file" name="files" multiple></td>
								<td><input type="submit" value="파일업로드"></td>
							</tr>
						</table>
					</form>
					
					
					<ul id="img_list">
					
					</ul>
					<button type="button" id="btn_more"style="height:30px; width:540px;" > 더 보기 </button>
				</div>
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
	
	<!-- 이미지 팝업(모달)창 -->
	<div class="modal fade" id="img-pop" >
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<div>
						<input type="hidden" id="img_saveName">
						<input type="hidden" id="img_no">
					  <img id="pop_img" src="" style="max-width:100%; width:200px;">
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="btn_del">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_cancel">닫기</button>
				</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	
	
</body>
<script type="text/javascript">

	$("ul").on("click","img",function(){
		
		var $this=$(this);
		console.log($this);
		var no = $this.attr("id");
		var userNo = $this.data("userno");
		var authNo = ${authVO==null?0:authVO.no};
		console.log(no +"  " +userNo);
		$("#img_no").val(no);
		
		if(userNo==authNo){
			
			$("#btn_del").show();
			
		} else{
			
			$("#btn_del").hide();
		}
		
		
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/gallery/zoom",
			  type : "POST",
			  data : {no:no, begin:1},
			  dataType : "json",	
			
			  success : function(vo){
				  
				  $("#pop_img").attr("src","${pageContext.request.contextPath}/upload/"+vo.saveName);
				  $("#img-pop").modal();
										
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
		
		 
	
	});
	


	$(document).ready(function(){
		
		begin=1;
		fetchList();
		
	});
	
	function fetchList(){
		console.log("초기화 1이어야하는 "+ begin);
		
	$.ajax({
		  
		  url : "${pageContext.request.contextPath}/gallery/getList",
		  type : "POST",
		  data : {begin : 1},
		  dataType : "json",
		
		  success : function(list){
			  
			  $.each(list, function(idx, val) {
					console.log(idx + " " + val.no);
					render(val,"down");
						  
					  });
			  
		  
		  },
		  
		  error : function(XHR, status, error){

			 console.error(XHR+status+error);
		  }
		  
	  });
	  
	}
	
	$("#btn_del").on("click",function(){
		
		var no = $("#img_no").val();
		
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/gallery/delete",
			  type : "POST",
			  data : {no:no},
			  dataType : "json",	
			
			  success : function(result){
					 
					  remove(no);
					  $("#img-pop").modal('hide');
				
										
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
		
		
		 
	});
	
	

	function render(vo,updown){

		  str= " ";
		  str+= "	<li id=li_"+vo.no+">";
		  str+= "	<div id='btn_align'>";
		  str+= "	<img id=" +vo.no+ " src='${pageContext.request.contextPath}/upload/"+vo.saveName+"'";
		  str+= " 		style='max-width:100%;' data-userno="+vo.userNo+">";
		  str+= "	</div>";
		  str+= "	</li>";
		  str+= "	";
		  
		  if(updown=="up"){
			  
			  $("#img_list").prepend(str);
			  
		  } else{
			  
			  $("#img_list").append(str);
		  }
			  
	}
	
	function remove(no){
		
		$("#li_"+no).remove();
		
	}
	
	$(window).on("scroll",function() {
		
        
		var scrolltop = $(window).scrollTop();
		console.log(scrolltop);
		var height = $(document).height();
		console.log(height);
		var height_win = $(window).height();
		console.log(height_win);
		
		
	 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
		
		 setTimeout("moreList()", 300); 
		
	}  
	
	});
	
	$("#btn_more").on("click",function(){
		
		var begin = $("#begin").val();
		console.log("버튼 클릭 후"+ begin);
		setTimeout("moreList()", 300); 
		
		
	});
	
	function moreList(){
	
		begin= parseInt(begin) + 16 ;
		
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/gallery/getList",
			  type : "POST",
			  data : {begin: begin},
			  dataType : "json",
			
			  success : function(list){
				  
				  $.each(list, function(idx, val) {
						/* console.log(idx + " " + val.no); */
						render(val,"down");
							  
						  });
				  
			  
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
		
	}
	
</script>
</html>		
		
