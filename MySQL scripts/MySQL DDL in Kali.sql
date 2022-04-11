/*                                                                                                             
┌──(root㉿kali)-[/home/foxliu]
└─# mysql -h localhost -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 34
Server version: 10.5.12-MariaDB-1 Debian 11

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.000 sec)

MariaDB [(none)]> create database 50900_db;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| 50900_db           |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.000 sec)

MariaDB [(none)]> use 50900_db;
Database changed

MariaDB [50900_db]> create table cart(ID int, Date date, Price float);
Query OK, 0 rows affected (0.009 sec)

MariaDB [50900_db]> load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/cart.csv' into table cart fields terminated by ',';
Query OK, 3 rows affected, 2 warnings (0.004 sec)    
Records: 3  Deleted: 0  Skipped: 0  Warnings: 2

MariaDB [50900_db]> select * from cart;
+------+------------+--------+
| ID   | Date       | Price  |
+------+------------+--------+
|    1 | 2022-03-01 |   21.5 |
|    2 | 2022-03-11 | 100.35 |
|    3 | 2022-02-16 |   75.8 |
+------+------------+--------+
3 rows in set (0.000 sec)

MariaDB [50900_db]> create table customer(Email varchar(30), firstName varchar(20), lastName varchar(20), Password varchar(20), cartID int);
Query OK, 0 rows affected (0.011 sec)

MariaDB [50900_db]> load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/customer.csv' into table customer fields terminated by ',';
Query OK, 3 rows affected, 2 warnings (0.005 sec)    
Records: 3  Deleted: 0  Skipped: 0  Warnings: 2

MariaDB [50900_db]> select * from customer;
+-------------------------+-----------+----------+------------+--------+
| Email                   | firstName | lastName | Password   | cartID |                                                    
+-------------------------+-----------+----------+------------+--------+                                                    
| 'tomSmith@gmail.com'    | 'Tom'     | 'Smith'  | 'tom123'   |      1 |                                                    
| 'jamesMiller@gmail.com' | 'James'   | 'Miller' | 'james123' |      2 |
| 'emmaStone@gmail.com'   | 'Emma'    | 'Stone'  | 'emma123'  |      3 |
+-------------------------+-----------+----------+------------+--------+
3 rows in set (0.000 sec)

MariaDB [50900_db]> create table menuItem(ID int, Name varchar(40), Price Float, Description Blob, RestaurantID int);
Query OK, 0 rows affected (0.013 sec)

MariaDB [50900_db]> load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/menuItem.csv' into tab
le menuItem fields terminated by ',';
Query OK, 3 rows affected, 5 warnings (0.004 sec)    
Records: 3  Deleted: 0  Skipped: 0  Warnings: 5

MariaDB [50900_db]> select * from menuItem;
+------+---------------+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+
| ID   | Name          | Price | Description                                                                                                                                                  | RestaurantID |
+------+---------------+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+
|    3 | Fried rice    |   9.5 | A dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs                             |            0 |
|    6 | Whopper       |   7.5 | The signature hamburger and an associated product line sold by international fast food restaurant chain Burger King and its Australian franchise Hungry Jack |            2 |
|    9 | Fried chicken |   6.9 | A dish consisting of chicken pieces that have been coated with seasoned flour or batter and pan-fried                                                        |            0 |
+------+---------------+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+
3 rows in set (0.000 sec)

MariaDB [50900_db]> create table orderItem(ID int, Quantity int, Price Float, MenuItemID int, CartID int);
Query OK, 0 rows affected (0.010 sec)

MariaDB [50900_db]> load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/orderItem.csv' into ta
ble orderItem fields terminated by ',';
Query OK, 3 rows affected, 2 warnings (0.004 sec)    
Records: 3  Deleted: 0  Skipped: 0  Warnings: 2

MariaDB [50900_db]> select * from orderItem;
+------+----------+-------+------------+--------+
| ID   | Quantity | Price | MenuItemID | CartID |
+------+----------+-------+------------+--------+
|    1 |        2 |   9.5 |          3 |      1 |
|    2 |        1 |   7.5 |          6 |      2 |
|    3 |        1 |   6.9 |          9 |      3 |
+------+----------+-------+------------+--------+
3 rows in set (0.000 sec)

MariaDB [50900_db]> create table restaurant(ID int, Address varchar(60), Name Varchar (40), Phone Varchar (20), ImageURL Blob);
Query OK, 0 rows affected (0.007 sec)

MariaDB [50900_db]> load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/restaurant.csv' into t
able restaurant fields terminated by ',';
Query OK, 3 rows affected (0.006 sec)                
Records: 3  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [50900_db]> select * from restaurant;
+------+--------------------------------------------+---------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ID   | Address                                    | Name          | Phone        | ImageURL                                                                                                                                       |
+------+--------------------------------------------+---------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------+
|    1 | 5417 Washington Ave. Racine. WI 53406      | Panda Express | 213-421-1111 | https://cdn-fsly.yottaa.net/555a305b2bb |c71b9002d22/10ec148069090139fdee0ead9ecbf798.yottaa.net/v~4b.29e.0.0/tenantlogos/4424.png?yocs=D_NA_
|    2 | 5335 Washington Ave. Mt Pleasant. WI 53406 | Burger King   | 213-421-2222 | https://static.dezeen.com/uploads/2021/                                          |een_2364_col_0.jpg
|    3 | 2359 Sheridan Rd. Zion. IL 60099           | KFC           | 213-421-3333 | https://media-cldnry.s-nbcnews.com/imag                                     |3/061113_kfc_logo_vmed5p.jpg
+------+--------------------------------------------+---------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------+
3 rows in set (0.000 sec)

MariaDB [50900_db]>
MariaDB [50900_db]> ALTER TABLE cart ADD CONSTRAINT Cart_pk PRIMARY KEY (id);
Query OK, 0 rows affected, 1 warning (0.038 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [50900_db]> ALTER TABLE customer ADD CONSTRAINT Customer_pk PRIMARY KEY (email);
Query OK, 0 rows affected, 1 warning (0.014 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [50900_db]> ALTER TABLE menuItem ADD CONSTRAINT MenuItem_pk PRIMARY KEY (id);
Query OK, 0 rows affected, 1 warning (0.016 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [50900_db]> ALTER TABLE orderItem ADD CONSTRAINT orderItem_pk PRIMARY KEY (id);
Query OK, 0 rows affected, 1 warning (0.016 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [50900_db]> ALTER TABLE restaurant ADD CONSTRAINT restaurant_pk PRIMARY KEY (id);
Query OK, 0 rows affected, 1 warning (0.021 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [50900_db]> ALTER TABLE customer ADD CONSTRAINT customer_cart FOREIGN KEY customer_cart (cartID) REFERENCES cart (id);
Query OK, 3 rows affected (0.027 sec)              
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [50900_db]> ALTER TABLE menuItem ADD CONSTRAINT menuItem_restaurant FOREIGN KEY menuItem_restaurant (RestaurantID) REFERENCES restaurant (ID);
Query OK, 3 rows affected (0.033 sec)              
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [50900_db]> ALTER TABLE orderItem ADD CONSTRAINT orderItem_cart FOREIGN KEY orderItem_cart (cartID) REFERENCES cart (id);
Query OK, 3 rows affected (0.025 sec)              
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [50900_db]> ALTER TABLE orderItem ADD CONSTRAINT orderItem_menuItem FOREIGN KEY orderItem_menuItem (MenuItemID) REFERENCES menuItem (ID);
Query OK, 3 rows affected (0.280 sec)              
Records: 3  Duplicates: 0  Warnings: 0
*/


-- Connect to the MySQL Server
mysql -h localhost -u root
show databases;
-- Create my DB
create database 50900_db;
show databases;
-- Enter the DB
use 50900_db;
-- Create tables and load data into them
create table cart(ID int, Date date, Price float);
load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/cart.csv' into table cart fields terminated by ',';
select * from cart;
create table customer(Email varchar(30), firstName varchar(20), lastName varchar(20), Password varchar(20), cartID int);
load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/customer.csv' into table customer fields terminated by ',';
select * from customer;
create table menuItem(ID int, Name varchar(40), Price Float, Description Blob, RestaurantID int);
load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/menuItem.csv' into table menuItem fields terminated by ',';
select * from menuItem;
create table orderItem(ID int, Quantity int, Price Float, MenuItemID int, CartID int);
load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/orderItem.csv' into table orderItem fields terminated by ',';
select * from orderItem;
create table restaurant(ID int, Address varchar(60), Name Varchar (40), Phone Varchar (20), ImageURL Blob);
load data local infile '/home/foxliu/Documents/50900_Project/Data Sources/source2/restaurant.csv' into table restaurant fields terminated by ',';
select * from restaurant;
-- Define PKs
ALTER TABLE cart ADD CONSTRAINT Cart_pk PRIMARY KEY (id);
ALTER TABLE customer ADD CONSTRAINT Customer_pk PRIMARY KEY (email);
ALTER TABLE menuItem ADD CONSTRAINT MenuItem_pk PRIMARY KEY (id);
ALTER TABLE orderItem ADD CONSTRAINT orderItem_pk PRIMARY KEY (id);
ALTER TABLE restaurant ADD CONSTRAINT restaurant_pk PRIMARY KEY (id);
-- Define FKs
ALTER TABLE customer ADD CONSTRAINT customer_cart FOREIGN KEY customer_cart (cartID) REFERENCES cart (id);
ALTER TABLE menuItem ADD CONSTRAINT menuItem_restaurant FOREIGN KEY menuItem_restaurant (RestaurantID) REFERENCES restaurant (ID);
ALTER TABLE orderItem ADD CONSTRAINT orderItem_cart FOREIGN KEY orderItem_cart (cartID) REFERENCES cart (id);
ALTER TABLE orderItem ADD CONSTRAINT orderItem_menuItem FOREIGN KEY orderItem_menuItem (MenuItemID) REFERENCES menuItem (ID);



