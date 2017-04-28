<?php 
// including the database connection file 
include_once("config.php");
//include_once("config_local.php");

session_start();
if(empty($_SESSION['email']))
{
 header("location:joke.php");
}

echo "Welcome ".$_SESSION['name']."<br>";

$id = $_GET['id'];


$sql = "SELECT * FROM joke WHERE id=:id"; 
$query = $conn->prepare($sql); 
$query->execute(array(':id' => $id)); 

while($row = $query->fetch()) 
{ 
$joketext = $row['joketext']; 
$authorid = $row['authorid']; 
}

$authorSql = "SELECT * FROM author"; 
$authorQuery = $conn->prepare($authorSql); 
$authorQuery->execute();


?> 
<?php 


if(isset($_POST['update'])) 
{ 
$id = $_POST['id']; 

$joketext=$_POST['joketext']; 
$authorid=$_POST['authorid']; 


// checking empty fields

if(empty($joketext) || empty($authorid)) { 

if(empty($joketext)) { 
echo "<font color='red'>Name field is empty.</font><br/>"; 
} 

if(empty($authorid)) { 
echo "<font color='red'>Author field is empty.</font><br/>"; 
} 

} else { 


$sql = "UPDATE joke SET joketext=:joketext, authorid=:authorid WHERE id=:id";


$query = $conn->prepare($sql); 
/*Sedan binder vi det som finns i platshållaren till variabeln*/
$query->bindparam(':id', $id); 
$query->bindparam(':joketext', $joketext); 
$query->bindparam(':authorid', $authorid);
//vi använder det som nu finns i $query för att köra sql frågan 
$query->execute(); 

// Alternative to above bindparam and execute 
// $query->execute(array(':id' => $id, ':joketext' => $joketext)); 

//header används för att skicka tillbaka efter proccesn är klart till en sida
header("Location: index.php"); 
} 
}  
?> 
<!DOCTYPE html> 

<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<body> 
    <a href="aeroplane.php">Home</a> 
<br/><br/> 

<form name="form1" method="post" action="edit.php"> 
<table border="0"> 
<tr> 
<td>Airplane</td> 
<!-- Resultatet av vår sql fråga från rad34 lägger vi en textarea, man kan alltid
blanda html och php som ni ser, genom att flika in php taggar som start och slut-->
<td><input name="joketext" value=<?php echo $joketext;?>></td>
</tr> 
<tr> 
<td>Manufacturer</td> 
<td>
 
<select name="authorid"> 
<?php 
while($author = $authorQuery->fetch()) { 
if ($author['id'] == $authorid) { 

echo "<option value=\"{$author['id']}\" selected>{$author['name']}</option>"; 
} else { 

echo "<option value=\"{$author['id']}\">{$author['name']}</option>"; 
} 
} 
?> 
</select> 
</td> 
</tr> 

<tr>
<td><input type="hidden" name="id" value=<?php echo $_GET['id'];?></td> 
<td><input type="submit" name="update" value="Update"></td> 
</tr> 
</table> 
</form>

<a href="logout.php">Logout</a>
    </body>
</html>
