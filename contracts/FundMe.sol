// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 minimumUsd = 50 * 1e18;

    // array that will used to store all funders
    address[] public funders;
    //storing how much of money each funder has funded
    mapping (address => uint256) public addressToAmountFunded;

     //Allows users to fund the contract with Ether

    function fund() public payable  {
        require(getConversionRate(msg.value) > minimumUsd,"Didn't send enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    // Retrieves the latest price of Ether in USD from an external price feed
    function getPrice() public view returns (uint256) {
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e18);
    } 

    // Retrieves the version of the price feed contract
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    // Calculates the conversion rate of Ether to USD
    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10e18;
        return ethAmountInUsd;
    }

}
