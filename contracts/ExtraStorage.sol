// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;
import "contracts/SimpleStorage.sol";

contract ExtraStoarage is SimpleStorage {

   function store(uint256 _favoriteNumber) public override  {
    favoriteNumber = _favoriteNumber + 5;
   } 
}