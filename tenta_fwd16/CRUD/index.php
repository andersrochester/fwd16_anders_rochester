<?php
echo 'Current PHP version: ' . phpversion();

include_once("config.php");


session_start();

if(isset($_POST['signup'])){
 $name = $_POST['name'];
 $email = $_POST['email'];
 $pass = md5($_POST['pass']);
 
$insert = $conn->prepare("INSERT INTO users (name,email,pass) values(:name,:email,:pass) ");
$insert->bindParam(':name',$name);
$insert->bindParam(':email',$email);
$insert->bindParam(':pass',$pass);
$insert->execute();


}elseif(isset($_POST['signin'])){
 $email = $_POST['email'];
 
 $pass = md5($_POST['pass']);
 
 $select = $conn->prepare("SELECT * FROM users WHERE email='$email' and pass='$pass'");
 $select->setFetchMode();
 $select->execute();
 $data=$select->fetch();

 if($data['email']!=$email and $data['pass']!=$pass)
 {
  echo "invalid email or pass";
 }

 elseif($data['email']==$email and $data['pass']==$pass)
 {
 $_SESSION['email']=$data['email'];
    $_SESSION['name']=$data['name'];
header("location:aeroplane.php"); 
 }
 }


?>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Credentials</title>
        <style>
            h1 {
                font-family: arial;
                font-size: 20px;
            }
            .formContainer{
                display: flex;
            }

            .rightForm{
                padding:85px;
            }

            .leftForm{
                margin-left: auto;
                padding:85px;
            }
        </style>
    </head>
    <body>
        <div class="formContainer">
            
            <div class="rightForm">
                <h1>Create Account Here</h1>
                <form method="post">
                    <input type="text" name="name" placeholder="User Name"><br><br>
                    <input type="text" name="email" placeholder="example@example.com"><br><br>
                    <input type="password" name="pass" placeholder="password"><br><br>
                    <input type="submit" name="signup" value="SIGN UP">
                </form>
            </div>
            
            <div class="leftForm">
                <h1>Log In Here</h1>
                <form method="post">
                    <input type="text" name="email" placeholder="example@example.com"><br><br>
                    <input type="password" name="pass" placeholder="password"><br><br>
                    <input type="submit" name="signin" value="SIGN IN">
                </form>
            </div>
        
        </div>
    </body>
</html>
