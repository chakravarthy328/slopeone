<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
                           <h2>Best Matches for you</h2>
			<div class="products">
                            <%      
                                
                                ArrayList recos = new ArrayList<String>();
                                ArrayList speed = new ArrayList<String>();
                                Integer rating;                               
                                recos = (ArrayList)request.getAttribute("recos");
                                speed = (ArrayList)request.getAttribute("speed");                                                             
                                String a = "";
                                String b = "";
                                if(recos.size()>3){
                                for(int i=0;i<3;i++){                                                                        
                                    a = (String)recos.get(i);
                                    b  = (String)speed.get(i);
                            %>
                            
				<div class="product-holder">
					<div class="product">
						<a title="Details" href="#"><img src="css/images/laptop1.jpg" alt="Black and red stylish computer case" /></a>
                                                <p> <%= a  %> </p>
                                                <p> Processor speed <%= b   %> GHz </p>
					</div>										                                        
				</div>                                        
                                                          
                                                <%      }      }
                                                                               else{
                                    
                                for(int i=0;i<recos.size();i++){                                                                        
                                    a = (String)recos.get(i);
                                    b  = (String)speed.get(i);
                            %>
                            
				<div class="product-holder">
					<div class="product">
						<a title="Details" href="#"><img src="css/images/laptop1.jpg" alt="Black and red stylish computer case" /></a>
                                                <p> <%= a  %> </p>
                                                <p> Processor speed <%= b   %> GHz </p>
					</div>										                                        
				</div>                                        
                                                          
                                                <%      }  
                                                                               
                                                                               }
                                                             %>
				<!-- END Latest Products -->
				</div>
		<!-- END Main -->
                
	</div>	
</body>
</html>
