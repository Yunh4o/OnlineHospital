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
		function checkName(){
			var xmlHttp;
			var username=$("#username").val();
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var dataObj=eval("("+xmlHttp.responseText+")");
					
					if(dataObj.usernull){
						document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp用户名不能为空！";
						 $("#password").attr("disabled",true);
					}else{
						if(dataObj.exist){
						document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp<font color='red'>用户名已存在！</font>";
						 $("#password").attr("disabled",true);
						}else{
							document.getElementById("tip").innerHTML="<img src='images/ok.png'>&nbsp<font color='green'>用户名可以使用！</font>";
							$("#password").attr("disabled",false);
						}
					}
					
				}
			};
			xmlHttp.open("get", "CheckNameServlet?username="+username,true);
			xmlHttp.send();
		}
	</script>
  </head>
  
  <body>
  	<div id="f">
 		<form class="form-horizontal" action="addUser" method="post">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">账号</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="username" id="username" onblur="checkName()">
		    </div>
		    <font id="tip"></font>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="password" id="password"">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-2 control-label">职业</label>
		    <div class="col-sm-2">
		      <select id="occupation" class="form-control required" name="occupation">
                  	<option value="nurse">护士</option>
					<option value="doctor">医生</option>
	          </select>
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-md-1 col-md-offset-2">
		  		<input type="submit" class="btn btn-success" value="添加" />
		  	</div>
		  		<div class="col-md-1">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DisplayUser'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
