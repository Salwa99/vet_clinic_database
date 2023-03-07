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

create table invoices (
id SERIAL PRIMARY KEY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
CONSTRAINT FK_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

create table invoices_items (
id SERIAL PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
CONSTRAINT FK_invoice FOREIGN KEY (invoice_id) REFERENCES invoices (id),
CONSTRAINT FK_treatment FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

CREATE TABLE treatments_histories (
  treatment_id INT,
  medical_history_id INT,
  PRIMARY KEY (treatment_id, medical_history_id),
  CONSTRAINT FK_treatment FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE,
  CONSTRAINT FK_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE INDEX patient_id_index ON medical_histories (patient_id);

CREATE INDEX invoice_index ON invoices (medical_history_id);

CREATE INDEX invoice_id_index ON invoices_items(invoice_id);

CREATE INDEX treatment_id_index ON invoices_items(treatment_id);

CREATE INDEX treatment_id_index ON treatments_histories(treatment_id);

CREATE INDEX medical_history_index ON treatments_histories(medical_history_id);