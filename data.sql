/* Populate database with sample data. */

INSERT INTO animals(
	name,
	date_of_birth,
	escape_attempts,
	neutered,
	weight_kg
)

VALUES('Agumon', DATE '2020-02-03', '0', 'true', '10.23');
VALUES('Gabumon', DATE '2018-11-15', '2', 'true', '8.00');
VALUES('Pikachu', DATE '2021-01-07', '1', 'false', '15.00');
VALUES('Devimon', DATE '2017-05-12', '5', 'true', '11.00');

/* Insert additional data. */

VALUES('Charmander', DATE '2020-02-08', '0', 'false', '11.00'),
VALUES('Plantmon', DATE '2022-11-15', '2', 'true', '-5.70'),
VALUES('Squirtle', DATE '1993-04-02', '3', 'false', '-12.13'),
VALUES('Angemon', DATE '2005-06-12', '1', 'true', '-45.00'),
VALUES('Boarmon', DATE '2005-06-07', '7', 'true', '20.40'),
VALUES('Blossom', DATE '1998-10-13', '3', 'true', '17.00'),


/* Populate owners table with sample data. */
INSERT INTO owners(
	full_name,
	age
)

VALUES('Sam Smith', '34');
VALUES('Jennifer Orwell', '19');
VALUES('Bob', '45');
VALUES('Melody Pond', '77');
VALUES('Dean Winchester', '14');
VALUES('Jodie Whittaker', '38');


/* Populate species table with sample data. */
INSERT INTO species(
	name
)

VALUES('Pokemon');
VALUES('Digimon');


/*Queries, update species_id column of animals table.*/
UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon';


UPDATE animals 
SET species_id = 1
WHERE name NOT LIKE '%mon';


UPDATE animals 
SET owner_id = 1
WHERE name = 'Agumon';


UPDATE animals 
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals 
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals 
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals 
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';


/*Many to Many table relationship*/

INSERT INTO vets(
	name,
	age,
	date_of_graduation
)

VALUES('Vet William Tatcher', '45', DATE '2000-04-23');
VALUES('Vet Maisy Smith', '26', DATE '2019-01-17');
VALUES('Vet Stephanie Mendez', '64', DATE '1981-05-04');
VALUES('Vet Jack Harkness', '38', DATE '2008-06-08');