<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createAccount.aspx.cs" Inherits="WebApplication2.WebForm4" %>

<!DOCTYPE html>
<?php
session_start();
if ($_SESSION['goBack'] == false) 
{
    $_SESSION['createMode'] = $_POST["type"];
} 
else 
{
    //TODO: load data from before into fields
}
?>
<style>
.done {
    margin: 0;
    padding: 4px 6px;
    background-color: #BBBBBB;
    border-color: #BBBBBB;
    border-style: outset;
}
.done:hover {
    margin: 0;
    padding: 4px 6px;
    background-color: #999999;
    border-color: #999999;
    border-style: inset;
}
</style>
<script src="jquery.min.js"></script>
<script>
var timeslotcount = 1;

$(document).ready(function(){
    //$('.init').append('<label><b>Username</b></label><input type="text" name="uname" required>    	<label><b>Password</b></label>  	<input type="password" name="pass" required>  	<label><b>Confirm Password</b></label>  	<input type="password" name="con_pass" required>  	<br><br>  	<div class="container">  	<label><b>First Name</b></label>  	<input type="text" name="fname" required>    	<label><b>Last Name</b></label>  	<input type="password" name="lname" required>  	<br><br>	<label><b>GPA</b></label>	<input type="text" name="gpa" required>    	<label><b>Major</b></label>  	<input type="text" name="major" required>  	<br><br>	<label>I am unavailable on </label>	<select name = "dayUnavail1">		<option></option>		<option value="Sunday1">Sunday</option> 		<option value="Monday1">Monday</option> 		<option value="Tuesday1">Tuesday</option> 		<option value="Wednesday1">Wednesday</option> 		<option value="Thursday1">Thursday</option> 		<option value="Friday1">Friday</option> 		<option value="Saturday1">Saturday</option> 	</select> 	from	<input type="time" name="timeFrom1">	to	<input type="time" name="timeTo1">	<p class="moreTime">	<p></p>	<br>	<a href = "#" onclick="appendTime();">Add another time...</a>    <br>	<button>Submit</button>');
    if (<?php echo json_encode($_SESSION['createMode'])?> == "advisor"){
        $('.studentonly').remove();
    }
    var timeslotcount = 1;
    if (<?php echo json_encode($_SESSION['goBack'])?> == true){
        var yay = "yay"; //replace with restoreTime() later.
    }
    
});

function restoreTime() {
    
    var numTimeslots = <?php echo json_encode($_SESSION['restoreTimeslotsNum'])?>;
    var appendString = <?php
      $outstring = "";
      $counter = 2;
      $numTimeslots = $_SESSION['restoreTimeslotsNum'];
      while ($counter <= $numTimeslots) {
          
          //Add the label and select fields.
          $outstring = $outstring . "<label>I'm also unavailable on </label>" ."<select name = 'dayUnavail" . $counter . "'>";
          
          //Add the empty option field.
          $outstring = $outstring . "<option";
          //Check if this field was selected
          if (isset($_SESSION['createDayUnavail'.$counter])) { if ($_SESSION['createDayUnavail'.$counter] == '') {$outstring = $outstring . 'selected="selected"'; } }
          $outstring = $outstring . "></option>";
          
          //Add the Sunday option field.
          $outstring = $outstring . '<option value="Sunday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Sunday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Sunday</option>';
          
          //Add the Monday option field.
          $outstring = $outstring . '<option value="Monday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Monday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Monday</option>';
          
          //Add the Tuesday option field.
          $outstring = $outstring . '<option value="Tuesday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Tuesday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Tuesday</option>';
          
          //Add the Wednesday option field.
          $outstring = $outstring . '<option value="Wednesday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Wednesday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Wednesday</option>';
          
          //Add the Thursday option field.
          $outstring = $outstring . '<option value="Thursday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Thursday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Thursday</option>';
          
          //Add the Friday option field.
          $outstring = $outstring . '<option value="Friday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Friday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Friday</option>';
          
          //Add the Saturday option field.
          $outstring = $outstring . '<option value="Saturday"';
          if(isset($_SESSION['createDayUnavail'.$counter])) {
		        if ($_SESSION['createDayUnavail'.$counter] == 'Saturday'){$outstring = $outstring . 'selected="selected"';  } }
          $outstring = $outstring . '>Saturday</option>';
          
          //Close the select field.
          $outstring = $outstring . "</select>";
          
          //Increment the counter.
          $counter = $counter + 1;
      }
      
      echo json_encode($outstring);  
    ?>;
    
    for (var i = 2; i <= numTimeslots; i++){
        var selectedTime = "";
    }
    timeslotcount = numTimeslots;
        $('.moreTime').append(appendstring);
    
}

    function appendTime() {
        timeslotcount = timeslotcount + 1;
        $('.moreTime').append("<label>I'm also unavailable on </label>" +
				"<select name = 'dayUnavail" + timeslotcount + "'>"+
				"<option></option>"+
				'<option value="Sunday' + "" + '">Sunday</option>' +
				'<option value="Monday' + "" + '">Monday</option>' + 
				'<option value="Tuesday' + "" + '">Tuesday</option>' +
				'<option value="Wednesday' + "" + '">Wednesday</option>' + 
				'<option value="Thursday' + "" + '">Thursday</option>' + 
				'<option value="Friday' + "" + '">Friday</option>' + 
				'<option value="Saturday' + "" + '">Saturday</option>' + 
				'</select> ' +
				'from <input type="time" name="timeFrom' + timeslotcount + '"> to <input type="time" name="timeTo' + timeslotcount + '"><p></p>');
    };
    

</script>
<form action="processCreateAccount.php" method="post">
  <fieldset>
      <label><?php if (($_SESSION['goBack'] == true) && isset($_SESSION['dayUnavail1'])) { echo $_SESSION['dayUnavail1']; } else { echo ""; } ?></label>
  	<div class="container">
  	<label><?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createAccountError'])) { echo $_SESSION['createAccountError']; } else { echo ""; } ?></label>
  	<p class="init"></p>
  	<label><b>Username</b></label>
  	<input type="text" name="uname" required value = <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createUsername']) ){ echo $_SESSION['createUsername'];} else { echo ""; } ?>>  
  	<label><b>Password</b></label>
  	<input type="password" name="pass" required>
  	<label><b>Confirm Password</b></label>
  	<input type="password" name="con_pass" required>
  	<br><br>
  	<div class="container">
  	<label><b>First Name</b></label>
  	<input type="text" name="fname" required value = <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createFName']) ){ echo $_SESSION['createFName'];} else { echo ""; } ?>>  
  	<label><b>Last Name</b></label>
  	<input type="text" name="lname" required value = <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createLName']) ){ echo $_SESSION['createLName'];} else { echo ""; } ?>>
  	<br class = "studentonly"><br class = "studentonly">
	<label class = "studentonly"><b>GPA</b></label>
	<input class = "studentonly" type="text" name="gpa" required value = <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createGPA']) ){ echo $_SESSION['createGPA'];} else { echo ""; } ?> >  
  	<label class = "studentonly"><b>Major</b></label>
  	<input class = "studentonly" type="text" name="major" required value = <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createMajor']) ){ echo $_SESSION['createMajor'];} else { echo ""; } ?>>
  	<br><br>
	<label>I'm unavailable on </label>
	<select name = "dayUnavail1" >
		<option <?php 
		    if(($_SESSION['goBack'] == false)) {echo 'selected="selected"';} 
		    else if (isset($_SESSION['createDayUnavail1'])) { if ($_SESSION['createDayUnavail1'] == ''){echo 'selected="selected"'; } }
		    ?>></option>
		<option value="Sunday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Sunday'){echo 'selected="selected"';  } }
		    ?>>Sunday</option> 
		<option value="Monday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Monday'){echo 'selected="selected"';  } }
		    ?>>Monday</option> 
		<option value="Tuesday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Tuesday'){echo 'selected="selected"';  } }
		    ?>>Tuesday</option> 
		<option value="Wednesday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Wednesday'){echo 'selected="selected"';  } }
		    ?>>Wednesday</option> 
		<option value="Thursday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Thursday'){echo 'selected="selected"';  } }
		    ?>>Thursday</option> 
		<option value="Friday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Friday'){echo 'selected="selected"';  } }
		    ?>>Friday</option> 
		<option value="Saturday" <?php
		    if(($_SESSION['goBack'] == true) && isset($_SESSION['createDayUnavail1'])) {
		        if ($_SESSION['createDayUnavail1'] == 'Saturday'){echo 'selected="selected"';  } }
		    ?>>Saturday</option> 
	</select> 
	from
	<input type="time" name="timeFrom1" <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createTimeFrom1']) ){ echo "value=".$_SESSION['createTimeFrom1'];} else { echo ""; } ?>>
	to
	<input type="time" name="timeTo1" <?php if (($_SESSION['goBack'] == true) && isset($_SESSION['createTimeTo1']) ){ echo "value=".$_SESSION['createTimeTo1'];} else { echo ""; } ?>>
	<p class="moreTime">
	<p></p>
	<br>
	<a href = "#" onclick="appendTime();">Add another time...</a>
    <br>
    <br>
    <button class = "done">Submit</button>
  	</div>
  </fieldset>
  <br>
</form>

</html>
