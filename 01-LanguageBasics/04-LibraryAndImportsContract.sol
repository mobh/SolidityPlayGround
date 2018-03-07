// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;


library SimpleMath {
   function add(uint a, uint b) public pure returns(uint)  {
       return a + b;
   }
}

library AddressesUtil {
  function isContract(address _base) internal constant returns (bool) {
      uint codeSize;
      assembly {
          codeSize := extcodesize(_base)
      }
      return codeSize > 0;
  }
}



contract TestLibraries {
    
    using SimpleMath for uint;
     // SimpleMath Math
   
   function sum(uint a, uint b) public pure returns (uint){
        return a.add(b);
    }
    
   
   // 
    function checkAddress(address _addr) public view returns (bool){
       bool b = AddressesUtil.isContract(_addr);
       return b;
   }
}

