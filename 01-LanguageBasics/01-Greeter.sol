pragma solidity ^0.4.0;

contract Greeter {
	
	string greeting;
	  
    function Greeter(string _greeting) public   //  constructor.
    {
       
        greeting = _greeting;
    }

    function greet() constant public returns (string)          
    {
        return greeting;
    }
    
    function setGreeting (string _newgreeting) public 
    {
        greeting = _newgreeting;
    }
    
   
}