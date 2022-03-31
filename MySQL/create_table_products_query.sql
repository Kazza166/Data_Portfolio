CREATE TABLE Products (
    product_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    supplier_ID INT NOT NULL,
    category_ID INT NOT NULL,
    FOREIGN KEY (supplier_ID)
        REFERENCES Supplier (supplier_ID),
    FOREIGN KEY (category_ID)
        REFERENCES Category (category_ID),
    product_name VARCHAR(255) NOT NULL,
    product_SKU INT NOT NULL,
    product_description LONGTEXT NOT NULL,
    product_quantity INT NOT NULL,
    product_MSRP DOUBLE(40 , 2 ) NOT NULL,
    product_price DOUBLE(40 , 2 ) NOT NULL,
    product_size INT NOT NULL,
    product_colour VARCHAR(50),
    product_weight INT NOT NULL,
    product_reorder_level INT NOT NULL,
    product_amount_in_stock INT NOT NULL,
    product_available BOOL NOT NULL,
    product_amount_on_order INT NOT NULL,
    product_ranking INT NOT NULL
);