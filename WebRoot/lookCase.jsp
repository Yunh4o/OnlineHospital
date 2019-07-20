<%@page import="beans.MgtUserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="beans.Recipe" %>
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
   		Recipe recipe=null;
   		String recipenum=request.getParameter("recipenum");
   		recipe=mgtPatientDAO.queryRecipe(recipenum);
   		request.setAttribute("recipe", recipe);
   	 %>
  	<div id="f">
 		<form class="form-horizontal" action="MedicalTrans" method="post">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">处方编号</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="recipenum" id="recipenum" value="${recipe.recipeNum }" readonly="readonly">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">病因</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="casereason" id="casereason" value="${recipe.caseReason }" readonly="readonly">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">处方详情</label>
		    <div class="col-sm-2">
		     <textarea rows="4" cols="30" id="recipeinfo" name="recipeinfo" readonly="readonly">${recipe.recipeInfo }</textarea>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label class="col-sm-2 control-label">开方医生</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="deldoc" id="deldoc" value="${recipe.delDoc }" readonly="readonly">
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-md-2"></div>
		  		<div class="col-md-2">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DisplayPatient?occupation=nurse'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
