DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

-- DOCTORS TABLE
CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialization TEXT
);

INSERT INTO doctors
    (first_name, last_name, specialization)
VALUES
    ('Elizabeth', 'Walsh', 'Entomology'),
    ('Caleb', 'MacLean', 'Gynacology'),
    ('Tessa', 'ODoherty', 'Dermatology'),
    ('Nick', 'Pickering', 'Optomology');

-- PATIENTS TABLE
CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    last_visit DATE
);

INSERT INTO patients
    (first_name, last_name, last_visit)
VALUES
    ('Malcolm', 'Teel', '1/22/1998'),
    ('Emily', 'MacLean', '3/17/2005'),
    ('Isaiah', 'Wren', '12/25/2019'),
    ('Mia', 'Goth', '10/31/2022');

-- DISEASE TABLE
CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO diseases (name)
VALUES
    ('Syphalis'),
    ('Dengue'),
    ('Hepatitus'),
    ('Influenza');

-- VISITATION DATA TABLE
CREATE TABLE visit_data
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    disease_id INTEGER REFERENCES diseases
);

INSERT INTO visit_data
    (patient_id, doctor_id, disease_id)
VALUES
    (1,1,1),
    (1,2,1),
    (1,2,2),
    (2,1,3),
    (2,2,3),
    (2,3,3),
    (2,4,3),
    (3,3,4),
    (4,4,1),
    (4,4,2);