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
		document.getElementById("srt1").value = document
				.getElementById("bjNazwa").value.match(/\(([^)]+)\)/)[1];
		document.getElementById("rokBudowySrt").value = document
				.getElementById("rokBudowySelect").value;
		document.getElementById("stanBudynkuSrt").value = document
				.getElementById("stanBudynkuSelect").value;
	}
</script>

</head>
<body>
	<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
		url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
		password="admin" scope="session" />

	<sql:query var="bj" dataSource="${postgres}">
select sposob_ogrzewania, bjid from bj
</sql:query>

	<h1 align="center">Dodaj Bj</h1>

	<form:form method="POST" action="/Projekt/saveZuzycieBj.html"
		id="formularz">
		<center>
			<div id="accordion" style="width: 80%;">
				<div>
					<table align="center">
						<tr>
							<td align="left">Sposób ogrzewania:</td>
							<td align="left"><select name="bjNazwa" id="bjNazwa"
								style="width: 200px; font-size: 18px;">
									<c:forEach var="row" items="${bj.rows}">
										<option>
											<c:out value="${row.sposob_ogrzewania}" />
											<c:out value="(${row.bjid})" />
										</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td style="display: none;">Bj Id:</td>
							<td style="display: none;"><input name="bjId" id="srt1"
								value="${zuzycie_Bj.bjId}"></td>
						</tr>
						<tr>
								<td align="left">Rok budowy:</td>
								<td align="left"><select name="rokBudowySelect"
									id="rokBudowySelect"
									style="width: 200px; font-size: 18px;">
										<option value="przed 1918">Przed 1918</option>
										<option value="1918-70">1918-70</option>
										<option value="1971-79">1971-79</option>
										<option value="po 1979">Po 1979</option>
								</select></td>
							</tr>
							<tr>
								<td align="left" style="display: none;">Rok budowy:</td>
								<td align="left" style="display: none;"><input type="text" id="rokBudowySrt" name="rokBudowy"
									value="${zuzycie_Bj.rokBudowy}" ></td>
							<tr />
							<tr>
								<td align="left">Rok budowy:</td>
								<td align="left"><select name="stanBudynkuSelect"
									id="stanBudynkuSelect"
									style="width: 200px; font-size: 18px;">
										<option value="przed termomodernizacją">Przed termomodernizacją</option>
										<option value="po termomodernizacji">Po termomodernizacji</option>
								</select></td>
							</tr>
							<tr>
								<td align="left" style="display: none;">Stan budynku:</td>
								<td align="left" style="display: none;"><input type="text" id="stanBudynkuSrt" name="stanBudynku"
									value="${zuzycie_Bj.stanBudynku}" ></td>
							<tr />
						<tr>
							<td align="left">Zuzycie finalne:</td>
							<td align="left"><input type="text" name="zuzycieFinalne"
								value="${zuzycie_Bj.zuzycieFinalne}"></td>
						<tr />
						<tr>
							<td align="left">SO2:</td>
							<td align="left"><input type="text" name="zuzycieSO2"
								value="${zuzycie_Bj.so2}"></td>
						<tr />
						<tr>
							<td align="left">Nox:</td>
							<td align="left"><input type="text" name="zuzycieNox"
								value="${zuzycie_Bj.nox}"></td>
						<tr />
						<tr>
							<td align="left">CO:</td>
							<td align="left"><input type="text" name="zuzycieCO"
								value="${zuzycie_Bj.co}"></td>
						<tr />
						<tr>
							<td align="left">Pył:</td>
							<td align="left"><input type="text" name="zuzyciePyl"
								value="${zuzycie_Bj.pyl}"></td>
						<tr />
						<tr>
							<td align="left">CO2:</td>
							<td align="left"><input type="text" name="zuzycieCO2"
								value="${zuzycie_Bj.co2}"></td>
						<tr />
						<tr>
							<td align="left">BaP:</td>
							<td align="left"><input type="text" name="zuzycieBaP"
								value="${zuzycie_Bj.BaP}"></td>
						<tr />
						<tr>
							<td align="left">Rok:</td>
							<td align="left"><input type="text" name="zuzycieRok"
								value="${zuzycie_Bj.rok}"></td>
						<tr />
					</table>
				</div>
			</div>
		</center>
		<center>
			<input type="submit" value="Dodaj" onclick="run()" />
		</center>
	</form:form>
</body>
</html>