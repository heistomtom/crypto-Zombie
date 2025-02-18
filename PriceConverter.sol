// This is a library, a price converter library

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28; // stating my version

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    // Below is a function to get our token price
    function getPrice() internal view returns(uint256) {
        return uint256(price * 1e10);
    }
    function getConversionRate(uint256, ethAmount) internal view return(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVerdion() internal view returns (uint256){
        return AggregatorV3Interface().version();
        //the first bracket is to contain a wallet address
    }
}

