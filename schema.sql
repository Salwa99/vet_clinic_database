CREATE TABLE animals (
    id INT PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);

ALTER TABLE animals
    ADD COLUMN species VARCHAR(100);

----------------------------------------------------------------

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT 
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT,
  ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

-----------------------------------------------------------------

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    PRIMARY KEY (vets_id, species_id),
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    animals_id INT,
    vet_id INT,
    visits_date DATE,
    FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE,
    PRIMARY KEY (animals_id, vet_id, visits_date)
);