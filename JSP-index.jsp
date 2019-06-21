<%@ page import = "java.sql.*" %>
<%
 // create database portfolio
//create table contact (name varchar(30) , email varchar(100) , comment varchar(150) , id int primary key AUTO_INCREMENT );
	  
	  String param    = request.getParameter("param1");
	  String p	 	  = param == null ? "" : param;
	  
	  System.out.println("-------parameter-----"+param);
	  
	  String name    = request.getParameter("name");
	  String email   = request.getParameter("email");
	  String comment = request.getParameter("comments");

	  String signName  = request.getParameter("signName");
	  String signPass  = request.getParameter("signPass");
	  String signEmail = request.getParameter("signEmail");

	  String username  = request.getParameter("username");
	  String password  = request.getParameter("password");
	  

	  System.out.println("-------N------"+name);
	  System.out.println("-------C------"+email);
	  System.out.println("-------UN------"+username);
	  System.out.println("-------SN------"+signName);
	  System.out.println("-------SE------"+signEmail);
	  
	  if ( 
			  (name     != null && email    != null)
		   || (username != null && password != null)
		   || (signName != null && signName != null && signEmail  != null)	     
	     )
	  { 
		  String sqlStr = "";
		  Connection conn;  
		  
	      try
	      {
	      Class.forName("com.mysql.jdbc.Driver");
	      conn = DriverManager.getConnection("jdbc:mysql://35.193.125.17/portfolio", "root", ""); // <== Check!
	      // Connection conn = DriverManager.getConnection("jdbc:odbc:eshopODBC");  // Access
	      Statement stmt = conn.createStatement();
	      	    
	      if (p.equals("portfolio"))
	      {
	    	  sqlStr = "insert into contact(name,email,comment) values ('"+name+"','"+email+"','"+comment+"')";
	    	  stmt.executeUpdate(sqlStr);
	      }
	      
	      
	      conn.close();
	      
	      } 
	      catch (Exception e) 
	      {
	        System.out.println("problem during the connection with the database!"+e);
	      }
	  }
 %>

<!DOCTYPE html>
<html lang="en">
<head>
  
  <title>Porfolio</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>  
  <script src="./js/bootstrap.min.js"></script>
  
   <script>   
   
 
   
   // IF USED ONCLICK DEFAULT VALIDATION WONT WORK
   function submitVal(val)
   {	
	  
	  
	  if ( val == "login")
	  {
		  $('#param').attr('value', val);
		  
		 //document.location.href="bootstrap/Portfolio.jsp";		 
		   document.forms[val].action = "/bootstrap/mainAction";		  
		   document.forms[val].submit();
	  }	
	   else   
	 {
		$('#param1').attr('value', val);
	    document.forms[val].submit();
	 }
   }
   
   </script>
  
  <style>
  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #0033FF;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }  
  .jumbotron {
      background-color: #3399FF;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #3399FF;
      font-size: 50px;
  }
  .logo {
      color: #3399FF;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #3399FF;
  }
  .carousel-indicators li {
      border-color: #3399FF;
  }
  .carousel-indicators li.active {
      background-color: #3399FF;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel 
  {
      border: 1px solid #3399FF; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover 
  {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #3399FF;
      background-color: #fff !important;
      color: #3399FF;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #3399FF !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #3399FF;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: #3399FF;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 3px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #3399FF !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #3399FF;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }

  </style>
    
</head>
  
  
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" >

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
      <a class="navbar-brand" href="#myPage" style="font-size: 16px">Logo</a>
      <!-- 
      <a class="navbar-brand" href= "#myModal#" data-toggle="modal" data-target="#myModal"><strong>Register</strong></a>
      -->
      
      <div class="btn-group" >
        <div style="height:8px"></div>
       <button type="button" class="btn btn-primary">access</button>
       <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
       </button>
       <ul class="dropdown-menu" role="menu">
       <li ><a href="#"><span style="color:#3399FF" href= "#myModal#" data-toggle="modal" data-target="#signup">SignUp</span></a></li>
       <li ><a href="#"><span style="color:#3399FF" href= "#myModal#" data-toggle="modal" data-target="#login">Login</span></a></li>
       </ul>
      </div>
      
      
    </div>
    
     <!-- Modal -->
  <div class="modal fade in" id="login" role="dialog">
    <div class="modal-dialog modal-lg"> 
    
      <form  id="login" name="login" method="get" data-toggle="validator" role="form" >
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #3399FF ">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white">Login</h4>
        </div>
        <div class="modal-body">
          <p></p>
          <div class="row">
          <div class="col-sm-6 form-group">
          <input class="form-control" id="username" name="username" placeholder="user name" type="text" required>
          </div>
          <div class="col-sm-6 form-group">
          <input class="form-control" id="password" name="password" placeholder="password" type="password" required> 
          	
          <input type="hidden" value="" id="param" name="param">	
          	
        </div>
      </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" 		   style="background-color: #3399FF;color: white;" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-default pull-right" style="background-color: #3399FF;color: white;" onclick="submitVal('login')">Login</button>          
        </div>
      </div>
      </form>
    </div>
  </div>

  <div class="modal fade in" id="signup" role="dialog">
    <div class="modal-dialog modal-lg"> 
    
      <form  id="signup" name="login" method="post" data-toggle="validator" role="form" >
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #3399FF ">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white">SignUp</h4>
        </div>
        <div class="modal-body">
          <p></p>
          <div class="row">
          <div class="col-sm-6 form-group">
          <input class="form-control" id="signName" name="signName" placeholder="user name" type="text" required>
          </div>
          </div>          
          <div class="row">
          <div class="col-sm-6 form-group">
          <input class="form-control" id="signPass" name="signPass"   placeholder="password" type="password" required> 
          </div>
          </div>
          <div class="row">
          <div class="col-sm-6 form-group">
          <input class="form-control" id="signEmail" name="signEmail"  placeholder="email" type="email" required>
           
          </div>
          </div>
                
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" 		   style="background-color: #3399FF;color: white " data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-default pull-right" style="background-color: #3399FF;color: white " onclick="submitVal('signup')">SignUp</button>
        </div>
      </div>
      </form>
    </div>
  </div>
    
<form  id="portfolio" name="portfolio" method="post" data-toggle="validator" role="form" >
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">Personal Infos.</a></li>
        <li><a href="#education">Education</a></li>
        <li><a href="#experience">Prof. Experience</a></li>
        <li><a href="#hobbies">Pass Time</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="container" align="center">
 </br></br>
 
 <div id="myCarousel" class="carousel slide text-center " data-ride="carousel" align="center" style="width:70%;" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" align="center">

    <div class="item active" align="center">
        <img src=".\img\portfolio\e1.jpg" alt="Thailand" width="100%" height="345" align="center">
        <!-- 
        <div class="carousel-caption">
          <h3>Thailand</h3>
          <p>Pucket Island</p>
        </div>
        -->
      </div>
       
      <div class="item" align="center">
        <img src=".\img\portfolio\e2.jpg" alt="Cambodia" width="100%" height="345" align="center">
        <!--
        <div class="carousel-caption">
          <h3>Cambodia</h3>
          <p>Siem Reap City</p>
        </div>
        -->
      </div>
      
      <div class="item" align="center">
        <img src=".\img\portfolio\e3.jpg" alt="Singapore" width="100%" height="345" align="center">
        <!--
        <div class="carousel-caption">
          <h3>Singapore</h3>
          <p>Singapre</p>
        </div>
        -->
      </div>
      
      <div class="item" align="center">
        <img src=".\img\portfolio\e4.jpg" alt="Malaysia" width="100%" height="345" align="center">
        <!--
        <div class="carousel-caption">
          <h3>Malaysia</h3>
          <p>State of Melaka</p>
        </div>
      -->
      </div>      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</div>



<!-- Container (Personal Info) -->
<div id="about" class="container-fluid text-center bg-grey">
  <h2>Personal Information</h2><br>
  <div class="row text-center">
    <div class="col-sm-6 slideanim">
      
      <div class="well">
      <div class="alert alert-info">
  		<strong>Date of Birth :</strong> Hragel, 28 August 1983
	   </div>
      <div class="alert alert-success">
  		<strong>Relationship Status :</strong> Single
	  </div>
	  <div class="alert alert-danger">
  		<strong>Blood Group :</strong> A+
	  </div>
    </div>
    </div>
    <div class="col-sm-4 slideanim" align="center">
      </br>
      <span class="glyphicon glyphicon-repeat logo"></span>
    </div>
  </div>
  </div>

<!-- Container (Education Section) -->
<div id="education" class="container-fluid text-center">
  <h2>Education</h2><br>
  
  <div class="row text-center " >
    <div class="panel-group" id="accordion0">
      
    <div class="col-sm-3">
      <div class="panel panel-default slideanim">      
        <a data-toggle="collapse" href="#collapse1" data-parent="#accordion0">
            <img src=".\img\portfolio\usj.jpg"  class="img-rounded" alt="USJ" width="200" height="100">
        </a>
        <p><strong>USJ</strong></p>
        <div id="collapse1" class="panel-collapse collapse  alert alert-info">
        <div class="panel-heading">
        <h4 class="panel-title">Universite Saint Joseph</h4>
        </div>
        <ul class="list-group alert alert-info">           
          <li class="list-group-item" >International Master in Business Administration</li>
          <li class="list-group-item">Management of Financial Institution</li>
        </ul>
        <div class="panel-footer alert alert-info" >2010 - 2012</div>
      </div>
      </div>      
    </div>
      
    <div class="col-sm-3">
      <div class="panel panel-default slideanim">
        <a data-toggle="collapse" href="#collapse2" data-parent="#accordion0">
           <img src=".\img\portfolio\iae.jpg" class="img-rounded" alt="IAE" width="200" height="100">
        </a>
        <p><strong>IAE</strong></p>
      <div id="collapse2" class="panel-collapse collapse alert alert-info">
        <div class="panel-heading">
        <h4 class="panel-title">Universite Pantheon Sorbonne</h4>
        </div>
        <ul class="list-group alert alert-info">           
          <li class="list-group-item" >International Master in Business Administration</li>
          <li class="list-group-item">Management of Financial Institution</li>
        </ul>
        <div class="panel-footer alert alert-info" >2010 - 2012</div>
      </div>
      </div>
    </div>

      <div class="col-sm-3">
      <div class="panel panel-default slideanim">
        <a data-toggle="collapse" href="#collapse3" data-parent="#accordion0">
        <img src=".\img\portfolio\pd.jpg" class="img-rounded" alt="Paris Dauphine" width="200" height="100">
        </a>
        <p><strong>Paris Dauphine</strong></p>
      <div id="collapse3" class="panel-collapse collapse alert alert-info">
        <div class="panel-heading">
        <h4 class="panel-title">Universite Paris Dauphine</h4>
        </div>
        <ul class="list-group alert alert-info">           
          <li class="list-group-item" >International Master in Business Administration</li>
          <li class="list-group-item">Management of Financial Institution</li>
        </ul>
        <div class="panel-footer alert alert-info" >2010 - 2012</div>
      </div>
      </div>
    </div>
          
    <div class="col-sm-3">
      <div class="panel panel-default slideanim" >
        <a data-toggle="collapse" href="#collapse4" data-parent="#accordion0">
        <img src=".\img\portfolio\usek.jpg" class="img-rounded" alt="USEK" width="200" height="100">
        </a>
        <p><strong>USEK</strong></p>
      <div id="collapse4" class="panel-collapse collapse alert alert-info">
        <div class="panel-heading">
        <h4 class="panel-title">Universite Saint Esprit de Kaslik</h4>
        </div>
        <ul class="list-group alert alert-info">           
          <li class="list-group-item" >Bachelor in Computer Science </li>
          <li class="list-group-item">Software Development </li>
        </ul>
        <div class="panel-footer alert alert-info" >2004 - 2006</div>
      </div>
      </div>
    </div>
  </div>
  </div>
</div>





<!-- Container (Experience) -->
<div id="experience" class="container-fluid text-center bg-grey">
  <h2>Professional Experience</h2>
  
  <div class="panel-group" id="accordion">
    <div class="panel panel-default slideanim">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">BML Istisharat</a>
        </h4>
      </div>
      
      <div id="collapse5" class="panel-collapse collapse ">                  
        <div class="panel-body">
          <div class="table-responsive">
          <table class="table table-hover">
    	  <thead>
      		<tr>
        	<th>Year</th>
        	<th>Title</th>    
        	<th>Activity</th>
      		</tr>
    	  </thead>
	      <tbody>
	      <tr>
	        <td align="left">2013 - Present</td>
	        <td align="left">Project Leader</td>
	        <td align="left">BSN-Malaysia Onsite Support</td>
	      </tr>
	      <tr>
	        <td align="left">2009-2013</td>
	        <td align="left">Supervisor</td>
	        <td align="left">Java new Web Based framework Developer </td>
	      </tr>
	      </tbody>
	      </table>
        </div>
        </div>
      
      <div class="panel-footer">
        <strong>Beirut - Lebanon</strong></br>
        <div align="center">
        <table >
        <tr>
        <td>
           <span class="glyphicon glyphicon-envelope">   </span>
        </td>
        <td> <a href="http://www.istisharat.com">www.istisharat.com</a></td>
        
        </tr>
        <tr>
        <td>
        <span class="glyphicon glyphicon-phone">   </span></td>
        <td> +961 1 566130</td>
        </tr>
        </table>
        </div>
     </div>
    </div>
    </div>
    
    <div class="panel panel-default slideanim">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Soft Solutions</a>
        </h4>
      </div>
      
      <div id="collapse6" class="panel-collapse collapse ">                  
        <div class="panel-body">
          <div class="table-responsive">
          <table class="table table-hover">
    	  <thead>
      		<tr>
        	<th>Year</th>
        	<th>Title</th>    
        	<th>Activity</th>
      		</tr>
    	  </thead>
	      <tbody>
	      <tr>
	        <td align="left">2008 - 2009</td>
	        <td align="left">Module Development Manager</td>
	        <td align="left">Retail Operations System</td>
	      </tr>
	      <tr>
	        <td align="left">2007-2008</td>
	        <td align="left">Junior Developer</td>
	        <td align="left">Master Data Management team</td>
	      </tr>
	      </tbody>
	      </table>
        </div>
        </div>
      
      <div class="panel-footer" >
        <strong>Jdeideh - Lebanon</strong></br>
        <div align="center">
        <table>
        <tr>
        <td>
           <span class="glyphicon glyphicon-envelope">   </span>
        </td>
        <td> <a href="http://www.ibs-softsolutions.com">www.ibs-softsolutions.com</a></td>
        
        </tr>
        <tr>
        <td>
        <span class="glyphicon glyphicon-phone">   </span></td>
        <td> +961 1 901170</td>
        </tr>
        </table>
        </div> 
      </div>  
    </div>
    </div>
    
    <div class="panel panel-default slideanim">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">CTServ</a>
        </h4>
      </div>
      
      <div id="collapse7" class="panel-collapse collapse ">                  
        <div class="panel-body">
        <div class="table-responsive">          
          <table class="table table-hover">
    	  <thead>
      		<tr>
        	<th>Year</th>
        	<th>Title</th>    
        	<th>Activity</th>
      		</tr>
    	  </thead>
	      <tbody>
	      <tr>
	        <td align="left">2006 - 2007</td>
	        <td align="left">Intership</td>
	        <td align="left">IT,deployment & Customer support</td>
	      </tr>
	      </tbody>
	      </table>
        </div>
        
      </div>
      <div class="panel-footer">
        <strong>Achrafieh - Lebanon</strong></br>
        <div align="center">
        <table border="0" >
        <tr>
        <td>
           <span class="glyphicon glyphicon-envelope">   </span>
        </td>
        <td> <a href="http://www.ctserv.net">www.ctserv.net</a></td>
        
        </tr>
        <tr>
        <td>
        <span class="glyphicon glyphicon-phone">   </span></td>
        <td> +961 1 202132</td>
        </tr>
        </table>
        </div>
      </div>  
      </div>
	  </div>
	  
	  </div>
	  </div>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      
      <p><span class="glyphicon glyphicon-map-marker"></span> Hragel, Lebanon</p>
      <p><span class="glyphicon glyphicon-phone"></span> +961 3 680167</p>
      <p><span class="glyphicon glyphicon-envelope"></span> egzgheib@hotmail.com</p>
      <p><span class="glyphicon glyphicon-envelope"></span> ezgheib@outlook.com</p>
      <p><span class="glyphicon glyphicon-envelope"></span> eliezgheib@outlook.com</p>
      <p><span class="glyphicon glyphicon-envelope"></span> ezoughaib@gmail.com</p>      
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>           
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="button" onclick="submitVal('portfolio')">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>

<input type="hidden" value="" id="param1" name="param1">

</form>

<div id="googleMap" style="height:400px;width:100%;"></div>

<!-- Add Google Maps -->
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
var myCenter = new google.maps.LatLng( 34.01356, 35.78322);

function initialize() {
var mapProp = {
  center:myCenter,
  zoom:12,
  scrollwheel:false,
  draggable:false,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker = new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>


<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Back to Top</p>
</footer>

  

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>
  
</body>
  
</html>