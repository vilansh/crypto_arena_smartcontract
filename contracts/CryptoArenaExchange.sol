// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CryptoArenaExchange is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}

    // Supported token symbols mapped to contract addresses
    mapping(string => address) public tokens;

    // Exchange rate: how many toToken units per 1 fromToken
    mapping(string => mapping(string => uint256)) public exchangeRates;

    event Swapped(address indexed user, string fromToken, string toToken, uint256 amountIn, uint256 amountOut);

    // Register a token
    function registerToken(string memory symbol, address tokenAddress) external onlyOwner {
        tokens[symbol] = tokenAddress;
    }

    // Set exchange rate manually (for now)
    function setRate(string memory fromToken, string memory toToken, uint256 rate) external onlyOwner {
        exchangeRates[fromToken][toToken] = rate;
    }

    // Swap tokens
    function swap(string memory fromToken, string memory toToken, uint256 amountIn) external {
        require(tokens[fromToken] != address(0), "Invalid fromToken");
        require(tokens[toToken] != address(0), "Invalid toToken");
        require(exchangeRates[fromToken][toToken] > 0, "Rate not set");

        address from = tokens[fromToken];
        address to = tokens[toToken];

        // Transfer from user to contract
        require(IERC20(from).transferFrom(msg.sender, address(this), amountIn), "TransferFrom failed");

        uint256 amountOut = (amountIn * exchangeRates[fromToken][toToken]) / 1e18;

        // Transfer swapped token to user
        require(IERC20(to).transfer(msg.sender, amountOut), "Transfer to user failed");

        emit Swapped(msg.sender, fromToken, toToken, amountIn, amountOut);
    }

    // Owner can withdraw tokens in emergency
    function emergencyWithdraw(address token, uint256 amount) external onlyOwner {
        IERC20(token).transfer(msg.sender, amount);
    }
}
