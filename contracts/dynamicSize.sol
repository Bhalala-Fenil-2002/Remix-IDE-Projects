// SPDX-License-Identifier: GPL-3.0

pragma solidity > 0.7.0 <=0.9.0;

contract dynamicArray {
    uint[] public array;

    function pushArray(uint ele) public {
        array.push(ele);
    }

    function popArray() public {
        array.pop();
    }
    
    function getLength() view public returns (uint){
        return array.length;
    }

}

contract dynamicByteArray {
    bytes public arr3 = 'abcd';

    function pushArray() public {
        arr3.push('e');
    }

    function popArray() public {
        arr3.pop();
    }
    
    function getLength() view public returns (uint){
        return arr3.length;
    }   

}