-- Create the database
CREATE DATABASE CarDealership;

-- Use the database
USE CarDealership;

-- Create tables
CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE Car (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    SerialNumber VARCHAR(50) UNIQUE,
    SalespersonID INT,
    CustomerID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    CustomerID INT,
    SalespersonID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    ServiceDate DATE,
    Description VARCHAR(255),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE Part (
    PartID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Cost DECIMAL(10, 2)
);

CREATE TABLE ServiceMechanic (
    ServiceID INT,
    MechanicID INT,
    PRIMARY KEY (ServiceID, MechanicID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
);

CREATE TABLE ServicePart (
    ServiceID INT,
    PartID INT,
    PRIMARY KEY (ServiceID, PartID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
    FOREIGN KEY (PartID) REFERENCES Part(PartID)
);
