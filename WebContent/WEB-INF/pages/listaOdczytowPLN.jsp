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
	<h1 align="center">Lista odczytów</h1>
	<br></br>

	<sql:query var="odczyty" dataSource="${postgres}">
select nazwa, 
odczytid, obiektid, odczytdata, okresod, okresdo, 
cieplogj, cieplopln, energiakwh, energiapln, gaznm3, gazpln, wodam3, wodapln
from obiekt
inner join odczyt using (obiektid)
</sql:query>

	<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th>Id</th>
					<th><center>Data odczytu</center></th>
					<th><center>Okres od</center></th>
					<th><center>Okres do</center></th>
					<th><center>Ciepło [PLN]</center></th>
					<th><center>Energia [PLN]</center></th>
					<th><center>Gaz [PLN]</center></th>
					<th><center>Woda [PLN]</center></th>
					<th><center>Nazwa obiektu</center></th>
					<th><center>Akcja</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="odczyt" items="${odczyty.rows}">
					<tr>
						<td><c:out value="${odczyt.odczytid}" /></td>
						<td align="center"><c:out value="${odczyt.odczytdata}" /></td>
						<td align="center"><c:out value="${odczyt.okresod}" /></td>
						<td align="center"><c:out value="${odczyt.okresdo}" /></td>
						<td align="center"><c:out value="${odczyt.cieplopln}" /></td>
						<td align="center"><c:out value="${odczyt.energiapln}" /></td>
						<td align="center"><c:out value="${odczyt.gazpln}" /></td>
						<td align="center"><c:out value="${odczyt.wodapln}" /></td>
						<td align="center"><c:out value="${odczyt.nazwa}" /></td>
						<td align="center"><a href="usunOdczyt.html?id=${odczyt.odczytid}"
							style="font-style: oblique;">Usuń /</a> 
							<a href="edytujOdczyt.html?id=${odczyt.odczytid}"
							style="font-style: oblique;"> Edytuj</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>