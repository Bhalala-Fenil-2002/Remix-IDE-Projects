// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
// pragma solidity >=0.4.0 <0.5.0;

contract checkUint{
    uint8 public valUint = 255; 

    function setUint(uint8 newUint) public {
        valUint = newUint;
    }
}