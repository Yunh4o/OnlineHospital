<%@include file="checkvalid.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
	<style>
		body{
		    background: url("images/main1.jpg");
		    background-size:cover;
		    animation-name:myfirst;
		    animation-duration:10s;
		    /*变换时间*/
/* 		    animation-delay:2s; */
		    /*动画开始时间*/
		    animation-iteration-count:infinite;
		    /*下一周期循环播放*/
		    animation-play-state:running;
		    /*动画开始运行*/
		}
		@keyframes myfirst
		{
		    0%   {background:url("images/main1.jpg");background-size: cover;}
		    34%  {background:url("images/main2.jpg");background-size: cover;}
		    67%  {background:url("images/main3.jpg");background-size: cover;}
		    100% {background:url("images/main4.jpg");background-size: cover;}
		    
		}
		.form{background: rgba(255,255,255,0.2);width:400px;margin:120px auto;}
		/*阴影*/
		.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
		input[type="text"],input[type="password"]{padding-left:16px;}/*灰色字体在各自框中的位置*/
		.checkbox{padding-left:21px;}
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
						document.getElementById("tip").innerHTML="<img src='images/ok.png'>&nbsp<font color='green'>用户名正确！</font>";
						 $("#password").attr("disabled",false);
						}else{
							document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp<font color='red'>用户名不存在！</font>";
							$("#password").attr("disabled",true);
						}
					}
					
				}
			};
			xmlHttp.open("get", "CheckNameServlet?username="+username,true);
			xmlHttp.send();
		}
		
		function checkPass(){
			var xmlHttp;
			var occupation=$("#occupation").val();
			var pass=$("#password").val();
			var username=$("#username").val();
			var remember=0;
			if($("input[type='checkbox']").is(':checked')){
				remember=$("input[type='checkbox']").attr('value'); 
			}
			
                    
             
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var dataObj=eval("("+xmlHttp.responseText+")");
					if(dataObj.error){
						alert("请核实您的身份和密码！");
					}else{

						if(occupation=="doctor"){
							location.href="DisplayPatient?occupation=doctor";
						}else if(occupation=="nurse"){
							location.href="DisplayPatient?occupation=nurse";
						}else if(occupation=="admin"){
							location.href="DisplayUser";
						}
					}
				}
			};
			xmlHttp.open("get", "CheckPassword?occupation="+occupation+"&password="+pass+"&username="+username+"&remember="+remember,true);
			xmlHttp.send();
		}
		
		
		
	</script>
  </head>
  	
  <body>
     <div class="container">
       <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
	                	<div class="form-group">
	                        <i class="fa fa-user fa-lg"></i>
	                        <select id="occupation" class="form-control required" name="occupation" maxlength="20">
	                        	<option value="admin">管理员</option>
	                        	<option value="nurse">护士</option>
								<option value="doctor">医生</option>
	                        </select>
	                    </div>
	                   
	                    <div class="form-group">
	                        <i class="fa fa-user fa-lg"></i>
	                        <input class="form-control required" id="username" type="text" placeholder="Username" id="username" name="username" onblur="checkName()" value="${sessionScope.username }" autofocus="autofocus" maxlength="20"/>
							<font id="tip"></font>
	                    </div>
	                     
	                    <div class="form-group">
	                            <i class="fa fa-lock fa-lg"></i>
	                            <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
	                    </div>
	                    <div class="form-group">
	                        <label class="checkbox">
	                            <input type="checkbox" id="remember" name="remember" value="${60*60*24*7 }"/>记住账号
	                        </label>
	                    </div>
	                    <div class="form-group col-md-offset-9">
	                        <button class="btn btn-success pull-right" name="submit" onclick="checkPass()">登录</button>
	                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
