// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {
    function fund() public payable {
        // Set a minimum fund amount in USD
        require(msg.value >= 1e18, "Didn't send enough"); // 1e18 = 1 * 10^18 // in wei
    }

    // function withdraw() {}
}
