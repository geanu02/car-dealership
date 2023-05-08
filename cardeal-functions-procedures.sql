-- FUNCTIONS and PROCEDURES

-- FUNCTIONS --

-- Insert Cars

SELECT *
FROM car;

CREATE OR REPLACE FUNCTION insert_car (
	_car_make_id INTEGER,
	_vin VARCHAR,
	_year INTEGER,
	_color VARCHAR
)
RETURNS void AS $$
	BEGIN
		INSERT INTO car (
			car_make_id,
			vin,
			year,
			color
		) VALUES (
			_car_make_id,
			_vin,
			_year,
			_color
		)
	END;
$$
LANGUAGE plpgsql;

INSERT INTO car (
	car_make_id,
	vin,
	year,
	color
) VALUES (
	1,
	'4Y1SL65848Z411450',
	2020,
	'slate'
), (
	5,
	'4Z1SL65848Z411455',
	2021,
	'honey'
), (
	6,
	'4A1SL65848Z411460',
	2022,
	'cinnabar'
);

SELECT insert_car(1,'4Y1SL65848Z411450',2020,'slate');
SELECT insert_car(5,'4Z1SL65848Z411455',2021,'honey');
SELECT insert_car(6,'4A1SL65848Z411460',2022,'cinnabar');

SELECT *
FROM car;

-- Insert Address

SELECT *
FROM address;

CREATE OR REPLACE FUNCTION add_address (
	_address1 VARCHAR,
	_address2 VARCHAR,
	_district VARCHAR,
	_city VARCHAR,
	_postal_code INTEGER
)
RETURNS void AS $$
	BEGIN
		INSERT INTO car (
			address1,
			address2,
			district,
			city,
			postal_code
		) VALUES (
			_address1,
			_address2,
			_district,
			_city,
			_postal_code
		)
	END;
$$
LANGUAGE plpgsql;

SELECT add_address('150 Jay St', 'Apt 2B', 'Brooklyn', 'New York City', 10321);
SELECT add_address('79 Carol Ave', '', 'Manhattan', 'New York City', 10101);
SELECT add_address('1334 Lars Way', 'Apt 98', 'Queens', 'New York City', 10221);

SELECT *
FROM address;

-- Change the Sales Person assigned to a Car Sale

SELECT *
FROM car_sale;

CREATE OR REPLACE FUNCTION update_sales_person (
	_car_sale_id INTEGER,
	_sales_id INTEGER
)
RETURNS void AS $$
	BEGIN
		UPDATE car_sale
		SET sales_id = _sales_id
		WHERE car_sale_id = _car_sale_id;
	END;
$$
LANGUAGE plpgsql;

SELECT *
FROM car_sale;

SELECT update_sales_person(2, 1);

-- PROCEDURES --

-- Assign Mechanic to a Service Team

SELECT *
FROM service_team;

CREATE OR REPLACE PROCEDURE assign_mechanic (
	_service_id INTEGER,
	_mechanic_id INTEGER
) AS $$ 
	BEGIN
		INSERT INTO service_team (
			service_id,
			mechanic_id
		) VALUES (
			_service_id,
			_mechanic_id
		);
		COMMIT;
	END;
$$
LANGUAGE plpgsql; 

CALL assign_mechanic(3, 1);
