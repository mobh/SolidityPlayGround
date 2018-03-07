// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;
contract ErrorHandlingContract {
	
	/*In the following function, you can see how require can be used to easily check conditions 
	 on inputs and how and assert can be used for internal error checking 
	 Source: solidity docu.
	 */
	
	function sendHalf(address addr) public payable returns (uint balance) {
		require(msg.value % 2 == 0); // Only allow even numbers 
		uint balanceBeforeTransfer = this.balance; 
		addr.transfer(msg.value / 2);
		
		// Since transfer throws an exception on failure and
		// cannot call back here, Check if the 1/2 was really 
		//transfered
		assert(this.balance == balanceBeforeTransfer - msg.value / 2); 
		
		return this.balance;

	} 
	
	//revert example
	
	 function buyProduct() public payable  returns (bool success) {
    	
        if (msg.value >100 ){
        	// Buy Product
	    	return true;
	    }else{
	    	revert();

        }
        return false;
    }

}
