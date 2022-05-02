

INSERT INTO categorys (name, size, weight)
VALUES ('mail',100, 2);
INSERT INTO categorys (name, size, weight)
VALUES ('small',1000, 1000);
INSERT INTO categorys (name, size, weight)
VALUES ('medium',2000, 2000);
INSERT INTO categorys (name, size, weight)
VALUES ('large',3000, 3000);


INSERT INTO countrys (name)
VALUES ('Norvay');
INSERT INTO countrys (name)
VALUES ('Ukraine');
INSERT INTO countrys (name)
VALUES ('Poland');

INSERT INTO citys (Countrys_id  , name)
VALUES (1, 'Oslo');
INSERT INTO citys (Countrys_id  , name)
VALUES (2, 'Kyiv');
INSERT INTO citys (Countrys_id  , name)
VALUES (3, 'Warsaw');


INSERT INTO address (postalCode, district, address, Citys_id)
VALUES (02000,'Miru','Miru 12 k 50', 1);
INSERT INTO address (postalCode, district, address, Citys_id)
VALUES (44020,'Zubr','Zubr 55 k 70', 2);
INSERT INTO address (postalCode, district, address, Citys_id)
VALUES (11700,'Kovbass','Kovbass 88 k 1', 3);


UPDATE postaloffices
SET phone = '123456789', type= 'mail'
WHERE id = 5;

INSERT INTO `postmodel`.`postaloffices`
(`Address_id`)
VALUES
(2);
UPDATE postaloffices
SET phone = '456789123', type= 'cargo'
WHERE id = 15;

INSERT INTO `postmodel`.`postaloffices`
(`Address_id`)
VALUES
(3);
UPDATE postaloffices
SET phone = '789456321', type= 'cargo'
WHERE id = 14;


INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('John','Carody', 'driver', 0);
INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('Sam','Rollback', 'driver', 0);
INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('Joe','Pilgess', 'driver', 0);
INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('Lina', 'Airost', 'manager', 0);
INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('Lara', 'Ponaanks', 'manager', 0);
INSERT INTO stuffs ( firstName, lastName, position, phoneNumberl)
VALUES ('Polja','Dilaree', 'manager', 0);


INSERT INTO `postmodel`.`customer`
(Address_id, firstName, lastName)
VALUES
(12, 'Oleh', 'Subota');




INSERT INTO orders
(customer_id, payments_id, stuffs_id, createDate, sender, recipient)
VALUES (45, 123, 112 , '1000-01-01 00:00:01', '13eeeeee1', '2fsdfdsfds2');

INSERT INTO orders
(customer_id, payments_id, stuffs_id, createDate, sender, recipient)
VALUES (43, 121, 121 , '1000-01-01 00:00:01', '111111', '2223232');

INSERT INTO orders
(customer_id, payments_id, stuffs_id, createDate, sender, recipient)
VALUES (42, 112, 112 , '1000-01-01 00:00:01', '155551', '223233');

INSERT INTO orders
(customer_id, payments_id, stuffs_id, createDate, sender, recipient)
VALUES (41, 11, 132 , '1000-01-01 00:00:01', '22', '444');




