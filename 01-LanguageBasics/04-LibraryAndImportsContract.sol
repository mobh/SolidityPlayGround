// Author: M Ben Hajla
// Only for educational purposes

pragma solidity ^0.4.0;



library Strings {
    
    function concat(string _base, string _value) internal pure returns (string) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);
        
        uint i;
        uint j;
        
        for(i=0;i<_baseBytes.length;i++) {
            _newValue[j++] = _baseBytes[i];
        }
        
        for(i=0;i<_valueBytes.length;i++) {
            _newValue[j++] = _valueBytes[i];
        }
        
        return string(_newValue);
    }
    
    function strpos(string _base, string _value) internal pure returns (int) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        assert(_valueBytes.length == 1);        
        
        for(uint i=0;i<_baseBytes.length;i++) {
            if (_baseBytes[i] == _valueBytes[0]) {
                return int(i);
            }
        }
        
        return -1;
    }
    
}


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
    
    using Strings for string;
     // SimpleMath Math
    using SimpleMath for uint;
  
    function testConcat(string _base) public pure returns (string) {
        return _base.concat("_suffix");
    }
    
    function needleInHaystack(string _base) public pure returns (int) {
        return _base.strpos("t");
    }
    

   
   function sum(uint a, uint b) public pure returns (uint){
        return a.add(b);
    }
   
   // 
    function checkAddress(address _addr) public view returns (bool){
       bool b = AddressesUtil.isContract(_addr);
       return b;
   }
}

