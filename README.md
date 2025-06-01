# OCOS TRC-20 Retroactive Trade & Liquidity Protocols (2021–2023)

This repository documents and facilitates the reactivation of historical OCOS TRC-20 trading for verified users from 2021–2023, backed by a $25,000,000 liquidity vault.

---

## 🎯 Purpose

In response to growing DAO governance and user claims, OCOS has launched a dedicated liquidity initiative to allow previous TRON-based OCOS holders (2021–2023) to **sell their TRC-20 tokens** through a secure, verified re-trade system.

### ✅ What’s new?
- A total of **$25,000,000 USDT liquidity** has been deployed to support historical sellers.
- Eligible users can access the portal to **swap old OCOS TRC-20 tokens to USDT at a fair fixed rate**.
- All operations are secured by on-chain verification and irreversible burn mechanics.

---

## 🧾 Who Is Eligible?

Only users who:
- Participated in **OCOS token sales or OTC swaps** via `trc20.ocos.io` from 2021 to 2023
- Are listed under the `/protocols/*.json` file with verified snapshots and hashproofs
- Hold TRC-20 OCOS tokens in a **non-custodial wallet**

If your address is listed, you are entitled to convert your old OCOS tokens into USDT under this liquidity window.

---

## 💰 Liquidity Structure

- **Pool Size:** 25,000,000 USDT
- **Redemption Rate:** 1 OCOS = 0.035 USDT *(fixed)*
- **Max Allocation Per Wallet:** Based on verified snapshot volume
- **Token Mechanism:** OCOS tokens are burned immediately post-redemption

---

## 🔐 Verification & Transparency

Each redemption is:
- Matched with historical transaction hashes
- Tracked through wallet-level protocol files (JSON)
- Logged on-chain and recorded in a public burn ledger

> This ensures full transparency and prevents double redemption.

---

## 🔧 Repository Structure

```bash
trc20-ocos-swap-protocols/
├── README.md
├── LICENSE
├── frontend/
│   └── index.html            # Swap interface
├── protocols/
│   └── <wallet>.json         # Verified user-level trade files
├── snapshots/
│   ├── snapshot_2021.csv
│   ├── snapshot_2022.csv
│   └── snapshot_2023.csv
├── docs/
│   ├── user_guide_az.md
│   └── liquidity_policy.md
├── scripts/
│   └── generateProtocol.js
