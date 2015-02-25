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
	src="<%=request.getContextPath()%>/resources/js/messages_pl.js"></script>

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
								adres : {
									minlength : 2,
									required : true
								},
								powierzchnia : {
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
								element.text('').addClass('valid').closest(
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

	<h1 align="center">Dodaj UrbisPwik</h1>
	<div class="container-fluid col-md-offset-3 col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Dodaj UrbisPwik</h3>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" method="POST" id="contact-form"
					action="/Projekt/saveUrbisPwik.html">
					<div class="control-group" style="display: none">
						<form:label path="id" class="control-label">Id urbisPwik</form:label>
						<div class="controls">
							<form:input path="id" value="${urbisPwik.id}" readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<form:label path="nazwa" class="control-label col-md-offset-1">Nazwa</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="nazwa"
								value="${urbisPwik.nazwa}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="adres" class="control-label col-md-offset-1">Adres</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="adres"
								value="${urbisPwik.adres}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="powierzchnia"
							class="control-label col-md-offset-1">Powierzchnia</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" type="text" path="powierzchnia"
								value="${urbisPwik.powierzchnia}" />
						</div>
					</div>
					<div class="control-group">
						<form:label class="control-label col-md-offset-1"
							path="liczbaUzytkownikow">Liczba
						użytkowników</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" type="text"
								path="liczbaUzytkownikow" value="${urbisPwik.liczbaUzytkownikow}" />
						</div>
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


	<%-- <tr>
								<td align="left">Nazwa:</td>
								<td align="left"><input type="text" name="bupNazwa"
									value="${bup.nazwa}" ></td>
							<tr />
							<tr>
								<td align="left">Adres:</td>
								<td align="left"><input type="text" name="bupAdres"
									value="${bup.adres}" ></td>
							<tr />
							<tr>
								<td align="left">Powierzchnia:</td>
								<td align="left"><input type="text" name="bupPowierzchnia"
									value="${bup.powierzchnia}" ></td>
							<tr />
							<tr>
								<td align="left">Liczba użytkowników:</td>
								<td align="left"><input type="text" name="bupLiczbaUzytkownikow"
									value="${bup.liczbaUzytkownikow}" ></td>
							<tr /> --%>
	<!-- 							<tr> -->
	<!-- 								<td align="left">Zużycie finalne:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieFinalne" -->
	<%-- 									value="${zuzycieBup.zuzycieFinalne}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">SO2:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieSO2" -->
	<%-- 									value="${zuzycieBup.zuzycieSO2}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">Nox:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieNox" -->
	<%-- 									value="${zuzycieBup.zuzycieNox}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">CO:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieCO" -->
	<%-- 									value="${zuzycieBup.zuzycieCO}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">Pył:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzyciePyl" -->
	<%-- 									value="${zuzycieBup.zuzyciePyl}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">CO2:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieCO2" -->
	<%-- 									value="${zuzycieBup.zuzycieCO2}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">BaP:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieBaP" -->
	<%-- 									value="${zuzycieBup.zuzycieBaP}" ></td> --%>
	<!-- 							<tr /> -->
	<!-- 							<tr> -->
	<!-- 								<td align="left">Rok:</td> -->
	<!-- 								<td align="left"><input type="text" name="zuzycieRok" -->
	<%-- 									value="${zuzycieBup.zuzycieRok}" ></td> --%>
	<!-- 							<tr /> -->
</body>
</body>
</html>