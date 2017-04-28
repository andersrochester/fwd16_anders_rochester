<?php
require_once 'class_lib.php';



class Interceptor extends Aircraft {
        
    public $missiles;
    
    public function __construct($aircraftDesignation, $speed, $range, $payload, $missiles ) {
        
        $this->missiles = $missiles;
       
        parent::__construct($aircraftDesignation, $speed, $range, $payload);
    }
    
    public function warning() {
        return '<br>WARNING!!! Boogie 9 oclock, Angels 5<br>';
    }
}


class Bomber extends Aircraft {
    
    
    public $bombs;
    
    public function __construct($aircraftDesignation, $speed, $range, $payload, $bombs ) {
        
        $this->bombs = $bombs;
       
        parent::__construct($aircraftDesignation, $speed, $range, $payload);
    }
}
