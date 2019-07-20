<%@page import="beans.MgtUserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modiUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap3/css/bootstrap-theme.min.css" >
	<script src="bootstrap3/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap3/js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
			background: url("images/ma.jpg");
			background-size: cover;
		}
		#f{
			margin: 120 auto;
			width: 80%;
		}
		
	</style>
	<script type="text/javascript">
		function ckPassword(){
			var xmlHttp;
			var newpa=$("#newpa").val();
			var ckpa=$("#ckpa").val();
			var user=$("#user").val();
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var dataObj=eval("("+xmlHttp.responseText+")");
					if(dataObj.error){
						document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp两次密码不一致！";
					}else{
						alert("修改成功！");
						location.href="DisplayPatient";
					}
				}
			};
			xmlHttp.open("get", "CkPassword?newpa="+newpa+"&ckpa="+ckpa+"&user="+user,true);
			xmlHttp.send();
		}
		
	</script>
  </head>
  
  <body>
  	<div id="f">
 	 	<form class="form-horizontal">
		 <div class="form-group">
		    <label class="col-sm-2 control-label">新密码</label>
		    <div class="col-sm-2">
		    	<input type="hidden" id="user" name="user" value="${sessionScope.username }"/>
		      <input type="password" class="form-control" name="newpa" id="newpa">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">确认密码</label>
		    <div class="col-sm-2">
		      <input type="password" class="form-control" name="ckpa" id="ckpa">
		    </div>
		    <font id="tip"></font>
		  </div>
		  
		  
		  <div class="form-group">
		  	<div class="col-md-1 col-md-offset-2">
		  		<input type="button" class="btn btn-success" value="修改" onclick="ckPassword()"/>
		  	</div>
		  		<div class="col-md-1">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DispalyPatient?occupation=nurse'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
