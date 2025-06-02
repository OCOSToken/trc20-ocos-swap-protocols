const hre = require("hardhat");

async function main() {
  console.log("🚀 Deploying OCOS Redeem Protocol Contracts...\n");

  const [deployer] = await hre.ethers.getSigners();
  console.log("📡 Deployer address:", deployer.address);

  // Deploy DAO Ledger
  const OcosDaoLedger = await hre.ethers.getContractFactory("OcosDaoLedger");
  const daoLedger = await OcosDaoLedger.deploy(deployer.address);
  await daoLedger.deployed();
  console.log("📘 OcosDaoLedger deployed to:", daoLedger.address);

  // Deploy Burn Tracker
  const OcosBurnTracker = await hre.ethers.getContractFactory("OcosBurnTracker");
  const burnTracker = await OcosBurnTracker.deploy(deployer.address);
  await burnTracker.deployed();
  console.log("🔥 OcosBurnTracker deployed to:", burnTracker.address);

  // Deploy Snapshot Verifier
  const OcosSnapshotVerifier = await hre.ethers.getContractFactory("OcosSnapshotVerifier");
  const verifier = await OcosSnapshotVerifier.deploy(deployer.address);
  await verifier.deployed();
  console.log("🔍 OcosSnapshotVerifier deployed to:", verifier.address);

  // Deploy Redeem Vault
  const OcosRedeemVault = await hre.ethers.getContractFactory("OcosRedeemVault");
  const redeemVault = await OcosRedeemVault.deploy(deployer.address);
  await redeemVault.deployed();
  console.log("🏦 OcosRedeemVault deployed to:", redeemVault.address);

  // Connect vault to modules
  await redeemVault.setBurnTracker(burnTracker.address);
  console.log("✅ Vault linked to BurnTracker");

  // Summary
  console.log("\n✅ Deployment complete. Addresses:");
  console.log("   OcosRedeemVault:", redeemVault.address);
  console.log("   OcosBurnTracker:", burnTracker.address);
  console.log("   OcosSnapshotVerifier:", verifier.address);
  console.log("   OcosDaoLedger:", daoLedger.address);
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
