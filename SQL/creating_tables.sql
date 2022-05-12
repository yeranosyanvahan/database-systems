drop table if exists Passenger cascade;
drop table if exists Schedule cascade;
drop table if exists Delay cascade;
drop table if exists Accident cascade;
drop table if exists Train cascade;
drop table if exists Seat cascade;
drop table if exists Ticket cascade;
drop table if exists Staff cascade;
drop table if exists Shift cascade;


create TABLE Train(
	id INTEGER PRIMARY KEY,
	train_type VARCHAR(100),
	status VARCHAR(100),
	num_of_seats INTEGER NOT NULL,
	"speed(km/h)" INTEGER
);

create table Passenger(
    id integer primary key,
    name_surname varchar(100) not null,
    train_id integer not null references Train(id)
);

CREATE TABLE Seat(
	id INTEGER PRIMARY KEY,
	seat_class VARCHAR(100),
	train_id integer not null references Train(id)
);

CREATE TABLE Shift(
	id INTEGER PRIMARY KEY,
	hours timestamp not null --?
);

CREATE TABLE Staff(
	id INTEGER PRIMARY KEY,
	name_surname VARCHAR(100),
	group_id integer not null references Shift(id),
	station_id integer not null references Station(id)
);

CREATE TABLE Schedule(
	id INTEGER PRIMARY KEY,
	departure_station VARCHAR(100) NOT NULL,
	departure_time timestamp NOT NULL, 
	arrival_station VARCHAR(100) NOT NULL,
	arrival_time timestamp NOT null,
	train_id integer not null references Train(id)
);

CREATE TABLE Delay(
	id INTEGER PRIMARY KEY,
	new_dep_time timestamp NOT NULL,
	new_arr_time timestamp NOT null,
	schedule_id integer not null references Schedule(id)
);

CREATE TABLE Accident(
	id INTEGER PRIMARY KEY,
	accident_type VARCHAR(100)
);

CREATE TABLE Ticket(
	id INTEGER PRIMARY KEY,
	passenger_id integer not null references Passenger(id),
	
	--inch klini ete grem es taki meky, en taki mnacaci texy?????
	--schedule_id integer not null references Schedule(id),
	-- stexic
	train_id INTEGER NOT NULL REFERENCES Train(id), --Train(id)  ?????????
	departure_station VARCHAR(100),
	departure_time timestamp, 
	arrival_station VARCHAR(100),
	arrival_time timestamp,
	-- minchev stex
	
	staff_id INTEGER NOT NULL REFERENCES Staff(id)
);