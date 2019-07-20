<%@page import="beans.MgtUserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="beans.Patient" %>
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
  	<jsp:useBean id="mgtPatientDAO" class="beans.MgtPatientDAO" scope="page"></jsp:useBean>
  	 <%
   		Patient patient=null;
   		String id=request.getParameter("id");
   		patient=mgtPatientDAO.queryPatient(id);
   		request.setAttribute("patient", patient);
   	 %>
  	<div id="f">
 		<form class="form-horizontal" action="modiPatient" method="post">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">姓名</label>
		    <div class="col-sm-2">
		   	  <input type="hidden" id="action" name="action" value="${patient.id }"/>
		      <input type="text" class="form-control" name="pname" id="pname" value="${patient.pName }">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-2">
		      <select id="psex" class="form-control required" name="psex">
                  	<option value="男">男</option>
					<option value="女">女</option>
	          </select>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-2 control-label">年龄</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="page" id="page" value="${patient.pAge }">
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-md-1 col-md-offset-2">
		  		<input type="submit" class="btn btn-success" value="修改" />
		  	</div>
		  		<div class="col-md-1">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DisplayPatient?occupation=nurse'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
