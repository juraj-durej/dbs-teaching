\ c movie_db
--
SELECT first_name,
    last_name,
    email
FROM customer;
--
SELECT first_name || ' ' || last_name,
    -- operator spoji 2 stlpce dokopy
    email
FROM customer;
--
SELECT first_name,
    c.last_name as priezvisko -- alias na stlpec
FROM customer as c -- alias na tabulku
where c.last_name = 'Stevens';
--
SELECT *
from film
where length < 50
limit 5;
--
SELECT *
from film
where length < 50
    and rental_duration = 3;
-- where length < 50 or rental_duration = 3;
--
SELECT *
from film
where (
        length < 50
        and rental_duration = 3
    )
    or length > 100;
--
SELECT *
from film
where length in (117, 130, 48);
--
SELECT DISTINCT length
from film -- distinct znamena, ze hodnoty budu unikatne a vezme prvu co najde
where length in (117, 130, 48);
--
SELECT customer_id,
    payment_id,
    amount
FROM payment
WHERE amount BETWEEN 8 AND 9;
-- najcastejsie sa vsak pouziva pre datumy
-----------------------------------------------------------------------------