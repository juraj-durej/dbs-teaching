-- SQL JOINS

-- tutorial
-- https://www.geeksforgeeks.org/postgresql-joins/


CREATE TABLE zoo_1 (
                       id INT PRIMARY KEY,
                       animal VARCHAR (100) NOT NULL
);

CREATE TABLE zoo_2 (
                       id INT PRIMARY KEY,
                       animal VARCHAR (100) NOT NULL
);

INSERT INTO zoo_1(id, animal)
VALUES
    (1, 'Lion'),
    (2, 'Tiger'),
    (3, 'Wolf'),
    (4, 'Fox');

INSERT INTO zoo_2(id, animal)
VALUES
    (1, 'Tiger'),
    (2, 'Lion'),
    (3, 'Rhino'),
    (4, 'Panther');


SELECT
    zoo_1.id id_a,
    zoo_1.animal animal_a,
    zoo_2.id id_b,
    zoo_2.animal animal_b
FROM
    zoo_1
JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;

-- inner join
SELECT
    zoo_1.id id_a,
    zoo_1.animal animal_a,
    zoo_2.id id_b,
    zoo_2.animal animal_b
FROM
    zoo_1
INNER JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;


-- aky je rozdiel medzi join a inner join ?
-- https://letmegooglethat.com/?q=postgresql+join+vs+inner+join


-- left join
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
LEFT JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;

-- right join
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
RIGHT JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;

-- full join
SELECT
    zoo_1.id,
    zoo_1.animal,
    zoo_2.id,
    zoo_2.animal
FROM
    zoo_1
FULL JOIN zoo_2 ON zoo_1.animal = zoo_2.animal;





--
--      ulohy
--

select * from country
where country = 'Germany'
limit 100;

-- id nemecka je 38

select * from city where country_id = 38;

-- Meh, da sa to spravit aj lepsie - JOINS

select * from country
join city on country.country_id = city.country_id
where country = 'Germany'
limit 100;


-- ale ja nechcem uplne vsetky data tychto 2 tabuliek, chcem len nazov mesta a krajinu kam patri

select country.country, city.city from country
join city on country.country_id = city.country_id
where country = 'Germany'
limit 100;


select address.address_id, store_id from address
join store s on address.address_id = s.address_id
order by address_id;

select address.address_id, store_id from address
left join store s on address.address_id = s.address_id
order by address_id;

select address.address_id, store_id from address
right join store s on address.address_id = s.address_id
order by address_id;


-- trosku zvysime tempo:




-- vyhladajte mi vsetky filmy, ktore maju category 'Action'

select title,name from category
join film_category fc on category.category_id = fc.category_id
join film f on fc.film_id = f.film_id
where name = 'Action';


--
--      Order by/distinct funkcie
--


-- zistite mi kolko je roznych unikatnych kategorii filmov

select distinct name from category;

-- zistite mi kolko je roznych unikatnych kategorii filmov a zoraddte ich ascending/descending

select distinct name from category
order by name asc;

select distinct name from category
order by name desc;

-- pre kazdu kategoriu, ktora existuje mi vratte prave 1 film
-- sql nizsie v preklade: pre kazdy name najdi prave 1 title

select distinct on (name) title, name from category
join film_category fc on category.category_id = fc.category_id
join film f on fc.film_id = f.film_id
order by name desc;


