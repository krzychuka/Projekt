<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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

<script>
	$(document).ready(function() {
		$('#odczytTable').dataTable({
			"oLanguage" : {
				"sSearch" : "Szukaj:",
				"sLengthMenu" : "Wyświetl _MENU_ rekordów na stronie",
				"sZeroRecords" : "Nic nie znaleziono",
				"sInfo" : "Pokaż rekordy od _START_ do _END_ ",
				"sInfoEmpty" : "0 rekordów do wyświetlenia",
				"sInfoFiltered" : "( z _MAX_ wszystkich rekordów )",
				"oPaginate" : {
					"sNext" : "Następna",
					"sPrevious" : "Poprzednia",
					"sFirst" : "Pierwsza",
					"sLast" : "Ostatnia"
				}
			},
		});
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">Bw</h2>
	<br></br>

	<sql:query var="bws" dataSource="${postgres}">
select adres, powierzchnia, kubatura,
bwid, 
round(cast(bap as numeric), 2) as roundbap, 
round(cast(co as numeric), 2) as roundco, 
round(cast(co2 as numeric), 2) as roundco2, 
round(cast(zuzyciefinalne as numeric), 2) as roundzuzyciefinalne, 
round(cast(so2 as numeric), 2) as roundso2, 
round(cast(nox as numeric), 2) as roundnox, 
round(cast(pyl as numeric), 2) as roundpyl, 
round(cast(rok as numeric), 0) as roundrok
from bw
inner join zuzycie_bw using (bwid)
</sql:query>

	<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Adres</center></th>
					<th><center>Powierzchnia</center></th>
					<th><center>Kubatura</center></th>
					<th><center>Zużycie finalne</center></th>
					<th><center>SO2</center></th>
					<th><center>Nox</center></th>
					<th><center>CO</center></th>
					<th><center>Pył</center></th>
					<th><center>CO2</center></th>
					<th><center>BaP</center></th>
					<th><center>Rok</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bw" items="${bws.rows}">
					<tr>
						<td style="display: none;"><c:out value="${bw.bwid}" /></td>
						<td align="center"><c:out value="${bw.adres}" /></td>
						<td align="center"><c:out value="${bw.powierzchnia}" /></td>
						<td align="center"><c:out value="${bw.kubatura}" /></td>
						<td align="center"><c:out value="${bw.roundzuzyciefinalne}" /></td>
						<td align="center"><c:out value="${bw.roundso2}" /></td>
						<td align="center"><c:out value="${bw.roundnox}" /></td>
						<td align="center"><c:out value="${bw.roundco}" /></td>
						<td align="center"><c:out value="${bw.roundpyl}" /></td>
						<td align="center"><c:out value="${bw.roundco2}" /></td>
						<td align="center"><c:out value="${bw.roundbap}" /></td>
						<td align="center"><c:out value="${bw.roundrok}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
