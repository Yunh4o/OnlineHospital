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
		function checkRecipeNum(){
			var xmlHttp;
			var recipenum=$("#recipenum").val();
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var dataObj=eval("("+xmlHttp.responseText+")");
					
					if(dataObj.recipeNull){
						document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp<font color='red'>处方编号不能为空！</font>";
						 $("#finish").attr("disabled",true);
					}else{
						if(dataObj.exist){
						document.getElementById("tip").innerHTML="<img src='images/no.png'>&nbsp<font color='red'>处方编号已存在！</font>";
						 $("#finish").attr("disabled",true);
						}else{
							document.getElementById("tip").innerHTML="<img src='images/ok.png'>&nbsp<font color='green'>处方编号可以使用！</font>";
							$("#finish").attr("disabled",false);
						}
					}
					
				}
			};
			xmlHttp.open("get", "CheckRecipeNum?recipenum="+recipenum,true);
			xmlHttp.send();
		}
	</script>
  </head>
  
  <body>
  	<div id="f">
 		<form class="form-horizontal" action="MedicalTrans" method="post">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">处方编号</label>
		    <div class="col-sm-2">
		   	  <input type="hidden" value="${param.id }" id="pid" name="pid"/>
		      <input type="text" class="form-control" name="recipenum" id="recipenum" onblur="checkRecipeNum()">
		    </div>
		    <font id="tip"></font>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">病因</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" name="casereason" id="casereason">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">处方详情</label>
		    <div class="col-sm-2">
		     <textarea rows="4" cols="30" id="recipeinfo" name="recipeinfo"></textarea>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-2 control-label">开方医生</label>
		    <div class="col-sm-2">
		      <select id="deldoc" class="form-control required" name="deldoc">
                  	<option value="${sessionScope.username }">${sessionScope.username }</option>
	          </select>
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-md-1 col-md-offset-2">
		  		<input id="finish" type="submit" class="btn btn-success" value="完成" />
		  	</div>
		  		<div class="col-md-1">
		  		<button type="button" class="btn btn-info" onclick="javascrtpt:window.location.href='DisplayPatient?occupation=doctor'">返回</button>
		  	</div>
		  </div>
		</form>
	</div>
  </body>
</html>
