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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

<title>Mysite</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;text-align:left;}
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
				<c:if test="${authVO!=null}">
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
					</c:if>
					
					
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
					  <img id="pop_img" src="" style="max-width:100%; width:400px;">
				
					</div>
					<div style="margin:5px;border-top:1px solid #e5e5e5;padding:15px;">
						 <ul id="guest-list">
					
						</ul>
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

	$("ul").on("click","#img",function(){
		
		var $this=$(this);
		console.log($this);
		var no = $this.data("delno");
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
		fetchGallery();
		fetchList();
		
	});

	$("ul").on("click","img[data-likeno]",function(){
		
		var state = $(this).data("state");
		var no = $(this).data("likeno");
		var src= $("[data-likeno="+no+"]").attr("src");
		
		if(state==0){
			src="${pageContext.request.contextPath}/assets/images/heart-on.PNG";
			
		} else{
			
			src= "${pageContext.request.contextPath}/assets/images/heart-off.PNG";
		}
		
		console.log("삼항 후"+src);
		$("[data-likeno="+no+"]").attr("src",src);      
		
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/gallery/upLike",
			  type : "POST",
			  data : {no:no, state: state},
			  dataType : "json",	
			
			  success : function(resultVO){
				  
				  console.log(resultVO);
				  $("#like_"+no).text(resultVO.like);
				  $("[data-likeno="+no+"]").data("state",resultVO.state);						
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
		
		
		
	});


	
	
	function fetchGallery(){
		console.log("초기화 1이어야하는 "+ begin);
		
	$.ajax({
		  
		  url : "${pageContext.request.contextPath}/gallery/getList",
		  type : "POST",
		  data : {begin : 1},
		  dataType : "json",
		
		  success : function(list){
			  
			  $.each(list, function(idx, val) {
					console.log(idx + " " + val.no);
					var src ='${pageContext.request.contextPath}/assets/images/heart-off.PNG';
					if(val.state==1){
						src ='${pageContext.request.contextPath}/assets/images/heart-on.PNG';
					}
					render(val,"down",src);
						  
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
	
	
	<!--갤러리 글 만들기 영역 -->
	function render(vo,updown,src){

		  str= " ";
		  str+= "	<li id=li_"+vo.no+" style='background-color:white;padding-bottom:10px'>";
		  str+= "	<div id='btn_align' style='border-bottom:1px solid #D8D8D8;' >";
		  str+= "	<img id='img' data-delno="+vo.no+" src='${pageContext.request.contextPath}/upload/"+vo.saveName+"'";
		  str+= " 		style='width:90%;height:80px;margin:5px;cursor:pointer;' data-userno="+vo.userNo+">";
		  str+= "	</div>";
		  str+= "	<div>";
		  str+= "	  <img id='heart' data-likeno="+vo.no+" data-state='"+vo.state+"'src="+src;
		  str+= " 				style='width:15px;height:15px;margin-left:5px;margin-bottom:1px;cursor:pointer;'/>  ";
		  str+= "	<span id='like_"+vo.no+"' type='text' style='border:none;font-size:8pt;'>"+vo.like+"</span>";
		  str+= "	<span style='font-size:8pt;float:right;'>"+vo.userName+"</span>";
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
					  var src ='${pageContext.request.contextPath}/assets/images/heart-off.PNG';
						if(val.state==1){
							src ='${pageContext.request.contextPath}/assets/images/heart-on.PNG';
						}
						render(val,"down",src);
							  
						  });
				  
			  
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
		
	}
	

	function fetchList(){
		var begin_guest = 1;
		console.log("초기화 1이어야하는 "+ begin_guest);
		
	$.ajax({
		  
		  url : "${pageContext.request.contextPath}/api/guest/getList",
		  type : "POST",
		  data : {begin : 1},
		  dataType : "json",
		
		  success : function(list){
			  
			  $.each(list, function(idx, val) {
					/* console.log(idx + " " + val.no); */
					render_guest(val,"down");
						  
					  });
			  
		  
		  },
		  
		  error : function(XHR, status, error){

			 console.error(XHR+status+error);
		  }
		  
	  });
	  
	}
	
	<!--댓글 기능영역-->
	function render_guest(vo,updown){
		

		  str= " ";
		  str+= "	<li id=li_"+vo.no+" >";
		  str+= "	<table id='content'>";
		  str+= "	<tr>";
		  str+= "	<td id='no'>" +vo.no+  "</td>";
		  str+= "	<td>" +vo.name+ "</td>";
		  str+= "	<td>" +vo.date+ "</td>";
		  str+= "	<td style='text-align:right;'><button type='button' data-no="+vo.no+" style='outline:0;border:0;background-color:white;'><img id='delete' src='${pageContext.request.contextPath}/assets/images/delete_simple.PNG'style='width:15px;height:15px;' title='댓글 삭제' ></button></td>";
		  str+= "	</tr>";
		  str+= "	<tr>";
		  str+= "	<td colspan=4>";
		  str+= "	<pre-line id='content'>"+vo.content+"</pre-line>";
		  str+= "	</td>";
		  str+= "	</tr>";
		  str+= "	 </table>";
		  str+= "	<br>";
		  str+= "	</li>";
		  str+= "	";
		  
		  if(updown=="up"){
			  
			  $("#guest-list").prepend(str);
			  
		  } else{
			  
			  $("#guest-list").append(str);
		  }
			  
	}
	
</script>
</html>		
		
