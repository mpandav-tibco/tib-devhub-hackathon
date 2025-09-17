-- Description: The SQL statements to create the table in the database

CREATE TABLE sensor_data (
    sensor_id VARCHAR(255) NOT NULL,
    temperature REAL NOT NULL,
    pressure REAL NOT NULL,
    humidity REAL NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (sensor_id, timestamp)
);


-- Description: Tthe SQL statements to insert data into the table in the database
INSERT INTO sensor_data (sensor_id, temperature, pressure, humidity, timestamp)
    VALUES (?sensor_id, ?temperature, ?pressure, ?humidity, ?timestamp);


-- Description: The SQL statements to query the table and get the average temperature
SELECT avg(temperature)
FROM sensor_data
WHERE timestamp >= now() - interval '5 minutes';


