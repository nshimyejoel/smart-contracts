// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;
import "contracts/FundMeLibrary.sol";
contract FundMe {
    using  FundMeLibrary for uint256;
    uint256 minimumUsd = 50 * 1e18;

    // array that will used to store all funders
    address[] public funders;

    //storing how much of money each funder has funded
    mapping (address => uint256) public addressToAmountFunded;

    address public owner;
    constructor() {
        owner = msg.sender;
    }

     //Allows users to fund the contract with Ether
    function fund() public payable  {
        require(msg.value.getConversionRate() > minimumUsd,"Didn't send enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    //resetting amount funded 
    function withdraw() public onlyOwner{
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //resetting funder array(resetting all funders at the same time without looping)
        funders = new address[](0);
      
        // withdrawing funds
        (bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

  // Modifier for checking the owner of the smart contract to withdraw the funds
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
}