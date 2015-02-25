<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
	password="admin" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div style="width: 60%; margin-left: 20%">
		<table align="center" class="table table-striped table-bordered">
			<tr>
				<td>Nazwa</td>
				<td><form:form method="POST">${bukip.nazwa}</form:form></td>
			</tr>
			<tr>
				<td>Adres</td>
				<td><form:form method="POST">${bukip.adres}</form:form></td>
			</tr>
			<tr>
				<td>Powierzchnia</td>
				<td><form:form method="POST">${bukip.powierzchnia}</form:form></td>
			</tr>
			<tr>
				<td>Liczba użytkowników</td>
				<td><form:form method="POST">${bukip.liczbaUzytkownikow}</form:form></td>
			</tr>
		</table>
	</div>

	<sql:query var="bukip" dataSource="${postgres}">
	select bukipid, 
	zuzyciebukipid,
	round(cast(bap as numeric), 2) as roundbap, 
	round(cast(co as numeric), 2) as roundco, 
	round(cast(co2 as numeric), 2) as roundco2, 
	round(cast(zuzyciefinalne as numeric), 2) as roundzuzyciefinalne, 
	round(cast(so2 as numeric), 2) as roundso2, 
	round(cast(nox as numeric), 2) as roundnox, 
	round(cast(pyl as numeric), 2) as roundpyl, 
	round(cast(rok as numeric), 0) as roundrok
	from bukip
	inner join zuzycie_bukip using (bukipid)
	where bukipid=${bukip.id}
	</sql:query>

	<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="bupTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th style="display: none;">Zużycie Bup Id</th>
					<th><center>Zużycie finalne</center></th>
					<th><center>SO2</center></th>
					<th><center>Nox</center></th>
					<th><center>CO</center></th>
					<th><center>Pył</center></th>
					<th><center>CO2</center></th>
					<th><center>BaP</center></th>
					<th><center>Rok</center></th>
					<th><center>Edycja</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${bukip.rows}">
					<tr>
						<td align="center" style="display: none;"><c:out
								value="${row.bukipid}" /></td>
						<td align="center" style="display: none;"><c:out
								value="${row.zuzyciebukipid}" /></td>
						<td align="center"><c:out value="${row.roundzuzyciefinalne}" /></td>
						<td align="center"><c:out value="${row.roundso2}" /></td>
						<td align="center"><c:out value="${row.roundnox}" /></td>
						<td align="center"><c:out value="${row.roundco}" /></td>
						<td align="center"><c:out value="${row.roundpyl}" /></td>
						<td align="center"><c:out value="${row.roundco2}" /></td>
						<td align="center"><c:out value="${row.roundbap}" /></td>
						<td align="center"><c:out value="${row.roundrok}" /></td>
						<td align="center"><a
							href="editZuzycieBukip.html?id=${row.zuzyciebukipid}"
							style="font-style: oblique;">Edytuj</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>