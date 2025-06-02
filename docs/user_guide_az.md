# İSTİFADƏÇİ RƏHBƏRİ – OCOS TRC-20 TƏKRAR TİCARƏT VƏ LİKVDİLİK PROTOKOLU

Bu sənəd, 2021–2023-cü illərdə OCOS TRC-20 tokenlərini əldə etmiş və TRON şəbəkəsində `tron platforması (TQ4VkSbKXB3YUDoD6PZSYmpeuFj6QzCf39) smart kontraktı` üzərindən ticarət etmiş istifadəçilər üçün nəzərdə tutulmuşdur. Yenidən ticarət funksiyası yalnız uyğun şəxslərə təqdim olunur və $25,000,000 USDT likvidlik hovuzu ilə dəstəklənir.

---

## 📌 Ümumi Məlumat

- Layihənin məqsədi: Əvvəllər OCOS TRC-20 tokenlərinə sahib olmuş istifadəçilərə həmin tokenləri **təkrar satmaq imkanı** vermək.
- Məzənnə: **1 OCOS = 0.035 USDT** *(sabit və dəyişməz)*
- Əməliyyat nəticəsində alınan OCOS tokenləri **yandırılır (burn edilir)**.
- Bütün əməliyyatlar **blokçeyn üzərində təsdiqlənir və geriyə qaytarılmır**.

---

## 🧾 Kimlər uyğun sayılır?

Aşağıdakı şərtləri qarşılayan istifadəçilər uyğun sayılır:

1. 2021–2023-cü illərdə `trc20.ocos.io` və ya TRON platformasında OCOS tokenləri ilə əməliyyat aparıblar
2. Snapshot fayllarına daxil olunmuşdurlar
3. Cüzdan ünvanları `protocols/` qovluğunda yerləşən JSON fayllarında mövcuddur
4. TRC-20 OCOS tokenlərini şəxsi və aktiv cüzdanda saxlayırlar (məs: TronLink)

---

## 🪙 Mübadilə Qaydası

1. **Cüzdanı qoşun:** Mübadilə platformasına daxil olaraq TronLink və ya digər TRON uyğun cüzdanınızı bağlayın.
2. **Token miqdarını daxil edin:** Sistemdə sizə uyğunlaşdırılmış maksimum OCOS miqdarı avtomatik göstəriləcək.
3. **USDT alın:** Mübadilə düyməsinə klik etdikdən sonra, sistem sizə uyğun miqdarda USDT göndərəcək.
4. **OCOS tokenləri yandırılacaq:** Mübadilədən sonra istifadə etdiyiniz OCOS-lar smart contract tərəfindən burn edilir.

> ⚠️ Mübadilə prosesi tamamlandıqdan sonra tokenlər geri qaytarıla bilməz.

---

## 🔍 Protokol Necə Yoxlanılır?

Sizin cüzdan ünvanınıza uyğun mübadilə tarixinizi və hüquqlarınızı yoxlamaq üçün:

1. Bu repodakı `protocols/` qovluğuna daxil olun
2. Cüzdan ünvanınıza uyğun `.json` faylını tapın
3. Fayl içindəki aşağıdakı məlumatları yoxlayın:
   - `wallet`: sizin TRX ünvanınız
   - `total_eligible_ocos`: sizin üçün təsdiqlənmiş OCOS miqdarı
   - `max_usdt_claimable`: əldə edə biləcəyiniz maksimum USDT məbləği
   - `burn_status`: "pending" və ya "confirmed"

---

## 📊 Məsələn:

```json
{
  "wallet": "TVa39qJwBfP6AvTzU9oHRfVEnU2p1D5p3g",
  "total_eligible_ocos": 8900,
  "max_usdt_claimable": 311.5,
  "tx_log": [
    {
      "tx_hash": "0xabc123...",
      "date": "2022-03-12T13:20:10Z",
      "amount_ocos": 8900,
      "amount_usdt": 311.5
    }
  ],
  "snapshot_hash": "sha256:a81bcd9e2d7f...",
  "burn_status": "pending"
}

🔐 Təhlükəsizlik və Nəzarət
Token yandırılmaları geri qaytarılmır

Hər bir əməliyyat blokçeyn üzərində şəffaf şəkildə həyata keçirilir

Mübadilə hüququ yalnız bir dəfə həyata keçirilə bilər
🧠 Tez-Tez Verilən Suallar (FAQ)
🔹 Sual: Cüzdanım protocols/ faylında yoxdur. Nə etməliyəm?
Cavab: Əgər əməliyyat etdiyinizə əminsinizsə, admin@ocos.io ünvanına müraciət edin və Tronscan əməliyyat ID-lərinizi təqdim edin.

🔹 Sual: OCOS-larımı bu sistemdə dəyişsəm, geri ala bilərəmmi?
Cavab: Xeyr. Mübadilə nəticəsində alınan tokenlər yandırılır və əməliyyat dəyişdirilə bilməz.

🔹 Sual: Mənim üçün maksimum nə qədər USDT ayrılıb?
Cavab: Bu, snapshot-da qeyd olunmuş tarixçəyə və JSON protokol faylında max_usdt_claimable sahəsinə görə müəyyən edilir.
📞 Əlaqə və Texniki Dəstək
📧 Email: support@ocos.io

🌐 Veb sayt: https://trc20.ocos.io

📋 DAO qərarları üçün: [dao.ocos.io (tezliklə)]

🧾 Tronscan əməliyyat yoxlama: https://tronscan.org/
