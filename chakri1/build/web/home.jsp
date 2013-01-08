<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
	<title>ECOMMERCE Project</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="css/images/favicon.ico" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/prettyCheckboxes.css" type="text/css" media="all" />
	<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.js" type="text/javascript"></script>
	<script src="js/prettyCheckboxes.js" type="text/javascript"></script>
	<script src="js/DD_belatedPNG-min.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
        <script type="text/javascript">
            function get_id(clicked_id)
                {
                    
                    var id = clicked_id;
                    //session.setAttribute( "product_id", id );
                    var f=document.form;
                    f.method="post";
                    f.action='http://localhost:8080/ebusiness/eg?id='+id;
                    f.submit();
                    
                    
                }
        </script>
</head>
<body>
		<div id="header">
			<div id="top-navigation">	
				<ul>
					<li><form action="logout"><button id="logout" >Logout</button></form></li>				
				</ul>		
			</div>				
		</div>
		<!-- END Header -->
	
                <form action="eg" name="form"></form>
		<!-- END Navigation -->
		<!-- Main  -->
		<div id="main">
			<div class="cl"></div>
			<div class="products">
				<div class="product-holder">
					<div class="product">
						<a title="Details" href="#"><img src="css/images/laptop1.jpg" alt="Black and red stylish computer case" /></a>
						<p>Acer 110</p>							
                                                <p>Processor speed 1.5GHz</p>
					</div>										
                                        
				</div>
				<div class="product-holder">
					<div class="product">
						<a title="Details" href="#"><img src="css/images/laptop2.jpg" alt="Beautiful white case with flower motives" /></a>
						<img class="sale-label" src="css/images/sale-label.png" alt="Sale!" />							
						<p>Dell Vostro 130</p>
                                                <p>Processor speed 1.5 GHz</p>
					</div>										
				</div>
				<div class="product-holder">
					<div class="product">
						<a title="Details" href="#"><img src="css/images/laptop3.jpg" alt="Black and white gamers computer case" /></a>
						<p>Asus Zenbook</p>							
                                                <p>Processor speed 2.0 GHz</p>
					</div>					
				</div><br>
			<!-- END Latest Products -->
                        <div style ="width:100%;float:left;">
                          <h1> Please rate the laptops on a scale of 1-5</h1><br>
                                                <form action="reco">
                                                Rate system1  : <input type="text" name="rating1"><br>                                                
                                                Rate system2 : <input type="text" name="rating2"><br>                                                
                                                Rate system3 : <input type="text" name="rating3"><br>                                                                                                        
                                                        <input type="submit" value="Get recommendations">
                                                <br><br>                                     
                                                <p>User Preferences for Processor speed</p><br>
                                                    <input type="radio" name="speed" value="1.5">1.5 GHz<br>
                                                    <input type="radio" name="speed" value="2.0">2.0 GHz
                                                </form>
                    </div>
				</div>
		<!-- END Main -->
                
	</div>	
</body>
</html>
