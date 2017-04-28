<!DOCTYPE html>

<?php
//including the database connection file
include_once("config.php");

session_start();
if(empty($_SESSION['email']))
{
 header("location:index.php");
}

echo "Welcome ".$_SESSION['name']; 

$result = $conn->query("call sp_aeroplane");

?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Aeroplanes</title>
    </head>
    <body>
        <a href="aeroplaneAdd.php">Add New Aeroplane</a>
        <a href="aeroplaneAdd.php">Add New aeroplane maker</a><br/><br/>
 
        <table width='80%' border=0>
 
        <tr bgcolor='#CCCCCC'>
            <td>Maker name</td>
            <td>Aeroplane</td>
            <td>Top speed</td>
            <td>Range</td>
            <td>Update</td>
        </tr>
    <?php
  
    while($row = $result->fetch()) {         
        echo "<tr>";
        echo "<td>".$row['planeMakerName']."</td>";
        echo "<td>".$row['aeroplaneName']."</td>";
        echo "<td>".$row['aeroplaneTopSpeed']."</td>";
        echo "<td>".$row['aeroplaneRange']."</td>";
        echo "<td><a href=\"aeroplaneEdit.php?id=$row[aeroplaneID]\">Edit</a> | <a href=\"aeroplaneDelete.php?id=$row[aeroplaneID]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";        
    }
    ?>
 
    <a href="logout.php">Logout</a>
    </table>
    </body>
</html>
