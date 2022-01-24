/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INTEGER,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL	
)

/* Add a column species to animals table. */

ALTER TABLE animals 
ADD COLUMN species VARCHAR(100);

/* Create owners table. */
CREATE TABLE owners(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	age INTEGER NOT NULL
)

/* Create species table. */
CREATE TABLE species(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
)

/* Update animal table add species as forign key. */
ALTER TABLE animals 
ADD COLUMN species_id BIGINT REFERENCES species (id);

/* Update animal table add owner as forign key. */
ALTER TABLE animals 
ADD COLUMN owner_id BIGINT REFERENCES owners (id)

/* Many-to-many relationship table. */

CREATE TABLE vets (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INTEGER NOT NULL,
	date_of_graduation DATE NOT NULL
)


CREATE TABLE specializations (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	species_id BIGINT REFERENCES species (id),
	vets_id BIGINT REFERENCES vets (id)
)

CREATE TABLE visits (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	animals_id BIGINT REFERENCES animals (id),
	vets_id BIGINT REFERENCES vets (id),
	date_of_visit DATE NOT NULL
)


/* Database performance audit*/

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

