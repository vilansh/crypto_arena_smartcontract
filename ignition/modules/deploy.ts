import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CryptoArenaModule = buildModule("CryptoArenaExchangeV2", (m) => {
  const owner = m.getAccount(0);
  const exchange = m.contract("CryptoArenaExchange", [owner]);

  return { exchange };
});

export default CryptoArenaModule;
