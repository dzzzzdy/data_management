# Cost and price of every U2 item?
SELECT b.name, cost, price
FROM item i
JOIN band b ON
i.band_id = b.id
WHERE b.name = 'u2';

# Total number of each item in inventory?
SELECT b.name, COUNT(i.id)
FROM item i
JOIN band b
ON i.band_id = b.id
GROUP BY b.name;

# Total cost and profit potential of entire inventory
SELECT SUM(cost) AS Cost,
       SUM(price-cost) AS profit
FROM item;

#List showing name, location, and profit margin for every item, highest margin first?
SELECT i.name, 
	   l.ocean,
       l.pillar,
       l.shelf,
       l.bin,
       (price-cost)/price AS profit_margin
FROM item i
JOIN location l ON
i.loc_id = l.id
ORDER BY profit_margin DESC;

#Ratio of total item count in shelves 1-3 over 4-6?
SELECT SUM(CASE WHEN shelf between 1 and 3 THEN 1 ELSE 0 END) /
       SUM(CASE WHEN shelf between 4 and 6 THEN 1 ELSE 0 END) AS ratio
FROM item 
JOIN location  ON
item.loc_id = location.id;

# List all cities in reverse alphabetic order.
SELECT name 
FROM city 
ORDER BY name DESC;

# What is the total population of all countries in the database?
SELECT sum(population) AS total_population
FROM country;

# How many countries have a GNP>$1T? (NB: GNP data are stored in millions.)
SELECT COUNT(code) AS cogunt
FROM country
WHERE gnp > 1000000;

# List names and GNP of all countries, shown in trillions, in ascending order.
SELECT name, gnp / 1000000  AS gnp
FROM country
ORDER BY gnp DESC;

# What is the official language of Uzbekistan?
SELECT language 
FROM country c 
JOIN countrylanguage l
ON c.code = l.CountryCode
WHERE c.name = 'Uzbekistan' 
AND l.isofficial = 'T';

# What is the average life expectancy of Spanish-speaking countries?
SELECT SUM(c.LifeExpectancy) / COUNT(Code) AS average_life_expectancy
FROM country c 
JOIN countrylanguage l
ON c.code = l.CountryCode
WHERE l.Language = 'spanish';

# List the two countries with the lowest and highest life expectancies.
(SELECT name
FROM country 
ORDER BY lifeexpectancy
LIMIT 2)
UNION
(SELECT name
FROM country 
ORDER BY lifeexpectancy DESC
LIMIT 2);

# List the Spanish-speaking countries whose life expectancy is higher than the average of all Spanish-speaking countries?
WITH average_life_expectancy AS
(SELECT SUM(c.LifeExpectancy) / COUNT(Code) AS average
FROM country c 
JOIN countrylanguage l
ON c.code = l.CountryCode
WHERE l.Language = 'spanish')

SELECT name 
FROM country c
JOIN countrylanguage l
ON c.code = l.CountryCode
WHERE l.Language = 'spanish'
AND c.LifeExpectancy > (SELECT(average) 
    					FROM average_life_expectancy);
