CREATE TABLE Orders (
    order_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    customer_ID INT NOT NULL,
    payment_ID INT NOT NULL,
    FOREIGN KEY (customer_ID)
        REFERENCES customers (customer_ID),
    FOREIGN KEY (payment_ID)
        REFERENCES Payments (payment_ID),
    order_number INT NOT NULL,
    order_date DATE NOT NULL,
    order_ship_date DATE NOT NULL,
    shipper_ID INT NOT NULL,
    order_fulfilled BOOL NOT NULL,
    order_deleted BOOL NOT NULL,
    order_paid BOOL NOT NULL,
    order_payment_date DATE NOT NULL
);