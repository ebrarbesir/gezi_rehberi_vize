#  Proje Adı

> ExploreApp(Seyahat Rehberi Uygulaması-İstanbul)
 
---

##  Proje Amacı

Bu proje, İstanbul'u keşfetmek isteyen kullanıcılar için kapsamlı ve kullanıcı dostu bir mobil rehber uygulaması sunmayı amaçlamaktadır.
Uygulama; müzeler, tarihi yerler, doğal alanlar, eğlence mekanları ve çarşılar gibi gezilecek yerleri kategoriler halinde sunar.
Ayrıca Rota Planlayıcı yardımıyla semte göre rota belirleyerek seyahat planlarını kolaylaştırır.

 
---

##  Teknik Detaylar

- *Geliştirme Ortamı:* Flutter ( 3.29.0), Dart ( 3.7.0 ), DevTools (2.42.2)
- *Kullanılan Paketler / Kütüphaneler:*
    - provider: ^6.0.0
    - http: ^1.3.0
    - shared_preferences: ^2.2.2
    -  google_fonts: ^6.2.1
    - Kullanılan NDK sürümü: 27.0.12077973
- *Veri Kaynağı:*
    - (json dosyası(assets/data.json)(kendimiz oluşturduk), shared_preferences(shared_preferences: ^2.2.2))
    - Kullanılan api: https://picsum.photos/200


---

## Öne Çıkan Özellikler

- Modern ve kullanıcı dostu arayüz
- Favorilere ekleme özelliği
- İlçelere göre filtreleme
- Kategorilere Göre Mekan Listesi:Müzeler, tarihi yerler, doğal ve manzaralı alanlar, eğlence yerleri ve çarşılar gibi kategorilerde yerler listelenir
- Kullanıcı deneyimi odaklı, sade ve şık tasarım. Arka plan görselleriyle desteklenmiş zengin arayüz.


---
##  Projedeki sayfaların görevleri ve içeriği
- Muzeler:İstanbul’daki müzelerin listelendiği sayfadır. Detay kısmına tıklayınca müzeler hakkında kısa bilgiler ve görseller gösterilir.
- Tarihi Yerler:İstanbul’daki tarihi mekanların listelendiği sayfadır. Detay kısmına tıklayınca tarihi yerler hakkında kısa bilgiler ve görseller gösterilir .
- Doğal ve Manzaralı Yerler:Doğal ve manzaralı alanların listelendiği sayfadır.Detay kısmına tıklayınca doğal ve manzaralı yerler hakkında kısa bilgiler ve görseller gösterilir .
- Çarşılar: İstanbul’un çarşılarını ve alışveriş yapılabilecek bölgeleri tanıtır.Detay kısmına tıklayınca çarşılar hakkında kısa bilgiler ve görseller gösterilir .
- Eğlence Yerleri: Eğlence merkezleri, tema parklar ve sosyal etkinlik alanlarının yer aldığı sayfadır.Detay kısmına tıklayınca eğlence yerleri hakkında kısa bilgiler ve görseller gösterilir .
- Seçenekler(Drawer):Tüm sayfalara erişim sağlayan yan menüdür.Uygulama logosu ve çıkış seçeneği içerir.
- Rota Planlayıcısı:Seçilen semte göre gezi rotası oluşturur.
- Log in: Kullanıcı adı ve şifreyle giriş yapma sayfasıdır.
- Ana Sayfa:İstanbul hakkında kısa bir bilgi veren giriş sayfası

---

---
##  Katkı Dağılımı

| Takım Üyesi          | Rolü / Katkısı                                                                           |
|----------------------|------------------------------------------------------------------------------------------|
| Ebrar Beşir          | Rota planlayıcı sayfası,json dosyası oluşturma,log in sayfası,drawer,logoyu apiden çekme |
| Feyza Rabia Marasalı | json dosyası oluşturma,log in sayfası,Gezilecek yerler sayfaları                         |
| Jahed Sayjarı        | shared_preferences,Anasayfa.Model klasörü                                                |
 --------------------------------------------------------------------------------------------------- ------------ |


 
---

##  Özgünlük ve Yaratıcılık

Bu proje, standart uygulamaların ötesine geçerek kullanıcıya kişiselleştirilmiş deneyimler sunmayı hedeflemektedir. Özgün yönleri:
- İlçelere özel öneri sistemleri
- Kullanıcının konumuna göre dinamik içerik
- Kategori bazlı gezinme (doğa, tarih, müze vb.)

---
