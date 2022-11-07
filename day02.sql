--DML- DATA MANUPULATİN LANG.
--INSERT
SELECT * FROM ogrenciler;

--bir tabloda tüm field'lere veri ekleme
insert into ogrenciler VALUES('1234', 'Fatih karatug', 80.50, '2022-11-06');

INSERT INTO ogrenciler (id,isim_soyisim) values ('2345', 'yusuf un');

/* 
practice1:
tedarikçiler isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi”	field’lari olsun.
*/
create table tedarikciler2
(
	tedarikci_id char(4),
	tedarikci_ismi varchar(20) not null,
	tedarikci_adres varchar(50),
	ulasim_tarihi date
)

/*
tedarikçi_ziyaret” isminde bir tabloyu  “tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari olsun.
*/

CREATE TABLE tedarikçi_ziyaret
AS
SELECT tedarikci_ismi, ulasim_tarihi FROM tedarikciler;

SELECT*FROM tedarikciler
select*from tedarikçi_ziyaret

CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,
maas int
) ;
INSERT INTO personel (id,soyisim, isim) VALUES (123456789, 'isci', 'melik')
select*from personel

-- Primary key oluşturma 1.yol--
create table ogrenciler4
(
id char(4) primary key,
isim varchar (50) not null,
not_ortalaması real,
adres varchar(100),
	kayıt_tarihi date
);

--primary key oluşturma 2.yol

CREATE TABLE ogrenciler5
(
id char(4),
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date,
CONSTRAINT ogrpk PRIMARY KEY (id)
);

/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin
*/
create table tedarikciler3
(
	tedarikci_id char(5),
	tedarikci_isim varchar(20),
	iletisim_isim varchar(50),
constraint tedarikci_pk primary key(tedarikci_id)
	
)

create table urunler
(
	tedarikci_id char(10),
	urun_id char(20),
constraint tedarikci_fk foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)
)
/*
Practice 5:
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  field’lari olsun.
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”,
“sokak”, “cadde” ve “sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
	id char(9) primary key,
	isim varchar(30) unique, -- olduğu için aynı isim tekrar girilemez, duplicate olur--
	maas int not null,
	ise_baslama date
);


CREATE TABLE adresler
(
adres_id char(10),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
CONSTRAINT adrsfk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10012', 'Mehmet Sahin', 5000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- not null demiştik--
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--duplicate--
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- unique olduğu için--
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key--
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --primary key--
6:46
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select *from calisanlar
select*from adresler	

select isim from calisanlar where maas>5000
select *from calisanlar where maas>5000

--id'si 10004 olan kişinin id,isim ve maas field larını sorgulayalım
select id,isim,maas from calisanlar where id='10004'
--tablodan sadece maaşı 5000 den büyük, isim fiedld indeakı dataları getirir
--check constraint kullanımı
create table sehirler2
(
alan_kodu int primary key,
isim varchar (20) not null,
nufus int check (nufus>0)
);

insert into sehirler2 values (123,'fatih', -10) --bu durumda check constraint 
insert into sehirler2 values (123,'fatih', 5)

delete from tedarikçi_ziyaret

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select*from ogrenciler6
--id si 124 olan öğrenciyi sil

delete from ogrenciler6 where id='124'

select*from calisanlar
select*from adresler 

delete from adresler --içindeki verileri siliyor--

--ismi kemal yasa olan kaydı silin
delete from ogrenciler6 where isim= 'Kemal Yasa'
delete from ogrenciler6 where isim= 'Ali can'

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
white_check_mark
eyes
pray

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);
7:51
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select*from notlar
select*from talebeler

delete from notlar where talebe_id='123'
--child tablodaki veriyi sildiğimizde sadce oradaki silinir, parente silinmez
delete from talebeler where id='126'--parentte silinirse child de silinir.
delete from talebeler


CREATE TABLE musteriler 
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
9:03
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

--tablodan urun_ismi, orange, apple,appricot dataları getiriniz


select*from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Appricot'
select*from musteriler where urun_isim in  ('Orange','Apple', 'Appricot')

select*from musteriler where urun_isim not in ('Apple', 'Appricot') 
--ürün ismi orange olan ve ismi mark olan kaydı 

select*from musteriler where urun_isim='Orange' and musteri_isim='Mark'
select*from musteriler where urun_isim='Orange' or musteri_isim='Mark'

SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40 
SELECT * FROM musteriler WHERE urun_id  not BETWEEN 20 AND 40

--SUBQUERİES--

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

select*from calisanlar2 where isyeri='Vakko' or isyeri ='Adidas'

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
9:57
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

select*from calisanlar2
select isim, maas, isyeri from calisanlar2
where isyeri in(select marka_isim from markalar where calisan_sayisi>15000)

select isim,maas,sehir 
select*from markalar

-- marka idsi 101'den büyük isim maaş şehir
select isim, maas, isyeri from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id>101)

SELECT marka_id, calisan_sayisi FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar2 WHERE sehir = 'Ankara'); 

select sum(maas) as maas_toplam from calisanlar2
select max(maas) as en_yuksek from calisanlar2
select min(maas) as en_dusuk from calisanlar2
select avg(maas) as ortalama from calisanlar2
select round(avg(maas),2) as ortalama from calisanlar2-- virgül sonrası 2 hane oluyor böyle
select count(maas) as maas_adedi from calisanlar2
select sum(maas), count(maas) from calisanlar2 -- select toplu çalışmıyor ama komutları yan yana çalıştırabilirz

select marka_id, marka_isim,
(select count(sehir) from calisanlar2 where marka_isim=isyeri)as sehir_sayısı from markalar;


