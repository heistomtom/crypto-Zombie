// This is a library, a price converter library

// SPDX-License-Identifier: MIT

/**
 * @title SimpleStorage
 * @dev A simple contract for storing data.
 * @notice This contract allows you to store data using a key-value pair approach.
 * @dev The contract requires a compiler version of 0.8.0 or higher.
 */
pragma solidity ^0.8.0; // stating my version

import {AggregatorV3Interface} from "./interface/AggregatorV3Interface.sol";

library PriceConverter {
    // Below is a function to get our token price
    function getPrice(uint256 price) internal pure returns (uint256) {
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal pure returns (uint256) {
        uint256 ethPrice = getPrice(ethAmount);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion(address addy) internal view returns (uint256) {
        return AggregatorV3Interface(addy).version();
        //the first bracket is to contain a wallet address
    }
}
