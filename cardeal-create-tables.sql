-- CREATE TABLES IN CARDEAL DATABASE

CREATE TABLE "customer"(
    "cust_id" SERIAL PRIMARY KEY,
    "last_name" VARCHAR(75),
    "first_name" VARCHAR(75),
    "dob" DATE,
    "payment_details" VARCHAR(255),
    "billing_address" BIGINT
);