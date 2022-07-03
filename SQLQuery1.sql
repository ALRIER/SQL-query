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


---Subquery inside where
--You'll now try to figure out which countries had high average life expectancies (at the country level) in 2015.

--Recall that you can use SQL to do calculations for you. Suppose we wanted only records that were above 1.15 * 100 in terms of life expectancy for 2015:

--SELECT *
  --FROM populations
--WHERE life_expectancy > 1.15 * 100
  --AND year = 2015;

--Select all fields from populations with records corresponding to larger than 1.15 times the average you calculated in the first task for 2015. In other words, change the 100 in the example above with a subquery.

--SELECT ___
  --FROM ___
--WHERE ___ >
  --___ * (SELECT ___(___)
   --FROM ___
   --WHERE ___ = ___) AND
  --___ = ___;

-- Select fields
SELECT *
  -- From populations
  FROM populations
-- Where life_expectancy is greater than
WHERE life_expectancy >
  -- 1.15 * subquery
  1.15 * (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) AND
  year = 2015;

------------------------------Subquery inside where (2)----------------------
--Use your knowledge of subqueries in WHERE to get the urban
--area population for only capital cities.

--Make use of the capital field in the countries table in your subquery.
--Select the city name, country code, and urban area population fields.

--SELECT ___, ___, urbanarea_pop
  --FROM ___
--WHERE ___ IN
  --(SELECT capital
   --FROM countries)
--ORDER BY ___ ___;

-- Select fields
Select name, country_code, urbanarea_pop
  -- From cities
  from cities
-- Where city name in the field of capital cities
where name IN
  -- Subquery
  (select capital
   from countries)
ORDER BY urbanarea_pop DESC;

----------------------------Subquery inside select--------------------------
--In this exercise, you'll see how some queries can be written
--using either a join or a subquery.

--You have seen previously how to use GROUP BY with aggregate
--functions and an inner join to get summarized
--information from multiple tables.

--The code given in the first query selects the top nine
--countries in terms of number of cities appearing in the
--cities table. Recall that this corresponds to the most populous
--cities in the world. Your task will be to convert the second query
--to get the same result as the provided code.

--Convert the GROUP BY code to use a subquery inside of SELECT by filling
--in the blanks to get a result that matches the one given using the
--GROUP BY code in the first query.

--Again, sort the result by cities_num descending
--and then by country ascending.

--SELECT countries.name AS country,
  --(SELECT COUNT(*)
   --FROM ___
   --WHERE countries.code = cities.country_code) AS ___
--FROM countries
--ORDER BY cities_num ___, ___
--LIMIT 9;

---este que esta aqui abajo es el codigo que tengo que imitar.
/*
SELECT countries.name AS country, COUNT(*) AS cities_num
  FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;
*/
---y este de abajo es el codigo que estoy imitando que hace lo mismo
--que el de arriba.
SELECT countries.name AS country,
  -- Subquery
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

--------------------Subquery inside from-------------------
--The last type of subquery you will work with is one inside of FROM.

--You will use this to determine the number of languages spoken for each
--country, identified by the country's local name! (Note this may be different
--than the name field and is stored in the local_name field.)

--Begin by determining for each country code how many languages
--are listed in the languages table using SELECT, FROM, and GROUP BY.
--Alias the aggregated field as lang_num

SELECT ___, ___(___) AS ___
  FROM ___
GROUP BY ___;

-- Select fields (with aliases)
select code, count(name) as lang_num
  -- From languages
  from languages
-- Group by code
Group by code;

--*Include the previous query (aliased as subquery) as a
--subquery in the FROM clause of a new query.
--*Select the local name of the country from countries.
--*Also, select lang_num from subquery.
---*ake sure to use WHERE appropriately to match code
--in countries and in subquery.
--*Sort by lang_num in descending order.

--*Remember to place a comma after countries and before
--your subquery assignment in FROM.
SELECT ___, ___.___
  FROM ___,
      (SELECT code, COUNT(*) AS lang_num
       FROM languages
       GROUP BY code) AS ___
  WHERE ___.___ = ___.___
ORDER BY ___ ___;
--*solucion
SELECT local_name, subquery.lang_num
  FROM countries,
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS subquery
  WHERE countries.code = subquery.code
ORDER BY lang_num DESC;

-------------------Advanced subquery------------------------------------
--*You can also nest multiple subqueries to
--answer even more specific questions.

--*In this exercise, for each of the six continents listed in 2015,
--you'll identify which country had the maximum inflation rate,
--and how high it was, using multiple subqueries.
--*The table result of your final query should look something like
--the following, where anything between < > will
--be filled in with appropriate values:

--+------------+---------------+-------------------+
--| name       | continent     | inflation_rate    |
--|------------+---------------+-------------------|
--| <country1> | North America | <max_inflation1>  |
--| <country2> | Africa        | <max_inflation2>  |
--| <country3> | Oceania       | <max_inflation3>  |
--| <country4> | Europe        | <max_inflation4>  |
--| <country5> | South America | <max_inflation5>  |
--| <country6> | Asia          | <max_inflation6>  |
--+------------+---------------+-------------------+

--*Again, there are multiple ways to get to this solution using only
--joins, but the focus here is on showing you an introduction
--into advanced subqueries.

--*Create an INNER JOIN with countries on the left and economies
--on the right with USING, without aliasing your tables or columns.

--*Retrieve the country's name, continent, and inflation rate for 2015.

-- Select fields
SELECT countries.name, continent, inflation_rate
  -- From countries
  from countries
  	-- Join to economies
  	inner join economies
    -- Match on code
    USING (code)
-- Where year is 2015
Where year = 2015;

--*Select the maximum inflation rate in 2015 AS max_inf grouped by continent
--using the previous step's query as a subquery in the FROM clause.

--*Thus, in your subquery you should:
--*Create an inner join with countries on the left and economies on the right
--with USING (without aliasing your tables or columns).
--*Retrieve the country name, continent, and inflation rate for 2015.
--*Alias the subquery as subquery.
--*This will result in the six maximum inflation rates in 2015 for the six
--continents as one field table. Make sure to not include continent in the
--outer SELECT statement.


-- Select the maximum inflation rate as max_inf
Select max(inflation_rate) as max_inf
  -- Subquery using FROM (alias as subquery)
  FROM (
      SELECT name, continent, inflation_rate
      FROM countries
      INNER JOIN economies
      USING (code)
      WHERE year = 2015) AS subquery
-- Group by continent
GROUP BY continent;

--*Now it's time to append your second query to your first query
--using AND and IN to obtain the name of the country, its continent,
--and the maximum inflation rate for each continent in 2015.

--*For the sake of practice, change all joining conditions to use ON
--instead of USING.

-- Select fields
SELECT name, continent, inflation_rate
  -- From countries
  FROM countries
	-- Join to economies
	INNER JOIN economies
	-- Match on code
	ON countries.code = economies.code
  -- Where year is 2015
  WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
      -- Group by continent
        GROUP BY continent);

--------------------------Subquery challenge---------------------------------
--*Let's test your understanding of the subqueries with a challenge problem!
--Use a subquery to get 2015 economic data for countries that do not have

--gov_form of 'Constitutional Monarchy' or
--'Republic' in their gov_form.

--*Here, gov_form stands for the form of the government for each country.
--Review the different entries for gov_form in the countries table.

--Select the country code, inflation rate, and unemployment rate.
--Order by inflation rate ascending.
--Do not use table aliasing in this exercise.

-- Select fields
SELECT code, inflation_rate, unemployment_rate
  -- From economies
  FROM economies
  -- Where year is 2015 and code is not in
  WHERE year = 2015 AND code NOT IN
  	-- Subquery
  	(SELECT code
  	 FROM countries
  	 WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic%'))
-- Order by inflation rate
ORDER BY inflation_rate;

-------------//////////////// Final challenge //////////////------------------

--**Welcome to the end of the course! The next three exercises will
--test your knowledge of the content covered in this course and apply
--many of the ideas you've seen to difficult problems. Good luck!

--**Read carefully over the instructions and solve them step-by-step,
--thinking about how the different clauses work together.

--**In this exercise, you'll need to get the country names and other
--2015 data in the economies table and the countries table for Central
--American countries with an official language.

SELECT DISTINCT ___, ___, ___
  FROM ___ AS ___
    LEFT JOIN ___ AS ___
      ON (c.code = e.code
      AND c.code IN (
        SELECT l.code
        FROM languages AS l
        WHERE official = 'true'
      ) )
  WHERE ___ = ___ AND ___ = ___
ORDER BY ___;

-- Select fields
SELECT DISTINCT c.name, total_investment, imports
  -- From table (with alias)
  FROM countries AS c
    -- Join with table (with alias)
    LEFT JOIN economies AS e
      -- Match on code
      ON (c.code = e.code
      -- and code in Subquery
        AND c.code IN (
          SELECT l.code
          FROM languages AS l
          WHERE official = 'true'
        ) )
  -- Where region and year are correct
   Where region = 'Central America' AND year = 2015
-- Order by field
ORDER BY c.name;

--Final challenge (2)
--Whoofta! That was challenging, huh?

--Let's ease up a bit and calculate the average fertility rate
--for each region in 2015.

-- Select fields
SELECT c.region, c.continent, AVG(fertility_rate) AS avg_fert_rate
  -- From left table
  FROM countries AS c
    -- Join to right table
    INNER JOIN populations AS p
      -- Match on join condition
      ON c.code = p.country_code
  -- Where specific records matching some condition
  WHERE year = 2015
-- Group appropriately
GROUP BY region, continent
-- Order appropriatel
ORDER BY avg_fert_rate;

---------Final challenge (3)
/*Welcome to the last challenge problem. By now you're a query warrior!
Remember that these challenges are designed to take you to the limit to
solidify your SQL knowledge! Take a deep breath and solve this step-by-step.

You are now tasked with determining the top 10 capital cities in Europe
  and the Americas in terms of a calculated percentage using city_proper_pop
  and metroarea_pop in cities.

Do not use table aliasing in this exercise.*/

-- Select fields
SELECT name, country_code, city_proper_pop, metroarea_pop,
	  -- Calculate city_perc
      city_proper_pop / metroarea_pop * 100 AS city_perc
  -- From appropriate table
  FROM cities
  -- Where
  WHERE name IN
    -- Subquery
    (SELECT capital
     FROM countries
     WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
       AND metroarea_pop IS NOT NULL
-- Order appropriately
ORDER BY city_perc DESC
-- Limit amount
LIMIT 10;

---########################  INTERMEDIATE SQL  ########################
---###################################################################

---------------Basic CASE statements
/*What is your favorite team?

->The European Soccer Database contains data about 12,800 matches from 11
  countries played between 2011-2015! Throughout this course, you will be
  shown filtered versions of the tables in this database in order to better
  explore their contents.

->In this exercise, you will identify matches played between FC Schalke
  04 and FC Bayern Munich. There are 2 teams identified in each match in
  the hometeam_id and awayteam_id columns, available to you in the filtered
  matches_germany table. ID can join to the team_api_id column in the
  teams_germany table, but you cannot perform a join on both at the same time.

->However, you can perform this operation using a CASE statement once
  you've identified the team_api_id associated with each team!

->Select the team's long name and API id from the teams_germany table.

->Filter the query for FC Schalke 04 and FC Bayern Munich using
  IN, giving you the team_api_IDs needed for the next step.}

->Make sure to select for both teams in your WHERE statement based on
  matches IN a list contained inside parentheses.*/

SELECT
	-- Select the team long name and team API id
	team_long_name,
	team_api_id
FROM teams_germany
-- Only include FC Schalke 04 and FC Bayern Munich
WHERE team_long_name IN ('FC Bayern Munich', 'FC Schalke 04');

/*
->Create a CASE statement that identifies whether a match in Germany included
    FC Bayern Munich, FC Schalke 04, or neither as the home team.
->Group the query by the CASE statement alias, home_team. */
-- Identify the home team as Bayern Munich, Schalke 04, or neither
SELECT
    CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
         WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
-- Group by the CASE statement alias
GROUP BY home_team;

-----------------------CASE statements comparing column values
/*Barcelona is considered one of the strongest teams in Spain's soccer league.

In this exercise, you will be creating a list of matches in the 2011/2012
  season where Barcelona was the home team. You will do this using a CASE
  statement that compares the values of two columns to create a new group
  -- wins, losses, and ties.

In 3 steps, you will build a query that identifies a match's winner,
  identifies the identity of the opponent, and finally filters for Barcelona
  as the home team. Completing a query in this order will allow you to watch
  your results take shape with each new piece of information.

The matches_spain table currently contains Barcelona's matches from the
  2011/2012 season, and has two key columns, hometeam_id and awayteam_id,
  that can be joined with the teams_spain table. However, you can only join
  teams_spain to one column at a time.

Select the date of the match and create a CASE statement to identify matches
  as home wins, home losses, or ties.*/
  SELECT
	-- Select the date of the match
	date,
	-- Identify home wins, losses, or ties
	CASE WHEN home_goal > away_goal THEN 'Home win!'
        WHEN home_goal < away_goal THEN 'Home loss :('
        ELSE 'Tie' end as outcome
FROM matches_spain;

/*
Left join the teams_spain table team_api_id column to the matches_spain
  table awayteam_id. This allows us to retrieve the away team's identity.
Select team_long_name from teams_spain as opponent and complete the CASE
  statement from Step 1.
  */
SELECT
	m.date,
	--Select the team long name column and call it 'opponent'
	t.team_long_name AS opponent,
	-- Complete the CASE statement with an alias
	CASE WHEN m.home_goal > m.away_goal THEN 'Home win!'
        WHEN m.home_goal < m.away_goal THEN 'Home loss :('
        ELSE 'Tie' end as outcome
FROM matches_spain AS m
-- Left join teams_spain onto matches_spain
left join teams_spain AS t
ON m.awayteam_id = t.team_api_id;

/*
Complete the same CASE statement as the previous steps.
Filter for matches where the home team is FC Barcelona (id = 8634).
*/
SELECT
	m.date,
	t.team_long_name AS opponent,
    -- Complete the CASE statement with an alias
	CASE when m.home_goal >m.away_goal THEN 'Barcelona win!'
        when m.home_goal <m.away_goal THEN 'Barcelona loss :('
        ELSE 'Tie' end as outcome
FROM matches_spain AS m
LEFT JOIN teams_spain AS t
ON m.awayteam_id = t.team_api_id
-- Filter for Barcelona as the home team
WHERE m.hometeam_id = 8634;
/*
-->Complete the CASE statement to identify Barcelona's away team games
  (id = 8634) as wins, losses, or ties.
-->Left join the teams_spain table team_api_id column on the matches_spain
  table hometeam_id column. This retrieves the identity of the home team
  opponent.
-->Filter the query to only include matches where Barcelona was the away team.
*/
-- Select matches where Barcelona was the away team
SELECT
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal <m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal >m.away_goal THEN 'Barcelona loss :('
         ELSE 'Tie' END AS outcome
FROM matches_spain AS m
-- Join teams_spain to matches_spain
LEFT JOIN teams_spain AS t
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;

---------------------------------In CASE of rivalry---------------------------
/*
Barcelona and Real Madrid have been rival teams for more than 80 years.
  Matches between these two teams are given the name El Clásico (The Classic).
  In this exercise, you will query a list of matches played between these two
  rivals.

You will notice in Step 2 that when you have multiple logical conditions in
  a CASE statement, you may quickly end up with a large number of WHEN clauses
  to logically test every outcome you are interested in. It's important to make
  sure you don't accidentally exclude key information in your ELSE clause.

In this exercise, you will retrieve information about matches played between
  Barcelona (id = 8634) and Real Madrid (id = 8633). Note that the query you
  are provided with already identifies the Clásico matches using a filter in
  the WHERE clause.

-->Complete the first CASE statement, identifying Barcelona or Real Madrid as
the home team using the hometeam_id column.
-->Complete the second CASE statement in the same way, using awayteam_id

TABLA1: team_spain
id	      eam_api_id	team_long_name	          team_short_name
43035	      10267	    Valencia CF	                  VAL
43036	      8661	    RCD Mallorca	                MAL
43037	      8371	    CA Osasuna	                  OSA
43038	      10205	    Villarreal CF	                VIL
43039	      9783	    RC Deportivo de La Coruña	    COR
43040	      8633	    Real Madrid CF	              REA


TABLA2: Team_matches
id	country_id	season	stage	date	hometeam_id	awayteam_id	home_goal	away_goal
22658	21518	2011/2012	1	2012-01-21	8560	9906	0	4
22659	21518	2011/2012	1	2012-01-22	8633	8315	4	1
22660	21518	2011/2012	1	2012-01-22	9864	8634	1	4
22661	21518	2011/2012	1	2012-01-23	10205	9869	3	0
22662	21518	2011/2012	1	2012-01-21	8603	8302	1	1
22663	21518	2011/2012	1	2012-01-22	8371	10267	1	1

*/

SELECT
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END AS home,
    -- Identify the away team as Barcelona or Real Madrid
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END AS away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
/*
-->Construct the final CASE statement identifying who won each match.
  Note there are 3 possible outcomes, but 5 conditions that you need
  to identify.
-->Fill in the logical operators to identify Barcelona or Real Madrid as
  the winner. */

  SELECT
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona'
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!'
         WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!'
         WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!'
         WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!'
         ELSE 'Tie!' END AS outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);

--------------------------Filtering your CASE statement----------------------

/*Let's generate a list of matches won by Italy's Bologna team! There are
  quite a few additional teams in the two tables, so a key part of generating
  a usable query will be using your CASE statement as a filter in the WHERE
  clause.

CASE statements allow you to categorize data that you're interested in -- and
exclude data you're not interested in. In order to do this, you can use a CASE
statement as a filter in the WHERE statement to remove output you don't want
to see.

Here is how you might set that up:

SELECT *
FROM table
WHERE
    CASE WHEN a > 5 THEN 'Keep'
         WHEN a <= 5 THEN 'Exclude' END = 'Keep';

In essence, you can use the CASE statement as a filtering column like any
other column in your database. The only difference is that you don't alias
the statement in WHERE.

Identify Bologna's team ID listed in the teams_italy table by selecting the
team_long_name and team_api_id. */

-- Select the season and date columns
SELECT season, date,
    -- Identify when Bologna won a match
	CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
         WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win'
          END AS outcome
FROM matches_italy;

-- Select the season, date, home_goal, and away_goal columns
SELECT season, date, home_goal, away_goal
FROM matches_italy
WHERE
-- Exclude games not won by Bologna
	case when hometeam_id = 9857 and home_goal > away_goal then 'Bologna Win'
		when awayteam_id = 9857 and away_goal > home_goal then 'Bologna Win'
		end IS NOT NULL;

 -------------------------------COUNT using CASE WHEN--------------------------
 /*
Do the number of soccer matches played in a given European country differ
across seasons? We will use the European Soccer Database to answer this
question.

You will examine the number of matches played in 3 seasons within each
country listed in the database. This is much easier to explore with each
season's matches in separate columns. Using the country and unfiltered
match table, you will count the number of matches played in each country
during the 2012/2013, 2013/2014, and 2014/2015 match seasons.

-->Create a CASE statement that identifies the id of matches played in
the 2012/2013 season. Specify that you want ELSE values to be NULL.
-->Wrap the CASE statement in a COUNT function and group the query
by the country alias.

TABLA1: Match

id	country_id	season	stage	date	hometeam_id	awayteam_id	home_goal	away_goal
757	1	2011/2012	1	2011-07-29	1773	8635	2	1
758	1	2011/2012	1	2011-07-30	9998	9985	1	1
759	1	2011/2012	1	2011-07-30	9987	9993	3	1
760	1	2011/2012	1	2011-07-30	9991	9984	0	1

TABLA2: country
id	       name
1	        Belgium
1729	    England
4769	    France
7809	    Germany
10257 	   Italy
13274   	Netherlands
15722	    Poland
17642	   Portugal
19694	    Scotland
21518	    Spain
24558	    Switzerland

*/

SELECT
	c.name AS country,
    -- Count games from the 2012/2013 season
	COUNT(CASE WHEN m.season = '2012/2013'
          	   THEN m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;





