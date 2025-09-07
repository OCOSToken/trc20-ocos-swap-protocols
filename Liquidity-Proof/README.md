# 🟢 OCOS TRC-20 Swap Protocols

The **OCOS TRC-20 Swap Protocols** project is built on the **TRON blockchain**, containing liquidity pools, swap mechanisms, and DAO governance logic. This repository includes both the **smart contracts** and **frontend integration** needed for deployment.

### Core Objectives
- **Liquidity Provision:** 25,000,000 USDT (TRC-20) has already been provisioned.  
- **Transparency:** All on-chain proofs are published openly.  
- **Integration:** Built for compatibility with SunSwap, JustMoney, and other DEX platforms.  
- **DAO Support:** Modular approach allowing governance, voting, and participation.  

---

## 📂 Repository Structure

```
contracts/        → Smart contracts (OcosBurnTracker, OcosDaoLedger, etc.)
scripts/          → Deployment and utility scripts
frontend/         → Web dashboard and integration modules
docs/             → Documentation, diagrams, user guides
protocols/        → JSON snapshots and holder data
interfaces/       → ERC-20 and protocol interfaces
```

Additional files:  
- `README.md` → Project introduction and instructions  
- `SECURITY.md` → Security policy  
- `LICENSE` → MIT license  
- `.github/workflows/ci.yml` → GitHub Actions minimal CI workflow  

---

## 💧 Liquidity Proof (25,000,000 USDT – TRC-20)

- **Treasury (Owner) Address (TRON):**  
  `']TUqpTZv2BJvTKCYjW7Tu41mdQvLDqMqh6N`

- **Liquidity / Transfer Transactions (TRONSCAN):**  
  1. [`acc18cad279ececf07240a775d97864bf4535d9f080bf36a88636d55ed37aca4`](https://tronscan.org/#/transaction/acc18cad279ececf07240a775d97864bf4535d9f080bf36a88636d55ed37aca4)  
  2. [`da6c9c3cea8a968450ecb7bb1c52c0ec5aa049ad465e1a8a996dadcb4af61c9d`](https://tronscan.org/#/transaction/da6c9c3cea8a968450ecb7bb1c52c0ec5aa049ad465e1a8a996dadcb4af61c9d)  
  3. [`fafeb76871af040a72845ac31607d0dac3e252b5e39293a65628e7c2071f0494`](https://tronscan.org/#/transaction/fafeb76871af040a72845ac31607d0dac3e252b5e39293a65628e7c2071f0494)  

- **Total Liquidity Provisioned:** `25,000,000 USDT (TRC-20)`  

- **DEX Pair (SunSwap / JustMoney):**  
  *(Bu yaxınlarda)*  

---

## 🚀 Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/OCOSToken/ocos-trc20-swap-protocols.git
cd ocos-trc20-swap-protocols
```

### 2. Install dependencies
For Node.js projects:
```bash
npm install
```

For Python environments:
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### 3. Deploy and run
- Deploy contracts to TRON with `scripts/deployContracts.js`.  
- Start frontend with `npm run dev` inside `frontend/`.  

---

## 🔒 Security

- Never commit **private keys** or **mnemonics**.  
- `.env` files are included in `.gitignore`.  
- See `SECURITY.md` for detailed security recommendations.  

---

## 📜 License

This project is released under the **MIT License**. See [`LICENSE`](LICENSE) for details.  

---

## 📞 Contact

- **Project:** OCOS  
- **Owner:** RHorning  
- **Website:** [https://ocos.io](https://ocos.io)  
