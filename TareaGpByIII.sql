-- Tarea Group By III

--¿Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?

select c.first_name, c.last_name, c.email, c3.country from customer c, address a, city c2, country c3 
where c.address_id = a.address_id and a.city_id = c2.city_id and c2.country_id = c3.country_id and 
c3.country = 'Canada'

--¿Qué cliente ha rentado más de nuestra sección de adultos?

select c.first_name || ' ' || c.last_name as nombre, count (r.rental_id) as tot_ren, f.rating from customer c, rental r, 
inventory i, film f where c.customer_id = r.customer_id and r.inventory_id = i.inventory_id 
and i.film_id = f.film_id 
group by (nombre, f.rating) having f.rating = 'NC-17' order by tot_ren desc --limit 1; 

--¿Qué películas son las más rentadas en todas nuestras stores?

select s.store_id, f.title , count(r.rental_id) as tot_ren from film f, inventory i, store s, rental r where
f.film_id = i.inventory_id and i.inventory_id = r.inventory_id and i.store_id = s.store_id 
group by (s.store_id, f.title) order by tot_ren desc

--¿Cuál es nuestro revenue por store?

select s.store_id, sum(p.amount) as tot_rev from payment p, rental r, store s, inventory i 
where p.rental_id = r.rental_id and r.inventory_id = i.inventory_id and i.store_id = s.store_id 
group by (s.store_id) order by s.store_id


