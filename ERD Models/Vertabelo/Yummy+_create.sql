-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-02 17:32:20.248

-- tables
-- Table: Cart
CREATE TABLE Cart (
    id int NOT NULL,
    date date NOT NULL,
    totalPrice float(7,2) NOT NULL,
    CONSTRAINT Cart_pk PRIMARY KEY (id)
);

-- Table: Customer
CREATE TABLE Customer (
    email varchar(30) NOT NULL,
    firstName varchar(20) NOT NULL,
    lastName varchar(20) NOT NULL,
    password varchar(20) NOT NULL,
    Cart_id int NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (email)
);

-- Table: MenuItem
CREATE TABLE MenuItem (
    id int NOT NULL,
    name varchar(40) NOT NULL,
    price float(7,2) NOT NULL,
    description blob NOT NULL,
    Restaurant_id int NOT NULL,
    CONSTRAINT MenuItem_pk PRIMARY KEY (id)
);

-- Table: OrderItem
CREATE TABLE OrderItem (
    id int NOT NULL,
    quantity int NOT NULL,
    price float(7,2) NOT NULL,
    Cart_id int NOT NULL,
    MenuItem_id int NOT NULL,
    CONSTRAINT OrderItem_pk PRIMARY KEY (id)
);

-- Table: Restaurant
CREATE TABLE Restaurant (
    id int NOT NULL,
    address varchar(60) NOT NULL,
    name varchar(40) NOT NULL,
    phone varchar(20) NOT NULL,
    imageUrl blob NOT NULL,
    CONSTRAINT Restaurant_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Customer_Cart (table: Customer)
ALTER TABLE Customer ADD CONSTRAINT Customer_Cart FOREIGN KEY Customer_Cart (Cart_id)
    REFERENCES Cart (id);

-- Reference: MenuItem_Restaurant (table: MenuItem)
ALTER TABLE MenuItem ADD CONSTRAINT MenuItem_Restaurant FOREIGN KEY MenuItem_Restaurant (Restaurant_id)
    REFERENCES Restaurant (id);

-- Reference: OrderItem_Cart (table: OrderItem)
ALTER TABLE OrderItem ADD CONSTRAINT OrderItem_Cart FOREIGN KEY OrderItem_Cart (Cart_id)
    REFERENCES Cart (id);

-- Reference: OrderItem_MenuItem (table: OrderItem)
ALTER TABLE OrderItem ADD CONSTRAINT OrderItem_MenuItem FOREIGN KEY OrderItem_MenuItem (MenuItem_id)
    REFERENCES MenuItem (id);

-- End of file.

