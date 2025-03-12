// What to do with this contract
// Get funds from users
// Withdraw funds
// Set minimum funding value in usd $

// SPDX-License-Identifier: MIT

/**
 * @title SimpleStorage
 * @dev A simple contract for storing data.
 * @notice This contract allows you to store data using a key-value pair approach.
 * @dev The contract requires a compiler version of 0.8.0 or higher.
 */
pragma solidity ^0.8.0; // stating my version

import {PriceConverter} from "./PriceConverter.sol";

//  Allow users to send money
// Have a minimum $ send
contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // How to make the contract require at least 1eth
        require(msg.value.getConversionRate() == minimumUsd, "didn't send enough eth"); // 1e18 means 1ETH means 1000000000000000000 = 1 * 10 ** 18. the ** means raise to power
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
    // msg.value is in terms of eth

    function withdraw() public onlyOwner {
        // for loop
        // [1, 2, 3, 4] elements
        // [0, 1, 2, 3] indexes
        // for(/* starting index, ending index, step amount */)
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex + 1) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // funderIndex = funderIndex + 1; can also be written as funderIndex ++;

        //to reset the array we say
        funders = new address[](0);

        // to withraw the funds from this contract
        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //msg.sender id of type address while payable (msg.sender) is of type payable address

        // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "send failed");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }
    // What happens if someone sends ETH to this contract without calling the fund function?

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
