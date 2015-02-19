<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-UTF-8" />

<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>

<style type="text/css">
html,body {
	height: 100%;
}
</style>

</head>
<body>
	<table style="width: 90%; height: 100%;" cellpadding="2" 
		cellspacing="2" align="center" background="<c:url value="/resources/img/tlo_gniezno.jpg" />">
		<tr>
			<td style="height: 20%;" align="center" colspan="2"><tiles:insertAttribute
					name="header"></tiles:insertAttribute></td>
		</tr>
		<tr>
			<td style="width: 15%; height: 90%;" valign=top><tiles:insertAttribute
					name="menu"></tiles:insertAttribute></td>
			<td style="width: 85%; height: 90%;"><tiles:insertAttribute
					name="body"></tiles:insertAttribute></td>
		</tr>
	</table>
</body>
</html>