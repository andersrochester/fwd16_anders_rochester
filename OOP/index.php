<!DOCTYPE html>
<!--
Jag tar och repeterar OOP, hittade en bra tutorial killerphp.com

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>OOP IN PHP, exercises</title>
        <?php 
        include('class_lib.php');

        ?>
    </head>
    <body>
        <?php
        
        include 'aircrafts.php';
        
        
        $viggen = new Interceptor('Viggen', 2000, 3500, 6000, 6);
        
        print_r($viggen->refuel().$viggen->warning());
        print_r($viggen);
        
        $B52 = new Bomber("Big mamas carrier", 900, 1500, 20000, 40);

        print_r($B52->refuel());
        print_r($B52);
        
 
        ?>
    </body>
</html>
