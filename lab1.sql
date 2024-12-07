-- таблица raptor
create table raptor (
    id serial primary key,
    name varchar(50),
    state varchar(50),
    current_action varchar(100),
    foreign key (id) references action(raptor_name)
);

-- таблица egg
create table egg (
    id serial primary key,
    state varchar(50),
    contents varchar(50),
    location_id int,
    foreign key (location_id) references floor(id)
);

-- таблица floor
create table floor (
    id serial primary key,
    state varchar(50),
    color varchar(50),
    foreign key (egg_id) references egg(id)
);

-- таблица raptor_egg (связь "многие-ко-многим" между raptor и egg)
create table raptor_egg (
    raptor_id int,
    egg_id int,
    type varchar(50),
    time date,
    primary key (raptor_id, egg_id),
    foreign key (raptor_id) references raptor(id),
    foreign key (egg_id) references egg(id)        
);

-- таблица human
create table human (
    id serial primary key,
    name varchar(50),
    location_id int,
    foreign key (location_id) references floor(id) 
);

-- таблица action
create table action (
    id serial primary key,
    action_type varchar(50),
    target varchar(50),
    raptor_name varchar(50),
    spectator varchar(50),
    foreign key(spectator) references human(id)
);

-- заполнение таблицы raptor
insert into raptor (id, name, state, current_action) values (1, 'blue', 'active', 'hunting');
insert into raptor (id, name, state, current_action) values (2, 'charlie', 'inactive', 'resting');
insert into raptor (id, name, state, current_action) values (3, 'delta', 'active', 'protecting');

-- заполнение таблицы egg
insert into egg (id, state, contents, location_id) values (1, 'intact', 'raptor embryo', 1);
insert into egg (id, state, contents, location_id) values (2, 'cracked', 'empty', 2);
insert into egg (id, state, contents, location_id) values (3, 'hatched', 'raptor embryo', 3);

-- заполнение таблицы floor
insert into floor (id, state, color) values (1, 'clean', 'gray');
insert into floor (id, state, color) values (2, 'dirty', 'brown');
insert into floor (id, state, color) values (3, 'clean', 'white');

-- заполнение таблицы action
insert into action (id, action_type, target, raptor_name, spectator) values (1, 'attack', 'egg', 'blue', '1');
insert into action (id, action_type, target, raptor_name, spectator) values (2, 'protect', 'nest', 'charlie', '2');
insert into action (id, action_type, target, raptor_name, spectator) values (3, 'rest', 'cave', 'delta', 'none');

-- заполнение таблицы human
insert into human (id, name, location_id) values (1, 'dr. grant', 1);
insert into human (id, name, location_id) values (2, 'dr. sattler', 2);
insert into human (id, name, location_id) values (3, 'dr. malcolm', 3);

-- заполнение таблицы raptor_egg
insert into raptor_egg (raptor_id, egg_id, type, time) values (1, 1, 'protecting', '2024-11-15');
insert into raptor_egg (raptor_id, egg_id, type, time) values (2, 2, 'ignoring', '2024-11-14');
insert into raptor_egg (raptor_id, egg_id, type, time) values (3, 3, 'hunting', '2024-11-13');
