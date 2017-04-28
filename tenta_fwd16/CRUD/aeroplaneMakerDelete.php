<?php
//including the database connection file
include_once("config.php");
//include_once("config_local.php");
 
//getting id of the data from url
$id = $_GET['id'];
 
//deleting the row from table    
$sql = "DELETE FROM aeroplane WHERE aeroplaneID=:aeroplaneID";
$query = $pdo->prepare($sql);
$query->execute(array(':aeroplaneID' => $id));
 
header("Location:aeroplane.php");
?>

