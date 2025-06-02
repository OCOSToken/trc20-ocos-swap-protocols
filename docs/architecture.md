# OCOS TRC-20 Təkrar Ticarət Platforması – Arxitektura Sənədi

**Sənəd növü:** Texniki memarlıq və sistem struktur izahı  
**Versiya:** 1.0  
**Tətbiq sahəsi:** OCOS Retroactive Liquidity & Burn System  
**Təsdiq:** OCOS DAO Komitəsi (on-chain qərar #0003)

---

## 🎯 Məqsəd

Bu sənəd OCOS-un 2021–2023 TRC-20 istifadəçiləri üçün yaradılmış təkrar ticarət sisteminin **mərhələli texniki memarlığını** və **on-chain fəaliyyət axınını** izah edir. Sistem $25M USDT likvidliklə dəstəklənir və DAO tərəfindən idarə olunur.

---

## 🧩 Əsas Komponentlər

| Komponent | Təyinat |
|----------|---------|
| **User Wallet** | Tron şəbəkəsindəki real istifadəçi cüzdanı |
| **Swap UI** | `trc20.ocos.io` interfeysi üzərindən istifadəçi ilə qarşılıqlı əlaqə |
| **Smart Contract** | Mübadilə, burn və USDT ödənişlərini icra edən Solidity əsaslı müqavilə |
| **USDT Vault** | Təkrar ticarət üçün ayrılmış 25M USDT-lik əsas likvidlik hovuzu |
| **Burn Engine** | Mübadilə edilən OCOS tokenlərini daimi olaraq yandıran modul |
| **Log & Snapshot Hash** | Əməliyyatların audit üçün hash ilə qeyd olunduğu log sistem |
| **DAO Ledger** | On-chain DAO-nun qərarlarını və nəticələri saxlayan sistem |

---

## 🔁 Əməliyyat Axını

```plaintext
[User Wallet] 
   ➝  [Swap UI]
        ➝  [Smart Contract]
              ➝  [USDT Transfer]
                    ➝ [DAO Ledger]
              ➝  [Log & Snapshot Hash]
                    ➝ [Burn]

🛠 Texnologiyalar
Texnologiya	İstifadə sahəsi
Solidity v0.8.20+	Smart contract yazılması
TronLink / TronWeb	Cüzdan bağlantısı və imzalama
Node.js	Snapshot JSON protokollarının avtomatlaşdırılması
CSV Parsing (csv-parser)	Əvvəlki əməliyyatların daxil edilməsi və çevrilməsi
SHA256 Hashing	Snapshotların dəyişməzliyini təmin etmək
TailwindCSS	UI dizayn və responsive görsəllik üçün
IPFS (optional)	Snapshot sübutlarının paylanmış qeydiyyatı üçün

🧮 Snapshot & Protokol Mexanizmi
Əvvəlki illərə aid CSV snapshot faylları (snapshots/) içərisində saxlanılır

Bu fayllar scripts/generateProtocol.js vasitəsilə JSON formatlı protocols/*.json fayllarına çevrilir

Hər protokolda:

Wallet ünvanı

Trade həcmi və məzənnə

USDT qarşılığı

Əməliyyat tarixi və Tronscan tx hash

Burn status

SHA256 ilə qorunan snapshot hash


🔐 Təhlükəsizlik və Audit Dizaynı
Immutable Hash Logs: Hər əməliyyat və snapshot üçün sha256: hash qeyd olunur

Non-Custodial: İstifadəçilərin tokenləri yalnız öz cüzdanlarından daxil olur

On-Chain Finalization: Bütün əməliyyatlar on-chain müqavilə ilə təsdiqlənir və DAO Ledger-ə yazılır

Burn Mechanism: OCOS tokenləri mübadilə zamanı yandırılır — bu, təklifin azaldılması və şəffaflığı təmin edir

Single-use Protocols: Hər cüzdan üçün yalnız bir dəfə mübadilə hüququ olur

🗳 DAO ilə İnteqrasiya
DAO qərarları docs/liquidity_policy.md və dao_governance.md sənədləri ilə müəyyən olunur

İstifadəçi uyğunluğu DAO tərəfindən səsvermə və snapshot-a əsasən təsdiqlənir

DAO Ledger modulu hər əməliyyatı və nəticəni tarixçəyə yazır

📌 Gələcək Versiyalar üçün Planlar (v2+)
Ethereum və BNB Chain üzrə eyni sistemin multi-chain versiyası

DAO voting sisteminin snapshot.org ilə birləşdirilməsi

Tətbiq mobil interfeys (PWA) üzərindən də açıq olacaq

Chainlink oracle ilə real vaxt qiymətləndirmə (dinamik OCOS/USDT məzənnəsi)

📫 Əlaqə
Layihə rəhbərliyi: support@ocos.io

DAO təklifləri və governance: dao.ocos.io (tezliklə)

Kod və texniki sənədlər: https://github.com/OCOSToken
