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

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1),  (2, 2), (2, 1), (3, 2);

INSERT INTO visits (animals_id, vet_id, visits_date)
VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-05-14'),
    (4, 2, '2021-05-04'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2020-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');