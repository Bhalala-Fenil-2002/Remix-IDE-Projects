// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test{

    address payable user = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);

    function payEther() public payable
    {
        
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    function transferEther() public payable {
        user.transfer(1 ether);
    }
}