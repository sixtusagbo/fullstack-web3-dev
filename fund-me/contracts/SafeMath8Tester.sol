// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255; // checked from ^0.8

    function add() public {
        unchecked {bigNumber = bigNumber + 1;} // to revert back to unchecked
    }
}
