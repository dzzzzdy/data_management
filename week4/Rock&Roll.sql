CREATE DATABASE IF NOT EXISTS DM_rockroll;

USE DM_rockroll;

CREATE TABLE band
(id INT(8) NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL, PRIMARY KEY (id));

CREATE TABLE location
(id INT(8) NOT NULL AUTO_INCREMENT,
ocean VARCHAR(15) NOT NULL,
pillar VARCHAR(15) NOT NULL,
shelf INT(2) NOT NULL,
bin INT(2) NOT NULL,
PRIMARY KEY (id));

CREATE TABLE item
(id INT(8) NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
quantity INT(10) NOT NULL,
cost DECIMAL(10, 2) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
band_id INT(8),
loc_id INT(8) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY fk_band(band_id) REFERENCES band(id)
ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY fk_loc(loc_id) REFERENCES location(id)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO band(id,name)
VALUES (1,'U2'), (2, 'Kiss'), (3,'The Hip'), (10, 'AC/DC');
INSERT INTO location (ocean,pillar,shelf,bin)
VALUES ('Arctic','C',2,1), 
    ('Pacific','F',4,2),
    ('Indian','A',3,3), 
    ('Pacific','A',1,2),
    ('Atlantic','B',5,1);
INSERT INTO item (name,quantity,cost,price,band_id,loc_id)
VALUES ('Bono Sunglasses',39,9.5,39,1,1),
    ('Edge Pick',165,.25,1,1,2),
    ('Joshua Tree Vinyl LP',6,8.75,26.50,1,2),
    ('Kiss Boots',71,145.50,425,2,4),
    ('Simmons Fake Blood',5,1.75,5.75,2,3),
    ('Downie Jacket',1,850,1500,3,5),
    ('Farewell Tour DVD',12,6.20,15,3,4),
    ('Red iPhone Case',75,4.35,18,1,1),
    ('Joshua Tree Poster',9,3.65,21,1,2),
    ('Road Apples CD',3,2.7,12,3,4),
    ('Mask Mug',12,1.1,4.99,2,2),
    ('Ball Cap',21,7.5,15,1,5),
    ('Larry Lithograph',2,89,189,1,4),
    ('Mini Bass Guitar',10,6,16,NULL,4),
    ('Toaster Oven',3,34.5,75.99,NULL,4);