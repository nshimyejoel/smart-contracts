// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/SimpleStorage.sol";

contract storageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public  {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _index,uint256 _number) public  {
        simpleStorageArray[_index].store(_number);
    }

    function addPeople(uint256 _index, uint _number, string memory _name) public {
        simpleStorageArray[_index].addPerson(_number, _name);
    }

    function sfGet(uint256 _index) public view returns (uint256) {
       return  simpleStorageArray[_index].retrieve();
    }

    
    function getPeople(uint256 _index,uint256 _favoriteNumber) public view returns (string memory) {
      return  simpleStorageArray[_index].nameToFavorite(_favoriteNumber);
    }

    
}
