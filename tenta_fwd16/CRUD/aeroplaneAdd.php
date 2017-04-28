<?php
include_once("config.php");

session_start();
if(empty($_SESSION['email']))
{
 header("location:index.php");
}

echo "Welcome ".$_SESSION['name']."<br>";

if(isset($_POST['Submit'])) {    
    $planeModel = $_POST['planemodel'];
    $range = $_POST['range'];
    $topSpeed = $_POST['topspeed'];
    $planeMakerID = $_POST['planemakerID'];
        
    if(empty($planeModel) || empty($planeMaker)) {
                
        if(empty($planeModel)) {
            echo "<font color='red'>Field is empty.</font><br/>";
        }
        
        if(empty($planeMaker)) {
            echo "<font color='red'>Field is empty.</font><br/>";
        }
        
        echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
    } else { 
            
        $sql = "INSERT INTO aeroplanes(aeroplaneName, aeroplaneTopSpeed, aeroplaneRange, planeMakerID) VALUES(:aeroplaneName, :areoplaneTopSpeed, :aeroplaneRange, :planeMakerID )";
        $query = $conn->prepare($sql);
        $query->bindparam(':aeroplaneName', $planeModel);
        $query->bindparam(':aeroplaneTopSpeed', $topSpeed);
        $query->bindparam(':aeroplaneRange', $range);
        $query->bindparam(':planeMakerID', $planeMakerID);
        $query->execute();
        
        // Alternative to above bindparam and execute
        // $query->execute(array(':joketext' => $joketext, ':authorId' => $authorId));
        
        echo "<font color='green'>Data added successfully.";
        echo "<br/><a href='aeroplane.php'>Result</a>";
    }
}

$makerSql = "SELECT * FROM plane_maker"; 
$q1 = $conn->prepare($makerSql); 
$q1->execute(); 
        
?>

<!DOCTYPE html>

<html>
    <head>
        <title>Jokes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <a href="aeroplane.php">Home</a>
    <br/><br/>

    <form action="aeroplaneAdd.php" method="post" name="form1">
        <table width="25%" border="0">
            <tr> 
                <td>Airplane</td>
                <td><input name="planemodel"></input></td>
                <td>Top Speed</td>
                <td><input name="topspeed"></input></td>
                <td>Range</td>
                <td><input name="range"></input></td>
                <td>Manufacturer ID</td>
                <td><input name="ID"></input></td>            </tr>
            
            <tr> 
<td>Manufacturer</td> 
<td>

<!-- Vi skapar en dropdown som laddas med författare från databasen, så att inte
användare inte lägger till författare som inte existerar-->    
<select name="planeMakerID"> 
<?php

$planeMakerID="";
while($maker = $q1->fetch()) { 
if ($maker['planeMakerId'] == $planeMakerID) { 
//The author is currently associated to the joke, select it by default 
echo "<option value=\"{$maker['planeMakerId']}\" selected>{$maker['planeMakerId']}</option>"; 
} else { 
//The author is not currently associated to the joke 
echo "<option value=\"{$maker['planeMakerId']}\">{$maker['planeMakerName']}</option>"; 
} 
} 
?> 
</select> 
</td> 
</tr> 
    <tr> 
        <td></td>
            <td><input type="submit" name="Submit" value="Add"></td>
            </tr>
        </table>
    </form>
<!--För att logga ut skickar vi användaren till en sida där sessionen avslutas
med session_destroy-->    
    <a href="logout.php">Logout</a>
    </body>
</html>


