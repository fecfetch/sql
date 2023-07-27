CREATE TABLE calisanlar3 (
	id int, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

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

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

SELECT MAX(maas) FROM calisanlar3;
SELECT SUM(maas) FROM calisanlar3;
SELECT ROUND(AVG(maas),2) FROM calisanlar3;
SELECT COUNT(id) FROM calisanlar3;

CREATE TABLE workers(
	calisan_id char(9),
	calisan_isim varchar(50),
	calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Demir', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Bakır', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

SELECT calisan_id AS id,calisan_isim || ' - ' || calisan_dogdugu_sehir AS isim_sehir FROM workers;

SELECT * FROM calisanlar3 WHERE isyeri=(SELECT marka_isim FROM markalar WHERE marka_id=100);

SELECT * FROM calisanlar3 WHERE maas=(SELECT  MAX(maas) FROM calisanlar3);

SELECT * FROM calisanlar3 WHERE maas=( --çalışanın bütün bilgileri  (Aşağıdan yukarı oku)
	SELECT MAX(maas) AS ikinci FROM calisanlar3 WHERE maas< --dan düşük en yüksek maaşı alan
	(SELECT  MAX(maas) FROM calisanlar3));--maaşı en yüksek olan
	
CREATE VIEW sehir_sayisi AS SELECT COUNT(DISTINCT sehir) FROM calisanlar3;

CREATE TABLE mart
(	
urun_id int,	
musteri_isim varchar(50),
urun_isim varchar(50)
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
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

SELECT * FROM mart WHERE EXISTS(
	SELECT urun_isim FROM nisan WHERE nisan.urun_isim=mart.urun_isim);