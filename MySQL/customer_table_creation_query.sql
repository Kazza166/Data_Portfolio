CREATE TABLE Customers (
    customer_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    customer_first_name VARCHAR(255) NOT NULL,
    customer_last_name VARCHAR(255) NOT NULL,
    customer_address VARCHAR(255) NOT NULL,
    customer_address_2 VARCHAR(255),
    customer_city VARCHAR(255) NOT NULL,
    customer_state VARCHAR(255),
    customer_post_code VARCHAR(255) NOT NULL,
    customer_country VARCHAR(255) NOT NULL,
    customer_phone INT NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_credit_card INT,
    customer_credit_card_type VARCHAR(50),
    customer_cc_exp_mo INT(2),
    customer_cc_exp_year YEAR,
    customer_bill_address VARCHAR(255) NOT NULL,
    customer_bill_city VARCHAR(255) NOT NULL,
    customer_bill_state VARCHAR(255),
    customer_bill_post_code VARCHAR(255) NOT NULL,
    customer_bill_country VARCHAR(255) NOT NULL,
    customer_ship_address VARCHAR(255) NOT NULL,
    customer_ship_city VARCHAR(255) NOT NULL,
    customer_ship_state VARCHAR(255),
    customer_ship_post_code VARCHAR(255) NOT NULL,
    customer_ship_country VARCHAR(255) NOT NULL,
    customer_password VARCHAR(255) NOT NULL
);