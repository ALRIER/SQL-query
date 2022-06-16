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