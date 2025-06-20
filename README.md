
# 🏛️ CryptoArena Smart Contracts

**CryptoArena** is a decentralized testnet-based crypto exchange simulation platform. It allows users to swap mock cryptocurrencies like BTC, ETH, DOGE, and SHIB using smart contracts deployed on the Sepolia testnet. Built using **Hardhat**, **OpenZeppelin**, and **Ignition**, this project is the smart contract foundation for the full-stack dApp.

---

## 🚀 Contracts Overview

### 1. `CryptoArenaExchange.sol`

A flexible on-chain exchange smart contract that:

- Supports registration of multiple ERC-20 tokens
- Allows the owner to define and update exchange rates
- Enables users to swap tokens using these fixed rates
- Emits events on successful swaps

### 2. `MockToken.sol`

A minimal ERC-20 mock token contract used to simulate real tokens such as:

- `Mock BTC` (`BTC`)
- `Mock Ether` (`mETH`)
- `Mock Dogecoin` (`DOGE`)
- `Mock Shiba Inu` (`SHIB`)

Each token includes a `faucet()` function for minting test tokens freely.

---

## 📦 Tech Stack

- [Hardhat](https://hardhat.org/) — Ethereum development environment
- [Hardhat Ignition](https://hardhat.org/hardhat-runner/plugins/hardhat-ignition) — Declarative deployment system
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) — Secure ERC-20 implementation
- TypeScript for deployment scripts

---

## 🧪 How to Use

### 🔧 Install Dependencies

```bash
npm install
````

### ⚙️ Compile Contracts

```bash
npx hardhat compile
```

---

## 🚀 Deploy to Sepolia with Hardhat Ignition

Make sure you have a `.env` file configured:

```
PRIVATE_KEY=your_sepolia_wallet_private_key
SEPOLIA_URL=https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID
```

### Deploy Mock Tokens

```bash
npx hardhat ignition deploy ./ignition/modules/MockTokens.ts --network sepolia
```

### Deploy Exchange Contract

```bash
npx hardhat ignition deploy ./ignition/modules/Exchange.ts --network sepolia
```

---

## 📬 Deployed Contracts (Sepolia)

| Contract              | Address                                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `CryptoArenaExchange` | [`0x212F9E219CF82d1aE32A33DEac382Bc12EA6607D`](https://sepolia.etherscan.io/address/0x212F9E219CF82d1aE32A33DEac382Bc12EA6607D) |
| `MockTokenBTC`        | [`0xE7eeCAC4cfe2F73f7aA794e8bF6719D671146b85`](https://sepolia.etherscan.io/address/0xE7eeCAC4cfe2F73f7aA794e8bF6719D671146b85) |
| `MockTokenDOGE`       | [`0xe88fba437A74D5690Fb89775b86e49103Df7526e`](https://sepolia.etherscan.io/address/0xe88fba437A74D5690Fb89775b86e49103Df7526e) |
| `MockTokenETH` (mETH) | [`0x349eB8Bf06Aa2ce6BA4566dF869B4B4711aA9329`](https://sepolia.etherscan.io/address/0x349eB8Bf06Aa2ce6BA4566dF869B4B4711aA9329) |
| `MockTokenSHIB`       | [`0x00D34db8Cd945B28b25431ef18Bc8223C76a316c`](https://sepolia.etherscan.io/address/0x00D34db8Cd945B28b25431ef18Bc8223C76a316c) |

---

## 📘 Sample Tasks

```bash
npx hardhat help                       # View all tasks
npx hardhat test                      # Run tests (add yours in /test)
REPORT_GAS=true npx hardhat test     # See gas usage
npx hardhat node                     # Start a local Hardhat chain
```

---

## 🧠 Functionality Summary

* 🔗 Fully on-chain swap engine using testnet tokens
* 💧 Faucet-enabled ERC-20 mock tokens
* ⚙️ Admin-controlled exchange rate settings
* 🛡️ Uses OpenZeppelin's secure smart contract templates

---

## 🛠 TODO / Future Enhancements

* [ ] Integrate Chainlink oracles (optional realism)
* [ ] Liquidity pools and dynamic rates
* [ ] Automated token listing via factory
* [ ] Rate sync with CoinGecko via frontend
* [ ] Trade history storage with MongoDB backend

---

## 🤝 License

MIT License © 2025 Vilansh — CryptoArena

```
