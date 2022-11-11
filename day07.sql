--FETCH NEXT(SAYI) ROW ONLY -OFFSET KULLANIMI
SELECT*FROM musteri_urun2
--)Sirali tablodan ilk 3 kaydi listeleyin
select*from musteri_urun2
order by urun_id
fetch next 3 row only
--Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select*from musteri_urun2
order by urun_id
offset 3 row --3 satır atla
fetch next 4 row only--sonra 4 satır getir

--ALTER TABLE
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50), 
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

drop table if exists personel-- eğer tablo varsa siler
select*from personel

--1) ADD default değer ile tabloya bir field ekleme
alter table personel
add ulke_ismi varchar(20)

--DEFAULT değer ekleme
--2 birden fazla sütün eklme
alter table personel
add gender char(1), add okul varchar(10)

--3 DROP tablodan sütun silme
alter table personel
drop column gender

--4) RENAME column sütun adı değiştirme
ALTER TABLE personel
rename column ulke_ismi TO ulke_adi

--RENAME tablonun adını değiştirme

ALTER TABLE personel
rename to isciler

--TYPE/SET sütunlrın özelliklerini değiştirme
alter table isciler
alter column sehir_isim type varchar(10)

select* from isciler

alter table isciler
alter column sirket set not null

--TRANSECTİON (Begin, savepoint, rollback, commit)

CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);

BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);

ROLLBACK to x;
COMMIT;
--serial data türü kullanımı
insert into ogrenciler2(isim,veli_isim,yazili_notu) values ('erol','ahmet',95.5);
insert into ogrenciler2(isim,veli_isim,yazili_notu) values ('evren','cemil',85.5);
select*from ogrenciler2
delete from ogrenciler2

drop table ogrenciler2

CREATE TABLE isciler2
(
id int,
isim varchar(50),
soyisim varchar(50),
email varchar(30),
ise_baslama_tarih date,
is_unvani varchar(15),
maas int
);
insert into isciler2 values (123456789, 'Ali', 'Can', 'alican@gmail.com', '10-APR-10', 'isci', 5000);
insert into isciler2 values (123456788, 'Veli', 'Cem', 'velicem@gmail.com', '10-JAN-12','isci', 5500);
insert into isciler2 values (123456787, 'Ayse', 'Gul', 'aysegul@gmail.com', '01-MAY-14', 'muhasebeci', 4500);
insert into isciler2 values (123456789, 'Fatma', 'Yasa', 'fatmayasa@gmail.com', '10-APR-09', 'muhendis', 7500);

select*from isciler2
--a) Yukarda verilen “personel” tablosunu olusturun
--b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
--c) Iscilerin tum bilgilerini listeleyin
--d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
--e) Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
--f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
select isim,is_unvani,maas from isciler2
where maas<5000 or is_unvani='isci'

select is_unvani,maas from isciler2
where soyisim in('Can','Cem','Gul')

select email,ise_baslama_tarih from isciler2
where maas>5000

select email,ise_baslama_tarih from isciler2
where maas>5000 or maas<7000


drop table isciler

CREATE TABLE isciler
(
	id int,
	isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE'); 
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

select*from isciler
drop table personel

CREATE TABLE personel (
id int,
isim varchar(50), sehir varchar(50), maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

select*from personel

select*from isciler
--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query yaziniz

select isim,id from personel
where id in(select id from isciler where isciler.id = personel.id);

--her iki tabloda ortak id ve isimlere sahip kayıtalrı listele

select id,isim from personel
intersect
select id, isim from isciler
--id si çift olan personel
SELECT *FROM personel
WHERE MOD (id,2)=0;

select count(*) from personel

select*from isciler
where maas in(select max(maas) from isciler)

select*from isciler 
order by maas desc
fetch next  1 row only

--en düşük 2. maas alan
SELECT *
FROM isciler
ORDER BY maas
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

