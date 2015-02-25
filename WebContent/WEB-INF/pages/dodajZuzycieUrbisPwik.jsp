<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

<title>Insert title here</title>

<script type="text/javascript">
	function run() {
		document.getElementById("srt1").value = document.getElementById("srt").value
				.match(/\(([^)]+)\)/)[1];

		document.getElementById("inputRok").value = document.getElementById("selectRok").value;
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#contact-form').validate(
						{
							rules : {
								finalne : {
									required : true,
									number : true
								},
								sO2 : {
									required : true,
									number : true
								},
								nox : {
									required : true,
									number : true
								},
								cO2 : {
									required : true,
									number : true
								},
								pyl : {
									required : true,
									number : true
								},
								cO : {
									required : true,
									number : true
								},
								baP : {
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

</head>
<body>
	<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
		url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
		password="admin" scope="session" />

	<sql:query var="urbisPwik" dataSource="${postgres}">
select nazwa, urbispwikid from urbispwik
</sql:query>


	<h1 align="center">Dodaj zużycie UrbisPwik</h1>
	<div class="container-fluid col-md-offset-3 col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Dodaj zużycie</h3>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" method="POST" id="contact-form"
					action="/Projekt/saveZuzycieUrbisPwik.html">
					<div class="control-group" style="display: none;">
						<form:label path="id" class="control-label col-md-offset-1">Id zużycie Urbis Pwik</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="id"
								value="${zuzycieUrbisPwik.id}" readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label col-md-offset-1">Urbis Pwik nazwa</label>
						<div class="controls col-md-offset-1">
							<%-- <form:input class="form-control" path="beanBupId" value="${zuzycieBup.beanBupId}"  /> --%>
							<select name="urbisPwikNazwa" id="srt" class="form-control">
								<c:forEach var="row" items="${urbisPwik.rows}">
									<option>
										<c:out value="${row.nazwa}" />
										<c:out value="(${row.urbispwikid})" />
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group" style="display: none;">
						<form:label path="beanUrbisPwikId" class="control-label col-md-offset-1">Urbis Pwik id</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="beanUrbisPwikId"
								value="${zuzycieUrbisPwik.beanUrbisPwikId}" id="srt1"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="finalne" class="control-label col-md-offset-1">Finalne</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="finalne"
								value="${zuzycieUrbisPwik.finalne}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="sO2" class="control-label col-md-offset-1">SO2</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="sO2"
								value="${zuzycieUrbisPwik.sO2}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="nox" class="control-label col-md-offset-1">Nox</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="nox"
								value="${zuzycieUrbisPwik.nox}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="cO2" class="control-label col-md-offset-1">CO2</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="cO2"
								value="${zuzycieUrbisPwik.cO2}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="pyl" class="control-label col-md-offset-1">Pyl</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="pyl"
								value="${zuzycieUrbisPwik.pyl}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="cO" class="control-label col-md-offset-1">CO</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="cO"
								value="${zuzycieUrbisPwik.cO}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<form:label path="baP" class="control-label col-md-offset-1">BaP</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="baP"
								value="${zuzycieUrbisPwik.baP}"></form:input>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label col-md-offset-1">Rok</label>
						<div class="controls col-md-offset-1">
							<%-- <form:input class="form-control" path="rok"
								value="${zuzycieBup.rok}"></form:input> --%>
							<select class="form-control" id="selectRok">
								<option>2013</option>
								<option>2020</option>
							</select>
						</div>
					</div>
					<div class="control-group" style="display: none;">
						<form:label path="rok" class="control-label col-md-offset-1">Rok</form:label>
						<div class="controls col-md-offset-1">
							<form:input class="form-control" path="rok" id="inputRok"
								value="${zuzycieUrbisPwik.rok}"></form:input>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-1 col-sm-2">
							<button type="submit" class="btn btn-primary" onclick="run()">Dodaj</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<%-- 	<form:form method="POST" action="/Projekt/saveZuzycieBup.html" 
			id="formularz">
			<center>
				<div id="accordion" style="width: 80%;">
					<div>
						<table align="center">
						<tr>
								<td align="left">Nazwa Bup:</td>
								<td align="left"><select name="bupNazwa"
									id="bupNazwa"
									style="width: 200px; font-size: 18px;">
										<c:forEach var="row" items="${bup.rows}">
											<option>
												<c:out value="${row.nazwa}" />
												<c:out value="(${row.bupid})" />
											</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="display: none;">Bup Id:</td>
								<td style="display: none;"><input name="bupId" id="srt1"
									value="${zuzycie_Bup.bupId}"></td>
							</tr>
							<tr>
								<td align="left">Zuzycie finalne:</td>
								<td align="left"><input type="text" name="zuzycieFinalne"
									value="${zuzycie_Bup.zuzycieFinalne}" ></td>
							<tr />
							<tr>
								<td align="left">SO2:</td>
								<td align="left"><input type="text" name="zuzycieSO2"
									value="${zuzycie_Bup.so2}" ></td>
							<tr />
							<tr>
								<td align="left">Nox:</td>
								<td align="left"><input type="text" name="zuzycieNox"
									value="${zuzycie_Bup.nox}" ></td>
							<tr />
							<tr>
								<td align="left">CO:</td>
								<td align="left"><input type="text" name="zuzycieCO"
									value="${zuzycie_Bup.co}" ></td>
							<tr />
							<tr>
								<td align="left">Pył:</td>
								<td align="left"><input type="text" name="zuzyciePyl"
									value="${zuzycie_Bup.pyl}" ></td>
							<tr />
							<tr>
								<td align="left">CO2:</td>
								<td align="left"><input type="text" name="zuzycieCO2"
									value="${zuzycie_Bup.co2}" ></td>
							<tr />
							<tr>
								<td align="left">BaP:</td>
								<td align="left"><input type="text" name="zuzycieBaP"
									value="${zuzycie_Bup.BaP}" ></td>
							<tr />
							<tr>
								<td align="left">Rok:</td>
								<td align="left"><input type="text" name="zuzycieRok"
									value="${zuzycie_Bup.rok}" ></td>
							<tr />
						</table>
					</div>
				</div>
			</center>
			<center>
				<input type="submit" value="Dodaj" onclick="run()"/>
			</center>
		</form:form> --%>
</body>
</html>