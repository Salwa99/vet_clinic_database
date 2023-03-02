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

select * from animals;

ROLLBACK;

select * from animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

select * from animals;

COMMIT;
select * from animals;

BEGIN;
DELETE FROM animals;

select * from animals;

ROLLBACK;

select * from animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-1-1';

SAVEPOINT pre_point;

UPDATE animals
SET weight_kg = weight_kg * -1;

select * from animals;

ROLLBACK TO pre_point;

select * from animals;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

select * from animals;

COMMIT;

select * from animals;

----------------------------------------------------------------
select COUNT(*) FROM animals;

select COUNT(*) FROM animals WHERE escape_attempts = 0;

select AVG(weight_kg) FROM animals;

select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

select species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

select species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

----------------------------------------------------------------

SELECT animals.name, owners.full_name 
FROM animals 
JOIN owners 
ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody';

SELECT animals.name AS animal_name, species.name AS species_type 
FROM animals 
JOIN species 
ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name 
FROM owners 
LEFT JOIN animals 
ON animals.owner_id = owners.id;

SELECT species.name, count(animals) 
FROM animals 
JOIN species 
ON animals.species_id = species.id 
GROUP BY species.name;

SELECT animals.name 
FROM animals 
JOIN owners 
ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Jennifer Orwell';

SELECT species.name, count(animals) 
FROM animals 
JOIN species 
ON animals.species_id = species.id 
GROUP BY species.name;

SELECT owners.full_name, COUNT(animals.name) AS total_animals 
FROM owners 
JOIN animals 
ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY total_animals DESC 
LIMIT 1;

----------------------------------------------------------------

SELECT v.visits_date AS visit_date, a.name, vt.name 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'William Tatcher' 
ORDER BY visit_date DESC 
LIMIT 1;


SELECT COUNT(DISTINCT a.id) 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Stephanie Mendez';

SELECT s.species_id, vt.name AS vet_name 
FROM vets vt 
LEFT JOIN specializations s ON s.vets_id = vt.id 
LEFT JOIN species sp ON s.species_id = sp.id;

SELECT a.name 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Stephanie Mendez' 
AND v.visits_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
GROUP BY a.id 
ORDER BY COUNT(*) DESC 
LIMIT 1;

SELECT v.visits_date AS visit_day, a.name AS animal_name, vt.name AS vet_name 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Maisy Smith' 
ORDER BY v.visits_date 
LIMIT 1;


SELECT v.visits_date AS visit_day, a.name AS animal_name, vt.name AS vet_name 
FROM visits v 
JOIN animals a ON v.animals_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
ORDER BY v.visits_date DESC 
LIMIT 1;

SELECT vets.name, s.species_id 
FROM vets 
LEFT JOIN specializations s ON s.vets_id=vets.id 
WHERE s.species_id IS NULL;

SELECT species.name, COUNT(species.name) AS count_species 
FROM vets 
JOIN specializations s ON s.vets_id=vets.id 
JOIN animals ON animals.species_id=s.species_id 
JOIN species ON species.id=s.species_id 
WHERE vets.name='Maisy Smith' 
GROUP BY species.name 
ORDER BY count_species DESC 
LIMIT 1;
