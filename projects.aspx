<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<!DOCTYPE html>
<?php
session_start();
?>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
	overflow: hidden;
    background-color: #BB0000;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    background-color: #BB0000;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    border-style: outset;
    border-color: #BB0000;
}

.currentpage {
    background-color: #BBBBBB;
    color: #440000;
    border-color: #BBBBBB;
}

li a:hover {
    background-color: #440000;
    color: white;
    border-style: inset;
    border-color: #440000;
}

</style>
</head>
<body>

<ul>
  <li><a href="overview.php">Overview</a></li>
  <li><a class="currentpage" href="project.php">Project</a></li>
  <li><a href="messages.php">Messages</a></li>
  <li><a href="profile.php">Profile</a></li>
  <li><a href="login.php">Log Out</a></li>
</ul>
<br>
<br>
<br>


<?php 
echo $_SESSION['username']; 
?><br>
<br>
<?php
echo $_SESSION['mode'];
?><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</body>
</html>

</html>
