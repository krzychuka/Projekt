<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>

<h1 align="center">
		Dodaj Bup
		</h1>

		<form:form method="POST" action="/Projekt/saveBup.html" 
			id="formularz">
			<center>
				<div id="accordion" style="width: 80%;">
					<div>
						<table align="center">
							<tr>
								<td align="left">Nazwa:</td>
								<td align="left"><input type="text" name="bupNazwa"
									value="${bup.nazwa}" ></td>
							<tr />
							<tr>
								<td align="left">Adres:</td>
								<td align="left"><input type="text" name="bupAdres"
									value="${bup.adres}" ></td>
							<tr />
							<tr>
								<td align="left">Powierzchnia:</td>
								<td align="left"><input type="text" name="bupPowierzchnia"
									value="${bup.powierzchnia}" ></td>
							<tr />
							<tr>
								<td align="left">Liczba użytkowników:</td>
								<td align="left"><input type="text" name="bupLiczbaUzytkownikow"
									value="${bup.liczbaUzytkownikow}" ></td>
							<tr />
<!-- 							<tr> -->
<!-- 								<td align="left">Zużycie finalne:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieFinalne" -->
<%-- 									value="${zuzycieBup.zuzycieFinalne}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">SO2:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieSO2" -->
<%-- 									value="${zuzycieBup.zuzycieSO2}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">Nox:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieNox" -->
<%-- 									value="${zuzycieBup.zuzycieNox}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">CO:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieCO" -->
<%-- 									value="${zuzycieBup.zuzycieCO}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">Pył:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzyciePyl" -->
<%-- 									value="${zuzycieBup.zuzyciePyl}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">CO2:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieCO2" -->
<%-- 									value="${zuzycieBup.zuzycieCO2}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">BaP:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieBaP" -->
<%-- 									value="${zuzycieBup.zuzycieBaP}" ></td> --%>
<!-- 							<tr /> -->
<!-- 							<tr> -->
<!-- 								<td align="left">Rok:</td> -->
<!-- 								<td align="left"><input type="text" name="zuzycieRok" -->
<%-- 									value="${zuzycieBup.zuzycieRok}" ></td> --%>
<!-- 							<tr /> -->
						</table>
					</div>
				</div>
			</center>
			<center>
				<input type="submit" value="Dodaj"/>
			</center>
		</form:form>
</body>
</body>
</html>