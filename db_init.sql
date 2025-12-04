-- 1. Cədvəlin (Table) yaradılması: 'bagshoes_new_table'

-- Əgər cədvəl mövcuddursa, onu silin (İxtiyari: Test zamanı faydalıdır)
DROP TABLE IF EXISTS bagshoes_new_table;

CREATE TABLE bagshoes_new_table (
    productid INT NOT NULL PRIMARY KEY, -- productid: primary key
    productname VARCHAR(45) NOT NULL,
    image VARCHAR(45) NOT NULL,
    description VARCHAR(45),
    price DECIMAL(10, 2) NOT NULL,
    discount INT,
    apply INT,
    stock INT NOT NULL,
    backName VARCHAR(45),
    TheBag TINYINT NOT NULL, -- TheBag (TinyInt: 0 və ya 1 olaraq görünür)
    TheShoes TINYINT NOT NULL -- TheShoes (TinyInt: 0 və ya 1 olaraq görünür)
);


-- 2. Məlumatların (Data) cədvələ daxil edilməsi

INSERT INTO bagshoes_new_table (
    productid, productname, image, description, price, discount, apply, stock, backName, TheBag, TheShoes
) VALUES
(1, 'MKu Mku', 'bag_1.jpg', 'Burgundy', 251.99, 25, 1, 8, 'bag', 1, 0),
(2, 'MKu Mku', 'bag_2.jpg', 'Dark Brown', 225.99, 15, 1, 14, 'bag', 1, 0),
(3, 'Wrenne Wee', 'bag_3.jpg', 'Black', 433.00, NULL, NULL, 12, 'bag', 1, 0),
(4, 'Wrenne Wee', 'bag_4.jpg', 'Black', 327.99, 22, 1, 22, 'bag', 1, 0),
(5, 'JuicyCouture', 'bag_5.jpg', 'Pink', 250.00, 22, 1, 12, 'bag', 1, 0),
(6, 'angelloss', 'bag_6.jpg', 'Black', 250.00, 23, 1, 13, 'bag', 1, 0),
(7, 'JuicyCouture', 'bag_7.jpg', 'Puffy Pink', 423.00, NULL, NULL, 5, 'bag', 1, 0),
(8, 'Coach', 'bag_8.jpg', 'Light Pink', 226.00, 22, 1, 5, 'bag', 1, 0),
(9, 'Coach', 'bag_9.jpg', 'Mint', 251.99, 25, 1, 8, 'bag', 1, 0),
(10, 'Adidas Samba', 'shoes_1.jpg', 'Black', 457.00, 24, 1, 25, 'shoes', 0, 1),
(11, 'Adidas Samba', 'shoes_2.jpg', 'White', 436.00, NULL, NULL, 4, 'shoes', 0, 1),
(12, 'Umbro Special', 'shoes_3.jpg', 'Yellow', 365.00, 22, 1, 44, 'shoes', 0, 1),
(13, 'Adidas Samba', 'shoes_4.jpg', 'Blue', 568.00, NULL, NULL, 5, 'shoes', 0, 1),
(14, 'Adidas Samba', 'shoes_5.jpg', 'Silver', 368.00, 23, 1, 12, 'shoes', 0, 1),
(15, 'Adidas Samba', 'shoes_6.jpg', 'Burgundy', 327.00, 25, 1, 32, 'shoes', 0, 1),
(16, 'Asics', 'shoes_7.jpg', 'Grey', 356.00, 22, 1, 14, 'shoes', 0, 1),
(17, 'New Balance', 'shoes_8.jpg', 'Grey', 376.00, NULL, NULL, 18, 'shoes', 0, 1),
(18, 'Puma', 'shoes_9.jpg', 'Dark Brown', 323.00, NULL, NULL, 15, 'shoes', 0, 1);