<?php

abstract class Aircraft  {
    
    protected $speed;
    protected $range;
    protected $payload;
    protected $aircraftDesignation;


    public function __construct($aircraftDesignation, $speed, $range, $payload) {
        
        $this->aircraftDesignation = $aircraftDesignation;
        $this->speed = $speed;
        $this->range = $range;
        $this->payload = $payload;
        
        }
    
    public function refuel() {
        return '<br>Go Juice, thanks Texaco<br>';
    }
        
}


