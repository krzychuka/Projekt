<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
	password="admin" scope="session" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="<c:url value="/resources/js/dataTables/columnFilter.js" />"></script>

<title>Insert title here</title>
</head>
<body>

<div class="container-fluid col-md-offset-3 col-md-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Dodaj użytkownika</h3>
		</div>
		<div class="panel-body">
			<form:form class="form-horizontal" method="POST" id="contact-form"
				action="/Projekt/zapiszUzytkownika.html">
				<div class="control-group" style="display: none">
					<form:label path="id" class="control-label">Id użytkownika</form:label>
					<div class="controls">
						<form:input path="id" value="${uzytkownik.id}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<form:label path="login" class="control-label col-md-offset-1">Login</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" path="login" 
							value="${uzytkownik.login}" ></form:input>
					</div>
				</div>
				<div class="control-group">
					<form:label path="haslo"
						class="control-label col-md-offset-1">Hasło</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" type="text" path="haslo"
							value="${uzytkownik.haslo}" />
					</div>
				</div>
				<div class="control-group">
					<form:label path="kubatura" class="control-label col-md-offset-1">Kubatura</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" type="text" path="kubatura" value="${obiekt.kubatura}" />
					</div>
				</div>
				<div class="control-group">
					<form:label class="control-label col-md-offset-1" path="liczbaUzytkownikow">Liczba
						użytkowników</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" type="text" path="liczbaUzytkownikow"
							value="${obiekt.liczbaUzytkownikow}" />
					</div>
				</div>
				<div class="control-group">
					<form:label path="czyCalodobowy"
						class="control-label col-md-offset-1">Całodobowy</form:label>
					<form:checkbox path="czyCalodobowy" value="${obiekt.czyCalodobowy}"></form:checkbox>
				</div>
				<div class="form-group">
					<div class="col-md-offset-1 col-sm-2">
						<button type="submit" class="btn btn-primary">Dodaj</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	
</body>
</html>