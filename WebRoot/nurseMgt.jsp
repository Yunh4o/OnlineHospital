<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminMgt.jsp' starting page</title>
    
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
			background-color: gray;
		}
		h1{
			font-family: "微软雅黑";
			text-align: center;
		}
		span{
			cursor: pointer;
		}
		#del{
			color: red;
		}
		#modi{
			color: green;
		}
		#add{
			float:right;
		}
		#next{
			cursor: default;
		}
		.b{
			margin: 60px auto;
		}
		h4{
			margin-left:50px;
			color: white;
		}
		a{
			color:black;
		}
	</style>
	<script type="text/javascript">
		function deletePatient(id){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var dataObj=eval("("+xmlHttp.responseText+")");
					if(dataObj.success){
						alert("删除成功！");
						window.location.reload();
					}else{
						alert("删除失败！");
					}
				}
			};
			xmlHttp.open("get", "deletePatient?id="+id,true);
			xmlHttp.send();
		}
		
		$(function () {
		  $('[data-toggle="popover"]').popover()
		})
	</script>
  </head>
  
  <body>
   <h1>病人信息管理</h1>
   <h4>当前用户:${sessionScope.username }|<a href="modiSelf.jsp">修改密码</a></h4>
   	<hr>
   	<div class="container">
		<div class="col-md-2 "></div>
		<div class="b col-md-8">
			<table class="table table-striped">
		<tr>
			<th class="first" width="80">序号</th>
			<th>病历编号</th>
			<th>病人姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>处方编号</th>
			<th>修改</th>
			<th>删除</th>
		</tr>	
		<c:forEach var="patient" items="${patientList }" varStatus="status">
				<tr>
					<td>${(pageNum-1)*4+status.count }</td>
					<td class="title">${patient.caseNum }</td>
					<td>${patient.pName }</td>
					<td>${patient.pSex }</td>
					<td>${patient.pAge }</td>
					<td><a href="lookCase.jsp?recipenum=${patient.recipeNum }">${patient.recipeNum }</a></td>
					<td><a href="modiPatient.jsp?id=${patient.id }">
					<span id="modi" class="glyphicon glyphicon-pencil"></span>
					</a></td>
					<td><span id="del" class="glyphicon glyphicon-remove" onclick="deletePatient(${patient.id })"></span></td>
				</tr>
		</c:forEach>
	</table>
	
		<nav aria-label="Page navigation">
	  <ul class="pagination">
	   <c:choose>
	     	<c:when test="${pageNum==1 }">
	     		 <li class="disabled">
	       			 <span>
       					 <span aria-hidden="true">&laquo;</span>
     				 </span>
	       		 </li>
	     	</c:when>
	     	<c:otherwise>
		     	<li>
		     	 <a href="DisplayPatient?pageNum=${pageNum-1 }&occupation=nurse" aria-label="Next">
		       		<span aria-hidden="true">&laquo;</span>
		      	 </a>
		      	</li>
	     	</c:otherwise>
	     	
	     </c:choose>
	    <c:forEach begin="1" end="${pageCount}" var="i">
	    	 <li><a href="DisplayPatient?pageNum=${i }&occupation=nurse">${i }</a></li>
	    </c:forEach>
	    
	     <c:choose>
	     	<c:when test="${pageNum==pageCount }">
	     		 <li class="disabled">
	       			 <span>
       					 <span aria-hidden="true">&raquo;</span>
     				 </span>
	       		 </li>
	     	</c:when>
	     	<c:otherwise>
		     	<li>
		     	 <a href="DisplayPatient?pageNum=${pageNum+1 }&occupation=nurse" aria-label="Next">
		       		<span aria-hidden="true">&raquo;</span>
		      	 </a>
		      	</li>
	     	</c:otherwise>
	     	
	     </c:choose>
	    
	  </ul>
	</nav>
	<div  id="add" >
		<button type="button" class="btn btn-success" onclick="javascrtpt:window.location.href='addPatient.jsp'" >添加病人</button>
	</div>
	
	</div>
		<div class="col-md-2"></div>
	</div>
  	 
	
	
	
	
  </body>
</html>
