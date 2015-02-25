<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>

<sql:query var="bie" dataSource="${postgres}">
select * from bie2013</sql:query>

<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Kategoria</center></th>
					<th><center>Symbol</center></th>
					<th><center>FZE [MWh]</center></th>
					<th><center>SO2 [kg/a]</center></th>
					<th><center>Nox [kg/a]</center></th>
					<th><center>CO [kg/a]</center></th>
					<th><center>Pył [kg/a]</center></th>
					<th><center>CO2 [kg/a]</center></th>
					<th><center>B(a)P [kg/a]</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bie2013" items="${bie.rows}">
					<tr>
						<td align="left"><c:out value="${bie2013.kategoria}" /></td>
						<td align="left"><c:out value="${bie2013.symbol}" /></td>
						<td align="left"><c:out value="${bie2013.fze}" /></td>
						<td align="left"><c:out value="${bie2013.so2}" /></td>
						<td align="left"><c:out value="${bie2013.nox}" /></td>
						<td align="left"><c:out value="${bie2013.co}" /></td>
						<td align="left"><c:out value="${bie2013.pyl}" /></td>
						<td align="left"><c:out value="${bie2013.co2}" /></td>
						<td align="left"><c:out value="${bie2013.bap}" /></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</body>
</html>