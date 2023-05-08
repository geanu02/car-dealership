-- FUNCTIONS and PROCEDURES

-- FUNCTION --

-- Change the Sales Person assigned to a Car Sale

SELECT *
FROM car_sale;

CREATE OR REPLACE FUNCTION update_sales_person(
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


-- PROCEDURE --

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
