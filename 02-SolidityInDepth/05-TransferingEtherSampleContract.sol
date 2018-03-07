// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;

contract TransferingEtherSampleContract {
    
    mapping(address => uint) public balances;
    
    function deposit() payable public {
        balances[msg.sender] += msg.value;
    }
    
    
    //transfer
    
    function withdraw(uint amount) public payable{
        if(balances[msg.sender] >= amount) {
            balances[msg.sender] -= amount;
            msg.sender.transfer(amount);
        }
    }
    
    //require  / transfer (Exception handling)
    function withdrawWithCheck(uint amount) public payable{
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
    
}