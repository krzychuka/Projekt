<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<sql:query var="oswietlenia" dataSource="${postgres}">
select * from oswietlenie</sql:query>

<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Wyszczególnienie</center></th>
					<th><center>MWh/rok</center></th>
					<th><center>GJ/rok</center></th>
					<th><center>Akcja</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="oswietlenie" items="${oswietlenia.rows}">
					<tr>
						<td align="left"><c:out value="${oswietlenie.opis}" /></td>
						<td align="left"><c:out value="${oswietlenie.kWh}" /></td>
						<td align="left"><c:out value="${oswietlenie.co2}" /></td>
						<td><a href="edytujOdczyt.html?id=${oswietlenie.co2rok}"
							style="font-style: oblique;">Edytuj</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>