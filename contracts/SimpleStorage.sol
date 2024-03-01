// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 public favoriteNumber;
    mapping (uint256 => string) public nameToFavorite;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256)  {
        return favoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name) public  {
        people.push(People(_favoriteNumber,_name));
        nameToFavorite[_favoriteNumber] = _name;
    }
}