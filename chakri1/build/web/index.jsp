<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
	<title>Online Shopping</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="css/images/favicon.ico" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/prettyCheckboxes.css" type="text/css" media="all" />
	<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.js" type="text/javascript"></script>
	<script src="js/prettyCheckboxes.js" type="text/javascript"></script>
	<script src="js/DD_belatedPNG-min.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
</head>
<body>
	<div class="shell">
			<div id="content">				
				<div class="post">
					<h2>Welcome to MEGAStore</h2>
					<p></p>
					<p></p>
				</div>
			</div>
			<!-- Sidebar -->
			<div id="sidebar">
					<h2>Sign In</h2>
					<form action="login" method="post">
                                            <div>
                                                <label>Username</label> 
                                                <input type="text" name="username" id="login_username"  />
                                            </div>			
                                            <div>
                                                <label>Password</label>
                                                <input type="password" name="password" id="login_password" />
                                            </div>
                                            <div class="submit">
                                                <button type="submit">Log in</button>   
                                                <label><input type="checkbox" name="remember"/>Remember my login on this computer </label>
                                            </div>
                                        </form>
                                        <form action="register.jsp" method="post">
                                            <div class="submit">
                                            <button type="submit">Register</button>
                                            </div>
                                        </form>
				
</body>
</html>