<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
// visar direkt i browser används inte men inte i
// men sätt den til 0 (FALSE) när det är skarpt läge

// 
ini_set('log_errors', 1);




try {
    
    //$pdo = new PDO('mysql:host=localhost; dbname=db1164707_AndersR', 'root', 'root');
    $conn = new PDO('mysql:host=83.168.227.23; dbname=db1164707_AndersR', 'u1164707_AndersR', 'n4jR8R}[|F');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    
} catch (PDOException $e) {
    
    echo 'Connection failed: '. $e->getMessage();

}
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

