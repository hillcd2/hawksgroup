<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="processLogin.aspx.cs" Inherits="WebApplication2.WebForm6" %>

<!DOCTYPE html>

<?php 
session_start();
$_SESSION['username'] = $_POST["uname"]; 
$_SESSION['password'] = $_POST["psw"];

//Connect to the db
$dbh=mysqli_connect ("162.241.244.118", "hillcdtw_hawkman", "sesame123@321", "hillcdtw_hawksdb")
or die ('Database error; please try again later.');
$sql="SELECT * FROM User WHERE Username='" . $_SESSION['username'] . "' AND Password='" . $_SESSION['password'] . "';";
$result=$dbh->query($sql);

//check to see if the query has any results
$validate = 0;
if ($result->num_rows > 0) {
    $validate = 1;
}
$dbh->close();

if ($validate == 1) 
{
	if (isset($_SESSION['wrong']))
	{
		unset($_SESSION['wrong']);
	}
	while ($row=$result->fetch_assoc()){
	    $type = $row['Type'];
	    if (strcmp($type, "admin") == 0) {
	        $_SESSION['mode'] = 'admin';
	    } else if (strcmp($type, "advisor") == 0) {
	        $_SESSION['mode'] = 'advisor';
	    } else if (strcmp($type, "student") == 0) {
	        $_SESSION['mode'] = 'student';
	    } else {
	        $_SESSION['mode'] = 'none';
	    }
	}
	
	header("Location: overview.aspx");
	exit();
} 
else 
{
	$_SESSION['wrong'] = 1;
	header("Location: login.aspx");
	exit();
}
 ?>
 <p>Redirecting...</p>
</html>
