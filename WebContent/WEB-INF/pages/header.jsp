<!DOCTYPE html>
<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap</title>

<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</head>
<body>
<!-- <nav class="navbar navbar-default" role="navigation"> -->
<!--   <div class="container-fluid "> -->
 
<!--     Grupowanie elementów menu w celu lepszego wyświetlania na urządzeniach moblinych -->
<!--     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
<!--       <ul class="nav navbar-nav navbar-right"> -->
<!--         <li><a href="j_spring_security_logout">Wyloguj się</a></li> -->
<!--       </ul> -->
<!--     </div>/.navbar-collapse -->
<!--   </div>/.container-fluid -->
<!-- </nav> -->

		<div class="container">
			<center><img src="<c:url value="/resources/img/logo.jpg" />" align="middle" style="width: 60%"></center>
		</div>
		
  <h3>Plan Gospodarki Niskoemisyjnej dla Gniezna</h3>

	<nav class="navbar  navbar navbar-default navbar-static-top" role="navigation">
		<div class="collapse navbar-collapse navbar-right">
				
				
				<ul class="nav navbar-nav">
					<li style="margin-right: 20px; border: 1px"><a href="login.html">Wyloguj</a></li>
				</ul>
				</div>
		</nav>


</body>
</html>