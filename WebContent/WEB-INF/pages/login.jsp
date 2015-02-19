<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Logowanie</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>

<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>

	<c:if test="${not empty error}">
		<div class="errorblock">
			Zły login i/lub hasło!!! Spróbuj jeszcze raz.<br />
		</div>
	</c:if>

	<form  class="form-horizontal" name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>

		<div class="control-group">
			<label class="control-label col-md-offset-5">Login</label>
			<div class="controls col-md-offset-5">
				<input type='text' name='j_username' value=''>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label col-md-offset-5">Hasło</label>
			<div class="controls col-md-offset-5">
				<input type='password' name='j_password' value=''>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-2">
				<button type="submit" class="btn btn-primary">Zaloguj się</button>
			</div>
		</div>

	</form>
</body>
</html>