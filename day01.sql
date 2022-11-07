--CREATE-- Tablo oluşturma
create table ogretmenler
(
id char(4),
isim_soyisim varchar(30),
not_ort real,
kayıt_tari date
);

--VAROLA BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogretmen_ort
as 
select isim_soyisim, not_ort 
from ogretmenler;

--SELECT -DQL-
SELECT * FROM ogretmenler -- bir tablodaki tüm verileri çağırmak istersek * kullanırız
SELECT *FROM ogretmen_ort;
SELECT isim_soyisim, kayıt_tarih from ogretmenler;-- bir tablodan bir ya da daha fazla field çağırmak için bu şekilde kullanırız
select*from ogrenciler
select 