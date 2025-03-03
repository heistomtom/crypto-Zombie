// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28; // stating my version

//Adding another function that is not in SIMPLESTORAGE.SOL

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    function sayHello() public pure returns(string memory){
        return "Hello!";
    }

    //Excluding a specific function in SIMPLESTORAGE.SOL
    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;
    }
}