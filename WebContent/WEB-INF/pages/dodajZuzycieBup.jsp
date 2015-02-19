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
	src="<%= request.getContextPath() %>/resources/js/messages_pl.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	function run() {
		document.getElementById("srt1").value = document
				.getElementById("bupNazwa").value.match(/\(([^)]+)\)/)[1];
	}
</script>

</head>
<body>
<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
	password="admin" scope="session" />

<sql:query var="bup" dataSource="${postgres}">
select nazwa, bupid from bup
</sql:query>

<h1 align="center">
		Dodaj Bup
		</h1>

		<form:form method="POST" action="/Projekt/saveZuzycieBup.html" 
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
		</form:form>
</body>
</html>