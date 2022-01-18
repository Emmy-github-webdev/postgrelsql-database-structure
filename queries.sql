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