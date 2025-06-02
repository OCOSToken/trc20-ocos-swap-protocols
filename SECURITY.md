# 🔐 Security Policy – OCOS TRC-20 Swap Protocols

Thank you for your interest in helping secure the OCOS TRC-20 Redemption Protocol. Security is a top priority for our team and DAO members. This document outlines the proper procedures for reporting vulnerabilities and the way the OCOS project handles security disclosures.

---

## 🛡️ Supported Components
This policy applies to the following components:

- Smart contracts within the `/contracts/` directory
- Frontend interfaces (`/frontend/`)
- Protocol generation scripts (`/scripts/`)
- Snapshot & protocol data in `/protocols/`
- Any deploy logic and DAO governance handlers

---

## 📬 Reporting a Vulnerability
If you discover a potential security issue or exploit, please report it **privately and responsibly**.

### 📧 Contact
- **Email:** [security@ocos.io](mailto:security@ocos.io)
- **PGP Key:** Available upon request
- **Response Time:** Within 72 hours

Do **not** open a GitHub issue or public discussion to report security problems.

---

## 🔒 Disclosure Guidelines
- Clearly describe the vulnerability and potential risk.
- Include reproduction steps, relevant code locations, and if possible, test cases.
- If the exploit has been observed in the wild, state so immediately.

Upon validation, the OCOS security team will:
1. Acknowledge receipt of your report
2. Investigate and verify the issue internally
3. Engage DAO Core Members for remediation
4. Issue an official advisory, patch release, and changelog update

---

## ✅ Eligibility for Recognition

We offer on-chain recognition (e.g. snapshot-based badge, DAO note, or bounty) to security researchers who:
- Report original and unreleased vulnerabilities
- Follow responsible disclosure practices
- Do not attempt unauthorized testing or on-chain exploitation

DAO bug bounty program will be launched in **v1.1.0** under `dao.ocos.io`.

---

## 🔄 Security Practices

- All smart contracts are manually reviewed and monitored
- Snapshot hashes and burn logs are SHA256-authenticated
- One-time redemption enforcement reduces fraud vectors
- Secrets and API keys are automatically scanned via GitHub Security
- Code scanning and auditing workflows are being integrated

---

## 🌐 External Audits

OCOS is open to third-party audits and welcomes peer review. If you are an audit firm or contributor interested in collaborating, please reach out to `audit@ocos.io`.

---

## 📄 Revision History

| Date       | Version | Notes                      |
|------------|---------|----------------------------|
| 2025-06-02 | v1.0.0  | Initial security policy published |

---

> “Security is not a final milestone — it’s a continuous DAO-driven commitment.”
```
}
