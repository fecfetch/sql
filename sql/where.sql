CREATE TABLE calisanlar1 (
	id char(5) PRIMARY KEY,
	isim VARCHAR(50) UNIQUE, 
	maas INT NOT NULL,
	start DATE
);
CREATE TABLE adresler(
	addr_id char(5),
	sokak VARCHAR(50),
	cadde VARCHAR(30),
	sehir VARCHAR(20),
	FOREIGN KEY(addr_id) REFERENCES calisanlar1(id)
);


INSERT INTO calisanlar1 VALUES('10002', 'Donatello' ,12000, '2018-04-14'); 
INSERT INTO calisanlar1 VALUES('10003', null, 5000, '2018-04-14');
--İSİM UNİQUE OLMALI INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
--MAAS NOT NULL OLM  INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12');
--MAAS INTEGER OLMALI INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14');
INSERT INTO calisanlar1 VALUES('', 'April', 2000, '2018-04-14');
--pk UNIQUE OLMASI GEREKTİĞİ İÇİN ÇALIŞMAZ  INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');
--pk UNIQUE OLMASI GEREKTİĞİ İÇİN ÇALIŞMAZ  INSERT INTO calisanlar VALUES('10002', 'Splinter' ,12000, '2018-04-14');
--INSERT INTO calisanlar1 VALUES( null, 'Fred' ,12000, '2018-04-14');

INSERT INTO calisanlar1 VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10010', 'Betty' ,12000, '2018-04-14');


SELECT * FROM calisanlar1;
INSERT INTO adresler VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Taş Sok', '30.Cad.','Konya');


--10012 diye bi id yok calisanlar1de INSERT INTO adresler VALUES('10012','Taş Sok', '30.Cad.','Konya');


INSERT INTO adresler VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');

SELECT * FROM adresler;

SELECT * FROM calisanlar WHERE isim='Donatello' ;
SELECT * FROM calisanlar WHERE maas>5000 ;
SELECT isim, maas FROM calisanlar WHERE maas>5000 ;

SELECT * FROM adresler WHERE sehir='Konya' AND addr_id='10002'  ;
SELECT cadde,sehir FROM adresler WHERE sehir='Konya' OR sehir='Bursa'  ;


CREATE TABLE ogrenciler1
(
	id int,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int       
);

INSERT INTO ogrenciler1 VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO ogrenciler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler1 VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO ogrenciler1 VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO ogrenciler1 VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO ogrenciler1 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler1 VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO ogrenciler1 VALUES(129, 'Mehmet Bak', 'Alihan', 89);

SELECT * FROM ogrenciler1;

DELETE FROM ogrenciler1 WHERE id=123 ;
DELETE FROM ogrenciler1 WHERE isim='Kemal Tan' ;
DELETE FROM ogrenciler1 WHERE isim='Ahmet Han' OR isim='Veli Han' ;
DELETE FROM ogrenciler1 WHERE isim='Mustafa Bak' AND id=128;
DELETE FROM ogrenciler1 WHERE id=122 OR id=125 OR id=126;
DELETE FROM ogrenciler1 WHERE id>126;

DELETE FROM ogrenciler1;
DELETE FROM adresler WHERE addr_id='10002';
DELETE FROM calisanlar WHERE id='10002';
SELECT * FROM calisanlar;
DELETE FROM adresler;
DELETE FROM calisanlar;


CREATE TABLE talebeler
(
	id int primary key,  
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int
);--parent

CREATE TABLE notlar( 
	talebe_id int,
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
	ON DELETE CASCADE	--parenttaki ifadeyi child'ı silmeden silabilmeye yarıyor
);--child

INSERT INTO talebeler VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO talebeler VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO talebeler VALUES(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES (123,'kimya',75);
INSERT INTO notlar VALUES (124, 'fizik',65);
INSERT INTO notlar VALUES (125, 'tarih',90);
INSERT INTO notlar VALUES (126, 'Matematik',90);
INSERT INTO notlar VALUES (127, 'Matematik',90);
INSERT INTO notlar VALUES (null, 'tarih',90);


SELECT * FROM notlar;
SELECT * FROM talebeler;

DELETE FROM talebeler WHERE id=126;
SELECT * FROM notlar;
DELETE FROM talebeler;
DELETE FROM notlar;
DROP TABLE IF EXISTS talebeler CASCADE;

CREATE TABLE musteriler  (
	urun_id int,  
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;
SELECT * FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot');
SELECT * FROM musteriler WHERE musteri_isim IN('John','Mark','Eddie');
SELECT * FROM musteriler WHERE musteri_isim NOT IN('John','Mark','Eddie');
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40; --üsttekiyle aynı
SELECT * FROM musteriler WHERE urun_id<20 OR urun_id>30;
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 30;