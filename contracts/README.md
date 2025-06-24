# 📜 contracts — OCOS TRC20 Swap Protokolları üçün Smart-Kontaktlar

Bu qovluq, OCOS TRC20 tokenlərinin 2021–2023 dövründə alınmış ünvanlar üzrə USDT qarşılığında geri satılması və on-chain şəffaflığın təmin edilməsi üçün hazırlanmış bütün əsas smart-kontaktları və onlarla əlaqəli resursları ehtiva edir.

---

## 🏗 Struktura Baxış

- **RedeemVault.sol** — İstifadəçilərin OCOS (TRC20) tokenlərini USDT-yə sabit kursla dəyişdirə bilməsi üçün əsas vault/protokol kontraktı.
- **BurnLedger.sol** — Geri alınan tokenlərin on-chain yandırılmasını və bütün burn əməliyyatlarının izlenməsini təmin edən əlavə audit modulu.
- **AccessGuard.sol** — DAO idarəçiliyini, admin və operator hüquqlarını, smart-kontakt üzərindəki bütün dəyişikliklərin auditini təmin edən modullar.
- **Interfaces/** — Bütün xarici TRC20 və USDT interfeisləri üçün standart tip tərifləri.
- **Mocks/** — Test və simulasiya məqsədi ilə istifadə olunan mock kontraktları (yalnız audit/prod deyil, test üçün).
- **Libraries/** — Təhlükəsizlik, matematik və digər daxili funksiyaları optimallaşdıran kitabxanalar.

---

## 🎯 Əsas Funksionallıqlar

1. **Redemption (Geri Satış)**
   - İstifadəçi, snapshot-a daxil olmuş cüzdanından kontrakta OCOS token göndərir.
   - Kontrakt avtomatik olaraq USDT balansını yoxlayır və sabit kursla USDT ödəyir.
   - Geri alınan OCOS-lar anında burn edilir və burn ledger-də qeydə alınır.

2. **Şəffaflıq və Audit**
   - Bütün redemption və burn əməliyyatları chain üzərində qeydə alınır və DAO tərəfindən yoxlana bilər.
   - Operator və admin hüquqları, DAO səsverməsi ilə dəyişdirilə bilər.
   - Kod, “security-first” prinsipi ilə yazılıb və “openzeppelin” kitabxanalarından istifadə olunur.

3. **Access Control**
   - Səlahiyyətlilərin dəyişdirilməsi, yeni funksiyaların əlavə olunması yalnız DAO qərarı ilə mümkündür.
   - Multi-sig və timelock mexanizmləri dəstəklənir.

---

## 👨‍💻 İstifadə və Deploy Qaydaları

1. **Deploy prosesi**
   - `RedeemVault.sol` və əlaqəli kontraktlar yalnız DAO tərəfindən təsdiq edilmiş TRON mainnet adreslərinə deploy edilir.
   - Hər deployment ayrıca `deployment.md` və ya audit report-da sənədləşdirilir.

2. **Testlər və Təhlükəsizlik**
   - Mocks və libraries qovluqlarındakı fayllardan istifadə etməklə tam sınaq və fuzz-testing keçirilib.
   - Bütün core kontraktlar CertiK, Hacken və DAO community tərəfindən audit edilib/ediləcək.

3. **Audit və Təhlil**
   - Koda hər dəyişiklik “Pull Request” və DAO təsdiqi ilə əlavə edilir.
   - Kodsuz dəyişikliklərə (məs: proxy, storage) yalnız DAO təsdiqi ilə icazə verilir.

---

## 📚 Əlaqəli Sənədlər və Resurslar

- [../docs/REDEEM_POLICY_AZ.md](../docs/REDEEM_POLICY_AZ.md) — Geri Alış və Likvidlik Siyasəti
- [../snapshots/](../snapshots/) — 2021–2023 ünvan snapshot-ları (yalnız oxumaq üçün)
- [../protocols/](../protocols/) — Ünvan-protokol mapping faylları
- [../frontend/](../frontend/) — İstifadəçi interfeysi

---

## 📜 Lisenziya

Bütün smart-kontaktlar MIT lisenziyası ilə yayılır və yalnız DAO tərəfindən idarə olunan əməliyyatlarda istifadə olunmalıdır.

---

## ✉️ Suallar və Əlaqə

Əgər kodla bağlı hər hansı sual, audit və ya bug reportunuz varsa, GitHub Issues üzərindən və ya [OCOS DAO Community Telegram](https://t.me/ocosdao) kanalı vasitəsilə bizə müraciət edə bilərsiniz.

---

> **Qeyd:** Bütün kodlar və mexanizmlər, yalnız açıq, şəffaf və DAO idarəçiliyi prinsipi ilə işləyir. Əlavə təhlükəsizlik və sınaq nəticələri üçün audit reportlarını və changelog-ları oxumağı unutmayın.
