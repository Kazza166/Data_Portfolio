CREATE TABLE OrderDetails (
    orderd_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    order_ID INT NOT NULL,
    product_ID INT NOT NULL,
    FOREIGN KEY (order_ID)
        REFERENCES Orders (order_ID),
    FOREIGN KEY (product_ID)
        REFERENCES Products (product_ID),
    orderd_number INT NOT NULL,
    orderd_price DOUBLE(20 , 2 ) NOT NULL,
    order_d_qauntity INT NOT NULL,
    orderd_total DOUBLE(40 , 2 ) NOT NULL,
    orderd_size INT NOT NULL,
    orderd_colour VARCHAR(50),
    orderd_fulfilled BOOL NOT NULL,
    orderd_ship_date DATE NOT NULL,
    orderd_bill_date DATE NOT NULL
)
;