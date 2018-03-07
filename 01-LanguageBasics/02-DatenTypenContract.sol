// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.18;


contract DatenTypenContract { 

    //****************** 
    // Value Types
    //**********************

    bool varBool = false;
    int8 varInt8 = -128;
    uint8 varUint = 255;

    byte varByte;
    bytes1 varBytes1; 
    bytes32 varBytes32;

   	//****************** 
   	// Enum Types
	//**********************
    enum Action {ADD, REMOVE, UPDATE}
    Action public actionADD = Action.ADD;
	Action public actionRemove = Action.REMOVE;


    //**********************
    //Reference Types
    //**********************
   
   	//struct
	struct Product {
        string name;
        uint uid;
        uint price;
        uint stock;
       
    } 
    
    Product newProduct;

	// string
    string varString;

    //Arrays
    uint8[] varStringArr;
    uint[10] myFixedArr;

	//Mapping 
    mapping(uint => Product) public products;


    // Spezial Types
    address varAddress;


    //************************ 
    // Functions
    // function (<parameter types>) {internal|external} [pure|constant|view|payable] ˓→[returns (<return types>)]
	//****************
    
    
    
  
    function addProduct() public {
        newProduct  = Product({ name: "iPhone", uid: 1 , price: 100, stock: 5 });
        products[newProduct.uid] = newProduct;
	    	
    }
    
    
    function withDraw() public payable {
        varAddress = msg.sender;
        // Transfer 1 Ether
        varAddress.transfer(1000000000000000000);
    }
	
	// Fall Back Method
	function () payable{
	    
	  
	}
	
	// Constructor
	function DatenTypenContract () payable {
	    
	    
	}

    function getBalance () public view returns (uint)  {
        return this.balance;
        
    }
    
     address private owner;
    // Modifier
     modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }
    
    function withDrawWithCheck() isOwner public payable {
        varAddress = msg.sender;
        // Transfer 1 Ether
        varAddress.transfer(1000000000000000000);
    }
}


