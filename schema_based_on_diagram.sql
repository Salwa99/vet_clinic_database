create table patients (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
date_of_birth DATE
);

create table medical_histories (
id SERIAL PRIMARY KEY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(100),
CONSTRAINT FK_patient FOREIGN KEY (patient_id) REFERENCES patients(id)
);

create table treatments (
id SERIAL PRIMARY KEY,
type VARCHAR(100),
name VARCHAR(100)
);