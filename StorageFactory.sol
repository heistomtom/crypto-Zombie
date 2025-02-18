// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28; // stating my version

   import {SimpleStorage} "./SimpleStorage.sol";
   contract StorageFactory{

// uint 256 public favoriteNumber

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
    SimpleStorage newSimpleStorageContract = new SimpleStorage();
    listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view return(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }

   }
