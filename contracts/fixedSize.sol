// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

contract fixedSizeArray {
    uint[5] public array = [10,20,30,40,50];

    function setValue(uint index, uint value) public{
        array[index] = value;
    }

    function getLength() view public returns (uint) {
        return array.length;
    }
}

contract fixedSizeByteArray {
    bytes3 public arr3;
    bytes2 public arr2;

    function setByte() public {
        arr3 = 'abc';
        arr2 = 'ab'; 
    }    

}