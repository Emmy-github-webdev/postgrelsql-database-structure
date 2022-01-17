/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INTEGER,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL	
)
