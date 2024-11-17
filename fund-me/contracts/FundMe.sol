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

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // Set a minimum fund amount in USD
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough"); // 1e18 = 1 * 10^18 in wei
        funders.push(msg.sender);
    }

    function withdraw() public onlyOwner {
        // for loop
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the funders array
        funders = new address[](0);

        // actually withdraw

        // // transfer
        // // msg.sender is of type address
        // // while payable(msg.sender) is casted to type payable address
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // call
        (bool callSucess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess, "Call failed");

    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only contract owner is allowed to withdraw!");
        _;
    }
}
