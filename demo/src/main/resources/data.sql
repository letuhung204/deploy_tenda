
CREATE TABLE IF NOT EXISTS menu
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(300),
    description VARCHAR(1000),
    category    VARCHAR(300),
    price       NVARCHAR(100),
    photos      VARCHAR(300),
    id_category int
);
CREATE TABLE IF NOT EXISTS background
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    tieude_welcome       VARCHAR(300),
    sologan_habour VARCHAR(300),
    logo    VARCHAR(300),
    main_photo       VARCHAR(300),
    footer_photo      VARCHAR(300),
    tieu_de_cau_cam_on  VARCHAR(300),
    noi_dung_cau_cam_on  VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS `user`
(
    id       LONG AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(300),
    password VARCHAR(300)
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
    ten VARCHAR(200),
    chitiet VARCHAR(200)
);
CREATE TABLE IF NOT EXISTS role
(
    id   LONG AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO `user` (username, password)
VALUES ('admin-dante','$2a$10$KSX3/ZmYSK6udsTFRow1a.neW/k/UY5iVvx2w6iB.UhXDOnMQhNoa');

INSERT INTO catalogue (ten, chitiet)
VALUES ('Combo', 'mo ta Combo category'),
       ('Signature','mo ta Signature category'),
    ('Classic','mo ta Classic category');

INSERT INTO menu (id,title, `description`,photos,price,id_category)
VALUES (1,'Bombay Sapphire Combo', 'Combo','BombaySapphireCombo.jpg',N'1.600.000 VND',1),
		(2,'Jose Cuervo Tequila', 'Combo','JoseCuervoTequila.jpg',N'1.550.000 VND',1),
        (3,'Barcadi Gold Rum Combo', 'Combo','BarcadiGoldRumCombo.jpg',N'1.550.000 VND',1),
        (4,'Captain Morgan Rum Combo', 'Combo','CaptainMorganRumCombo.jpg',N'1.550.000 VND',1),
        (5,'Jack Daniels Combo', 'Combo','JackDanielsCombo.jpg',N'1.750.000 VND',1),
         (6,'Jimbeam White Combo', 'Combo','JimbeamWhiteCombo.jpg',N'1.450.000 VND',1),
          (7,'Attack on Pearl Harbor', 'Whisky,Sesame,Passion,Tamarind','AttackonPearlHarbor.jpg',N'230.000 VND',2),
           (8,'Ocean Heart', 'Gin,Alovera,Honey','OceanHeart.jpg',N'230.000 VND',2),
            (9,'The Habour Sunrise', 'Tequila,Watermelon,Basil,Grenadine','TheHabourSunrise.jpg',N'250.000 VND',2),
             (10,'Just a Kiss', 'Bourbon,Gin,Banana Liquor,Mamalade','JustaKiss.jpg',N'220.000 VND',2),
              (11,'Green Muse', 'Bourbon,Bailey,Hazenut,Matcha,Mlik','GreenMuse.jpg',N'190.000 VND',2),
               (12,'Bermuda Triangle', 'Seaweed Bourbon,Smoky Whisky,Bitter','BermudaTriangle.jpg',N'210.000 VND',2),
               (13,'Port Royal', 'Gin,Campari,Vermouth,Licorine,O Mai','PortRoyal.jpg',N'195.000 VND',2),
               (14,'Foundtain of Youth', 'Rum,Basil,Pine Apple,Lime,Honey','FoundtainofYouth.jpg',N'185.000 VND',2),
                (15,'The Flying Dutch Man', 'Tequila,Tomato,Cinnamon,Lemon,Tabasco','TheFlyingDutchMan.jpg',N'185.000 VND',2),
                (16,'Calypso', 'Gin,Hibicus Cordial,Honey Ginger,Egg White','Calypso.jpg',N'165.000 VND',2);

INSERT INTO background (id,tieude_welcome, sologan_habour,logo,main_photo,footer_photo,tieu_de_cau_cam_on,noi_dung_cau_cam_on)
VALUES (1,'WELCOME', 'TO-GO The Habour Cocktail-Lounge','HabourLogo.png','mainPhoto.jpg','footerPhoto.jpg','Thank You For Your Visiting','Hope to see you again');
