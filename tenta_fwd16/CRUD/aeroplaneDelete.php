<?php
//including the database connection file
include_once("config.php");
//include_once("config_local.php");
 
//getting id of the data from url
$id = $_GET['id'];
 
//deleting the row from table    
$sql = "DELETE FROM joke WHERE id=:id";
$query = $pdo->prepare($sql);
$query->execute(array(':id' => $id));
 
//redirecting to the display page (index.php in our case)
header("Location:joke.php");
?>

