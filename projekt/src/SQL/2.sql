-- vo VScode si stiahneme rozsirenie SQLTools pre komunikaciu s postgresql
-- 	https://www.tutorialspoint.com/postgresql/postgresql_operators.htm
-- 	stiahneme si odtialto vydumpovanu databazu, ktoru importneme do nasej lokalnej
-- 		https://www.postgresqltutorial.com/postgresql-sample-database/
-- 	rozrarujeme zip aby sme mali subor dvdrental.tar
-- 	C:\Program Files\PostgreSQL\11\bin vlozime do premennej path v Systemovych premennych v nastaveniach pocitaca 
-- 	prikazom psql -U postgres v cmd sa dostaneme do rozhrania databazy postgresql
-- 	a prikazom: 
-- 	CREATE DATABASE movie_db;
-- 	nasledne stlacime ctrl+c a spustime prikaz:
-- 	pg_restore -c -U postgres -d movie_db -v "C:/Users/User/Downloads/dvdrental.tar"
-- 	prikazom \l zobrazime vsetky databazy na nasom postgresql servery
-- 	prikazom \c databaseName zmenime v psql databzu v ktorej operujeme
-- 	prikazom \dt zobrazim vsetky tabulky v db
-- 	select * from actor;   -   bodkociarka je dolezita
SELECT first_name,
    last_name,
    email
FROM customer;
SELECT first_name || ' ' || last_name,
    -- operator spoji 2 stlpce dokopy
    email
FROM customer;
SELECT first_name,
    c.last_name as priezvisko -- alias na stlpec
FROM customer as c -- alias na tabulku
where c.last_name = 'Stevens';
SELECT *
from film
where length < 50
limit 5;
SELECT *
from film
where length < 50
    and rental_duration = 3;
-- where length < 50 or rental_duration = 3;
SELECT *
from film
where (
        length < 50
        and rental_duration != 3
    )
    or length > 100;
SELECT *
from film
where length in (117, 130, 48);
SELECT DISTINCT length
from film -- distinct znamena, ze hodnoty budu unikatne a vezme prvu co najde
where length in (117, 130, 48);
SELECT customer_id,
    payment_id,
    amount
FROM payment
WHERE amount BETWEEN 8 AND 9;
-- najcastejsie sa vsak pouziva pre datumy
-----------------------------------------------------------------------------