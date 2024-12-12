<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@page import="Algorithms.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    
<!DOCTYPE html>
<html lang="en">
   <!-- Basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- Site Metas -->
   <title>Life Care - Responsive HTML5 Multi Page Template</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- Site Icons -->
   <link rel="shortcut icon" href="images/fevicon.ico.png" type="image/x-icon" />
   <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <!-- Site CSS -->
   <link rel="stylesheet" href="style.css">
   <!-- Colors CSS -->
   <link rel="stylesheet" href="css/colors.css">
   <!-- ALL VERSION CSS -->
   <link rel="stylesheet" href="css/versions.css">
   <!-- Responsive CSS -->
   <link rel="stylesheet" href="css/responsive.css">
   <!-- Custom CSS -->
   <link rel="stylesheet" href="css/custom.css">
   <!-- Modernizer for Portfolio -->
  <script type="text/javascript" src="jsnew/jquery-1.9.1.min.js"></script>
<script src="jsnew/highcharts.js"></script>
<script>
	
<%          
chk1 c = new chk1();
c.br();
String a1=c.accql;
String a2=c.accfuzzy;
String a3=c.accrf;
			
			
			
			
			
			%>
	$(function() {
		$('#containergss').highcharts(
				{
					chart : {
						type : 'column'
					},
					title : {
						text : 'Calculate Accuracy'
					},
					subtitle : {

					},
					xAxis : {
						title : {
							text : 'Methods'
						},
						categories : [ 'QLearning','Fuzzy','Random Forest' ],
						labels : {
							rotation : -45,
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}

					},
					yAxis : {
						title : {
							text : 'Rate in %'
						},

					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '<b>{point.y:1f}%</b>'
					},
					series : [ {
						name : 'Time(S)',
						data : [
<%=a1%>
	,
<%=a2%>
	,
<%=a3%>
	
	],
						dataLabels : {
							enabled : false,
							rotation : -90,
							color : '#FFFFFF',
							align : 'right',
							format : '{point.y:.1f}', // one decimal
							y : 10, // 10 pixels down from the top
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					} ]
				});
	});
</script>
  
  
   </head>
   <body class="clinic_version">
      
      <header>
         <div class="header-top wow fadeIn">
            <div class="container">
               <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="image"></a>
               
            </div>
         </div>
         <div class="header-bottom wow fadeIn">
            <div class="container">
               <nav class="main-menu">
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i class="fa fa-bars" aria-hidden="true"></i></button>
                  </div>
				  
                  <div id="navbar" class="navbar-collapse collapse">
                     <ul class="nav navbar-nav">
                        <li><a  href="HospitalHomePage.jsp">Home</a></li>
                        <li><a  data-scroll href="H_DataPage.jsp">Data Show</a></li>
                        
                        <li><a data-scroll href="H_Add_Patient_infoPage.jsp">Add Patient Info</a></li>
                         <!-- <li><a class="active" data-scroll href="AnalysisPage.jsp">Analysis</a></li> -->
 <li><a data-scroll href="loginpage">Logout</a></li>
                        
                     </ul>
                  </div>
               </nav>
               <div class="serch-bar">
                  <div id="custom-search-input">
                    
                  </div>
               </div>
            </div>
         </div>
      </header>
      <div >
      <br/>
      <br/>
           </div>
           <div >
      <br/>
      <br/>
           </div>
       <div id="service" class="services wow fadeIn" >
         <div class="container">
         
            <div class="row">
            
                <div >
                  <div class="appointment-form" align="center">
                
                   
                     <div class="form">
                        
                          <div id="containergss"
										style="min-width: 600px; height: 500px; max-width: 200px;"
										align="center"></div>
                          
                           
                           
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end section -->
	  
	  <!-- doctor -->
	  
	 	  
	   
      
      </body>
</html>
