-- INSERT DATA INTO CARDEAL DATABASE

INSERT INTO address (
	address1,
	address2,
	district,
	city,
	postal_code
) VALUES (
	'1313 Mockingbird Lane',
	'1st Floor',
	'Brooklyn',
	'New York City',
	10201
), (
	'1313 Mockingbird Lane',
	'2nd Floor',
	'Brooklyn',
	'New York City',
	10201
), (
	'42 Wallaby Way',
	'Apt 9',
	'Queens',
	'New York City',
	11233
), (
	'1 Royal Way',
	'',
	'Manhattan',
	'New York City',
	10001
), (
	'456 Reece St',
	'4th Floor',
	'The Bronx',
	'New York City',
	14311
), (
	'1050 Benton St',
	'Apt 1C',
	'Staten Island',
	'New York City',
	12113
), (
	'78 Dayanara St',
	'Suite 5',
	'Manhattan',
	'New York City',
	10010
), (
	'2 Wall St',
	'The Penbrooke',
	'Manhattan',
	'New York City',
	10001
), (
	'1160 Oppenheimer Ct',
	'Studio 4',
	'Brooklyn',
	'New York City',
	11511
), (
	'44 Cinderace Dr',
	'The Penthouse',
	'Queens',
	'New York City',
	12003
), (
	'165 Gwyneth St',
	'Apt 4',
	'Brooklyn',
	'New York City',
	11213
);

INSERT INTO car_make (
	make,
	model
) VALUES (
	'Nissan',
	'Altima'
), (
	'Toyota',
	'Corolla'
), (
	'Tesla',
	'Model 3'
), (
	'Hyundai',
	'Elantra'
), (
	'Honda',
	'Civic'
), (
	'Porsche',
	'Cayenne'
), (
	'Mercedes Benz',
	'G63'
), (
	'Mercedes Benz',
	'E300'
), (
	'Mercedes Benz',
	'C300'
);

SELECT * FROM car_make;

INSERT INTO dealership (
	address_id,
	dealership_name
) VALUES (
	4,
	'Mercedes Benz of Chinatown'
), (
	7,
	'Mercedes Benz of Upper East Side'
), (
	1,
	'Mercedes Benz of Bedford-Stuyvesant'
);

SELECT * FROM dealership;

INSERT INTO mechanic (
	m_last_name,
	m_first_name,
	m_email,
	address_id
) VALUES (
	'Delano',
	'Adore',
	'adore_cilantro@gmail.com',
	2
), (
	'Coriander',
	'Hunty',
	'hunts_tomaten@yahoo.com',
	5
), (
	'Padme',
	'Amidala',
	'padme_amidala@aol.com',
	6
);

SELECT * FROM mechanic;

INSERT INTO sales_person (
	s_last_name,
	s_first_name,
	s_email,
	address_id
) VALUES (
	'Williams',
	'Nina',
	'nina.williams@tekken.net',
	9
), (
	'Williams',
	'Anna',
	'anna.williams@tekken.net',
	9
), (
	'Major',
	'Purita',
	'pfawcettmajors@nycmail.com',
	3
);

SELECT * FROM sales_person;

INSERT INTO customer (
	c_last_name,
	c_first_name,
	c_email,
	address_id
) VALUES (
	'Lodge',
	'Veronica',
	'vlodge@outlook.com',
	8
), (
	'Versace',
	'Donatella',
	'donatella@versace.com',
	10
), (
	'Jessica Parker',
	'Sarah',
	'sjp@nycmail.com',
	11
);

SELECT * FROM customer;

INSERT INTO car (
	car_make_id,
	vin,
	year,
	color
) VALUES (
	7,
	'4Y1SL65848Z411439',
	2022,
	'ash'
), (
	7,
	'4Z1SL65848Z411440',
	2022,
	'wine'
), (
	7,
	'4A1SL65848Z411441',
	2022,
	'shadow'
), (
	8,
	'4Y1SL65848Z411442',
	2022,
	'porpoise'
), (
	8,
	'4Z1SL65848Z411443',
	2022,
	'crimson'
), (
	8,
	'4A1SL65848Z411444',
	2022,
	'slate'
), (
	9,
	'4Y1SL65848Z411445',
	2022,
	'pewter'
), (
	9,
	'4Z1SL65848Z411446',
	2022,
	'burgundy'
), (
	9,
	'4A1SL65848Z411447',
	2022,
	'charcoal'
), (
	2,
	'4Y1SL65848Z411445',
	2003,
	'pearl'
), (
	3,
	'4Z1SL65848Z411446',
	2013,
	'garlet'
), (
	4,
	'4A1SL65848Z411447',
	2016,
	'fossil'
);

SELECT * FROM car;

INSERT INTO service (
	dealership_id,
	car_id,
	customer_id,
	service_date,
	due_date
) VALUES (
	3,
	10,
	1,
	'2023-04-01',
	'2023-04-16'
), (
	1,
	12,
	1,
	'2023-04-01',
	'2023-04-20'
), (
	1,
	11,
	3,
	'2023-04-09',
	'2023-04-27'
);

SELECT * FROM service;

INSERT INTO car_inventory (
	car_id,
	dealership_id,
	"brand_new?"
) VALUES 
(1,1,True),(4,1,True),(7,1,False),
(2,2,True),(5,2,True),(8,2,False),
(3,3,True),(6,3,True),(9,3,False);

SELECT * FROM car_inventory;

INSERT INTO car_sale (
	car_inv_id,
	customer_id,
	sales_id,
	sale_date
) VALUES (
	2,
	2,
	1,
	'2023-03-22'
), (
	4,
	3,
	3,
	'2023-03-25'
), (
	8,
	1,
	2,
	'2023-04-01'
);

SELECT * FROM car_sale;

INSERT INTO service_team (
	service_id,
	mechanic_id
) VALUES 
(1,1),(1,2),(2,1),(2,2),(3,3);

SELECT * FROM service_team;

INSERT INTO payment (
	payment_date,
	amount,
	customer_id,
	payment_method,
	car_sale_id,
	service_id
) VALUES (
	'2023-03-02',
	24000,
	2,
	'Downpayment',
	1,
	NULL
), (
	'2023-04-01',
	300,
	1,
	'Credit Card',
	NULL,
	1
), (
	'2023-03-25',
	36000,
	3,
	'Credit Card',
	2,
	NULL
), (
	'2023-04-01',
	1200,
	1,
	'Cash',
	NULL,
	2
), (
	'2023-04-01',
	56000,
	1,
	'Check',
	3,
	NULL
), (
	'2023-04-09',
	600,
	3,
	'Credit Card',
	NULL,
	3
);

SELECT * FROM payment;