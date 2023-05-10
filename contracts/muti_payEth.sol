// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract multiPayEther {
    uint[] public lotteryUser;
    address payable adminUser = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
    uint count;

    function pushLotteryUser(uint addUser) public{
        lotteryUser.push(addUser);
    }

    function payEther() public payable {
    }

    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

}