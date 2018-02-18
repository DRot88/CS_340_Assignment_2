#1 Find all films with maximum length or minimum rental duration (compared to all other films). 
#In other words let L be the maximum film length, and let R be the minimum rental duration in the table film. You need to find all films that have length L or duration R or both length L and duration R.
#You just need to return attribute film id for this query. 

SELECT film_id, title FROM film 
WHERE rental_duration = (
   SELECT MIN(rental_duration) FROM film
) OR length = (
   SELECT MAX(length) FROM film
);

#2 We want to find out how many of each category of film ED CHASE has started in so return a table with category.name and the count
#of the number of films that ED was in which were in that category order by the category name ascending (Your query should return every category even if ED has been in no films in that category).


#3 Find the first name, last name and total combined film length of Sci-Fi films for every actor
#That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films)and the total length of Sci-Fi films they have been in.


#4 Find the first name and last name of all actors who have never been in a Sci-Fi film
  
SELECT A.first_name, A.last_name
FROM actor A
WHERE A.actor_id NOT IN (
  SELECT A.actor_id
  FROM actor A
    INNER JOIN film_actor FA ON FA.actor_id = A.actor_id
    INNER JOIN film F ON F.film_id = FA.film_id
    INNER JOIN film_category FC ON FC.film_id = F.film_id
    INNER JOIN category C ON C.category_id = FC.category_id
  WHERE C.name = 'Sci-Fi'
);



#5 Find the film title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
#Order the results by title, descending (use ORDER BY title DESC at the end of the query)
#Warning, this is a tricky one and while the syntax is all things you know, you have to think oustide
#the box a bit to figure out how to get a table that shows pairs of actors in movies


