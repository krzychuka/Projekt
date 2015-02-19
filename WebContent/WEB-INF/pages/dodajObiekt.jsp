<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/resources/js/messages_pl.js"></script>

<script>
	$(document).ready(
			function() {

				$('#contact-form').validate(
						{
							rules : {
								nazwa : {
									minlength : 2,
									required : true
								},
								powierzchnia : {
									required : true,
									number : true
								},
								kubatura : {
									required : true,
									number : true
								},
								liczbaUzytkownikow : {
									required : true,
									number : true
								}
							},
							highlight : function(element) {
								$(element).closest('.control-group')
										.removeClass('has-success has-feedback').addClass(
												'has-error');
							},
							success : function(element) {
								element.text('OK!').addClass('valid').closest(
										'.control-group').removeClass(
										'has-error').addClass('has-success has-feedback');
							},
							errorElement : 'span',
							errorClass : 'help-block',
							errorPlacement : function(error, element) {
								if (element.parent('.input-group').length) {
									error.insertAfter(element.parent());
								} else {
									error.insertAfter(element);
								}
							}
						});
			}); // end document.ready
</script>

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid col-md-offset-3 col-md-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Dodaj obiekt</h3>
		</div>
		<div class="panel-body">
			<form:form class="form-horizontal" method="POST" id="contact-form"
				action="/Projekt/zapiszObiekt.html">
				<div class="control-group" style="display: none">
					<form:label path="id" class="control-label">Id obiektu</form:label>
					<div class="controls">
						<form:input path="id" value="${obiekt.id}" readonly="readonly" />
					</div>
				</div>
				<div class="control-group">
					<form:label path="nazwa" class="control-label col-md-offset-1">Nazwa</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" path="nazwa" 
							value="${obiekt.nazwa}" ></form:input>
					</div>
				</div>
				<div class="control-group">
					<form:label path="powierzchnia"
						class="control-label col-md-offset-1">Powierzchnia</form:label>
					<div class="controls col-md-offset-1">
						<form:input class="form-control" type="text" path="powierzchnia"
							value="${obiekt.powierzchnia}" />
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