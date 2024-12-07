-- Таблица floor
CREATE TABLE floor (
    id SERIAL PRIMARY KEY,
    state VARCHAR(50),
    color VARCHAR(50)
);

-- Таблица egg
CREATE TABLE egg (
    id SERIAL PRIMARY KEY,
    state VARCHAR(50),
    contents VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES floor(id)
);

-- Таблица raptor
CREATE TABLE raptor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50),
    current_action VARCHAR(100)
);

-- Таблица human
CREATE TABLE human (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES floor(id)
);

-- Таблица aaction
CREATE TABLE aaction (
    id SERIAL PRIMARY KEY,
    action_type VARCHAR(50),
    target VARCHAR(50),
    raptor_name INT,
    spectator INT,
    FOREIGN KEY (raptor_name) REFERENCES raptor(id),
    FOREIGN KEY (spectator) REFERENCES human(id)
);

-- Таблица raptor_egg
CREATE TABLE raptor_egg (
    raptor_id INT,
    egg_id INT,
    type VARCHAR(50),
    time DATE,
    PRIMARY KEY (raptor_id, egg_id),
    FOREIGN KEY (raptor_id) REFERENCES raptor(id),
    FOREIGN KEY (egg_id) REFERENCES egg(id)
);

-- Добавить данные в floor
INSERT INTO floor (id, state, color) VALUES 
(1, 'clean', 'gray'),
(2, 'dirty', 'brown'),
(3, 'clean', 'white');

-- Добавить данные в egg
INSERT INTO egg (id, state, contents, location_id) VALUES 
(1, 'intact', 'raptor embryo', 1),
(2, 'cracked', 'empty', 2),
(3, 'hatched', 'raptor embryo', 3);

-- Добавить данные в raptor
INSERT INTO raptor (id, name, state, current_action) VALUES 
(1, 'blue', 'active', 'hunting'),
(2, 'charlie', 'inactive', 'resting'),
(3, 'delta', 'active', 'protecting');

-- Добавить данные в human
INSERT INTO human (id, name, location_id) VALUES 
(1, 'dr. grant', 1),
(2, 'dr. sattler', 2),
(3, 'dr. malcolm', 3);

-- Добавить данные в aaction
INSERT INTO aaction (id, action_type, target, raptor_name, spectator) VALUES 
(1, 'attack', 'egg', 1, 1), -- Используется raptor.id и human.id
(2, 'protect', 'nest', 2, 2),
(3, 'rest', 'cave', 3, 3);

-- Добавить данные в raptor_egg
INSERT INTO raptor_egg (raptor_id, egg_id, type, time) VALUES 
(1, 1, 'protecting', '2024-11-15'),
(2, 2, 'ignoring', '2024-11-14'),
(3, 3, 'hunting', '2024-11-13');
