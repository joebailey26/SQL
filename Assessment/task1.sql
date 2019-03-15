/* 3.1 */
SELECT name, height, gender, birth_year
FROM Character
WHERE name LIKE '%Skywalker%'
ORDER BY name;

/* 3.2 */
SELECT s.name, s.average_height, c.name "HAIR_COLOR", a.name "SKIN_COLOR", p.name "HOMEWORLD", p.population
FROM Species s
JOIN Color c ON c.id = s.hair_color
JOIN Color a ON a.id = s.skin_color
JOIN Planet p ON p.id = s.homeworld
ORDER BY name;

/* 3.3 */
SELECT c.name, c.gender, s.name "SPECIES_ID", b.name "HAIR_COLOR", p.name "PLANET_NAME", v.model, v.vehicle_class
FROM Driver d
JOIN Character c ON c.id = d.character_id
JOIN Vehicle v ON v.id = d.vehicle_id
JOIN Cast a ON c.id = a.character_id
JOIN Film f ON f.id = a.film_id
JOIN Color b ON b.id = c.hair_color
JOIN Species s ON s.id = c.species_id
JOIN Planet p ON p.id = c.planet_id
WHERE f.id = 4
ORDER BY c.name;

/* 3.4 */
SELECT f.title, COUNT(s.id) "Number", ROUND(AVG(s.cost_in_credits), 2) "Average Cost", ROUND(STDDEV(s.cost_in_credits), 2) "Standard Deviation Cost"
FROM Starship s
JOIN Pilot p ON s.id = p.starship_id
JOIN Character c ON c.id = p.character_id
JOIN Cast a ON c.id = a.character_id
JOIN Film f ON f.id = a.film_id
GROUP BY f.title
ORDER BY AVG(s.cost_in_credits);