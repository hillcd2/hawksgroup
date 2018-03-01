<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createAccountInitial.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>
<?php
session_start();
$_SESSION['goBack'] = false;
?>
<script src="jquery.min.js"></script>


<form action="createAccount.aspx" method="post">
    <p>Are you a student or an advisor?</p>
    <input type="radio" name="type" value="student" checked> Student<br>
    <input type="radio" name="type" value="advisor"> Advisor<br>
    
    <button type="submit">Submit</button>
</form>


</html>
