<!DOCTYPE html>
<!--
Anders Rochester, Inlämning bankaccount, den 19 april 2017

-->
<?php

// Hämta uppkopplingen från konfigurationsfilen.
include_once 'config.php';


// Definera en klass och formatera utdatan(accountBalance)
class Bank {
    public $accountName, $accountFname, $accountLname, $accountBalance, $output;
    public function __construct() {
        $balanceOutput = number_format($this->accountBalance,2,",","." );
        $this->output = "{$this->accountFname}  {$this->accountLname} has: ".
        "{$this->accountName} account with $balanceOutput balance.";
    }
    
}
//Sparar denna snutt då jag använde mig av foreach() för första output
/*
foreach ($conn->query($sqlQuery) as $row) {
    echo '<hr>';
    print $row['accountFname']." ";
    print $row['accountLname']."<br>";
    print $row['accountBalance']."<br>";
}
*/

?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        
        $sqlQuery = 'call getbalance("Sohail")';

        
        $result = $conn->query($sqlQuery);

        if ($result->rowCount()) {
             $result->setFetchMode(PDO::FETCH_CLASS, 'Bank');
         while($row = $result->fetch()) {
            echo $row->output, '<br>';
        }
     
        } else {
     echo '0 results';
        }        
        
        ?>
    </body>
</html>
