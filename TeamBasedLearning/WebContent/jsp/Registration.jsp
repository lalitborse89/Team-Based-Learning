<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script language="JavaScript" type="text/javascript">
    
</script>

<style>

body {
    background-color: #E1D7FA;
     }
.divone{
    background-color: #ffffff;
    float:center;
    width:68%;
    border-radius: 25px;
    padding:20px;
    
    }

.tables{
    border-radius: 25px;
    background-color: #F5F5F5;
    overflow:hidden;
       }
    
.navbar-header{
background-color: #0047B2;
padding-bottom:20px;
}   
</style>

</head>
<body>

      <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="containter">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">UALBANY's Cafe</a>
            </div>  
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="SEfirst.html"><img src="images/homego.png" style="width:35px; height:30px;">HOME</a></li>
                        <li><a href="SEfirst.html"><img src="images/CART.png" style="width:40px; height:35px;">MY CART</a></li>
                        
                        
                            
                
                   </ul>  
                </div>
        </div>
    </div>

<div><br><br><br><br><br>
</div>
<form action="SignupCon" method="post">
    <div class="login" style="position:center; margin:100px;">
        <h1>Sign up</h1>
        <%
String loginMSg=(String)request.getAttribute("errorPass");
if(loginMSg!=null){                                   
    out.println(loginMSg);
}
%><br><br>
        First Name:<input name="firstname" required="true" type="text"placeholder="First Name" /><br><br>
        Last Name:<input name="lastname" required="true" type="text"placeholder="Last Name" /><br><br>
        UserName:<input name="username" required="true" type="text"placeholder="UserName" /><br><br>
        Email:<br><input name="email" required="true" type="email" class="register-input" placeholder="youremailaddress@something.com" /><br>
       
<br><br><br>
        Password:<input id="pass1" name="password1" required="true"  type="password" class="register-input" placeholder="Password" onfocus="pcheck(this.value)" onkeyup="pcheck(this.value)"/><br><br>
        Re-Type Password:<input name="password2" required="true" type="password" class="register-input" placeholder="Password" onfocus="p2check(this.value)" onkeyup="p2check(this.value)"/><br><br>
        <br>
        Address:<input name="address" required="true" type="text" class="register-input" placeholder="Address" onfocus="p2check(this.value)" onkeyup="p2check(this.value)"/><br><br>
        Phone:<input name="phone" required="true" type="number" class="register-input" placeholder="phone number" onfocus="p2check(this.value)" onkeyup="p2check(this.value)"/><br><br>
        
        
        
        <input type="submit" value="Create Account" class="register-button">
        <p>
            Already a member?
            <a href="Login.jsp">Log in</a>
        </p>
        <p id="test"></p>       
    </div>
</form>  
    
    
    
    
 <div style="margin-top:20px; "><br><br><br><br></div>
    
<footer>
    <div class="navbar navbar-inverse navbar-fixed-bottom" style="margin-top:20px"; >
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#footer-body">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            <div class="navbar-collapse collapse" id="footer-body">
                <ul class="nav navbar-nav">
                
                                                
                    <li><a href="SEfirst.html">Contact Us</a></li>
                    <li><a href="SEfirst.html">User Review</a></li>
                    <li><a href="http://www.albany.edu/">© copyright SUNY Albany</a></li>
                    
                </ul>
            </div>
        </div>
    </div>
</footer>
    
    
    
    
    
    
</body>
</html>