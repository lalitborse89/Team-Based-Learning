<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome page</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>

body {
    background-color: #E1D7FA;
     }
.divone{
    background-color: #ffffff;
    float:left;
    width:48%;
    border-radius: 25px;
    padding:20px;
    
    }
.divtwo{
    background-color: #ffffff;
    float:right;
    width:48%;
    border-radius: 25px;
    padding:20px;}
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
                        <li><a href="Login.jsp" ><img src="images/logout.png" style="margin-left:300px;width:25px; height:25px;">LOGOUT</a></li>
                        <!-- 
                        <li><div style="margin:25px margin-left:400px"><form method="link" action="Login.jsp">
                        <input type="submit" value="Logout"/></form>></div></li>
                        <li class="dropdown">
                         -->    
                
                            <!--<li><a href="#" onclick="goToLakeG()">Lake George</a></li>
                                <li><a href="#" onclick="gotoThach()">Thatcher Park</a></li>
                                <li><a href="#" onclick="gotoHud()">Hudson River</a></li>
                                <li><a href="#" onclick="gotoNYC()">NYC</a></li>
                            -->
                            </ul>   
                        </li>
                    </ul>
                </div>
        </div>
    </div>

<div><br><br><br><br><br>
</div>
    
        <div class="contain" style=" margin-right:100px; margin-left:100px;">
    
            
            <div class="divone" id="login" >
               <h3><%
String name=request.getParameter("username");
out.print("WELCOME "+name);
%></h3>
                <h2>MENU</h2>
                       
                <table class ="tables" style="list-style: none;">


            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/brownie3.jpg" id="profiles" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="height:75px;width:75px"></a><br><br>
                </td>
                <td>
                <a href="SEfirst.html" id="profile" onmouseover="animates(this)" onmouseout="stopAnimations(this)">BROWNIES</a><br><br>
                </td>
            </tr>

 
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/waffle.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:75px; height:75px" ></a>
                <br><br>
                </td>
    
                <td>
                <br><br>
                <a href="SEfirst.html" id="connection" onmouseover="animates(this)" onmouseout="stopAnimations(this)">WAFFLES</a><br><br>
                </td>       
            </tr>
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/hashbrown2.jpg" id="musics" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:75px; height:75px" ></a><br><br>
                </td>
                <td>
                <a href="SEfirst.html" id="music" onmouseover="animates(this)" onmouseout="stopAnimations(this)">HASH BROWNS</a><br><br>
                </td>
            </tr> 

            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/Coffee.jpg" id="news" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:75px; height:75px"></a><br><br>
                </td>
                <td>
                <a href="SEfirst.html" id="new" onmouseover="animates(this)" onmouseout="stopAnimations(this)">COFFEE</a><br><br>
                </td>
            </tr>  
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/coke.jpg" id="books" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:75px; height:75px"></a><br><br>
                </td>
     
                <td>
                <a href="SEfirst.html" id="book" onmouseover="animates(this)" onmouseout="stopAnimations(this)">DRINKS</a><br><br>
                </td>       
     
            </tr>
  
   </table>
            </div>
            <div class="divtwo">
             
             <h1></h1>
             
             <table class ="tables" style="list-style: none;">


            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/CCBrownies.jpg" id="profiles" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="height:95px;width:95px"></a><br><br>
                <h5>Add to cart<h5>
                </td>
                <td>
                <a href="SEfirst.html"><img src="images/PBBrownies.jpg" id="profiles" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="height:95px;width:95px"></a><br><br>
                <h5>Add to cart<h5>
                </td>
            </tr>

 
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/waffle2.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
    
                <td>
                <a href="SEfirst.html"><img src="images/waffle3.jpg" id="profiles" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="height:95px;width:95px"></a>
                <h5>Add to cart<h5>
                </td>       
            </tr>
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/hashbrownjpg.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
                <td>
                <a href="SEfirst.html"><img src="images/hashbrown3.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
            </tr> 

            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/Latte.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
                <td>
                <a href="SEfirst.html"><img src="images/Frenchvani.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
            </tr>  
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/cappuccino.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
     
                <td>
                <a href="SEfirst.html"><img src="images/Decaf.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>       
     
            </tr>
              
            <tr>
                <td>
                <a href="SEfirst.html"><img src="images/dietcoke.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>
                <td>
                <a href="SEfirst.html"><img src="images/fantaorange.jpg" id="connections" onmouseover="startanimate(this)" onmouseout="stopAnimation(this)" style="width:95px; height:95px" ></a>
                <h5>Add to cart<h5>
                </td>       
            </tr>
  
  </table>
             
             
             
            </div>           
        </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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