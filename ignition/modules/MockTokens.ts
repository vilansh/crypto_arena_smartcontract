import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MockTokensModule = buildModule("MockTokensModule", (m) => {
  const owner = m.getAccount(0);

  const btc = m.contract("MockToken", ["Mock Bitcoin", "BTC", owner], { id: "MockTokenBTC" });
  const eth = m.contract("MockToken", ["Mock Ether", "mETH", owner], { id: "MockTokenETH" });
  const doge = m.contract("MockToken", ["Mock Dogecoin", "DOGE", owner], { id: "MockTokenDOGE" });
  const shib = m.contract("MockToken", ["Mock Shiba", "SHIB", owner], { id: "MockTokenSHIB" });

  return { btc, eth, doge, shib };
});

export default MockTokensModule;