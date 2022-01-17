/* Populate database with sample data. */

INSERT INTO animals(
	name,
	date_of_birth,
	escape_attempts,
	neutered,
	weight_kg
)

VALUES('Agumon', DATE '2020-02-03', '0', 'true', '10.23');
VALUES('Gabumon', DATE '2018-11-15', '1', 'true', '8.00');
VALUES('Pikachu', DATE '2021-01-07', '1', 'false', '15.00');
VALUES('Devimon', DATE '2017-05-12', '1', 'true', '11.00');
