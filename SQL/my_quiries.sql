
# select film with category and language
select film.title as filmtitle, category.name as categoryname, language.name as languagename 
from film,language,film_category,category 
where film.language_id = language.language_id 
AND film.film_id = film_category.film_id
AND category.category_id = film_category.category_id;

# Count the number of rentals for each film
SELECT film.title,count(rental.rental_id)
FROM film,inventory,rental
WHERE film.film_id = inventory.inventory_id
AND inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id;

# find the best customers
SELECT
	p.customer_id,SUM(p.amount)
FROM
	payment p
GROUP BY
	1
ORDER BY
	2 desc
;

# What store have more revenue
SELECT
	store.store_id,s.total_sales
FROM
 sales_by_store s,store
 GROUP BY 1
 ORDER BY 2 desc
;

#  How many rentals we had each month 
# left usage
SELECT
	left(r.rental_date,7),count(r.rental_id)
FROM 
	rental r
GROUP BY
	1
ORDER BY
	2
;

# MIN and MAX usage
SELECT
	f.title as "Film title",max(r.rental_date) as "Last rental date" ,min(r.rental_date) as "First rental date"
FROM 
	rental r,inventory i,film f
WHERE
	r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
GROUP BY
	f.film_id
;

# customers last rental date
SELECT
	concat(c.last_name," ",c.first_name),max(r.rental_date)
FROM
	rental r, customer c
WHERE
	r.customer_id = c.customer_id
GROUP BY
	c.customer_id
;

# revenue by month
SELECT
	left(p.payment_date,7) as "payment month",sum(p.amount) as "total revenue"
FROM
	payment p
GROUP BY
	1
;