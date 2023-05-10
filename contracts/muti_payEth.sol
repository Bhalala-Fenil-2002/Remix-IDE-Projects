// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract multiPayEther {
    address payable[] public lotteryUser;
    // address payable adminUser = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
    uint count;
    address admin;

    constructor(){
        admin = msg.sender;
    }

    function pushLotteryUser(address addUser) public{
        lotteryUser.push(payable (addUser));
    }

    // function payEther() public payable {
    //     // msg.sender
    // }

    function getBalance() view public returns(uint) {
        require(msg.sender == admin, "Not admin");
        return address(this).balance;
    }

    receive() external payable  {
        require(msg.value == 2 ether, "Minmum 2 Ehter");
        lotteryUser.push(payable (msg.sender));
    }

}