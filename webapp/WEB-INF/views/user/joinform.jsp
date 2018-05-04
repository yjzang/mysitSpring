<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
	<title>Insert title here</title>
</head>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	#container{font-family: 'Jeju Hallasan', serif;}
	.submit{font-family: 'Jeju Hallasan', serif;}
</style>
<body>
<script type="text/javascript" src="/jqueryex/jquery/jquery-1.12.4.js"></script>


	<div id="container">
	
		
		<c:import url= "/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url= "/WEB-INF/views/includes/navigation.jsp"></c:import>
	
		
			
		<div id="wrapper">
			<div id="content">
				<div id="user">
						
					<form id="join-form" name="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
						<input type="hidden" id="name_check" class=check value=false >
						<input type="hidden" id="email_check" class=check value=false >
						<input type="hidden" id="pw_check"  class=check value=false >
						<input type="hidden" id="agree_check"  class=check value=false >
						
						<label class="block-label" for="name">이름</label>
						<input id="name" name="name" type="text" value="">
						<div id="msg_name"> </div>	
						<label class="block-label" for="email">이메일</label>
						<input id="email" name="email" type="text" value="">
						<input class="submit" type="button" id="btn" value="id 중복체크">
						<div id="msg_email"> </div>
						<label class="block-label">패스워드</label>
						<input name="password" type="password" id="password" value="">
						<div id="msg_pw"> </div>
						
						<fieldset>
							<legend>성별</legend>
							<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
							<label>남</label> <input type="radio" name="gender" value="male">
						</fieldset>
						
						<fieldset>
							<legend>약관동의</legend>
							<input id="agree-prov" type="checkbox" name="agreeProv" >
							<label>서비스 약관에 동의합니다.</label>
							<div id="msg_agree"> </div>
						</fieldset>
						<div id="msg_final"> </div>
						<input class="submit" type="submit" id="join" value="가입하기">
						
					</form>
					
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
	
	<c:import url= "/WEB-INF/views/includes/footer.jsp"></c:import>
	
	</div> <!-- /container -->

</body>

<script type="text/javascript">

$("#email").on("change", function(){
  var email = $("#email").val();
  console.log(email);
  
  $.ajax({
	  
	  url : "${pageContext.request.contextPath}/user/emailcheck",
	  type : "POST",
	  data : {email,email},
	  dataType : "json",
	  success : function(result){
		  console.log(result);
		  if(result){
			  
			  if($("#email").val()==""){
					 $("#msg_email").html("아이디를 적으셔야죠.");
					 $("#msg_email").css("color","red");
					 $("#msg_email").css("margin","5px");
					 $("#email_check").val(false);
			  } else{
					 $("#msg_email").html("멋진 아이디입니다.");
					 $("#msg_email").css("color","green");
					 $("#msg_email").css("margin","5px");
					 $("#email_check").val(true);
				  
			  }
		
		  } else{ 
			 $("#msg_email").html("이미 사용중인 아이디입니다.");
			 $("#msg_email").css("color","red");
			 $("#msg_email").css("margin","5px");
		  }
	 },
	  
	  error : function(XHR, status, error){

		 console.error(XHR+status+error);
	  }
  });
  
});
  
$("#name").on("blur", function name_check(){

	  var name_val = $("#name").val();
	  
	  if(name_val==""||name_val==null){
		  
			 $("#msg_name").html("이름을 입력하세요.");
			 $("#msg_name").css("color","red");
			 $("#msg_name").css("margin","5px");
			 $("#name_check").val(false);
			 
	  } else {
		  
		  $("#msg_name").html("");
		  $("#name_check").val(true);
		
	  }
	  
});  
$("#password").on("blur",function pw_check(){

	  var pw_val = $("#password").val();
	  
	  if(pw_val==""||pw_val==null){
		  
		  $("#msg_pw").html("비밀번호를 입력하세요.");
		  $("#msg_pw").css("color","red");
	   	  $("#msg_pw").css("margin","5px");
	   	  $("#pw_check").val(false);
		  	
	  } else {
		  $("#msg_pw").html("");
		  $("#pw_check").val(true);
		
	
	  }
	  
});  

$("#email").on("blur",function email_check(){

	  var email_val = $("#email").val();
	  
	  if(email_val==""){
		  
			 $("#msg_email").html("이메일을 입력하세요.");
			 $("#msg_email").css("color","red");
			 $("#msg_email").css("margin","5px");
			 $("#email_check").val(false);
	  } else {
		  
		  if($("#email_check").val()){
			  $("#msg_email").html("");
			  $("#email_check").val(true);
		  } else{
			  
			  $("#msg_email").html("이메일 중복체크 하세요.");
			  $("#email_check").val(false);
		  }
		
	  }
	  
});  

$("#join").on("click",function agree_check(){

	 var check = $("[type='checkbox']").is(":checked");
	  var check_val = $("[type='checkbox']").val();
	  
	 
	  
	  if(!check){
		  
			 $("#msg_agree").html("약관 동의는 필수 사항입니다.");
			 $("#msg_agree").css("color","red");
			 $("#msg_agree").css("margin","5px");
			 $("#agree_check").val(false);
			 
	  } else {
		  
		  $("#msg_agree").html("");	
		  $("#agree_check").val(true);
			  
	  }
	  
});  

$("#join").on("click",function(){

	
	console.log("-------------");
	console.log($("#name_check").val());
	console.log($("#email_check").val());
	console.log($("#pw_check").val());
	console.log($("#agree_check").val());

	var val1= $("#agree_check").val(); 
	var val2= $("#email_check").val(); 
	var val3= $("#name_check").val(); 
	var val4= $("#pw_check").val(); 
	
	 if(val1=="true"&&val2=="true"&&val3=="true"&&val4=="true"){
		 
		 return true;
		 
	 } else {
		 
		 $("#msg_final").html("<br>입력하신 정보를 다시 확인하세요.").css("color","red").css("margin","5px").css("text-align","center");
		 return false;
		 
	 }
});



</script>

</html>