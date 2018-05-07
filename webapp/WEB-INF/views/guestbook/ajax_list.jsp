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
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"	rel="stylesheet" type="text/css">
	<title>방명록</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	#content{font-family: 'Jeju Hallasan', serif; line-height : 150%;}
	#submit{font-family: 'Jeju Hallasan', serif;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

<body>

	<div id="container">
		
	<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
	<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>
	
		<input type="hidden" name="begin" id="begin" />
		
		<div id="wrapper">
			<div id="content">
				<div id="guestbook" >
					
				
						<table>
							<tr>
								<td>이름</td><td><input type="text" name="name" /></td>
								<td>비밀번호</td><td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td colspan=4><textarea name="content" id="content"></textarea></td>
							</tr>
							<tr>
								<td colspan=4 align=right><input id="btnAdd" type="button" VALUE=" 확인 " /></td>
							</tr>
						</table>
						
					<ul id="guest-list"  style="width:500px;display:inline-block;">
					
					</ul>
				<button type="button" id="btn_more"style="height:30px; width:540px;" > 더 보기 </button>
				</div><!-- /guestbook -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
	
	<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
	</div> <!-- /container -->

	

	<!-- 삭제팝업(모달)창 -->
	<div class="modal fade" id="del-pop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="btn_close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">방명록삭제</h4>
				</div>
				<div class="modal-body">
					<label>비밀번호</label> <input type="password" name="modalPassword" id="modalPassword">
						<br> <input type="hidden"	name="modalNo" id="modalNo"> <br>
						<div id="msg"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_cancel">취소</button>
					<button type="button" class="btn btn-danger" id="btn_del">삭제</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


</body>

<script type="text/javascript">
	

	$("#btn_more").on("click",function(){
		
		var begin = $("#begin").val();
		console.log("버튼 클릭 후"+ begin);
		moreList();
		
		
	});
	
 	$(window).on("scroll",function() {
		
        
		var scrolltop = $(window).scrollTop();
		console.log(scrolltop);
		var height = $(document).height();
		console.log(height);
		var height_win = $(window).height();
		console.log(height_win);
		
		
	 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
		
		moreList();
		
	}  
	
	}); 
	
	/* $(window).scroll( function() { 
		
		var elem = $("#guestbook");
		console.log(elem[0].scrollHeight );
		console.log(elem.scrollTop() );
		console.log(elem.outerHeight() );
		
		
		if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight()) { 
		
			console.log("bottom!");
			
		} 
	}); 
	 */

			
			
	function moreList(){
	
		var begin = $("#begin").val();
		begin= parseInt(begin) + 5 ;
		$("#begin").val(begin);
		
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/api/guest/getList",
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
	

	$("ul").on("click","button",function(){
		
		var $this=$(this);
		console.log($this);
		var no = $this.data("no");
		console.log(no);
		
		$("#msg").html("").css("color","red");
		$("#modalPassword").val("");
		$("#modalNo").val(no); 
		$("#del-pop").modal();
	
	});
	
	$("#btn_del").on("click",function(){
		
		
		var password = $("#modalPassword").val();
		console.log(password);
		var no = $("#modalNo").val(); 
		console.log(no);
		

		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/api/guest/delete",
			  type : "POST",
			  data : {no: no, password: password },
			  dataType : "json",
			
			  success : function(result){
				  
				 if(result=="true"){
				  
					 remove(no);
					 $("#del-pop").modal('hide');
					 
				 } else if(result=="empty"){
				 
					 $("#msg").html("비밀번호를 입력하세요.").css("color","red");
					 
				 }else{
					 
					$("#msg").html("비밀번호가 틀렸습니다.").css("color","red");
				 }
			  
			  },
			  
			  error : function(XHR, status, error){
				  
				 
				 console.error(XHR+status+error);
			  }
			  
		  });
		
		
	});

	$("#btnAdd").on("click", function add(){
		
		/* event.preventDefault(); form action-submit 기능 죽이는 함수 */
		
/* 		var name = $("[name=name]").val();
		var password = $("[name=password]").val();
		var content = $("[name=content]").val();
		console.log(name);
		console.log(password);
		console.log(content);
 */
		guestbookVO={	name : $("input[name='name']").val(),
						password : $("input[name='password']").val(),
						content: $("textarea[name='content']").val()
					}
	
		$.ajax({
			  
			  url : "${pageContext.request.contextPath}/api/guest/add",
			  type : "POST",
			  contentType : "application/json",   /* 보낼때 양식 JSON 양식으로 보내겠다. request의 body영역에 담겨간다.*/
			  data : JSON.stringify(guestbookVO), /* */
			  dataType : "json",	/* 받는 양식 */
			
			  success : function(vo){
				  
					 render(vo,"up");
					 $("[name=name]").val("");	  
					 $("[name=password]").val("");	  
					 $("[name=content]").val("");
					
			  },
			  
			  error : function(XHR, status, error){

				 console.error(XHR+status+error);
			  }
			  
		  });
	});
	
	
	$(document).ready(function(){
		
		fetchList();
		
	});
	
	
	function fetchList(){
		var begin = 1;
		console.log("초기화 1이어야하는 "+ begin);
		$("#begin").val(begin);
		var begin_out = $("#begin").val();
		console.log("히든태그 방금 들어갔다가 나온 "+ begin_out);
	$.ajax({
		  
		  url : "${pageContext.request.contextPath}/api/guest/getList",
		  type : "POST",
		  data : {begin : 1},
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
	
	
	function render(vo,updown){
		

		  str= " ";
		  str+= "	<li id=li_"+vo.no+" >";
		  str+= "	<table>";
		  str+= "	<tr>";
		  str+= "	<td id='no'>" +vo.no+  "</td>";
		  str+= "	<td>" +vo.name+ "</td>";
		  str+= "	<td>" +vo.date+ "</td>";
		  str+= "	<td><button type='button' data-no="+vo.no+">삭제</button></td>";
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
	
	function remove(no){
		
			  $("#li_"+no).remove();
			  
	}

</script>



</html>