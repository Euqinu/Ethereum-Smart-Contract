// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    uint256 minNum=50 * 1e18;
    address[] public funderList;
    mapping(address=>uint256) public funderNameAndAmount;


    function fund() public payable {
        require(getConversionRate(msg.value) > minNum,"less eth");
        funderList.push(msg.sender);
        funderNameAndAmount[msg.sender]=msg.value;
    }

    function getPrice() public {
        // ABI
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int price,,,)=priceFeed.latestRoundData();
        return uint256(price );
    }

    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }
    
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
      uint256 ethPrice = getPrice();
      uint256 rate = (ethPrice * ethAmount) /1e18;
      return rate; 
    }


}
