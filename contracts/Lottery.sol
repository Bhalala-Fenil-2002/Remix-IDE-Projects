// SPDX-License-Identifier: GPL-3.0 

pragma solidity >= 0.7.0 < 0.9.0;

contract LotteryTicket {

    enum userStatus{Register, lottery, Winner}

    struct userInfo {
        address user;
        string name;
        uint price;
        userStatus status;
    }

    userInfo[] public users;
    uint count;
    address admin;
    uint lotteryWinner;

    uint num = 10;

    constructor(){
        admin = msg.sender;
    }

    function payEther(string memory name) public payable {
        require(msg.value == 2 ether, "Pay 2 ETH.");
        userInfo memory user = userInfo({
            user: msg.sender,
            name: name,
            price: msg.value,
            status: userStatus.Register
        });
        users.push(user);
    }

    function AdminAcco() view public returns(address, uint) {
        return (admin, address(this).balance);
    }

    function GetAllUsers() view public returns(userInfo[] memory) {
        return users;
    }

    function AddLottery(uint userIndex) public  {
        require(users[lotteryWinner].status != userStatus.Winner);
        users[userIndex].price = users[userIndex].price - 1 ether;
        users[userIndex].status = userStatus.lottery;
    }

    function findWinner() public {
        lotteryWinner = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender, users.length))) % users.length;
        require(users[lotteryWinner].status == userStatus.lottery);
        require(users.length > 2);
        users[lotteryWinner].status = userStatus.Winner;
        delete users;
    }

}