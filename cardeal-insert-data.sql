-- INSERT DATA INTO CARDEAL DATABASE

INSERT INTO customer (
	first_name,
	last_name,
	dob,
	payment_details,
	billing_address,
	email
) VALUES (
	'Dylan',
	'Smith',
	'1993-01-01',
	'4242 4242 4242 4242',
	'1313 Mockingbird Lane',
	'dylan82-smith@codingtemple.com'
), (
	'Gian',
	'Torres',
	'1994-02-02',
	'5353 5353 5353 5353',
	'42 Wallaby Way',
	'geanu@outlook.com'
), (
	'Padme',
	'Amidala',
	'1985-08-02',
	'4141 4141 4141 4141',
	'1 Royal Way',
	'padme_amidala@aol.com'
);

SELECT * FROM customer;