Write twelve queries using SQL commands:
1.	Two queries of Insert statements.
> INSERT INTO cart VALUES (4,'2022-01-10',8.5);
> INSERT INTO customer VALUES ('SamHoule@gmail.com','Sam','Houle','sam123',4);

2.	Two queries of Update statements.
> UPDATE cart set Price=10.5 WHERE id=4;
> UPDATE customer set Password='456' WHERE cartID=4;

3.	One query of Delete statement.
> DELETE FROM customer WHERE cartID=4;

4.	One Select statement that selects a subset of the rows and columns from a table.
> SELECT Email FROM customer;

5.	Two queries of Select statements that select data from a joining of two tables.
> SELECT a.ID, a.Date, b.Email FROM cart a INNER JOIN customer b ON a.ID=b.cartID;
> SELECT a. Price, b.Name FROM orderItem a INNER JOIN menuItem b ON a. MenuItemID=b.ID;

6.	Three queries to use summary functions to generate statistics about the data.
> SELECT Date, Price FROM cart ORDER BY Price DESC LIMIT 3;
> SELECT COUNT(*) FROM cart;
> SELECT DISTINCT firstName FROM customer;

7.	One multi-table query.
> SELECT DISTINCT Email, Date, Quantity FROM customer, cart, orderItem LIMIT 6;
