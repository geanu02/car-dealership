-- CREATE TABLES IN CARDEAL DATABASE

CREATE TABLE "car_make"(
    "car_make_id" SERIAL NOT NULL PRIMARY KEY,
    "make" VARCHAR(50) NOT NULL,
    "model" VARCHAR(50) NOT NULL
);

CREATE TABLE "address"(
    "address_id" SERIAL NOT NULL PRIMARY KEY,
    "address1" VARCHAR(255) NOT NULL,
    "address2" VARCHAR(255) NOT NULL,
    "district" VARCHAR(100) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "postal_code" SMALLINT NOT NULL
);

CREATE TABLE "mechanic"(
    "mechanic_id" SERIAL NOT NULL PRIMARY KEY,
    "m_last_name" VARCHAR(50) NOT NULL,
    "m_first_name" VARCHAR(50) NOT NULL,
    "m_email" VARCHAR(100) NOT NULL,
    "address_id" INTEGER NOT NULL,
    FOREIGN KEY("address_id") REFERENCES "address"("address_id")
);

CREATE TABLE "customer"(
    "customer_id" SERIAL NOT NULL PRIMARY KEY,
    "c_last_name" VARCHAR(50) NOT NULL,
    "c_first_name" VARCHAR(50) NOT NULL,
    "c_email" VARCHAR(100) NOT NULL,
    "address_id" INTEGER NOT NULL,
    FOREIGN KEY("address_id") REFERENCES "address"("address_id")
);

CREATE TABLE "dealership"(
    "dealership_id" SERIAL NOT NULL PRIMARY KEY,
    "address_id" BIGINT NOT NULL,
    "dealership_name" VARCHAR(150) NOT NULL,
    FOREIGN KEY("address_id") REFERENCES "address"("address_id")
);

CREATE TABLE "sales_person"(
    "sales_id" SERIAL NOT NULL PRIMARY KEY,
    "s_last_name" VARCHAR(50) NOT NULL,
    "s_first_name" VARCHAR(50) NOT NULL,
    "s_email" BIGINT NOT NULL,
    "address_id" INTEGER NOT NULL,
    FOREIGN KEY("address_id") REFERENCES "address"("address_id")
);

CREATE TABLE "car"(
    "car_id" SERIAL NOT NULL PRIMARY KEY,
    "car_make_id" INTEGER NOT NULL,
    "vin" VARCHAR(100) NOT NULL,
    "year" BIGINT NOT NULL,
    "color" BIGINT NOT NULL,
    FOREIGN KEY("car_make_id") REFERENCES "car_make"("car_make_id")
);

CREATE TABLE "service"(
    "service_id" SERIAL NOT NULL PRIMARY KEY,
    "dealership_id" INTEGER NOT NULL,
    "car_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "service_date" DATE NOT NULL,
    "due_date" DATE NOT NULL,
    FOREIGN KEY("car_id") REFERENCES "car"("car_id"),
    FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id"),
);

CREATE TABLE "car_inventory"(
    "car_inv_id" SERIAL NOT NULL PRIMARY KEY,
    "car_id" INTEGER NOT NULL,
    "dealership_id" INTEGER NOT NULL,
    "brand_new?" BOOLEAN NOT NULL,
    FOREIGN KEY("car_id") REFERENCES "car"("car_id"),
    FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id")
);

CREATE TABLE "car_sale"(
    "car_sale_id" SERIAL NOT NULL PRIMARY KEY,
    "car_inv_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "sales_id" INTEGER NOT NULL,
    "sale_date" DATE NOT NULL,
    FOREIGN KEY("car_inv_id") REFERENCES "car_inventory"("car_inv_id"),
    FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id"),
    FOREIGN KEY("sales_id") REFERENCES "sales_person"("sales_id")
);

CREATE TABLE "service_team"(
    "service_id" INTEGER NOT NULL,
    "mechanic_id" INTEGER NOT NULL,
    FOREIGN KEY("mechanic_id") REFERENCES "mechanic"("mechanic_id"),
    FOREIGN KEY("service_id") REFERENCES "service"("service_id")
);

CREATE TABLE "payment"(
    "payment_id" SERIAL NOT NULL PRIMARY KEY,
    "payment_date" DATE NOT NULL,
    "amount" DECIMAL(8, 2) NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "payment_method" VARCHAR(100) NOT NULL,
    "car_sale_id" INTEGER NULL,
    "service_id" INTEGER NULL,
    FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id"),
    FOREIGN KEY("service_id") REFERENCES "service"("service_id"),
    FOREIGN KEY("car_sale_id") REFERENCES "car_sale"("car_sale_id")
);