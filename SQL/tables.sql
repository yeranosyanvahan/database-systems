CREATE TABLE train(
	id INTEGER PRIMARY KEY,
	train_type VARCHAR(50),
	status VARCHAR(50),
	num_of_seats INTEGER NOT NULL,
	speed INTEGER
);

CREATE TABLE station(
	id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	num_of_entries INTEGER NOT NULL,
	num_of_exits INTEGER NOT NULL,
	longitude DECIMAL(9,6) NOT NULL,
	latitude DECIMAL(8,6) NOT NULL,
	num_of_platforms INTEGER NOT NULL
);
	
CREATE TABLE passenger(
	id INTEGER PRIMARY KEY,
	name VARCHAR(70) NOT NULL,
	train_id INTEGER NOT NULL REFERENCES train(id)
);

CREATE TABLE seat(
	id INTEGER PRIMARY KEY,
	seat_class VARCHAR(20)
);

CREATE TABLE city(
	city_name INTEGER PRIMARY KEY,
	num_of_stations INTEGER,
	timezone
);

CREATE TABLE country(
	country_code INTEGER PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE staff(
	id INTEGER PRIMARY KEY,
	name VARCHAR(70)
);

CREATE TABLE shift(
	group_id INTEGER PRIMARY KEY,
	hours VARCHAR(50)
);

CREATE TABLE schedule(
	schedule_id INTEGER PRIMARY KEY,
	departure_station VARCHAR(50) NOT NULL,
	departure_time DATETIME NOT NULL, 
	arrival_station VARCHAR(50) NOT NULL,
	arrival_time DATETIME NOT NULL
);

CREATE TABLE ride(
	id INTEGER PRIMARY KEY,
	ride_date DATETIME NOT NULL
);

CREATE TABLE delay(
	id INTEGER PRIMARY KEY,
	new_dep_time DATETIME NOT NULL,
	new_arr_time DATETIME NOT NULL
);

CREATE TABLE accident(
	id INTEGER PRIMARY KEY,
	accident_type VARCHAR(50)
);

CREATE TABLE ticket(
	id INTEGER PRIMARY KEY,
	train_id INTEGER NOT NULL REFERENCES passenger(train_id)
	departure_station VARCHAR(50),
	departure_time DATETIME, 
	arrival_station VARCHAR(50),
	arrival_time DATETIME,
	staff_id INTEGER NOT NULL REFERENCES staff(id)
);