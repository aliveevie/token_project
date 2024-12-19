# Token Vendor Smart Contract 🏪

A decentralized token vending machine that allows users to buy and sell tokens using ETH. Built with Solidity, Hardhat, and Next.js.

## Overview 🔎

This project implements a token vendor system where:
- Users can buy tokens with ETH at a fixed rate (100 tokens per ETH)
- Users can sell tokens back to the vendor for ETH
- The contract owner can withdraw accumulated ETH from token sales
- Users can transfer tokens to other addresses

## Smart Contracts 📄

### YourToken.sol
- ERC20 token implementation
- Fixed supply token
- Mintable by owner

### Vendor.sol
- Handles token buying and selling functionality
- Fixed exchange rate: 100 tokens per ETH
- Functions:
  - `buyTokens()`: Purchase tokens with ETH
  - `sellTokens(uint256 _amount)`: Sell tokens back for ETH
  - `withdraw()`: Owner can withdraw accumulated ETH

## Features ✨

- 💰 Buy tokens with ETH
- 💱 Sell tokens back for ETH
- 🔄 Transfer tokens between addresses
- 📊 Real-time balance updates
- 👤 Owner-only withdrawal function
- 🔒 Secure token approvals for selling

## Tech Stack 🛠

- Solidity ^0.8.4
- OpenZeppelin Contracts
- Hardhat
- Next.js
- TypeScript
- wagmi
- viem



## Usage 📝

1. **Buying Tokens**
   - Enter the amount of tokens you want to buy
   - Click "Buy Tokens"
   - Confirm the transaction in your wallet

2. **Selling Tokens**
   - Enter the amount of tokens you want to sell
   - Click "Approve Tokens"
   - Once approved, click "Sell Tokens"
   - Confirm the transaction in your wallet

3. **Transferring Tokens**
   - Enter the recipient's address
   - Enter the amount to send
   - Click "Send Tokens"
   - Confirm the transaction in your wallet

## Security Considerations 🔐

- The contract includes checks for sufficient balances
- Requires token approval before selling
- Owner-only withdrawal function
- Uses OpenZeppelin's secure contract implementations

## License 📜

MIT License

