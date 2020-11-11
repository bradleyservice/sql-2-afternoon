SELECT *
FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;


SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

SELECT ar.name, al.title
FROM artist ar
JOIN album al ON ar.artist_id = al.artist_id;

SELECT pt.track_id
FROM playlist p
JOIN playlist_track pt ON p.playlist_id = pt.playlist_id
WHERE name = 'Music';

SELECT t.name
FROM playlist_track pt
JOIN track t ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name
FROM playlist_track pt
JOIN track t ON pt.track_id = t.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM album a
JOIN track t ON a.album_id = t.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';

SELECT *
FROM invoice
WHERE invoice_id IN (
  SELECT invoice_id FROM invoice_line il WHERE il.unit_price > 0.99);

SELECT *
FROM playlist_track
WHERE playlist_id IN (
  SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT t.name
FROM track t
WHERE track_id IN (
	SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT *
FROM track
WHERE genre_id IN (
	SELECT genre_id FROM genre WHERE name = 'Comedy');

SELECT *
FROM track
WHERE album_id IN (
	SELECT album_id FROM album WHERE title = 'Fireball');

SELECT *
FROM track
WHERE album_id IN (
	SELECT album_id FROM album
		WHERE artist_id IN (
    	SELECT artist_id FROM artist WHERE name = 'Queen'));

UPDATE customer
SET fax = NULL
WHERE fax IS NOT NULL;

UPDATE customer
SET company = 'Self'
WHERE company IS NULL;

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id IN (
	SELECT genre_id FROM genre WHERE name = 'Metal');

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT (*)
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT ar.name, COUNT(*)
FROM artist ar
JOIN album al ON ar.artist_id = al.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer FROM track;

SELECT DISTINCT billing_postal_code FROM invoice;

SELECT DISTINCT company FROM customer;

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete
WHERE type = 'silver';

DELETE FROM practice_delete
WHERE value = 150;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
  name VARCHAR(160),
  email VARCHAR(160)
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
  name VARCHAR(160),
  price INT
);

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  user_id INT REFERENCES users(id)
);

INSERT INTO users
(name, email)
VALUES
('Greg L.', 'gregory@gregorE.mail'),
('Bamboozle G.', 'bambamazon@brewery.cider'),
('Lina R.', 'humbucker420@1337.co');

INSERT INTO products
(name, price)
VALUES
('nerf gun', 14000),
('kitty socks', 70),
('xmas tree', 100);

INSERT INTO orders
(product_id, user_id)
VALUES
(1, 1),
(2, 2),
(2, 3);

SELECT *
FROM orders o
JOIN products p ON o.product_id = p.id;

SELECT *
FROM orders o
JOIN products p ON o.product_id = p.id
WHERE order_id = 1;

SELECT * FROM orders;

INSERT INTO orders
(order_id, product_id)
VALUES
(3, 3),
(4, 2), 
(5, 1),
(6, 2);

SELECT sum(price)
FROM orders o
JOIN products p ON o.product_id = p.id
WHERE order_id = 1 OR order_id = 2 OR order_id = 3;

SELECT *
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.id = 2;

SELECT COUNT (*)
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.id = 2;

