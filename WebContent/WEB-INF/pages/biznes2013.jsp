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

<sql:query var="biznesy" dataSource="${postgres}">
select * from biznes2013</sql:query>

<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" id="odczytTable"
			class="table table-striped table-bordered" cellspacing="0"
			width="100%" align="center">
			<thead>
				<tr>
					<th style="display: none;">Id</th>
					<th><center>Kategoria</center></th>
					<th><center>Symbol</center></th>
					<th><center>Ciepło sieciowe</center></th>
					<th><center>Gaz ziemny</center></th>
					<th><center>Węgiel</center></th>
					<th><center>Gaz ciekly</center></th>
					<th><center>Olej opałowy</center></th>
					<th><center>Drewno</center></th>
					<th><center>Biomasa</center></th>
					<th><center>Olej napędowy</center></th>
					<th><center>Benzyna</center></th>
					<th><center>Gaz ciekły</center></th>
					<th><center>Energia elektr. na potrzeby c.o./c.w.u. [MWh/rok] wg ankiet</center></th>
					<th><center>Energia elektryczna na pozostałe cele [MWh/rok]</center></th>
					<th><center>Eneria elektryczna razem [MWh/rok]</center></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="biznes2013" items="${biznesy.rows}">
					<tr>
						<td align="left"><c:out value="${biznes2013.kategoria}" /></td>
						<td align="left"><c:out value="${biznes2013.symbol}" /></td>
						<td align="left"><c:out value="${biznes2013.cieplo_sieciowe}" /></td>
						<td align="left"><c:out value="${biznes2013.gaz_ziemny}" /></td>
						<td align="left"><c:out value="${biznes2013.wegiel}" /></td>
						<td align="left"><c:out value="${biznes2013.gaz_ciekly}" /></td>
						<td align="left"><c:out value="${biznes2013.olej_opalowy}" /></td>
						<td align="left"><c:out value="${biznes2013.drewno}" /></td>
						<td align="left"><c:out value="${biznes2013.biomasa}" /></td>
						<td align="left"><c:out value="${biznes2013.olej_napedowy}" /></td>
						<td align="left"><c:out value="${biznes2013.benzyna}" /></td>
						<td align="left"><c:out value="${biznes2013.gaz_ciekly2}" /></td>
						<td align="left"><c:out value="${biznes2013.ee_co}" /></td>
						<td align="left"><c:out value="${biznes2013.ee_poz}" /></td>
						<td align="left"><c:out value="${biznes2013.ee_razem}" /></td>
						<td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Edytuj
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</body>
</html>