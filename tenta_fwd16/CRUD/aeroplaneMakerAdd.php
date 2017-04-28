<?php
include_once("config.php");

session_start();
if(empty($_SESSION['email']))
{
 header("location:index.php");
}

echo "Welcome ".$_SESSION['name']."<br>";

if(isset($_POST['Submit'])) {    
    $joketext = $_POST['joketext'];
    $authorid = $_POST['authorid'];
        
    if(empty($joketext) || empty($authorid)) {
                
        if(empty($joketext)) {
            echo "<font color='red'>Name field is empty.</font><br/>";
        }
        
        if(empty($authorid)) {
            echo "<font color='red'>Email field is empty.</font><br/>";
        }
        
        echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
    } else { 
            
        $sql = "INSERT INTO joke(joketext, authorid) VALUES(:joketext, :authorid)";
        $query = $conn->prepare($sql);
        $query->bindparam(':joketext', $joketext);
        $query->bindparam(':authorid', $authorid);
        $query->execute();
        
        // Alternative to above bindparam and execute
        // $query->execute(array(':joketext' => $joketext, ':authorId' => $authorId));
        
        echo "<font color='green'>Data added successfully.";
        echo "<br/><a href='aeroplane.php'>Result</a>";
    }
}

$authorSql = "SELECT * FROM author"; 
$authorQuery = $conn->prepare($authorSql); 
$authorQuery->execute(); 
        
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

    <form action="add_form.php" method="post" name="form1">
        <table width="25%" border="0">
            <tr> 
                <td>Airplane</td>
                <td><input name="joketext"></input></td>
            </tr>
            
            <tr> 
<td>Manufacturer</td> 
<td>

<!-- Vi skapar en dropdown som laddas med författare från databasen, så att inte
användare inte lägger till författare som inte existerar-->    
<select name="authorid"> 
<?php

$authorid="";
while($author = $authorQuery->fetch()) { 
if ($author['id'] == $authorid) { 
//The author is currently associated to the joke, select it by default 
echo "<option value=\"{$author['id']}\" selected>{$author['name']}</option>"; 
} else { 
//The author is not currently associated to the joke 
echo "<option value=\"{$author['id']}\">{$author['name']}</option>"; 
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


