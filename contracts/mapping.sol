// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <= 0.9.0;

contract mapping_array {

    mapping(uint => string) public roll_no;

    function setStu(uint roll_num, string memory name) public {
        roll_no[roll_num] = name;
    }

}