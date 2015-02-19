<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
	password="admin" scope="session" />

<html>
<head>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">

<link type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery.ui.1.10.3.ie.css"
	rel="stylesheet">
<link type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery-ui-1.10.3.custom.css"
	rel="stylesheet">
<link type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery-ui-1.10.3.theme.css"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.ui.datepicker-pl.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/messages_pl.js"></script>

<script type="text/javascript">
	function run() {
		document.getElementById("srt1").value = document.getElementById("srt").value
				.match(/\(([^)]+)\)/)[1];
	}
</script>

<script>
	$(function() {
		$("#data").datepicker({});
	});
</script>

<script>
	$(function() {
		$("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			onClose : function(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			onClose : function(selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>

<script>
	$(document)
			.ready(
					function() {

						$('#contact-form')
								.validate(
										{
											rules : {
												data : {
													required : true
												},
												okresPoczatek : {
													required : true,
												},
												okresKoniec : {
													required : true,
												},
												cieploGJ : {
													required : true,
													number : true
												},
												cieploPLN : {
													required : true,
													number : true
												},
												energiaKWH : {
													required : true,
													number : true
												},
												energiaPLN : {
													required : true,
													number : true
												},
												gazNM3 : {
													required : true,
													number : true
												},
												gazPLN : {
													required : true,
													number : true
												},
												wodaM3 : {
													required : true,
													number : true
												},
												wodaPLN : {
													required : true,
													number : true
												}
											},
											highlight : function(element) {
												$(element)
														.closest(
																'.control-group')
														.removeClass(
																'has-success has-feedback')
														.addClass('has-error');
											},
											success : function(element) {
												element
														.text('OK!')
														.addClass('valid')
														.closest(
																'.control-group')
														.removeClass(
																'has-error')
														.addClass(
																'has-success has-feedback');
											},
											errorElement : 'span',
											errorClass : 'help-block',
											errorPlacement : function(error,
													element) {
												if (element
														.parent('.input-group').length) {
													error.insertAfter(element
															.parent());
												} else {
													error.insertAfter(element);
												}
											}
										});
					}); // end document.ready
</script>

<style type="text/css">
.top-buffer {
	margin-bottom: 5px;
}
</style>

</head>
<body>

	<sql:query var="obiekt" dataSource="${postgres}">
select nazwa, obiektid from obiekt
</sql:query>

	<div class="container-fluid col-md-offset-1 col-md-10">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Dodaj odczyt</h3>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" method="POST"
					action="/Projekt/zapiszOdczyt.html"
					id="contact-form">
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Nazwa</label>
							<div class="col-sm-3">
								<select name="obiektNazwa" id="srt" class="form-control">
									<c:forEach var="row" items="${obiekt.rows}">
										<option>
											<c:out value="${row.nazwa}" />
											<c:out value="(${row.obiektid})" />
										</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group" style="display: none;">
							<label class="col-sm-3 control-label">Obiekt Id:</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.obiektId}" id="srt1"
									name="obiektId">
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Data</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.data}" id="data"
									name="data">
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Okres od</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.okresPoczatek}"
									id="from" name="okresPoczatek">
							</div>
							<div class="control-group">
								<label class="col-sm-3 control-label">do</label>
								<div class="col-sm-3">
									<input class="form-control" value="${odczyt.okresKoniec}"
										id="to" name="okresKoniec">
								</div>
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Ciepło GJ</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.cieploGJ}"
									name="cieploGJ">
							</div>
							<div class="control-group">
								<label class="col-sm-3 control-label">Ciepło PLN</label>
								<div class="col-sm-3">
									<input class="form-control" value="${odczyt.cieploPLN}"
										name="cieploPLN">
								</div>
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Energia kWh</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.energiaKWH}"
									name="energiaKWH">
							</div>
							<div class="control-group">
								<label class="col-sm-3 control-label">Energia PLN</label>
								<div class="col-sm-3">
									<input class="form-control" value="${odczyt.energiaPLN}"
										name="energiaPLN">
								</div>
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Gaz NM3</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.gazNM3}"
									name="gazNM3">
							</div>
							<div class="control-group">
								<label class="col-sm-3 control-label">Gaz PLN</label>
								<div class="col-sm-3">
									<input class="form-control" value="${odczyt.gazPLN}"
										name="gazPLN">
								</div>
							</div>
						</div>
					</div>
					<div class="row top-buffer">
						<div class="control-group">
							<label class="col-sm-3 control-label">Woda m3</label>
							<div class="col-sm-3">
								<input class="form-control" value="${odczyt.wodaM3}"
									name="wodaM3">
							</div>
							<div class="control-group">
								<label class="col-sm-3 control-label">Woda PLN</label>
								<div class="col-sm-3">
									<input class="form-control" value="${odczyt.wodaPLN}"
										name="wodaPLN">
								</div>
							</div>
						</div>
					</div>

					<!--<table class="table">
					<tr>
						<td align="left"><b>Nazwa obiektu:</b></td>
						<td align="left"><select name="obiektNazwa" id="srt">
								<c:forEach var="row" items="${obiekt.rows}">
									<option>
										<c:out value="${row.nazwa}" />
										<c:out value="(${row.obiektid})" />
									</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td style="display: none;">Obiekt Id:</td>
						<td style="display: none;"><input name="obiektId" id="srt1"
							value="${odczyt.obiektId}"></td>
					</tr>
					<tr class="control-group">
						<td align="left"><b>Data:</b></td>
						<td align="left"><input type="text" name="data" id="data"
							value="${odczyt.data}"></td>
					</tr>
					<tr>
						<td align="left"><b>Okres od:</b></td>
						<td align="left"><input type="text" name="okresPoczatek" id="from"
							value="${odczyt.okresPoczatek}"></td>
						<td align="left"><b>Okres do:</b></td>
						<td align="left"><input type="text" name="okresKoniec" id="to"
							value="${odczyt.okresKoniec}"></td>
					</tr>
					<tr>
						<td align="left"><b>Ciepło GJ:</b></td>
						<td align="left"><input type="text" name="cieploGJ"
							value="${odczyt.cieploGJ}"></td>
						<td align="left"><b>Ciepło PLN:</b></td>
						<td align="left"><input type="text" name="cieploPLN"
							value="${odczyt.cieploPLN}"></td>
					</tr>
					<tr>
						<td align="left"><b>Energia kWh:</b></td>
						<td align="left"><input type="text" name="energiaKWH"
							value="${odczyt.energiaKWH}"></td>
						<td align="left"><b>Energia PLN:</b></td>
						<td align="left"><input type="text" name="energiaPLN"
							value="${odczyt.energiaPLN}"></td>
					</tr>
					<tr>
						<td align="left"><b>Gaz NM3:</b></td>
						<td align="left"><input type="text" name="gazNM3"
							value="${odczyt.gazNM3}"></td>
						<td align="left"><b>Gaz PLN:</b></td>
						<td align="left"><input type="text" name="gazPLN"
							value="${odczyt.gazPLN}"></td>
					</tr>
					<tr>
						<td align="left"><b>Woda m3:</b></td>
						<td align="left"><input type="text" name="wodaM3"
							value="${odczyt.wodaM3}"></td>
						<td align="left"><b>Woda PLN:</b></td>
						<td align="left"><input type="text" name="wodaPLN"
							value="${odczyt.wodaPLN}"></td>
					</tr>
				</table>-->
					<center>
						<button type="submit" class="btn btn-primary" onclick="run()">Dodaj</button>
					</center>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>