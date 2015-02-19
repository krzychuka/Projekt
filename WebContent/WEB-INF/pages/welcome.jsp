<!DOCTYPE html>
<%@page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap</title>

<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</head>
<body>

<div align="center" style="margin-left: 5%">
<table style="width: 100%;">
<tr>
<td align="center"><b>Stan na 2013</b></td>
<td align="center"><b>Stan na 2020</b></td>
</tr>
<tr>
<td>
	<table class="table table-bordered" style="font-size: 11px; width: 95%">
		<thead>
			<tr>
				<th style="text-align: center;" rowspan="5">Kategoria</th>
				<th style="text-align: center;">2013</th>
				<th style="text-align: center;">2013</th>
			<tr>
			<tr>
				<th style="text-align: center;">MWh</th>
				<th style="text-align: center;">kg/a</th>
			<tr>
			<tr>
				<th style="text-align: center;">FZE</th>
				<th style="text-align: center;">CO2</th>
			<tr>
		</thead>
		<tbody>
			<tr class="active">
				<td>BUDYNKI, WYPOSAŻENIE/URZĄDZENIA I PRZEMYSŁ:</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Budynki użyteczności publicznej</td>
				<td style="text-align: right;">41 794,1</td>
				<td style="text-align: right;">14 383 658,9</td>
			</tr>
			<tr>
				<td>Budynki mieszkalne wielorodzinne</td>
				<td style="text-align: right;">148 290,2</td>
				<td style="text-align: right;">36 704 373,2</td>
			</tr>
			<tr>
				<td>Budynki mieszkalne indywidualne</td>
				<td style="text-align: right;">140 155,8</td>
				<td style="text-align: right;">33 739 521,9</td>
			</tr>
			<tr>
				<td>Budynki usług komercyjnych i przemysłu</td>
				<td style="text-align: right;">115 206,0</td>
				<td style="text-align: right;">27 715 303,8</td>
			</tr>
			<tr>
				<td>Oświetlenie uliczne</td>
				<td style="text-align: right;">4 388,3</td>
				<td style="text-align: right;">3 893 076,1</td>
			</tr>
			<tr>
				<td>Zużycie energii elektrycznej</td>
				<td style="text-align: right;">139 345,8</td>
				<td style="text-align: right;">123 619 948,4</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>589 180,3</b></td>
				<td style="text-align: right;"><b>240 055 882,3</b></td>
			</tr>
			<tr class="active">
				<td>TRANSPORT</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Transport publiczny</td>
				<td style="text-align: right;">6 737,1</td>
				<td style="text-align: right;">1 778 503,0</td>
			</tr>
			<tr>
				<td>Transport użyteczność publiczna</td>
				<td style="text-align: right;">73,1</td>
				<td style="text-align: right;">18 050,7</td>
			</tr>
			<tr>
				<td>Transport indywidualny</td>
				<td style="text-align: right;">366 563,0</td>
				<td style="text-align: right;">93 696 006,3</td>
			</tr>
			<tr>
				<td>Transport kolejowy</td>
				<td style="text-align: right;">1611,8</td>
				<td style="text-align: right;">1 308 814,1</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>374 984,9</b></td>
				<td style="text-align: right;"><b>96 801 374,1</b></td>
			</tr>
			<tr class="active">
				<td>GOSPODARKA ODPADOWA I WOLNOŚCIEKOWA</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Urbis</td>
				<td style="text-align: right;">4 003,3</td>
				<td style="text-align: right;">984 779,1</td>
			</tr>
			<tr>
				<td>PWiK</td>
				<td style="text-align: right;">39 306,1</td>
				<td style="text-align: right;">9 143 211,9</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>43 309,4</b></td>
				<td style="text-align: right;"><b>10 127 991,0</b></td>
			</tr>
			<tr class="active">
				<td><b>RAZEM</b></td>
				<td style="text-align: right;"><b>1 007 474,6</b></td>
				<td style="text-align: right;"><b>346 985 247,4</b></td>
			</tr>
		</tbody>
	</table>
	</td>
	<td>
	<table class="table table-bordered" style="font-size: 11px; width: 95%;">
		<thead>
			<tr>
				<th style="text-align: center;" rowspan="5">Kategoria</th>
				<th style="text-align: center;">2020</th>
				<th style="text-align: center;">2020</th>
			<tr>
			<tr>
				<th style="text-align: center;">MWh</th>
				<th style="text-align: center;">kg/a</th>
			<tr>
			<tr>
				<th style="text-align: center;">FZE</th>
				<th style="text-align: center;">CO2</th>
			<tr>
		</thead>
		<tbody>
			<tr class="active">
				<td>BUDYNKI, WYPOSAŻENIE/URZĄDZENIA I PRZEMYSŁ:</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Budynki użyteczności publicznej</td>
				<td style="text-align: right;">40 818,7</td>
				<td style="text-align: right;">14 059 855,5</td>
			</tr>
			<tr>
				<td>Budynki mieszkalne wielorodzinne</td>
				<td style="text-align: right;">143 793,5</td>
				<td style="text-align: right;">34 876 171,3</td>
			</tr>
			<tr>
				<td>Budynki mieszkalne indywidualne</td>
				<td style="text-align: right;">123 266,2</td>
				<td style="text-align: right;">28 643 704,7</td>
			</tr>
			<tr>
				<td>Budynki usług komercyjnych i przemysłu</td>
				<td style="text-align: right;">105 206,6</td>
				<td style="text-align: right;">27 703 092,1</td>
			</tr>
			<tr>
				<td>Oświetlenie uliczne</td>
				<td style="text-align: right;">4 399,3</td>
				<td style="text-align: right;">3 902 834,7</td>
			</tr>
			<tr>
				<td>Zużycie energii elektrycznej</td>
				<td style="text-align: right;">139 344,8</td>
				<td style="text-align: right;">123 610 189,8</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>556 819,1</b></td>
				<td style="text-align: right;"><b>232 795 848,2</b></td>
			</tr>
			<tr class="active">
				<td>TRANSPORT</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Transport publiczny</td>
				<td style="text-align: right;">6 737,1</td>
				<td style="text-align: right;">1 778 503,0</td>
			</tr>
			<tr>
				<td>Transport użyteczność publiczna</td>
				<td style="text-align: right;">73,1</td>
				<td style="text-align: right;">18 050,7</td>
			</tr>
			<tr>
				<td>Transport indywidualny</td>
				<td style="text-align: right;">366 563,0</td>
				<td style="text-align: right;">93 696 006,3</td>
			</tr>
			<tr>
				<td>Transport kolejowy</td>
				<td style="text-align: right;">1611,8</td>
				<td style="text-align: right;">1 308 814,1</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>374 984,9</b></td>
				<td style="text-align: right;"><b>96 801 374,1</b></td>
			</tr>
			<tr class="active">
				<td>GOSPODARKA ODPADOWA I WOLNOŚCIEKOWA</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Urbis</td>
				<td style="text-align: right;">4 003,3</td>
				<td style="text-align: right;">984 779,1</td>
			</tr>
			<tr>
				<td>PWiK</td>
				<td style="text-align: right;">31 092,1</td>
				<td style="text-align: right;">7 314 569,5</td>
			</tr>
			<tr>
				<td><b>Razem</b></td>
				<td style="text-align: right;"><b>35 095,4</b></td>
				<td style="text-align: right;"><b>8 299 348,7</b></td>
			</tr>
			<tr class="active">
				<td><b>RAZEM</b></td>
				<td style="text-align: right;"><b>966 899,5</b></td>
				<td style="text-align: right;"><b>337 896 570,9</b></td>
			</tr>
		</tbody>
	</table>
	</td>
	</tr>
</table>
</div>
</body>
</html>