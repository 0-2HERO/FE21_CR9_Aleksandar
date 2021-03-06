/* 1. How many Nike Products were bought before March 2021 */

SELECT SUM(orders.product_amount) AS 'Number of Nike products bought before January 2022'
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.brand_id = brands.brand_id
WHERE brand_name = 'Nike' AND orders.oder_date < '2021-03-01';

/*: 2. How many Nike Products were bought in total */

SELECT SUM(orders.product_amount) AS 'Number of Nike Products bought total'
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.brand_id = brands.brand_id
WHERE brand_name = 'Nike';

/* 3.  Who ordered Nike Products, when did they buy them and how many did they buy */

SELECT first_name, last_name, oder_date, orders.product_amount, products.product_name, brands.brand_name
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.brand_id = brands.brand_id
INNER JOIN `accounts` ON orders.account_id = accounts.account_id

/* 4: How many times did each customer use which card processor */

SELECT first_name, last_name, processor_name, COUNT(payment_info.processor_id) AS 'Number of times used'
FROM `orders`
INNER JOIN `accounts` ON orders.account_id = accounts.account_id
INNER JOIN `payment_status` ON orders.payment_id = payment_status.payment_id
INNER JOIN `payment_info` ON payment_status.payment_id = payment_info.payment_id
INNER JOIN `card_processor` ON payment_info.processor_id = card_processor.processor_id
GROUP BY accounts.account_id;


/* 5: What is the total sum generated by each product sold */

SELECT product_name, SUM(product_price * product_amount) AS 'Sum'
FROM `products`
RIGHT JOIN orders ON products.product_id = orders.product_id
GROUP BY products.product_id;

/* 6: What is the total sum generated by each product sold in 2021 */

SELECT product_name, SUM(product_price * product_amount) AS 'sum 2021'
FROM `products`
INNER JOIN orders ON products.product_id = orders.product_id
WHERE oder_date > '2020-12-31';