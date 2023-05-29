DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  doctor_name TEXT NOT NULL,
  specialty_practice TEXT NOT NULL
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  patient_name TEXT NOT NULL,
  insurance TEXT NULL,
  birthdate DATE NULL
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (doctor_id) REFERENCES doctors (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL,
  disease_desc TEXT NOT NULL
);

CREATE TABLE diagnoses (
  id SERIAL PRIMARY KEY,
  visit_id INTEGER NOT NULL,
  disease_id INTEGER NOT NULL,
  notes TEXT NULL,
  FOREIGN KEY (visit_id) REFERENCES visits (id),
  FOREIGN KEY (disease_id) REFERENCES diseases (id)
);
