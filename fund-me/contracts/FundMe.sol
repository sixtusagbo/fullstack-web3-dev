// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        // Set a minimum fund amount in USD
        require(msg.value >= minimumUsd, "Didn't send enough"); // 1e18 = 1 * 10^18 // in wei
    }

    function getPrice() public {
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate() public {

    }

    // function withdraw() {}
}
