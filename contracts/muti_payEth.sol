// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract multiPayEther {
    // address payable adminUser = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
    // uint[] public numberArr;
    address payable[] public lotteryUser;
    uint count;
    address admin;
    // uint num = 5;
    uint lotteryWinner;

    uint num = 10;

    constructor(){
        admin = msg.sender;
    }

    // function pushLotteryUser(address addUser) public{
    //     lotteryUser.push(payable(addUser));
    // }

    // function pushLotteryUser(uint addUser) public{
    //     lotteryUser.push(addUser);
    // }

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

    function randMod() public 
    {
        lotteryWinner = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender, lotteryUser.length))) % lotteryUser.length;
        // return lotteryWinner;
    }

    function winner() public payable {
        require(msg.sender == admin, "Not admin");
        
        lotteryUser[lotteryWinner].transfer(address(this).balance);
    }

    function Demo() public pure returns(uint){
        uint sum = 10 + 10;
        return sum;
    }

}