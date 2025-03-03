// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28; // stating my version

contract SimpleStorage {
   // gives 0 when its undefined

   uint256 myFavoriteNumber; 

   //uint256[] listOfFavoriteNumbers;
   struct Person{
      uint256 favoriteNumber;
      string name;
   }
   Person public myFriend = Person(7, "Pat");

   function store(uint256 _favoriteNumber) public {
      myFavoriteNumber = _favoriteNumber;
   }

   function retrieve() public view returns(uint256){
      return myFavoriteNumber;
   }
}