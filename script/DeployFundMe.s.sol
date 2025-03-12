// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMeFundMe is Script {
    // Add your deployment logic here
    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundme = new FundMe();
        vm.stopBroadcast();
        return fundme;
    }
}
