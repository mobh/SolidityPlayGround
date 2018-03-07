// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;

contract EventLoggingContract {
    
    event fallBackCalledEvent(address);
    event balanceChangedEvent(uint);
    event sendAssetsCalledEvent(address from, address to, uint amount);

  	//FallBack Method	
   function () payable public  {
        fallBackCalledEvent(msg.sender);
        balanceChangedEvent(msg.value);
    }
  
  
	function sendAssets(address receiver, uint amount) public {
        
		// Some logic
        //trigger Event
        sendAssetsCalledEvent(msg.sender, receiver, amount);
    }
    
}

