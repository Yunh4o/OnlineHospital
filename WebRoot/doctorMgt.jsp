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
		#trans{
			color: green;
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
	</style>
	<script type="text/javascript">
		$(function () {
		  $('[data-toggle="popover"]').popover()
		})
	</script>
  </head>
  
  <body>
   <h1>病人信息受理</h1>
   <h4>当前用户:${sessionScope.username }</h4>
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
			<th>开设处方</th>
		</tr>	
		<c:forEach var="patient" items="${patientList }" varStatus="status">
				<tr>
					<td>${(pageNum-1)*4+status.count }</td>
					<td class="title">${patient.caseNum }</td>
					<td>${patient.pName }</td>
					<td>${patient.pSex }</td>
					<td>${patient.pAge }</td>
					<td><a href="medicalTrans.jsp?id=${patient.id }">
					<span id="trans" class="glyphicon glyphicon-apple"></span>
					</a></td>
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
		     	 <a href="DisplayPatient?pageNum=${pageNum-1 }&occupation=doctor" aria-label="Next">
		       		<span aria-hidden="true">&laquo;</span>
		      	 </a>
		      	</li>
	     	</c:otherwise>
	     	
	     </c:choose>
	    <c:forEach begin="1" end="${pageCount}" var="i">
	    	 <li><a href="DisplayPatient?pageNum=${i }&occupation=doctor">${i }</a></li>
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
		     	 <a href="DisplayPatient?pageNum=${pageNum+1 }&occupation=doctor" aria-label="Next">
		       		<span aria-hidden="true">&raquo;</span>
		      	 </a>
		      	</li>
	     	</c:otherwise>
	     	
	     </c:choose>
	    
	  </ul>
	</nav>
	</div>
		<div class="col-md-2"></div>
	</div>
	
  </body>
</html>
