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

<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</head>
<body>
<!-- <div id="MainMenu" > -->
<!--   <div class="list-group panel" style="text-align: center;"> -->
<!--     <a href="#demo1" class="list-group-item list-group-item-info" data-toggle="collapse" data-parent="#MainMenu"><b>Obiekty</b></a> -->
<!--     <div class="collapse" id="demo1"> -->
<!--       <a href="obiekt.html" class="list-group-item">Dodaj obiekt</a> -->
<!--       <a href="listaObiektow.html" class="list-group-item">Lista obiektów</a> -->
<!--     </div> -->
<!--     <a href="#demo2" class="list-group-item list-group-item-info" data-toggle="collapse" data-parent="#MainMenu"><b>Odczyty</b></a> -->
<!--     <div class="collapse" id="demo2"> -->
<!--       <a href="odczyt.html" class="list-group-item">Dodaj odczyt</a> -->
<!--       <a href="odczyty.html" class="list-group-item">Lista odczytów</a> -->
<!--       <a href="odczytyPLN.html" class="list-group-item">Lista odczytów PLN</a> -->
<!--     </div> -->
<!--     <a href="#demo3" class="list-group-item list-group-item-info" data-toggle="collapse" data-parent="#MainMenu"><b>Statystyki</b></a> -->
<!--     <div class="collapse" id="demo3"> -->
<!--       <a href="calkowiteZuzycie.html" class="list-group-item">Całkowite zużycie</a> -->
<!--       <a href="jednostkoweZuzycie.html" class="list-group-item">Jednostkowe zużycie</a> -->
<!--       <a href="calkowiteKoszty.html" class="list-group-item">Całkowite koszty</a> -->
<!--       <a href="jednostkoweKoszty.html" class="list-group-item">Jednostkowe koszty</a>	 -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-home">
                            </span> Budynki</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-user text-primary"></span><a href="bups.html"> Użyteczności publicznej</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-home text-primary"></span><a href="bukips.html"> Mieszkalne</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-plane text-primary"></span><a href="urbisPwiks.html"> Usługowe</a>
                                    </td>
                                </tr>
                           
                    
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-shopping-cart">
                            </span> Przemysł i usługi komunalne</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-road text-primary"></span><a href="listaObiektow.html"> Transport</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-off  text-primary"></span><a href="listaObiektow.html"> Oświetlenie</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-fire text-primary"></span><a href="listaObiektow.html"> Przemysł</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-flash text-primary"></span><a href="listaObiektow.html"> Energetyka</a>
                                    </td>
                                </tr>                      
                    
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-folder-open">
                            </span> Pozostałe</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-tree-conifer text-primary"></span><a href="listaObiektow.html"> Rolnictwo i leśnictwo</a>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-trash text-primary"></span><a href="listaObiektow.html"> Gospodarka odpadami</a>
                                    </td>
                                </tr>
 
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-stats">
                            </span> Raporty</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-list-alt text-primary"></span><a href="calkowiteZuzycie.html"> Całkowite zużycie</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-list-alt text-primary"></span><a href="jednostkoweZuzycie.html"> Jednostkowe zużycie</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <span class="glyphicon glyphicon-usd text-primary"></span> <a href="calkowiteKoszty.html"> Całkowite koszty</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <span class="glyphicon glyphicon-usd text-primary"></span> <a href="jednostkoweKoszty.html"> Jednostkowe koszty</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                
       
            </div>
</body>
</html>