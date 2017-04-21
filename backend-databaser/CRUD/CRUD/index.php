<!DOCTYPE html>
<!--
Anders Rochester, Inlämning CRUD, den 19 april 2017

Uppgift: a) Skapa två tabeller med en till många relation i mySQL
         b) Skapa uppkoppling till databasen externt mha PDO i php
         c) Skapa en procedur som innehåller sql-fråga, inner join 
            skall användas, ingen view i proceduren
         d) Utdatan från proceduren skall använda data från bägge
            tabellerna
         e) Kommentera i koden.
         f) Projektmappen skall heta CRUD och skall ligga uppe 
            externt på ...icloudis.com/kyh_students/AndersRochester/

Jag har skapat två tabeller fruit och bowl:

bowl

+--------+-------------------+-----------+----------+------------+
| bowlID | bowlName          | bowlColor | bowlType | bowlWeight |
+--------+-------------------+-----------+----------+------------+
|      1 | grannys bowl      | grön      | kristall |       1750 |
|      2 | Anty Esters bling | svart     | silver   |       1250 |
+--------+-------------------+-----------+----------+------------+

fruit

+---------+--------------+--------+----------+-------------+
| fruitID | fruitName    | bowlID | fruitQTY | fruitWeight |
+---------+--------------+--------+----------+-------------+
|       1 | Banan        |      1 |        4 |      234.34 |
|       2 | Äpple        |      1 |        6 |      123.43 |
|       3 | Apelsin      |      1 |        3 |      256.21 |
|       4 | Clementin    |      2 |        3 |         560 |
|       5 | Granatäpple  |      2 |        2 |       432.3 |
+---------+--------------+--------+----------+-------------+

Proceduren 'totalweight'

Hämtar all frukt från 'fruit' summerar vikten och presenterar resultatet per
skål('bowl'). Nedan ser vi output från mysql lokalt. Eftersom jag använt mig av
float till vikten ('fruitWeight') så kommer det att bli många decimaler när man
summerar. Jag är endast intresserad av två decimaler därför används funktionen
number_format() i php-skriptet för att få få önkat antal decimaler med svenskt
komma ',' istället för engelsk punkt '.'.

+-------------------+--------------------+
| bowlName          | Total fruit weight |
+-------------------+--------------------+
| Anty Esters bling |  992.2999877929688 |
| grannys bowl      |  613.9799880981445 |
+-------------------+--------------------+


-->

<?php
// Hämta uppkopplingen från konfigurationsfilen 'config.php'

include_once 'config.php';

?>
    
    <meta charset="UTF-8">
    <title>FWD16, Inlämning den 20 april, Anders Rochester</title>
        
        <!--  Tabellens css  -->
        <style>
 
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 60%;
            }

            td, th {
                border: 1px solid #bbb;
                text-align: left;
                padding: 8px;
            }
            
            td {
                font-size: 14px;
            }

            tr:nth-child(even) {
                background-color: #ddb;
            }
        </style>
    
    <body>
        
        <table>
            <th colspan="2">Procedure result</th>
            <tr>
                <th>Bowl name</th>
                <th>Fruit weight</th>
            </tr>
        <?php
        
        //Kalla på proceduren 'totalweight', vilken
        //ställer frågan; hämta all frukt från skålarna.
        //Presentera i en tabell.
        
        $sqlQuery = 'call totalweight';
        foreach ($conn->query($sqlQuery) as $row) {
            echo '<tr>';
            echo '<td>'.$row['bowlName']." ";
            //
            echo '<td>'.number_format($row['Total fruit weight'], 2,","," "). " g.";
        }
        ?>
        </table>

    </body>

