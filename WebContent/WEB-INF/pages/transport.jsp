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

<sql:query var="transporty" dataSource="${postgres}">
select transportszczegolowo, 
mwrok, 
gjrok, 
co2rok  from transport</sql:query>

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
					<th><center> Mg CO2/rok</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="transport" items="${transporty.rows}">
					<tr>
						<td align="center"><c:out value="${transport.transportszczegolowo}" /></td>
						<td align="center"><c:out value="${transport.mwrok}" /></td>
						<td align="center"><c:out value="${transport.gjrok}" /></td>
						<td align="center"><c:out value="${transport.co2rok}" /></td>
						<td><a href="edytujOdczyt.html?id=${transport.co2rok}"
							style="font-style: oblique;">Edytuj</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td><center>Suma</center></td>
					<td><center></center></td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>