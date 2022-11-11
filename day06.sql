select*from sirketler  -- a küme
select*from siparisler -- b küme

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler left join siparisler
on sirketler.sirket_id = siparisler.sirket_id -- a nın tamamı

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler right join siparisler
on sirketler.sirket_id = siparisler.sirket_id -- b nin tmamı

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler full join siparisler
on sirketler.sirket_id = siparisler.sirket_id 

--SELF JOIN
CREATE TABLE personel8  
(
id int,
isim varchar(20),  
title varchar(60),  
yonetici_id int
);
INSERT INTO personel8 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel8 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel8 VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel8 VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel8
--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
-- burada hayali bir tablo gibi p1 kullanıyoruz
SELECT p1.isim as personel_isim,p2.isim as yonetici_isim
FROM personel8 p1 INNER JOIN personel8 p2
ON p1.yonetici_id = p2.id

-- LIKE CONDITION "wildcars'a (özel sembol) izin verir.
--ex: '%A' A ile başlayan herhangi bir ifade. LİKE A%"

CREATE TABLE musteriler2  
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1006, 'Alper', 45000);

--SORU  : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler2 WHERE isim LIKE 'A%';

-- Eğer büyük küçük harf farketmeksizin sorgulama yapmak isterseniz -ilike- kullanabilirsiniz

SELECT * FROM musteriler2 WHERE isim ILIKE 'a%';

-- Like kullanımı 2. yol ~(opt + ü)

-- Like kullanımı yerine ~~ bu sembolleri de kullanabilirsiniz
SELECT * FROM musteriler2 WHERE isim ~~ 'A%';

-- Like kullanımında sembol kullanıyorsak ve büyük küçük harf gözetmeksizin sorgu yapmak istersek (ilike) ~~* sembollerini kullanabiliriz
SELECT * FROM musteriler2 WHERE isim ~~* 'a%';

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler2 WHERE isim ILIKE '%e'

--SORU : Isminin icinde er olan musterilerin isim'lerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler2 WHERE isim ~~* '%er%';

--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
-- _ ile tek bir karakter için herhangi bir harf geliyor
SELECT * FROM musteriler2 WHERE isim like '_atma'; 
--SORU : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler2 WHERE isim like '_a%'

--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler2 WHERE isim ~~ '__s%'

--SORU : Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler2 WHERE isim like '__s_'

--SORU : Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler2 WHERE isim ilike 'F___%'

--SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler2 WHERE isim like '_a_m%'

--REGEXP_LIKE (~) 

CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL,  
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1000, 'hot', 1); 
INSERT INTO kelimeler VALUES (1009, 'hot', 2); 
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

select*from kelimeler

--SORU: Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ 'h[ai]t'

--SORU: Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ 'h[a-k]t' 

--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '[mi]'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '^[as]'
--Regexp-Like kullanımında başlangıç belirtmek için ^ sembol kullanılır

--SORU  : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '[mf]$'
--Regexp-Like kullanımında sonuç belirtmek için $ sembol kullanılır

--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime NOT LIKE 'h%'
SELECT * FROM kelimeler WHERE kelime !~~ 'h%'

--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~~ '%a%'

--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~~ '_de%'

--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~ '[_eio]'

--UPPER(Belirtilen field'daki verileri büyük harf yazar) 
--LOWER(Belirtilen field'daki verileri küçük harf yazar)
--INITCAP(Belirtilen field'daki verilerin ilk harfini büyük yazar)
SELECT UPPER(kelime) as kelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler

--DISTINCT KULLANIMI

CREATE TABLE musteri_urun2 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun2 VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun2 VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun2 VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun2 VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun2 VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun2 VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun2 VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun2 VALUES (20, 'Elif', 'Elma');

SELECT * FROM musteri_urun2

-- Urun isimlerini distinct komutuyla gruplayalım
select DISTINCT urun_isim from musteri_urun2

-- Musteri isimlerini gruplayınız
select distinct musteri_isim from musteri_urun2

-- Tabloda kac farklı çeşit meyve vardır "count ile saymış olduk"
SELECT COUNT(distinct(urun_isim)) as meyve_sayisi from musteri_urun2