--We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.

select * from country
where region = 'Southern Europe'
order by population ASC
limit 1


--Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.

select cl.language from country c
join countrylanguage cl on c.code = cl.countrycode
where c.code = 'VAT' AND cl.isofficial is true

--We have new news on the classes Carmen attended: our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which nearby country speaks nothing but that language.

select country.code, country.name from country
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'Italian' AND countrylanguage.isofficial is true AND country.region = 'Southern Europe'


select country.code, count(countrylanguage.language) from country
join countrylanguage on country.code = countrylanguage.countrycode
where country.code = 'ITA' OR country.code = 'SMR'
group by country.code


--We're booking the first flight out: maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.

select * from city
where city.countrycode = 'SMR' AND city.name <> 'San Marino'


--Oh no, she pulled a switch: there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

select country.name, country.code from country
join city on city.countrycode = country.code
where lower(city.name) like 'serr%' and country.code <> 'SMR'

--We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

select city.name from city
join country on country.capital = city.id
where country.code = 'BRA'

--Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but if we can crack it, we can finally put her where she belongs – behind bars.
--
--  Our play date of late has been unusually fun –
--  As an agent, I'll say, you've been a joy to outrun.
--  And while the food here is great, and the people – so nice!
--  I need a little more sunshine with my slice of life.
--  So I'm off to add one to the population I find
--  In a city of ninety-one thousand and now, eighty five.

select city.* from city
where city.population = 91084