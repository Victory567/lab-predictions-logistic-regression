SELECT 
    film.film_id, 
    film.title, 
    IFNULL(MAX(CASE WHEN MONTH(rental.rental_date) = 5 AND YEAR(rental.rental_date) = 2005 THEN 1 ELSE 0 END), 0) AS rented_last_month
FROM 
    film
LEFT JOIN 
    inventory ON film.film_id = inventory.film_id
LEFT JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY 
    film.film_id, 
    film.title;