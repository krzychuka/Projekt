<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="postgres" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/postgres" user="postgres"
	password="admin" scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>

<!--  
<script>
	$(document).ready(function() {
		$("#tabelaCalkowiteKoszty, #tabelaCieplo").dataTable({
			"oLanguage" : {
				"sSearch" : "Szukaj:",
				"sLengthMenu" : "Wyświetl _MENU_ rekordów na stronie",
				"sZeroRecords" : "Nic nie znaleziono",
				"sInfo" : "Pokaż rekordy od _START_ do _END_ ",
				"sInfoEmpty" : "0 rekordów do wyświetlenia",
				"sInfoFiltered" : "( z _MAX_ wszystkich rekordów )",
				"oPaginate" : {
					"sNext" : "Następna",
					"sPrevious" : "Poprzednia",
					"sFirst" : "Pierwsza",
					"sLast" : "Ostatnia"
				}
			},
		});
	});
</script>-->

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
								$('tr', table)
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
							};

							var table = document
									.getElementById('tabelaJednostkoweKoszty'), options = {
								chart : {
									renderTo : 'wykresJednostkoweKoszty',
									type : 'column'
								},
								title : {
									text : 'Jednostkowe koszty'
								},
								xAxis : {
									max : 3
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
        $(function () 
                {
                    // On document ready, call visualize on the datatable.
                    $(document).ready(function () 
                    {
                        Highcharts.visualize = function (table, options) 
                        {
                            // the categories
                           var sliceNames = [];
	$('tbody th', table).each(function (i) 
	{
    	sliceNames.push(this.innerHTML);
	});

                            // the data series
                            options.series = [];
                            $('tr', table).each(function (i) 
                            {
                                var tr = this;
                                $('th, td', tr).each(function (j) 
                                {
                                    if (j > 0) { // skip first column
                                        if (i == 0) 
                                        { // get the name and init the series
                                            options.series[j-1] = 
                                            {
                                                name: this.innerHTML,
                                                data: []
                                            };
                                        }
                                        else 
                                        { // add values
                                        	 options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
                                        }
                                    }
                                });
                            });

                            var chart = new Highcharts.Chart(options);
                        }

                        var table = document.getElementById('tabelaCieplo'),
                options = {
                    chart: {
                        renderTo: 'wykresCieplo',
                        type: 'pie'
                    },
                    title: {
                        text: 'Ciepło'
                    },
                    xAxis: {
                },
                yAxis: {
                    title: {
                        text: 'Jednostki'
                    }
                },
                tooltip: 
               {
                    formatter: function() 
                   {
                       return '<b>'+ this.series.name +'</b><br/>'+
                          (this.y).toFixed(2) +' '+ this.point.name;
                    }
               },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function () {
                                return '<b>' + this.point.name + '</b>: ' + (this.percentage).toFixed(2) + ' %';
                            }
                        }
                    }
                }
            };

                        Highcharts.visualize(table, options);
                    });

                });
        </script>
        
        <script type="text/javascript">
        $(function () 
                {
                    // On document ready, call visualize on the datatable.
                    $(document).ready(function () 
                    {
                        Highcharts.visualize = function (table, options) 
                        {
                            // the categories
                           var sliceNames = [];
	$('tbody th', table).each(function (i) 
	{
    	sliceNames.push(this.innerHTML);
	});

                            // the data series
                            options.series = [];
                            $('tr', table).each(function (i) 
                            {
                                var tr = this;
                                $('th, td', tr).each(function (j) 
                                {
                                    if (j > 0) { // skip first column
                                        if (i == 0) 
                                        { // get the name and init the series
                                            options.series[j-1] = 
                                            {
                                                name: this.innerHTML,
                                                data: []
                                            };
                                        }
                                        else 
                                        { // add values
                                        	 options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
                                        }
                                    }
                                });
                            });

                            var chart = new Highcharts.Chart(options);
                        }

                        var table = document.getElementById('tabelaEnergia'),
                options = {
                    chart: {
                        renderTo: 'wykresEnergia',
                        type: 'pie'
                    },
                    title: {
                        text: 'Energia'
                    },
                    xAxis: {
                },
                yAxis: {
                    title: {
                        text: 'Jednostki'
                    }
                },
                tooltip: 
               {
                    formatter: function() 
                   {
                       return '<b>'+ this.series.name +'</b><br/>'+
                          (this.y).toFixed(2) +' '+ this.point.name;
                    }
               },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function () {
                                return '<b>' + this.point.name + '</b>: ' + (this.percentage).toFixed(2) + ' %';
                            }
                        }
                    }
                }
            };

                        Highcharts.visualize(table, options);
                    });

                });
        </script>
        
        <script type="text/javascript">
        $(function () 
                {
                    // On document ready, call visualize on the datatable.
                    $(document).ready(function () 
                    {
                        Highcharts.visualize = function (table, options) 
                        {
                            // the categories
                           var sliceNames = [];
	$('tbody th', table).each(function (i) 
	{
    	sliceNames.push(this.innerHTML);
	});

                            // the data series
                            options.series = [];
                            $('tr', table).each(function (i) 
                            {
                                var tr = this;
                                $('th, td', tr).each(function (j) 
                                {
                                    if (j > 0) { // skip first column
                                        if (i == 0) 
                                        { // get the name and init the series
                                            options.series[j-1] = 
                                            {
                                                name: this.innerHTML,
                                                data: []
                                            };
                                        }
                                        else 
                                        { // add values
                                        	 options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
                                        }
                                    }
                                });
                            });

                            var chart = new Highcharts.Chart(options);
                        }

                        var table = document.getElementById('tabelaGaz'),
                options = {
                    chart: {
                        renderTo: 'wykresGaz',
                        type: 'pie'
                    },
                    title: {
                        text: 'Gaz'
                    },
                    xAxis: {
                },
                yAxis: {
                    title: {
                        text: 'Jednostki'
                    }
                },
                tooltip: 
               {
                    formatter: function() 
                   {
                       return '<b>'+ this.series.name +'</b><br/>'+
                          (this.y).toFixed(2) +' '+ this.point.name;
                    }
               },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function () {
                                return '<b>' + this.point.name + '</b>: ' + (this.percentage).toFixed(2) + ' %';
                            }
                        }
                    }
                }
            };

                        Highcharts.visualize(table, options);
                    });

                });
        </script>
        
        <script type="text/javascript">
        $(function () 
                {
                    // On document ready, call visualize on the datatable.
                    $(document).ready(function () 
                    {
                        Highcharts.visualize = function (table, options) 
                        {
                            // the categories
                           var sliceNames = [];
	$('tbody th', table).each(function (i) 
	{
    	sliceNames.push(this.innerHTML);
	});

                            // the data series
                            options.series = [];
                            $('tr', table).each(function (i) 
                            {
                                var tr = this;
                                $('th, td', tr).each(function (j) 
                                {
                                    if (j > 0) { // skip first column
                                        if (i == 0) 
                                        { // get the name and init the series
                                            options.series[j-1] = 
                                            {
                                                name: this.innerHTML,
                                                data: []
                                            };
                                        }
                                        else 
                                        { // add values
                                        	 options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
                                        }
                                    }
                                });
                            });

                            var chart = new Highcharts.Chart(options);
                        }

                        var table = document.getElementById('tabelaWoda'),
                options = {
                    chart: {
                        renderTo: 'wykresWoda',
                        type: 'pie'
                    },
                    title: {
                        text: 'Woda'
                    },
                    xAxis: {
                },
                yAxis: {
                    title: {
                        text: 'Jednostki'
                    }
                },
                tooltip: 
               {
                    formatter: function() 
                   {
                       return '<b>'+ this.series.name +'</b><br/>'+
                          (this.y).toFixed(2) +' '+ this.point.name;
                    }
               },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function () {
                                return '<b>' + this.point.name + '</b>: ' + (this.percentage).toFixed(2) + ' %';
                            }
                        }
                    }
                }
            };

                        Highcharts.visualize(table, options);
                    });

                });
        </script>


</head>
<body>

	<h2 align="center">Jednostkowe Koszty</h2>

	<sql:query var="obiekt" dataSource="${postgres}">
select nazwa,
sum(cieplogj) as "resultcieplo", sum(energiakwh) as "resultenergia", sum(gaznm3) as "resultgaz", sum(wodam3) as "resultwoda",
sum(cieplopln) as "resultcieplopln", sum(energiapln) as "resultenergiapln", sum(gazpln) as "resultgazpln", sum(wodapln) as "resultwodapln", 
round(cast(sum(cieplopln)/sum(cieplogj) as numeric), 2) as "wskaznikcieplo",
round(cast(sum(energiapln)/sum(energiakwh) as numeric), 2) as "wskaznikenergia",
round(cast(sum(gazpln)/sum(gaznm3) as numeric), 2) as "wskaznikgaz",
round(cast(sum(wodapln)/sum(wodam3) as numeric), 2) as "wskaznikwoda"
from obiekt
inner join odczyt using (obiektid)
group by nazwa
</sql:query>

	<br></br>
	<div style="width: 90%; margin-left: 5%">
		<table style="font-size: 12px" align="center" border="0"
			id="tabelaJednostkoweKoszty" cellspacing="0px"
			class="table table-striped table-bordered" width="100%">
			<thead>
				<tr>
					<th style="text-align: center;">Nazwa</th>
					<th style="text-align: center;">Ciepło [PLN/GJ]</th>
					<th style="text-align: center;">Energia [PLN/kWh]</th>
					<th style="text-align: center;">Gaz [PLN/Nm3]</th>
					<th style="text-align: center;">Woda [PLN/m3]</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${obiekt.rows}">
					<tr>
						<th style="text-align: center;"><c:out value="${row.nazwa}" /></th>
						<td align="center"><c:out value="${row.wskaznikcieplo}" /></td>
						<td align="center"><c:out value="${row.wskaznikenergia}" /></td>
						<td align="center"><c:out value="${row.wskaznikgaz}" /></td>
						<td align="center"><c:out value="${row.wskaznikwoda}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br></br>
	<div id="wykresJednostkoweKoszty" style="width: 80%; margin: 10%"></div>
	<br></br>

	<ul class="nav nav-tabs" role="tablist">
		<li class="active"><a href="#1kartajust" role="tab" data-toggle="tab">Ciepło</a></li>
		<li><a href="#2kartajust" role="tab" data-toggle="tab">Energia</a></li>
		<li><a href="#3kartajust" role="tab" data-toggle="tab">Gaz</a></li>
		<li><a href="#4kartajust" role="tab" data-toggle="tab">Woda</a></li>
	</ul>

	<!-- Zawartość zakładek -->
	<div class="tab-content">
		<div class="tab-pane active" id="1kartajust">
		<br></br>
		<table id="tabelaCieplo" style="font-size: 12px; margin-left: 20%; width: 60%" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Nazwa</th>
							<th style="text-align: center;">Ciepło [PLN/GJ]</th>
						</tr>
					</thead>
					<tbody> 
						<c:forEach var="row" items="${obiekt.rows}">
							<tr>
								<th style="text-align: center;"><c:out value="${row.nazwa}" /></th>
								<td align="center"><c:out value="${row.wskaznikcieplo}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br></br>
				<div id="wykresCieplo" 
					style="width: 60%; height: 400px; margin-left: 20%"></div>
				<br></br></div>
		<div class="tab-pane" id="2kartajust">
		<br></br>
		<table id="tabelaEnergia" style="font-size: 12px; width: 60%; margin-left: 20%" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Nazwa</th>
							<th style="text-align: center;">Energia [PLN/kWh]</th>
						</tr>
					</thead>
					<tbody> 
						<c:forEach var="row" items="${obiekt.rows}">
							<tr>
								<th style="text-align: center;"><c:out value="${row.nazwa}" /></th>
								<td align="center"><c:out value="${row.wskaznikenergia}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br></br>
				<div id="wykresEnergia"
					style="width: 60%; height: 400px; margin-left: 10%"></div>
				<br></br></div>
		<div class="tab-pane" id="3kartajust">
		<br></br>
		<table id="tabelaGaz" style="font-size: 12px; width: 60%; margin-left: 20%" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Nazwa</th>
							<th style="text-align: center;">Gaz [PLN/Nm3]</th>
						</tr>
					</thead>
					<tbody> 
						<c:forEach var="row" items="${obiekt.rows}">
							<tr>
								<th style="text-align: center;"><c:out value="${row.nazwa}" /></th>
								<td align="center"><c:out value="${row.wskaznikgaz}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br></br>
				<div id="wykresGaz"
					style="width: 60%; height: 400px; margin-left: 10%"></div>
				<br></br>
		</div>
		<div class="tab-pane" id="4kartajust">
		<br></br>
		<table id="tabelaWoda" style="font-size: 12px; margin-left: 20%; width: 60%" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Nazwa</th>
							<th style="text-align: center;">Woda [PLN/m3]</th>
						</tr>
					</thead>
					<tbody> 
						<c:forEach var="row" items="${obiekt.rows}">
							<tr>
								<th style="text-align: center;"><c:out value="${row.nazwa}" /></th>
								<td align="center"><c:out value="${row.wskaznikwoda}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br></br>
				<div id="wykresWoda"
					style="width: 60%; height: 400px; margin-left: 10%"></div>
				<br></br>
		</div>
	</div>
</body>
</html>