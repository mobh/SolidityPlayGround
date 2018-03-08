// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.18;


contract DatenTypenContract { 

    //****************** 
    // Value Types
    //**********************

	// string
    string varString;
    //Boolean
    bool  varBool = false;
    //Integer
    int8  varInt8 = -1;
    uint8  varUint = 255;
    uint128 public varResult = 2.5 + 0.5 ;
   //ufixed8x1 public varResult = 5 / 2;

    // bytes
    bytes public varByte;
    
    function string2bytes( string s)  public {
        varByte = bytes(s);
    }
   
   	//****************** 
   	// Enum Types
	//**********************
    enum State { Created, Locked, Inactive }
    State state = State.Created;
	State state1 = State.Locked;
    uint public wert = uint(state1);

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
    //Arrays
    uint8[] varStringArr;
    uint[10] myFixedArr;

	//Mapping 
    mapping(uint => Product) public products;

    // Spezial Types (see docu)
    address public varAddress = this;


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
	

	
	// Constructor
	function DatenTypenContract () public payable {
	    varAddress = msg.sender;
	    
	}

    function getBalance () public view returns (uint)  {
        return this.balance;
        
    }
    
    	// Fall Back Method
	function () payable public{
	    
	  
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


