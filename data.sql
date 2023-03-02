INSERT INTO animals VALUES  (1, 'Agumon', 'Feb 3, 2020', 0, 'true', 10.23 ),
                            (2, 'Gabumon', 'Nov 15, 2018', 2, 'true', 8),
                            (3, 'Pikachu', 'Jan 7, 2021', 1, 'false', 15.04),
                            (4, 'Devimon', 'May 12, 2017', 5, 'true', 11),
                            (5, 'Charmander', 'Feb 8, 2020', 0, 'false', -11),
                            (6, 'Plantmon', 'Nov 15 2021', 2, 'true', -5.7),
                            (7, 'Squirtle', 'Apr 2, 1993', 3, 'false', -12.13),
                            (8, 'Angemon', 'Jun 12, 2005', 1, 'true', -45),
                            (9, 'Boarmon', 'Jun 7, 2005', 7, 'true', 20.4),
                            (10, 'Blossom', 'Oct 13, 1998', 3, 'true', 17),
                            (11, 'Ditto', 'May 14, 2022', 4, 'true', 22)
                            ;


--------------------------------------------------------------------

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

BEGIN;
UPDATE animals
SET species_id = species.id
FROM species
WHERE species.name = 'Digimon' AND animals.name LIKE '%mon';
UPDATE animals
SET species_id = species.id
FROM species
WHERE species.name = 'Pokemon' AND animals.species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';
COMMIT;

-----------------------------------------------------------------

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-06-08'), ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id, species_id) VALUES (1, 1),  (2, 2), (2, 1), (3, 2);

