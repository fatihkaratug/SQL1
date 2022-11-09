CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--insanalr tablosundaki dataları adrese göre sıralayınız.


select*from insanlar2 
ORDER BY adres;

--ismi mine olanşarı SSN sıralı listeleyin

select*from insanlar2
where isim='Mine'
order by ssn;
--Bulut olanları isim sıralı listele

select*from insanlar2
where soyisim='Bulut'
order by isim;


select*from insanlar2
where soyisim='Bulut'
order by 4; --sıralamada field kullanabilirz

-- tüm kayıtları SSN no büyükten küçüğe

--tersten sıralama
select*from insanlar2
order by ssn desc; --descending: tersten 


select*from insanlar2
order by ssn asc;--ascending :doğal sıralama

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, 
--Soyisimler ters sirali olarak listeleyin

select*from insanlar2
order by ssn asc,soyisim desc;

-- İsim ve soyisim değerlerini isim kelime uzunluklarına göre sıralayınız
select isim, soyisim from insanlar2
order by length(isim)

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak
--her bir sütun değerini uzunluğuna göre sıralayınız
select concat(isim,'',soyisim) as isim_soyisim from insanlar2
order by length(isim)+length(soyisim)

--ikinci yol
select isim||''||soyisim as isim_soyisim from insanlar2
order by length(isim||soyisim)

-----GROUP BY CLAUSE----
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT*FROM manav
--1) Isme gore alinan toplam urunleri bulun
select isim, sum(urun_miktar) AS urun_miktari  from manav
group by isim
order by urun_miktari DESC

--2)ürün ismine göre ürün alan toplam kişi sayısı
select urun_adi, count (isim) from manav
group by urun_adi

--3)alınan kilo miktarına göre müşteri sayısı

select urun_miktar, count(isim) as alınan_ürünler_kisi_sayısı from manav
group by urun_miktar 
 
CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50),
maas int,
sirket varchar(20)
);
select*from personel
delete from personel

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select*from personel

select isim, sum(maas) from personel
group by isim

-- 2)sehre gore toplam personel sayisini bulun
select sehir, count(isim) as calisan_sayisi from personel 
group by sehir

-- Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun

select sirket, count(*) as calisan_sayisi
from personel
where maas>5000
group by sirket;

--her şirket için min ve max maaşı bulun
select sirket, min(maas) as endusuk, max(maas) as enyuksek from personel
group by sirket


