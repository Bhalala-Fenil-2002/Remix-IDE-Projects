// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PayableDemo {

    address payable pay1 = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    function payEther() public payable {

    }

    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    function sendEther() public {
        pay1.transfer(address(this).balance);
    }
    

}