// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.4;

/*
 *  SimpleStorage on the Blockchain
 * 	The contract should be able to store name and the age of a Person
 *  -Person should be defined as struct
 *  -addPerson method: has 2 Parameters  
 *  -The added person should be stored in a mapping , the key of the mapping is the address of the sender
 *
 */
 
contract SimpleStorageContract {

    address owner;
    
    struct Person{
        string name;
        uint age;
    }	
    mapping (address => Person) public persons;
    
    function SimpleStorageContract() public {
        owner = msg.sender;    
        
    }
    
    function addPerson(string _name, uint _age) public{
        
        Person memory p = Person({ name:_name , age :_age});
        persons[msg.sender]= p;
    }
    
    function withDraw () payable public{
        if (msg.sender == owner){
            owner.transfer(this.balance);
        }
        
    }
    
        
}