pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable{

  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;
  uint256 public constant tokensPerEth = 100;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:
  
  function buyTokens() public payable {
    require(msg.value > 0, "Send ETH to buy tokens");
    
    uint256 amountOfTokens = msg.value * tokensPerEth;
    
    // Check if the vendor contract has enough tokens
    require(yourToken.balanceOf(address(this)) >= amountOfTokens, "Vendor has insufficient tokens");
    
    // Transfer the tokens to the buyer
    bool sent = yourToken.transfer(msg.sender, amountOfTokens);
    require(sent, "Token transfer failed");
    
    // Emit the event
    emit BuyTokens(msg.sender, msg.value, amountOfTokens);
  }

  // ToDo: create a withdraw() function that lets the owner withdraw ETH
 function withdraw() public onlyOwner returns (bool) {
    uint256 balance = address(this).balance;
    require(balance > 0, "No ETH available to withdraw");
    
    (bool sent, ) = payable(owner()).call{value: balance}("");
    require(sent, "Failed to withdraw ETH");
    return true;
  }
  // ToDo: create a sellTokens(uint256 _amount) function:
   function sellTokens(uint256 _amount) public returns (bool) {
    require(_amount > 0, "Amount must be greater than 0");
    require(yourToken.balanceOf(msg.sender) >= _amount, "Insufficient token balance");
    
    uint256 ethToReturn = _amount / tokensPerEth;
    require(address(this).balance >= ethToReturn, "Vendor has insufficient ETH balance");
    
    bool transferred = yourToken.transferFrom(msg.sender, address(this), _amount);
    require(transferred, "Token transfer failed");
    
    (bool sent, ) = msg.sender.call{value: ethToReturn}("");
    require(sent, "Failed to send ETH");
    
    return true;
  }
}
