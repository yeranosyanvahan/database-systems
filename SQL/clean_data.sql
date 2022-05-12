ALTER TABLE country
  DROP COLUMN column1;
  
ALTER TABLE station
  DROP COLUMN column1;
  
ALTER TABLE station
  RENAME COLUMN station_id TO id;

UPDATE station SET id = id - 10000;

ALTER TABLE country
	ADD PRIMARY KEY (country_code);
	
ALTER TABLE station
	ADD PRIMARY KEY (id);