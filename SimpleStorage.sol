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

   Person[] public listOfPeople;

   mapping(string => uint256) public nameToFavoriteNumber;

   //Person public Pat = Person({favoriteNumber:7, name: "Pat"});
   //Person public Mariah = Person({favoriteNumber:12, name: "Mariah"});
   //Person public Jon = Person({favoriteNumber:17, name: "Jon"});

   function store(uint256 _favoriteNumber) public virtual {
      myFavoriteNumber = _favoriteNumber;
   }

   function retrieve() public view returns(uint256){
      return myFavoriteNumber;
   }
   function addPerson(string memory _name, uint256 _favoriteNumber) public {
      listOfPeople.push(Person( _favoriteNumber, _name) );
      nameToFavoriteNumber[_name] = _favoriteNumber;
   }
}