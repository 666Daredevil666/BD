-- Таблица Raptor
CREATE TABLE Raptor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50),
    current_action VARCHAR(100)
    FOREIGN KEY (id) REFERENCES Action(raptor_name)
);

-- Таблица Egg
CREATE TABLE Egg (
    id SERIAL PRIMARY KEY,
    state VARCHAR(50),
    contents VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Floor(id)
);

-- Таблица Floor
CREATE TABLE Floor (
    id SERIAL PRIMARY KEY,
    state VARCHAR(50),
    color VARCHAR(50),
    FOREIGN KEY (egg_id) REFERENCES Egg(id)
);

-- Таблица Raptor_Egg (Связь "многие-ко-многим" между Raptor и Egg)
CREATE TABLE Raptor_Egg (
    raptor_id INT,
    egg_id INT,
    type VARCHAR(50),
    time DATE,
    PRIMARY KEY (raptor_id, egg_id),
    FOREIGN KEY (raptor_id) REFERENCES Raptor(id),
    FOREIGN KEY (egg_id) REFERENCES Egg(id)        
);

-- Таблица Human
CREATE TABLE Human (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Floor(id) 
);

-- Таблица Action
CREATE TABLE Action (
    id SERIAL PRIMARY KEY,
    action_type VARCHAR(50),
    target VARCHAR(50),
    raptor_name VARCHAR(50),
    spectator VARCHAR(50)
    FOREIGN KEY(spectator) REFERENCES Human(id)
);

-- Заполнение таблицы Raptor
INSERT INTO Raptor (id, name, state, current_action) VALUES (1, 'Blue', 'Active', 'Hunting');
INSERT INTO Raptor (id, name, state, current_action) VALUES (2, 'Charlie', 'Inactive', 'Resting');
INSERT INTO Raptor (id, name, state, current_action) VALUES (3, 'Delta', 'Active', 'Protecting');

-- Заполнение таблицы Egg
INSERT INTO Egg (id, state, contents, location) VALUES (1, 'Intact', 'Raptor Embryo', 'Floor');
INSERT INTO Egg (id, state, contents, location) VALUES (2, 'Cracked', 'Empty', 'Forest');
INSERT INTO Egg (id, state, contents, location) VALUES (3, 'Hatched', 'Raptor Embryo', 'Lab');

-- Заполнение таблицы Floor
INSERT INTO Floor (id, state, color) VALUES (1, 'Clean', 'Gray');
INSERT INTO Floor (id, state, color) VALUES (2, 'Dirty', 'Brown');
INSERT INTO Floor (id, state, color) VALUES (3, 'Clean', 'White');

-- Заполнение таблицы Action
INSERT INTO Action (id, action_type, target, raptor_name, spectator) VALUES (1, 'Attack', 'Egg', 'Blue', 'Human');
INSERT INTO Action (id, action_type, target, raptor_name, spectator) VALUES (2, 'Protect', 'Nest', 'Charlie', 'Human');
INSERT INTO Action (id, action_type, target, raptor_name, spectator) VALUES (3, 'Rest', 'Cave', 'Delta', 'None');

-- Заполнение таблицы Grant
INSERT INTO Human (id, name, location) VALUES (1, 'Dr. Grant', 'Floor');
INSERT INTO Human (id, name, location) VALUES (2, 'Dr. Sattler', 'Field Station');
INSERT INTO Human (id, name, location) VALUES (3, 'Dr. Malcolm', 'Observation Post');

-- Заполнение таблицы Raptor_Egg
INSERT INTO Raptor_Egg (raptor_id, egg_id, type, time) VALUES (1, 1, 'Protecting', '2024-11-15');
INSERT INTO Raptor_Egg (raptor_id, egg_id, type, time) VALUES (2, 2, 'Ignoring', '2024-11-14');
INSERT INTO Raptor_Egg (raptor_id, egg_id, type, time) VALUES (3, 3, 'Hunting', '2024-11-13');
