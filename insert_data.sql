-- Insert Salesperson
INSERT INTO Salesperson (Name, ContactInfo) VALUES ('Jane Doe', 'jane@example.com');
INSERT INTO Salesperson (Name, ContactInfo) VALUES ('John Smith', 'john@example.com');

-- Stored function to add a customer
DELIMITER //
CREATE FUNCTION AddCustomer(custName VARCHAR(100), contact VARCHAR(100))
RETURNS INT
BEGIN
    INSERT INTO Customer (Name, ContactInfo) VALUES (custName, contact);
    RETURN LAST_INSERT_ID();
END;
//
DELIMITER ;

-- Insert Customer using the function
SELECT AddCustomer('Alice Johnson', 'alice@example.com');
SELECT AddCustomer('Bob Brown', 'bob@example.com');

-- Insert Cars
INSERT INTO Car (Make, Model, Year, SerialNumber, SalespersonID, CustomerID) VALUES ('Toyota', 'Corolla', 2020, 'ABC123', 1, 1);
INSERT INTO Car (Make, Model, Year, SerialNumber, SalespersonID, CustomerID) VALUES ('Honda', 'Civic', 2019, 'DEF456', 2, 2);

-- Insert Invoices
INSERT INTO Invoice (CarID, CustomerID, SalespersonID, SaleDate, Amount) VALUES (1, 1, 1, '2023-01-15', 20000.00);
INSERT INTO Invoice (CarID, CustomerID, SalespersonID, SaleDate, Amount) VALUES (2, 2, 2, '2023-02-20', 18000.00);

-- Insert Services
INSERT INTO Service (CarID, ServiceDate, Description, Cost) VALUES (1, '2023-03-10', 'Oil Change', 50.00);
INSERT INTO Service (CarID, ServiceDate, Description, Cost) VALUES (2, '2023-03-15', 'Brake Replacement', 200.00);

-- Insert Mechanics
INSERT INTO Mechanic (Name, ContactInfo) VALUES ('Mike Wazowski', 'mike@example.com');
INSERT INTO Mechanic (Name, ContactInfo) VALUES ('Sulley Sullivan', 'sulley@example.com');

-- Insert Parts
INSERT INTO Part (Name, Cost) VALUES ('Oil Filter', 10.00);
INSERT INTO Part (Name, Cost) VALUES ('Brake Pads', 40.00);

-- Associate Services with Mechanics and Parts
INSERT INTO ServiceMechanic (ServiceID, MechanicID) VALUES (1, 1);
INSERT INTO ServiceMechanic (ServiceID, MechanicID) VALUES (2, 2);
INSERT INTO ServicePart (ServiceID, PartID) VALUES (1, 1);
INSERT INTO ServicePart (ServiceID, PartID) VALUES (2, 2);
