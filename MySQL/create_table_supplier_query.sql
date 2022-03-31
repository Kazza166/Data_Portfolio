CREATE TABLE Supplier (
    supplier_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    supplier_name VARCHAR(255) NOT NULL,
    supplier_address VARCHAR(255) NOT NULL,
    supplier_city VARCHAR(255) NOT NULL,
    supplier_state VARCHAR(255),
    supplier_post_code VARCHAR(255) NOT NULL,
    supplier_country VARCHAR(255) NOT NULL,
    supplier_phone INT NOT NULL,
    supplier_email VARCHAR(255) NOT NULL,
    supplier_url VARCHAR(500)
);