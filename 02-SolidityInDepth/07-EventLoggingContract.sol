// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;

contract EventLoggingContract {
    
    event SenderLogger(address);
    event ValueLogger(uint);
    event Sent(address from, address to, uint amount);

    
    address private owner;
    
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }
    
    function EventLoggingContract()  public {
        owner = msg.sender;
    }
    
    function () payable public isOwner validValue {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
    }
  
	function sendAssets(address receiver, uint amount) public {
        //Some code for your intended logic...

        //Call the event that will fire at browser (client-side)
        Sent(msg.sender, receiver, amount);
    }
    
}

