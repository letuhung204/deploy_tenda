
CREATE TABLE IF NOT EXISTS menu
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(500),
    description VARCHAR(20500),
    category    VARCHAR(500),
    price       NVARCHAR(100),
    photos      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS role
(
    id   LONG AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS `user`
(
    id       LONG AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(500),
    password VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS catagory_menu
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_catagory INT,
    id_menu INT
);

CREATE TABLE IF NOT EXISTS catalogue
(
    id_catalogue INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(500),
    chitiet VARCHAR(500)
);
INSERT INTO `user` (username, password)
VALUES ('admin-dante','$2a$10$KSX3/ZmYSK6udsTFRow1a.neW/k/UY5iVvx2w6iB.UhXDOnMQhNoa');
INSERT INTO catalogue (ten, chitiet)
VALUES ('Combo', 'mo ta Combo category'),
       ('Signature','mo ta Signature category'),
    ('Classic','mo ta Classic category');
    INSERT INTO menu (id,title, `description`,photos,price)
VALUES (1,'Bombay Sapphire Combo', 'Combo','BombaySapphireCombo.jpeg',N'1.600.000 VND'),
		(2,'Jose Cuervo Tequila', 'Combo','JoseCuervoTequila.jpeg',N'1.550.000 VND'),
        (3,'Barcadi Gold Rum Combo', 'Combo','BarcadiGoldRumCombo.jpeg',N'1.550.000 VND'),
        (4,'Captain Morgan Rum Combo', 'Combo','CaptainMorganRumCombo.jpeg',N'1.550.000 VND'),
        (5,'Jack Daniels Combo', 'Combo','JackDanielsCombo.jpeg',N'1.750.000 VND'),
         (6,'Jimbeam White Combo', 'Combo','JimbeamWhiteCombo.jpeg',N'1.450.000 VND'),
          (7,'Attack on Pearl Harbor', 'Whisky,Sesame,Passion,Tamarind','AttackonPearlHarbor.jpeg',N'230.000 VND'),
           (8,'Ocean Heart', 'Gin,Alovera,Honey','OceanHeart.jpeg',N'230.000 VND'),
            (9,'The Habour Sunrise', 'Tequila,Watermelon,Basil,Grenadine','TheHabourSunrise.jpeg',N'250.000 VND'),
             (10,'Just a Kiss', 'Bourbon,Gin,Banana Liquor,Mamalade','JustaKiss.jpeg',N'220.000 VND'),
              (11,'Green Muse', 'Bourbon,Bailey,Hazenut,Matcha,Mlik','GreenMuse.jpeg',N'190.000 VND'),
               (12,'Bermuda Triangle', 'Seaweed Bourbon,Smoky Whisky,Bitter','BermudaTriangle.jpeg',N'210.000 VND'),
               (13,'Port Royal', 'Gin,Campari,Vermouth,Licorine,O Mai','PortRoyal.jpeg',N'195.000 VND'),
               (14,'Foundtain of Youth', 'Rum,Basil,Pine Apple,Lime,Honey','FoundtainofYouth.jpeg',N'185.000 VND'),
                (15,'The Flying Dutch Man', 'Tequila,Tomato,Cinnamon,Lemon,Tabasco','TheFlyingDutchMan.jpeg',N'185.000 VND'),
                (16,'Calypso', 'Gin,Hibicus Cordial,Honey Ginger,Egg White','Calypso.jpeg',N'165.000 VND');

INSERT INTO catagory_menu (id_catagory,id_menu)
 VALUES (1,1),
		(1,2),
        (1,3),
        (1,4),
        (1,5),
        (1,6),
        (2,7),
        (2,8),
        (2,9),
        (2,10),
        (2,11),
        (2,12),
        (2,13),
		(2,14),
        (2,15),
        (2,16);
