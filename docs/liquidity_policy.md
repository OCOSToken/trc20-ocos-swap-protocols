# OCOS TRC-20 Təkrar Ticarət və Likvidlik Siyasəti

**Sənəd Növü:** DAO Tənzimləyici Siyasət  
**Təsdiqləyən:** OCOS DAO Likvidlik və Qərar Komitəsi  
**Tətbiq Edilmə Tarixi:** 1 iyul 2025  
**Son Versiya:** v1.0

---

## 🎯 Məqsəd

Bu sənədin əsas məqsədi, 2021–2023-cü illər ərzində TRON şəbəkəsində OCOS tokeni ilə ticarət etmiş istifadəçilərə təqdim olunan **təkrar ticarət imkanı** üçün ayrılmış **25,000,000 USDT** likvidlik fondunun **istifadə, bölgü və audit qaydalarını** müəyyənləşdirməkdir.

---

## 🧾 Əhatə Dairəsi

Bu siyasət yalnız aşağıdakı kateqoriyaya aid olan istifadəçilərə şamil olunur:

- `trc20.ocos.io` platformasında 2021–2023-cü illər arası TRC-20 OCOS tokenləri ilə ticarət etmiş şəxslər
- Snapshot və Tronscan əməliyyat tarixçəsi ilə təsdiqlənmiş cüzdanlar
- `protocols/` qovluğunda müvafiq JSON faylı mövcud olan cüzdanlar

---

## 💰 Likvidlik Hovuzu Məlumatları

| Bölmə                | Məlumat                                                   |
|----------------------|------------------------------------------------------------|
| Ümumi hovuz          | 25,000,000 USDT                                            |
| İstifadə növü        | Geri ticarət (redeem), airdrop, retroaktiv satış hüququ    |
| Ayrılma metodu       | Snapshot + DAO təsdiqi əsasında                            |
| Ödəniş forması       | USDT (TRC-20)                                               |
| OCOS məzənnəsi       | 1 OCOS = 0.035 USDT (dəyişməz, sabit məzənnə)              |
| Tənzimləmə mexanizmi | Smart contract vasitəsilə avtomatik burn və transfer       |

---

## ✅ Uyğunluq Kriteriyaları

### İstifadəçi uyğun sayılırsa:
- Onun `protocols/<wallet>.json` faylı mövcuddur
- Faylda `total_eligible_ocos` və `max_usdt_claimable` dəyərləri qeyd olunub
- DAO tərəfindən snapshot təsdiqi ilə sistemə daxil edilmişdir
- Wallet TRC-20 uyğun və aktiv cüzdandır

### İstifadəçi uyğun sayılmırsa:
- Əvvəlcədən əməliyyatda iştirak etməyib
- Cüzdanı snapshot fayllarında görünmür
- Tokenlərini artıq başqa platformada satıb və DAO tərəfindən `burn_status: confirmed` olaraq işarələnib

---

## 🔄 Mübadilə Qaydaları

1. **İstifadəçi cüzdanını bağlayır**
2. **Sistem snapshot üzrə maksimum satış limitini təklif edir**
3. **İstifadəçi “Mübadilə” əmri verir**
4. **OCOS tokenləri burn edilir**
5. **USDT ödənişi istifadəçiyə göndərilir**

Bütün proseslər smart contract tərəfindən icra edilir və dəyişdirilə bilməz.

---

## 🔐 Təhlükəsizlik və Audit Qaydaları

- **Bütün əməliyyatlar blokçeyndə qeydə alınır**
- **Burn statusu və ödəniş təsdiqləri `protocols/*.json` üzərində yenilənir**
- **Snapshot faylları SHA256 hash ilə qorunur və üçüncü tərəf DAO üzvləri tərəfindən təsdiqlənir**
- **Likvidlik fondu yalnız müəyyən olunmuş cüzdanlar üçün əlçatandır**

---

## 📉 Yenidən Dağıtma Ssenariləri

Əgər istifadəçilər likvidlik fondundan tam istifadə etməzsə:
- Qalıq vəsait DAO tərəfindən yenidən bölüşdürülə bilər
- Əlavə mərhələ açılması (Phase 2) barədə qərar yalnız DAO səsverməsi ilə qəbul edilir

---

## ⚠️ Qadağalar və Hüquqi Şərtlər

- Hər bir istifadəçi yalnız **bir dəfə** mübadilə hüququ əldə edir
- OCOS tokenləri yandırıldıqdan sonra **geri qaytarılmır**
- Əməliyyatla bağlı istənilən saxta fəaliyyət DAO tərəfindən **bloklama və hüquqi tədbirlərlə nəticələnə bilər**
- DAO bu proqramı **istənilən vaxt** yenidən qiymətləndirə və dayandıra bilər

---

## 🏛️ İdarəçilik və Qərar Prosesi

Bu siyasət **OCOS DAO** tərəfindən idarə olunur. Qərarların verilməsi aşağıdakı struktura əsaslanır:

1. **DAO üzvlərinin təklifi**
2. **Snapshot yoxlaması və texniki audit**
3. **Səsvermə və ⅔ çoxluq**
4. **Likvidlik təsdiqi və icra**

---

## 📫 Əlaqə

- DAO Komitəsi: admin@ocos.io  
- Siyasət portalı: https://dao.ocos.io *(tezliklə aktiv olacaq)*  
- Əməliyyat izləmə: https://tronscan.org  
