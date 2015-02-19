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

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/highstock.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>

<script type="text/javascript">
        $(document).ready(function() 
        	    { 
        	        $("#tabelaZuzycie, #tabelaKoszty").dataTable({
        	        	"bPaginate": false,
        	        	"bFilter": false,
        	        	"bInfo": false,
                	     "oLanguage": {
                	    	 	"sSearch": "Szukaj:",
                	            "sLengthMenu": "Wyświetl _MENU_ rekordów na stronie",
                	            "sZeroRecords": "Nic nie znaleziono",
                	            "sInfo": "Pokaż rekordy od _START_ do _END_ ",
                	            "sInfoEmpty": "0 rekordów do wyświetlenia",
                	            "sInfoFiltered": "( z _MAX_ wszystkich rekordów )"
                	        },
                	        "fnFooterCallback": function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
                   			 var iTotal = [0,0,0,0];
                                for ( var i=0 ; i<aaData.length ; i++ )
                                   {
                               	 iTotal[0] += Number(aaData[i][1]);
                               	 iTotal[1] += Number(aaData[i][2]);
                               	 iTotal[2] += Number(aaData[i][3]);
                               	 iTotal[3] += Number(aaData[i][4]);
                                   }
                                
                                var iPage = [0,0,0,0];
                                for ( var i=iStart ; i<iEnd ; i++ )
                    			{
                    				iPage[0] += Number(aaData[ aiDisplay[i] ][1]);
                    				iPage[1] += Number(aaData[ aiDisplay[i] ][2]);
                    				iPage[2] += Number(aaData[ aiDisplay[i] ][3]);
                    				iPage[3] += Number(aaData[ aiDisplay[i] ][4]);
                    			}
                                
                                var iAverage = [0,0,0,0];
                               	 iAverage[0] = Number(iPage[0]/iEnd);
                               	 iAverage[1] = Number(iPage[1]/iEnd);
                               	 iAverage[2] = Number(iPage[2]/iEnd);
                               	 iAverage[3] = Number(iPage[3]/iEnd);

                                var nCells = nRow.getElementsByTagName('th');
                                   nCells[1].innerHTML=iPage[0].toFixed(2);
                                   nCells[2].innerHTML=iPage[1].toFixed(2);
                                   nCells[3].innerHTML=iPage[2].toFixed(2);
                                   nCells[4].innerHTML=iPage[3].toFixed(2);                       
                                   
                                   var secondRow = $(nRow).next()[0];
                                   var nsCells = secondRow.getElementsByTagName('th');
                                   nsCells[1].innerHTML = iAverage[0].toFixed(2);
                                   nsCells[2].innerHTML = iAverage[1].toFixed(2);
                                   nsCells[3].innerHTML = iAverage[2].toFixed(2);
                                   nsCells[4].innerHTML = iAverage[3].toFixed(2);
                   		} 
        	        }); 
        	    } 
        	); 
        </script>

<script type="text/javascript">
	$(function() {
		$(document)
				.ready(
						function() {
							Highcharts.visualize = function(table, options) {
								// the categories
								options.xAxis.categories = [];
								$('tbody th', table).each(
										function(i) {
											options.xAxis.categories
													.push(this.innerHTML);
										});

								// the data series
								options.series = [];
								$('tbody tr, thead tr', table)
										.each(
												function(i) {
													var tr = this;
													$('th, td', tr)
															.each(
																	function(j) {
																		if (j > 0) { // skip first column
																			if (i == 0) { // get the name and init the series
																				options.series[j - 1] = {
																					name : this.innerHTML,
																					data : []
																				};
																			} else { // add values
																				options.series[j - 1].data
																						.push(parseFloat(this.innerHTML));
																			}
																		}
																	});
												});

								var chart = new Highcharts.Chart(options);
							}

							var table = document
									.getElementById('tabelaZuzycie'), options = {
								chart : {
									renderTo : 'wykresZuzycie',
									type : 'line'
								},
								title : {
									text : 'Odczyty'
								},

								xAxis : {
									max : 11
								},

								scrollbar : {
									enabled : true
								},

								yAxis : {
									title : {
										text : 'Jednostki'
									}
								},

								tooltip : {
									formatter : function() {
										return '<b>' + this.series.name
												+ '</b><br/>' + this.y + ' '
												+ this.x.toLowerCase();
									}
								}
							};

							Highcharts.visualize(table, options);
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$(document)
				.ready(
						function() {
							Highcharts.visualize = function(table, options) {
								// the categories
								options.xAxis.categories = [];
								$('tbody th', table).each(
										function(i) {
											options.xAxis.categories
													.push(this.innerHTML);
										});

								// the data series
								options.series = [];
								$('tbody tr, thead tr', table)
										.each(
												function(i) {
													var tr = this;
													$('th, td', tr)
															.each(
																	function(j) {
																		if (j > 0) { // skip first column
																			if (i == 0) { // get the name and init the series
																				options.series[j - 1] = {
																					name : this.innerHTML,
																					data : []
																				};
																			} else { // add values
																				options.series[j - 1].data
																						.push(parseFloat(this.innerHTML));
																			}
																		}
																	});
												});

								var chart = new Highcharts.Chart(options);
							}

							var table = document.getElementById('tabelaKoszty'), options = {
								chart : {
									renderTo : 'wykresKoszty',
									type : 'line'
								},
								title : {
									text : 'Odczyty'
								},

								xAxis : {
									max : 11
								},

								scrollbar : {
									enabled : true
								},

								yAxis : {
									title : {
										text : 'Jednostki'
									}
								},

								tooltip : {
									formatter : function() {
										return '<b>' + this.series.name
												+ '</b><br/>' + this.y + ' '
												+ this.x.toLowerCase();
									}
								}
							};

							Highcharts.visualize(table, options);
						});

	});
</script>

</head>
<body>

	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table id="example" style="font-size: 12px"
				class="table table-striped table-bordered" cellspacing="0"
				width="100%" align="center">
				<tr>
					<td>Nazwa</td>
					<td>${obiekt.nazwa}</td>
				</tr>
				<tr>
					<td>Powierzchnia</td>
					<td>${obiekt.powierzchnia}</td>
				</tr>
				<tr>
					<td>Kubatura</td>
					<td>${obiekt.kubatura}</td>
				</tr>
				<tr>
					<td>Liczba użytkowników</td>
					<td>${obiekt.liczbaUzytkownikow}</td>
				</tr>
				<tr>
					<td>Całodobowy</td>
					<td><c:choose>
							<c:when test="${obiekt.czyCalodobowy=='true'}">
								<p>TAK</p>
							</c:when>
							<c:otherwise>
								<p>NIE</p>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</div>
	</div>

	<sql:query var="obiekt" dataSource="${postgres}">
select odczytdata , cieplogj, cieplopln, energiakwh, energiapln, gaznm3, gazpln, wodam3, wodapln
from obiekt
inner join odczyt using (obiektid)
where obiektid=${obiekt.id}
</sql:query>


		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#1kartajust" role="tab"
				data-toggle="tab">Zużycie</a></li>
			<li><a href="#2kartajust" role="tab" data-toggle="tab">Koszty</a></li>
		</ul>


	<div class="tab-content">
		<div class="tab-pane active" id="1kartajust">
			<br></br> <br></br>
			<table style="font-size: 12px; width: 60%; margin-left: 20%"
				class="table table-striped table-bordered" 
				id="tabelaZuzycie">
				<thead>
					<tr>
						<th>Data</th>
						<th>Ciepło [GJ]</th>
						<th>Energia [kWh]</th>
						<th>Gaz [Nm3]</th>
						<th>Woda [m3]</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${obiekt.rows}">
						<tr>
							<td align="center"><c:out value="${row.odczytdata}" /></td>
							<td align="center"><c:out value="${row.cieplogj}" /></td>
							<td align="center"><c:out value="${row.energiakwh}" /></td>
							<td align="center"><c:out value="${row.gaznm3}" /></td>
							<td align="center"><c:out value="${row.wodam3}" /></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th style="text-align: center;">SUMA:</th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
					</tr>
					<tr>
						<th style="text-align: center;">ŚREDNIA:</th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;"></th>
					</tr>
				</tfoot>
			</table>
			<br></br>
			<div id="wykresZuzycie"
				style="width: 70%; height: 400px; margin-left: 15%"></div>
	</div>
	<div class="tab-pane" id="2kartajust">
		<br></br> <br></br>
		<table style="font-size: 12px; width: 60%; margin-left: 20%"
			class="table table-striped table-bordered" 
			id="tabelaKoszty">
			<thead>
				<tr>
					<th>Data</th>
					<th>Ciepło [PLN]</th>
					<th>Energia [PLN]</th>
					<th>Gaz [PLN]</th>
					<th>Woda [PLN]</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${obiekt.rows}">
					<tr>
						<td align="center"><c:out value="${row.odczytdata}" /></td>
						<td align="center"><c:out value="${row.cieplopln}" /></td>
						<td align="center"><c:out value="${row.energiapln}" /></td>
						<td align="center"><c:out value="${row.gazpln}" /></td>
						<td align="center"><c:out value="${row.wodapln}" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th style="text-align: center;">SUMA:</th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
				</tr>
				<tr>
					<th style="text-align: center;">ŚREDNIA:</th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
				</tr>
			</tfoot>
		</table>
		<br></br>
			<div id="wykresKoszty"
				style="width: 60%; height: 400px; margin-left: 10%"></div>
	</div>
	</div>
</body>
</html>