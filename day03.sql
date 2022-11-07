--SUBQUERİES
select*from calisanlar2
select*from markalar
--her markanın ismini, calışan sayısını ve markaya ait çalışanların toplam maaşını listeleyiniz
select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where marka_isim = isyeri) as calisanlar_toplam_maas
from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where marka_isim=isyeri) as enyuksek,
(select min(maas) from calisanlar2 where marka_isim=isyeri)as endusuk
from markalar

CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
 --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

select urun_id, musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id = nisan.urun_id)

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim = nisan.urun_isim )


CREATE TABLE tedarikciler4 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler4 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler4 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler4 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler4 VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler4 -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler4(vergi_no)
on delete cascade
);

INSERT INTO urunler4 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler4 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler4 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler4 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler4 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler4 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler4 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select*from tedarikciler4
select*from urunler4

--vergi n0'su 102 olan tedarikçinin ismini vestel olarak güncelle

update tedarikciler4
set firma_ismi ='Vestel' where vergi_no = 102;

update tedarikciler4
set firma_ismi ='Casper' , irtibat_ismi ='Ali Veli' where vergi_no = 101;

-- ürünler tablosundaki 'phone' değerlerini telefon olarak güncelleyiniz.

update urunler4
set urun_isim ='telefon' where urun_isim ='Phone'

-- urunler tablosundaki
--urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

update urunler4
set urun_id = urun_id + 1
where urun_id >1004;

delete  from urunler4
delete from tedarikciler4

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
--sutun değerleri ile toplayarak güncelleyiniz.
update urunler4
set  urun_id = urun_id + ted_vergino

--urunler tablosundaki tüm ürün isimlerini müşteiri isimleri ile 
--birleştirerek update edelim

update urunler4
set urun_isim = concat(urun_isim, '-', musteri_isim)

--tabloda iki string fieldi bir biri ile birleştrimek için bu yolu kullanabilirz
update urunler4
set urun_isim = urun_isim|| '-'|| musteri_isim)

select*from urunler4
--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda
--irtibat_ismi
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler4
SET urun_isim = (SELECT firma_ismi from tedarikciler4 WHERE irtibat_ismi ='Adam Eve') --> Apple
WHERE musteri_isim = 'Ali Bak'

UPDATE urunler4
set musteri_isim = (SELECT irtibat_ismi from tedarikciler4 where firma_ismi ='Apple') -->'Adam Eve'
WHERE urun_isim = 'Laptop'

--Allies
select urun_id as id,urun_isim as isim from urunler4

select urun_id as id, urun_isim || '-' || musteri_isim as urun_isim_musteri_isim 
from urunler4;

--IS NULL condition

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),
adres varchar(50)
);
12:14


INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

DROP TABLE insanlar

select*from insanlar where name is null
select*from insanlar where name is not null




















