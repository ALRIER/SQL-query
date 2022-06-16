-- Select fields
SELECT c.code, name, region, year, fertility_rate
  -- From countries (alias as c)
  FROM countries AS c
  -- Join with populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code;


SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
  INNER JOIN economies AS e
    ON c.code = e.code;


    -- Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
  -- From countries (alias as c)
  FROM countries AS c
  -- Join to populations (as p)
  INNER JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
  -- Join to economies (as e)
  INNER JOIN economies AS e
    -- Match on country code and year
    ON c.code = e.code AND e.year = p.year;


/* Left join (3) 
Youll now revisit the use of the AVG() function introduced in our introductory SQL course.
 You will use it in combination with left join to determine the average gross domestic product
  (GDP) per capita by region in 2010. */ 
  
  -- Select fields
SELECT region, AVG(gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
  -- Left join with economies (alias as e)
  LEFT join economies AS e
    -- Match on code fields
    ON c.code = e.code
-- Focus on 2010
WHERE year = 2010
-- Group by region
Group by region
-- Order by descending avg_gdp
Order by avg_gdp DESC;

/*Right join
Right joins arent as common as left joins. One reason why is that you can always write
 a right join as a left join.

The left join code is commented out here. Your task is to write a new query using
rights joins that produces the same result as what the query using left joins produces. 
Keep this left joins code commented as you write your own query just below it using right 
joins to solve the problem.

Note the order of the joins matters in your conversion to using right joins! */

-- convert this code to use RIGHT JOINs instead of LEFT JOINs

/*
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM cities
  LEFT JOIN countries
    ON cities.country_code = countries.code
  LEFT JOIN languages
    ON countries.code = languages.code
ORDER BY city, language;
*/

SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
  RIGHT JOIN countries
    ON languages.code = countries.code
  RIGHT JOIN cities
    ON countries.code = cities.country_code
ORDER BY city, language;

/*Full join
In this exercise, youll examine how your results differ when using a full join versus using a left join versus using an inner join with the countries and currencies tables.

You will focus on the North American region and also where the name of the country is missing. Dig in to see what we mean!

Begin with a full join with countries on the left and currencies on the right. The fields of interest have been SELECTed for you throughout this exercise.

Then complete a similar left join and conclude with an inner join. */

SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  FULL JOIN currencies 
    -- Match on code
    USING (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS null
-- Order by region
ORDER BY region;

/*Repeat the same query as before, using a LEFT JOIN instead of a FULL JOIN.
 Note what has changed compared to the FULL JOIN result!*/

 SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  left Join currencies
    -- Match on code
    using (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;

/*Repeat the same query again but use an INNER JOIN instead of a FULL JOIN.
Note what has changed compared to the FULL JOIN and LEFT JOIN results! */

SELECT name AS country, code, region, basic_unit
-- From countries
FROM countries
  -- Join to currencies
  inner join currencies
    -- Match on code
    USING (code)
-- Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- Order by region
ORDER BY region;

/*Choose records in which countries.name starts with the capital letter 'V' or is NULL.
Arrange by countries.name in ascending order to more clearly see the results.*/

SELECT countries.name, code, languages.name AS language
-- From languages
FROM languages
  -- Join to countries
  full JOIN countries
    -- Match on code
    USING (code)
-- Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS null
-- Order by ascending countries.name
ORDER BY countries.name;



--Well done! Now you know how to select single columns.

--In the real world, you will often want to select multiple columns. Luckily, SQL makes this really easy. To select multiple columns from a table, simply separate the column names with commas!

--For example, this query selects two columns, name and birthdate, from the people table:

--SELECT name, birthdate
--FROM people;
--Sometimes, you may want to select all columns from a table. Typing out every column name would be a pain, so there's a handy shortcut:

--SELECT *
--FROM people;
--If you only want to return a certain number of results, you can use the LIMIT keyword to limit the number of rows returned:

--SELECT *
--FROM people
--LIMIT 10;
--Before getting started with the instructions below, check out the column names in the films table!

--Get the title of every film from the films table.

--Get the title and release year for every film.

--Get the title, release year and country for every film.

--Get all columns from the films table.

SELECT title
from films;

--Often your results will include many duplicate values. If you want to select all the unique values from a column, you can use the DISTINCT keyword.

--This might be useful if, for example, you're interested in knowing which languages are represented in the films table:

--SELECT DISTINCT language
--FROM films;
--Remember, you can check out the data in the tables by clicking on the table name!

--Get all the unique countries represented in the films table.

--Get all the different film certifications from the films table.

--Get the different types of film roles from the roles table.

SELECT DISTINCT country
FROM films;

--As you've seen, COUNT(*) tells you how many rows are in a table. However, if you want to count the number of non-missing values in a particular column, you can call COUNT() on just that column.

--For example, to count the number of birth dates present in the people table:

--SELECT COUNT(birthdate)
--FROM people;
--It's also common to combine COUNT() with DISTINCT to count the number of distinct values in a column.

--For example, this query counts the number of distinct birth dates contained in the people table:

--SELECT COUNT(DISTINCT birthdate)
--FROM people;
--Let's get some practice with COUNT()!

--Count the number of rows in the people table.

--Count the number of (non-missing) birth dates in the people table.

--Count the number of unique birth dates in the people table.

--Count the number of unique languages in the films table.

--Count the number of unique countries in the films table.

SELECT COUNT(people)
FROM people;

--Simple filtering of numeric values
--As you learned in the previous exercise, the WHERE clause can also be used to filter numeric records, such as years or ages.

--For example, the following query selects all details for films with a budget over ten thousand dollars:

--SELECT *
--FROM films
--WHERE budget > 10000;
--Now it's your turn to use the WHERE clause to filter numeric values!

--Get all details for all films released in 2016.

--Get the number of films released before 2000.

--Get the title and release year of films released after 2000.

SELECT *
FROM films
WHERE release_year = 2016;

--Get all details for all French language films.

SELECT *
FROM films
WHERE language = 'French';

---Now you'll write a query to get the title and release year
-- of films released in the 90s which were in French or Spanish
--and which took in more than $2M gross.

SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND gross > 2000000

--BETWEEN (2)
--Similar to the WHERE clause, the BETWEEN clause can be used with multiple AND and OR operators, so you can build up your queries and make them even more powerful!

--For example, suppose we have a table called kids. We can get the names of all kids between the ages of 2 and 12 from the United States:

SELECT name
FROM kids
WHERE age BETWEEN 2 AND 12
AND nationality = 'USA';
--Take a go at using BETWEEN with AND on the films data to get the title and
--- release year of all Spanish language films released between 1990 and 2000
--- (inclusive) with budgets over $100 million. We have broken the problem into
-- smaller steps so that you can build the query as you go along!

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' OR language = 'French');


---Diagnosing problems using anti-join
--Another powerful join in SQL is the anti-join. It is particularly useful in identifying which records are causing an incorrect number of records to appear in join queries.

--You will also see another example of a subquery here, as you saw in the first exercise on semi-joins. Your goal is to identify the currencies used in Oceanian countries!

--Begin by determining the number of countries in countries that are listed in Oceania using SELECT, FROM, and WHERE.
-- Select statement
select count(*)
  -- From countries
  from countries
-- Where continent is Oceania
where continent = 'Oceania';

--SELECT ___.___, ___, ___ AS ___
--  FROM ___ AS ___
--   INNER JOIN ___ AS ___
--    ON ___.___ = ___.___
--WHERE ___.___ = ___;

-- Select fields (with aliases)
Select c1.code, name, basic_unit As currency
  -- From countries (alias as c1)
  from countries AS c1
  	-- Join with currencies (alias as c2)
  	inner join currencies AS c2
    -- Match on code
    ON c1.code = c2.code
-- Where continent is Oceania
Where c1.continent = 'Oceania';

--Note that not all countries in Oceania were listed in the resulting inner join with currencies. Use an anti-join to determine which countries were not included!

--Use NOT IN and (SELECT code FROM currencies) as a subquery to get the country code and country name for the Oceanian countries that are not included in the currencies table.

--SELECT ___, ___
--  FROM ___
--  WHERE ___ = ___
--      AND ___ NOT ___
--      (SELECT ___
--       FROM ___);

-- Select fields
select code, name
  -- From Countries
  FROM Countries
  -- Where continent is Oceania
  where continent = 'Oceania'
  	-- And code not in
  	AND code NOT in
  	-- Subquery
  	(select code
  	 from currencies);

---Set theory challenge----

--Congratulations! Youve now made your way to the challenge problem for this third chapter.
-- Your task here will be to incorporate two of UNION/UNION ALL/INTERSECT/EXCEPT to solve a
-- challenge involving three tables.

--In addition, you will use a subquery as you have in the last two exercises!
-- This will be great practice as you hop into subqueries more in Chapter 4!

--Identify the country codes that are included in either economies or currencies
-- but not in populations.
--Use that result to determine the names of cities in the countries that match the
-- specification in the previous instruction.

--SELECT name
--  FROM ___ AS c1
--  WHERE country_code IN
--(
--    SELECT ___.___
--    FROM ___ AS ___
--    UNION
--    SELECT c2.code
--    FROM currencies AS ___
--    EXCEPT
--    SELECT p.country_code
--    FROM populations AS p
--);

-- Select the city name
select c1.name
  -- Alias the table where city name resides
  from cities AS c1
  -- Choose only records matching the result of multiple set theory clauses
  WHERE country_code IN
(
    -- Select appropriate field from economies AS e
    SELECT e.code
    FROM economies AS e
    -- Get all additional (unique) values of the field from currencies AS c2
    UNION
    SELECT c2.code
    FROM currencies AS c2
    -- Exclude those appearing in populations AS p
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);



