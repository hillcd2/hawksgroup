<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.MyFirstPage" %>

<!DOCTYPE html>

 <?php
session_start();
?>
<head runat="server">
    
</head>

<form action="processLogin.aspx" method="post">
  <div class="imgcontainer">
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
  </div>
  <fieldset>
  <?php
  if (isset($_SESSION['wrong']))
  {
  	echo "Invalid Username or Password.";
  }
  ?>
  	<div class="container">
    	<label><b>Username</b></label>
    	<input type="text" placeholder="Enter Username" name="uname" required>
    	<br>
    	<label><b>Password</b></label>
    	<input type="password" placeholder="Enter Password" name="psw" required>
		<br>
    	<input type="checkbox" checked="checked"> 
		Remember me
        <br><br>
    	<button type="submit">Login</button>
  	</div>
  </fieldset>
  <br>
  <div class="container" style="background-color:#f1f1f1">
    <span><a href="createAccountInitial.aspx">Create New Account</a></span>
  </div>
  <div class="container" style="background-color:#f1f1f1">
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>

</html>
