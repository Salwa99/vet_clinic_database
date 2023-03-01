SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

----------------------------------------------------------------

BEGIN;
UPDATE animals
SET species = 'unspecified';

ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;
DELETE FROM animals;

ROLLBACK;

select * from animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-1-1';

SAVEPOINT pre_point;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO pre_point;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

select * from animals;

----------------------------------------------------------------
select COUNT(*) FROM animals;

select COUNT(*) FROM animals WHERE escape_attempts = 0;

select AVG(weight_kg) FROM animals;

select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

select species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

select species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;