
-- Excellent

# TASKS
use sakila;
# Qestion 1

select country 
from country c ;

# Qestion 2 
select count(country) No_of_countries
from country c ;

# Qestion 3
select * 
from country c
where c.country = "United States";

# Qestion 4
select p.payment_id ,p.customer_id ,p.amount 
from payment p 
where p.amount in(1.99, 2.99, 3.99,4.99);

# Qestion 5

INSERT into country()
values(110,"utopia", last_update);

# Qestion 6: No, Because country_id is the primary key and "1" is already a country_id of another country. 
# Hence the quary will not executed successfully.

#  Qestion 7
-- you should end your query with semicolon please
select c.country 12th_17th_rows 
from country c 
where country_id between 12 and 17
order by c.country_id asc;

#  Qestion 8
select distinct c.first_name First_Name_Without_Duplicate
from customer c ;

#  Qestion 9
 select s.store_id Store_ID, count(c.customer_id) Count_of_Customers  
 from customer c , store s  
 where c.store_id = s.store_id 
 group by s.store_id 
 having count(distinct c.customer_id) > 200;
 
--  
 
 #  Qestion 10
 
 select c.first_name First_Name, count(c.first_name) Count_of_Name  
 from customer c 
 group by c.first_name 
 having count(c.first_name)>1 ;
 
 # Qestion 11
 select a.address City_Address,c.city City_Name 
 from city c, address a  
 where a.city_id  = c.city_id 
 and c.city like "A%";
 
 # Qestion 12
--  select *  
--  from address natural city 
--  where city like 'A%';
 
# This query does not work because the values of attributes of "city" does not have common values with attributes of "address"  therefore using natural join did not find a have a match.
 
 
# Qestion 13  
 select  avg(amount) Average_Amount,first_name First_Name ,last_name Last_Name
 from customer c, payment p
 where c.customer_id = p.customer_id 
 group by c.customer_id 
 
 # Qestion 14
 
 select c.first_name First_Name , c.last_name Last_Name ,c2.city City 
 from customer c , address a ,city c2 
 where c.address_id =a.address_id 
 and a.city_id =c2.city_id; 
 
 # Qestion 15
# Qestion16
select c.name Names ,f.title Title ,f.length
from film f, film_category fc, category c 
where c.category_id = fc.category_id 
and f.film_id = fc.film_id 
and f.length > (select min(max_length) from (select max(f2.length) as "max_length"
from film_category fc2 ,category c4 ,film f2
where c4.category_id =fc2.category_id 
and f2.film_id = fc2.film_id 
group by fc2.category_id)  
as min);


# Qestion 17

select c.customer_id Customer_ID , c.first_name First_Name 
from customer c ,payment p 
where p.customer_id =c.customer_id 
and p.amount >=11;

# Qestion 18
select c.customer_id Customer_ID  ,c.first_name First_Name 
from customer c ,payment p 
where c.customer_id = p.customer_id 
and p.amount >= 9
group by p.customer_id 
having count(p.customer_id)>=3;

# Qestion 19
create view high_price_rental as
select c.customer_id , c.first_name 
from customer c, rental r , payment p 
where r.rental_id =p.rental_id 
and p.customer_id = c.customer_id 
and amount in (select max(amount) from payment p)

select * from high_price_rental 
 
 # Qestion 20
 select c2.country Country , count(c.customer_id) Count_of_Customers 
 from customer c ,country c2 ,city c3 ,address a 
 where c2.country_id = c3.country_id 
 and c3.city_id = a.city_id 
 and a.address_id = c.address_id 
 group by c2.country_id 
 order by count(c.customer_id) desc 
 
