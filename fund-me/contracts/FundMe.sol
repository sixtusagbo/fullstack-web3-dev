// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // Set a minimum fund amount in USD
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough"); // 1e18 = 1 * 10^18 in wei
        funders.push(msg.sender);
    }

    // function withdraw() {}
}
