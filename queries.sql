/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE 	date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE 	neutered = 'true' AND escape_attempts < '3';
SELECT date_of_birth FROM animals WHERE 	name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts  FROM animals WHERE weight_kg > '10.5';
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/*Queries, update animals table.*/

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals 
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';


BEGIN;

COMMIT;

SELECT COUNT(*) FROM animals;
SELECT * FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals WHERE neutered = 'true';
SELECT MAX( weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN( weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN( weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MAX( weight_kg) FROM animals WHERE species = 'pokemon';
SELECT AVG( escape_attempts) FROM animals WHERE species = 'digimon' AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';
SELECT AVG( escape_attempts) FROM animals WHERE species = 'pokemon' AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'


SELECT name
FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT * FROM owners JOIN animals ON animals.owner_id = owners.id;

SELECT species.name, COUNT(species_id)
FROM species JOIN animals ON animals.species_id = species.id
GROUP BY species.name;

SELECT name
FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';


SELECT full_name, name, escape_attempts
FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT full_name, COUNT (full_name) AS number_of_animals
from owners JOIN animals ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY number_of_animals DESC LIMIT 1;


/*Many to many relationship*/

SELECT vets.name, animals
.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id =
(SELECT id
FROM vets
WHERE name = 'Vet William Tatcher')
ORDER BY visits.date_of_visit DESC LIMIT 1;


SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id =(SELECT id
 FROM vets WHERE name = 'Vet Stephanie Mendez');

SELECT vets.name, species.name
FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vets_id FULL OUTER JOIN species ON species.id = specializations.species_id;


SELECT vets.name, animals
.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id =
(SELECT id
FROM vets
WHERE name = 'Vet Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30');


SELECT animals.name, COUNT (*) AS visits
FROM animals JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
HAVING COUNT (*) = (SELECT MAX (visits)
FROM (SELECT name, COUNT (*) AS visits
    FROM animals JOIN visits ON animals.id = visits.animals_id
    GROUP BY animals.name) animals);


SELECT animals.name, visits.date_of_visit
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Vet Maisy Smith'
ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name
, age, date_of_graduation, date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;


SELECT vets.name, COUNT (*)
FROM vets JOIN visits ON vets.id = visits.vets_id JOIN specializations ON vets.id = specializations.vets_id
WHERE specializations.species_id is NULL
GROUP BY vets.name;


SELECT COUNT (*), species.name
FROM animals JOIN species ON animals.species_id = species.id JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Vet Maisy Smith'
GROUP BY species.name
LIMIT 1;

/* Database performance audit*/
SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';
