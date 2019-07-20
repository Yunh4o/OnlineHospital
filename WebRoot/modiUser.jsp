<%@page import="beans.MgtUserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="beans.User" %>
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
		
  </head>
  
  <body>
  	<jsp:useBean id="MgtUserDao" class="beans.MgtUserDAO" scope="page"></jsp:useBean>
  	 <%
   		User user=null;
   		String id=request.getParameter("id");
   		user=MgtUserDao.queryUser(id);
   		request.setAttribute("user", user);
   	 %>
  	<div id="f">
 		<form class="form-horizontal" action="modiUser" method="post">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">账号</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="username" id="username" value="${user.username }" readonly="readonly">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="password" id="password" value="${user.password }">
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
		  		<input type="submit" class="btn btn-success" value="修改" />
		  	</div>
		  		<div class="col-md-1">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DisplayUser'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
