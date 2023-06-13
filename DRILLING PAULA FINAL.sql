--1.a insertar customer--
INSERT INTO public.customer
(store_id, first_name, last_name, email, address_id, activebool, 
create_date, last_update, active)
VALUES
(5, 'Marilita', 'Yañez', 'actrizdelosnoventa@gmail.com', 300, true, '1998-05-04', '2019-07-17', 2);

--1.a modificar customer--

UPDATE public.customer
SET store_id=3, first_name='Patricia', last_name='Salvado', 
email='sintrabajo@gmail.com', 
address_id=3, activebool=true, create_date='2023-06-12'::date, 
last_update=now(), active=0
WHERE customer_id= (680);

--1.a eliminar customer--

--UPDATE public.customer--
--SET store_id=3, first_name='Patricia', last_name='Salvado', 
--email='sintrabajo@gmail.com', address_id=3, activebool=true, create_date='2023-06-12'::date, last_update=now(), active=0--
--WHERE customer_id= (680); Quise borrar el mismo que cree--

DELETE FROM public.customer
WHERE customer_id= (680);

--1b Insertar Staff--

INSERT INTO public.staff
(first_name, last_name, address_id, email, store_id, active, 
username, "password", last_update, picture)
VALUES('Marcelo', 'Fernandez', 4, 'sonidomarcelo@gmail.com', 6, 
true, 'mfernandez', 'canalla', 
now(), null);


--1b Modificar Staff--
UPDATE public.staff
SET first_name='Daniel', last_name='Marino', 
address_id=5, email='danny@gmail.com', store_id=2, 
active=true, username='Dany', "password"='dani12', 
last_update=now(), picture= null
WHERE staff_id=(8);

--1b eliminar Staff--
DELETE FROM public.staff
WHERE staff_id= (8);

--1c Insertar Actor--
INSERT INTO public.actor
(first_name, last_name, last_update)
VALUES('Keanu', 'Reaves', now());

--1c Modificar Actor--
UPDATE public.actor
SET first_name='Sally', last_name='Mendoza', last_update=now()
WHERE actor_id=(500);

--1c eliminar Actor--
DELETE from public.actor
WHERE actor_id=(500);


--2.a Listar todas las “rental” con los datos del “customer” dado un año y mes--
select rental.rental_date, customer.first_name, customer.last_name
from rental 
join customer on rental.customer_id  = customer.customer_id 
where extract(year from rental.rental_date) = 2005
and extract(month from rental.rental_date) = 08;

--2.b Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment"--
select payment.payment_id, payment.payment_date, 
sum(payment.amount) as total from payment 
group by payment.payment_id; 

--2.c Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0--
select film.film_id, 
film.release_year, 
film.rental_rate 
from film
where release_year = 2006 
and rental_rate > 4.0;

-- Diccionario de datos--
SELECT
    t1.TABLE_NAME AS tabla_nombre,
    t1.COLUMN_NAME AS columna_nombre,
    t1.COLUMN_DEFAULT AS columna_defecto,
    t1.IS_NULLABLE AS columna_nulo,
    t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION,
    t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
    PG_CATALOG.COL_DESCRIPTION(t2.OID,
    t1.DTD_IDENTIFIER::int) AS columna_descripcion,
    t1.DOMAIN_NAME AS columna_dominio
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME;
 

--FIN-- 




