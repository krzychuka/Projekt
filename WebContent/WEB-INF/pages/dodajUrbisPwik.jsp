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
		Dodaj UrbisPwik
		</h1>

		<form:form method="POST" action="/Projekt/saveUrbisPwik.html" 
			id="formularz">
			<center>
				<div id="accordion" style="width: 80%;">
					<div>
						<table align="center">
							<tr>
								<td align="left">Nazwa:</td>
								<td align="left"><input type="text" name="urbisPwikNazwa"
									value="${urbisPwik.nazwa}" ></td>
							<tr />
							<tr>
								<td align="left">Adres:</td>
								<td align="left"><input type="text" name="urbisPwikAdres"
									value="${urbisPwik.adres}" ></td>
							<tr />
							<tr>
								<td align="left">Powierzchnia:</td>
								<td align="left"><input type="text" name="urbisPwikPowierzchnia"
									value="${urbisPwik.powierzchnia}" ></td>
							<tr />
							<tr>
								<td align="left">Liczba użytkowników:</td>
								<td align="left"><input type="text" name="urbisPwikLiczbaUzytkownikow"
									value="${urbisPwik.liczbaUzytkownikow}" ></td>
							<tr />
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