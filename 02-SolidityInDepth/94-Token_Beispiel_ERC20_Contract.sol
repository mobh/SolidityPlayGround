// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;

interface ERC20 {
    function totalSupply() public constant  returns (uint totalSupplyAmount);
	function balanceOf(address _owner) public constant  returns (uint balance);
	function transfer(address _to, uint _value) public returns (bool success);
	function transferFrom(address _from, address _to, uint _value) public returns (bool success);
	function approve(address _spender, uint _value) public returns (bool success);
	function allowance(address _owner, address _spender) public constant returns (uint remaining);

    event Transfer(address indexed _from, address indexed _to, uint _value);
	event Approval(address indexed _owner, address indexed _spender, uint _value);
}



contract SampleToken is ERC20 {
    uint private totalSupplyInt;
     
    /* Map containing the token Holder adresses and their balances of issued tokens */
    mapping (address => uint) balances;
    
    /* Map containing users and their approval addresses and amounts */
    mapping (address => mapping (address => uint)) allowances;

	/* symbol for the contract */
    
    string public symbol;
    
	/* Constructor to create the token*/
    
    function Token() public {
        totalSupplyInt = 1000;
        balances[msg.sender] = 1000;
        symbol = "SAT";
    }
    
    /* total supply of tokens */
  
    function totalSupply() constant public returns (uint256 _totalSupply)  {
        return totalSupplyInt;
    }

  	/* balance of the specified account */
  
    function balanceOf(address _owner) constant public returns (uint256 balance)  {
        return balances[_owner];
    }

 	 /* Transfer the balance from msg.sender account to another account */
 	 
    function transfer(address _to, uint256 _value) public returns (bool success) {
     	/* Check if sender has balance and for overflows */
        if (balances[msg.sender] >= _value &&
            balances[_to] + _value >= balances[_to]) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        }
        return false;
    }

	 /* Transfer funds between two addresses , the from address is not the current msg.sender  
	 - The Transfer requires approval to have been given previously with approve function  */
	 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    
     /* Check if allowed from sender and if sender has balance and for overflows */
        if (allowances[_from][msg.sender] >= _value &&  balances[_from] >= _value &&
            balances[_to] + _value >= balances[_to]) {
            balances[_from] -= _value;
            balances[_to] += _value;
            allowances[_from][msg.sender] -= _value;
            return true;
        }
        return false;
    }

	/* Adds an approval for the specified account to spend money of the msg.sender up to the specified limit */
   
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        return true;
    }

  	/* current allowance that has been approved from the specified address for the specified spender  */
  
    function allowance(address _owner, address _spender) constant public returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
}
