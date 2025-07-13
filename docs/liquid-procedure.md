# OCOS TRC‑20 → USDT Likvid Dəyişmə Proseduru
> DAO tərəfindən idarə olunan protokol | Snapshot yoxlamalı | On-chain token burn

---

## 🔹 Məqsəd
Bu sənəd 2021–2023-cü illərdə TRON şəbəkəsində istifadə edilmiş TRC‑20 OCOS tokenlərinin USDT-yə dəyişdirilməsi üçün yaradılmış **$25,000,000 USDT-lik likvidlik fondunun** istifadə qaydasını izah edir.

---

## 🧾 Kimlər iştirak edə bilər?
- Cüzdan adresiniz `snapshots/*.csv` fayllarında mövcud olmalıdır.
- Tokenlərin yerləşdiyi cüzdanın şəxsi açarı sizdə olmalıdır.
- Exchange və ya bridge-lərdə saxlanan tokenlər uyğun deyil.
- Hər istifadəçi yalnız **bir dəfə** dəyişmə hüququna malikdir.

---

## 🔁 Dəyişmə Şərtləri
| Parametr             | Dəyər                              |
|----------------------|-------------------------------------|
| Token Tipi           | TRC‑20 OCOS                         |
| Dəyişmə Kursu        | 1 OCOS = 0.035 USDT                 |
| Ümumi Fond           | 25,000,000 USDT (DAO kilidli)       |
| Minimum Limit        | 100 OCOS                            |
| Maksimum Limit       | Snapshot faylında göstərilən qədər  |
| Dəyişən Tokenlər     | On-chain olaraq **yanır** (burn)    |

---

## 🛠️ On-Chain Dəyişmə Prosesi
1. **Cüzdanı qoşun**  
   TronLink və ya uyğun TRON cüzdanınızı ön interfeysə (`frontend/index.html`) bağlayın.
2. **Snapshot Yoxlanışı**  
   Cüzdan adresiniz `protocols/*.json` fayllarındakı təsdiqlə yoxlanılır.
3. **Token Təsdiqi (Approve)**  
   OCOS tokenlərini dəyişmək üçün smart kontrakta təsdiq verin.
4. **Dəyişmə Əməliyyatı**  
   `swap(uint256 amount)` funksiyasını çağırın:
   - Cüzdan uyğunluğunu yoxlayır
   - Məbləğ snapshot limitini keçməməlidir
   - OCOS tokenləri on-chain olaraq **burn** edilir
   - Müvafiq USDT miqdarı cüzdanınıza köçürülür
5. **Əməliyyat Nəticəsi**  
   Burn və swap əməliyyatları `burn-ledger/*.csv` faylında qeyd olunur.

---

## 🔒 Sadələşdirilmiş Smart Kontrakt Loqikası
```solidity
function swap(uint256 amount) public {
    require(isEligible[msg.sender], "Uyğun deyilsiniz");
    require(!claimed[msg.sender], "Artıq dəyişmisiniz");
    require(OCOS.transferFrom(msg.sender, address(this), amount));

    uint256 usdtAmount = amount * 35 / 1000;
    require(USDT.transfer(msg.sender, usdtAmount));

    OCOS.burn(amount);
    claimed[msg.sender] = true;
}
