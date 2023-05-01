// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test{

    uint age = 2;
    string name = 'fenil';

    function setNewAge2(uint newage) public {
        age = newage;
    }

    function getAge() public view returns(uint){
        return age;
    }

    function getName() public view returns(string memory){
        return name;
    }

    function setName(string memory addName) public {
        name = addName;
    }

}