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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/dataTables.columnFilter.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document)
			.ready(
					function() {
						$('#example')
								.dataTable(
										{
											"bJQueryUI" : true,
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
											"fnFooterCallback" : function(nRow,
													aaData, iStart, iEnd,
													aiDisplay) {
												var iTotal = [ 0, 0, 0 ];
												for (var i = 0; i < aaData.length; i++) {
													iTotal[0] += Number(aaData[i][2]);
													iTotal[1] += Number(aaData[i][3]);
													iTotal[2] += Number(aaData[i][4]);
												}

												var iPage = [ 0, 0, 0 ];
												for (var i = iStart; i < iEnd; i++) {
													iPage[0] += Number(aaData[aiDisplay[i]][2]);
													iPage[1] += Number(aaData[aiDisplay[i]][3]);
													iPage[2] += Number(aaData[aiDisplay[i]][4]);
												}

												var iAverage = [ 0, 0, 0 ];
												iAverage[0] = Number(iPage[0]
														/ iEnd);
												iAverage[1] = Number(iPage[1]
														/ iEnd);
												iAverage[2] = Number(iPage[2]
														/ iEnd);

												var secondRow = $(nRow).next()[0];
												var nCells = secondRow
														.getElementsByTagName('th');
												nCells[2].innerHTML = iPage[0]
														.toFixed(2);
												nCells[3].innerHTML = iPage[1]
														.toFixed(2);
												nCells[4].innerHTML = iPage[2]
														.toFixed(2);

												var thirdRow = $(secondRow)
														.next()[0];
												var nsCells = thirdRow
														.getElementsByTagName('th');
												nsCells[2].innerHTML = iAverage[0]
														.toFixed(2);
												nsCells[3].innerHTML = iAverage[1]
														.toFixed(2);
												nsCells[4].innerHTML = iAverage[2]
														.toFixed(2);
											}
										}).columnFilter({
									aoColumns : [ null, {
										type : "text"
									}, {
										type : "number"
									}, {
										type : "number"
									}, {
										type : "number"
									}, {
										type : "text"
									}, null ]
								});
					});
</script>

<style type="text/css">
.text_filter {
	width: 100px;
}
</style>

<style type="text/css">
.number_filter {
	width: auto;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Lista obiektów</h1>
	<br></br>
	<sql:query var="obiekty" dataSource="${postgres}">
select obiektid, nazwa, powierzchnia, kubatura, liczba_uzytkownikow, czycalodobowy
from Obiekt</sql:query>

	<div class="container col-md-offset-1 col-md-10">
		<table id="example" style="font-size: 12px"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Nazwa</center></th>
					<th><center>Powierzchnia</center></th>
					<th><center>Kubatura</center></th>
					<th><center>Liczba użytkowników</center></th>
					<th><center>Całodobowy</center></th>
					<th><center>Akcja</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obiekt" items="${obiekty.rows}">
					<tr>
						<td style="display: none"><c:out value="${obiekt.obiektid}" /></td>
						<td align="center"><c:out value="${obiekt.nazwa}" /></td>
						<td align="center"><c:out value="${obiekt.powierzchnia}" /></td>
						<td align="center"><c:out value="${obiekt.kubatura}" /></td>
						<td align="center"><c:out
								value="${obiekt.liczba_uzytkownikow}" /></td>
						<td align="center"><c:choose>
								<c:when test="${obiekt.czyCalodobowy=='true'}">
									<p>TAK</p>
								</c:when>
								<c:otherwise>
									<p>NIE</p>
								</c:otherwise>
							</c:choose></td>
						<td align="center"><a
							href="usunObiekt.html?id=${obiekt.obiektid}"
							style="font-style: oblique;">Usuń /</a> <a
							href="edytujObiekt.html?id=${obiekt.obiektid}"
							style="font-style: oblique;"> Edytuj /</a>
							<a
							href="otworzObiekt.html?id=${obiekt.obiektid}"
							style="font-style: oblique;"> Otwórz</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td style="display: none;"><center>Id</center></td>
					<td><center>Nazwa</center></td>
					<td><center>Powierzchnia</center></td>
					<td><center>Kubatura</center></td>
					<td><center>Liczba użytkowników</center></td>
					<td><center>Całodobowy</center></td>
					<td><center></center></td>
				</tr>
				<tr>
					<th style="text-align: center;">SUMA:</th>
					<th style="display: none;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
				</tr>
				<tr>
					<th style="text-align: center;">ŚREDNIA:</th>
					<th style="display: none;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>