-- query 1 --

SELECT category_name, product_name, list_price
FROM categories join products
ON categories.category_id = products.category_id
order by category_name, product_name;
-- query 2 --
 
 SELECT first_name, last_name, line1, city, state, zip_code
 FROM customers join addresses
 ON customers.customer_id = addresses.customer_id  
 WHERE email_address = 'allan.sherwood@yahoo.com'; 
 
 -- query 3 --

 SELECT first_name, last_name, line1, city, state, zip_code
 FROM customers join addresses
 ON customers.customer_id = addresses.customer_id  
 WHERE customers.shipping_address_id = addresses.address_id;
 
 
 
 -- query 4 --

 
 SELECT  last_name, first_name, order_date, product_name,
 item_price, discount_amount, quantity
 FROM customers cu join orders o
 on cu.customer_id = o.customer_id
 join order_items oi 
 on o.order_id = oi.order_id
 join products p 
 on oi.product_id = p.product_id
 order by last_name,order_date,product_name;
 
 -- query 5 --
 
 
 SELECT p1.product_name, p1.list_price
 FROM products p1,products p2
 where p1.product_id <> p2.product_id
 and p1.list_price = p2.list_price
 order by product_name;

 -- query 6 --
 
 SELECT c.category_name, p.product_id
 FROM categories c
 left join products p
 on c.category_id = p.category_id
 right join categories cs
 on p.category_id = cs.category_id
 where product_id is null;
 
 
 
 -- query 7 --
 
 SELECT 'SHIPPED' AS ship_status, 
order_id, order_date

FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED', order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;
 