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
	<h2 align="center">Budynki użyteczności publicznej</h2>
	<br></br>

<%-- 	<sql:query var="bups" dataSource="${postgres}">
select nazwa, adres, powierzchnia, liczba_uzytkownikow,
bupid, 
round(cast(bap as numeric), 2) as roundbap, 
round(cast(co as numeric), 2) as roundco, 
round(cast(co2 as numeric), 2) as roundco2, 
round(cast(zuzyciefinalne as numeric), 2) as roundzuzyciefinalne, 
round(cast(so2 as numeric), 2) as roundso2, 
round(cast(nox as numeric), 2) as roundnox, 
round(cast(pyl as numeric), 2) as roundpyl, 
round(cast(rok as numeric), 0) as roundrok
from bup
inner join zuzycie_bup using (bupid)
</sql:query> --%>

	<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Nazwa</center></th>
					<th><center>Adres</center></th>
					<th><center>Powierzchnia</center></th>
					<th><center>Liczba użytkowników</center></th>
					<th><center>Zużycie</center></th>
					<%-- <th><center>Zużycie finalne</center></th>
					<th><center>SO2</center></th>
					<th><center>Nox</center></th>
					<th><center>CO</center></th>
					<th><center>Pył</center></th>
					<th><center>CO2</center></th>
					<th><center>BaP</center></th>
					<th><center>Rok</center></th> --%>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach var="bup" items="${bups.rows}">
					<tr>
						<td style="display: none;"><c:out value="${bup.bupid}" /></td>
						<td align="center"><c:out value="${bup.nazwa}" /></td>
						<td align="center"><c:out value="${bup.adres}" /></td>
						<td align="center"><c:out value="${bup.powierzchnia}" /></td>
						<td align="center"><c:out value="${bup.liczba_uzytkownikow}" /></td>
						<td align="center">
								<a href="otworzBup.html?id=${bup.bupid}"
								style="height: 30px; font-size: 15px; font-style: oblique;">Zużycie</a></td>
						<td align="center"><c:out value="${bup.roundzuzyciefinalne}" /></td>
						<td align="center"><c:out value="${bup.roundso2}" /></td>
						<td align="center"><c:out value="${bup.roundnox}" /></td>
						<td align="center"><c:out value="${bup.roundco}" /></td>
						<td align="center"><c:out value="${bup.roundpyl}" /></td>
						<td align="center"><c:out value="${bup.roundco2}" /></td>
						<td align="center"><c:out value="${bup.roundbap}" /></td>
						<td align="center"><c:out value="${bup.roundrok}" /></td>
					</tr>
				</c:forEach> --%>
				<c:forEach items="${bups}" var="bup">
					<tr>
						<td style="display: none;"><center>
								<c:out value="${bup.id}" />
							</center></td>
						<td><center>
								<c:out value="${bup.nazwa}" />
							</center></td>
						<td><center>
								<c:out value="${bup.adres}" />
							</center></td>
						<td><center>
								<c:out value="${bup.powierzchnia}" />
							</center></td>
						<td><center>
								<c:out value="${bup.liczbaUzytkownikow}" />
							</center></td>
						<td align="center"><a href="otworzBup.html?id=${bup.id}"
							style="height: 30px; font-size: 15px; font-style: oblique;">Zużycie</a>
							<a href="editBup.html?id=${bup.id}"
							style="height: 30px; font-size: 15px; font-style: oblique;">Edytuj</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
