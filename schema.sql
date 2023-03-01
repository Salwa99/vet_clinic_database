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
    id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT 
);


