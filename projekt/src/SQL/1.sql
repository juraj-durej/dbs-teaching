select * from film;

-- DB najprv musi niekde byt hostovana (lokalne v PC alebo na vzdialenom servery)

-- nasledne je potrebne sa do nej prihlasit zadanim (url, name, password, database_name)

-- nasledne je potrebne vytvorit databazu (databazovy server moze mat viacero databaz)

CREATE DATABASE my_database_name
WITH
   [OWNER =  role_name]
   [ENCODING = encoding]
   [LC_COLLATE = collate]
   [ALLOW_CONNECTIONS = true | false]
   [CONNECTION LIMIT = max_concurrent_connection]


-- colate/encoding

-- In database systems, Collation specifies how data is sorted and compared in a 
-- database. Collation provides the sorting rules, case, and accent sensitivity properties 
-- for the data in the database.

-- For example, when you run a query using the ORDER BY clause, collation determines whether 
-- or not uppercase letters and lowercase letters are treated the same.

-- vytvorenie tabulky v databaze

create table film
(
    film_id          integer default nextval('film_film_id_seq'::regclass) not null -- sekvencia generovania ID
                     constraint film_pkey primary key,
    title            varchar(255) not null,
    description      text,
    release_year     year,
    language_id      smallint not null constraint film_language_id_fkey references language -- foreign key
                     on update cascade on delete restrict, -- co je cascade
    rental_duration  smallint      default 3 not null,
    rental_rate      numeric(4, 2) default 4.99 not null,
    length           smallint,
    replacement_cost numeric(5, 2) default 19.99 not null,
    rating           mpaa_rating   default 'G'::mpaa_rating,   -- ENUM
    last_update      timestamp     default now() not null,
    special_features text[],
    fulltext         tsvector not null  -- fulltext search
);