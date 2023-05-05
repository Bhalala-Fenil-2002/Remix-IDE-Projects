// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test{

    address payable user1 = payable(0x617F2E2fD72FD9D5503197092aC168c91465E7f2);
    address payable user2 = payable(0x17F6AD8Ef982297579C203069C1DbfFE4348c372);
    address payable user3 = payable(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678);

    function sendEther() public payable {

    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendToOne() public payable {
        user1.transfer(1 ether);
    }

    function sendToTwo() public payable {
        user2.transfer(1 ether);
    }

    function sendToThree() public payable {
        user3.transfer(1 ether);
    }


    
}