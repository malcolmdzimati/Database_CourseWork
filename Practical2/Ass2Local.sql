CREATE DATABASE u20456078_CARRENTALS;

USE u20456078_CARRENTALS;

/*Creating Tables*/
CREATE TABLE Customer(
		CustomerID INTEGER,
        Name VARCHAR(45),
        Surname VARCHAR(45),
        Title varchar(4),
        Address VARCHAR(45),
        
        CONSTRAINT CUPK
			primary key(CustomerID)
);

CREATE TABLE Cars(
		CarID INTEGER,
        Description VARCHAR(45),
        YearModel INTEGER(4),
        
        CONSTRAINT CAPK
			PRIMARY KEY (CarID)
            
);

CREATE TABLE Motorbikes(
		BikeID INTEGER,
        Type VARCHAR(45),
        YearModel INTEGER(4),
        
        CONSTRAINT MBPK
			PRIMARY KEY (BikeID)
);

CREATE TABLE Customer_Bike(
		CustID INTEGER,
        BID INTEGER,
		RentedDate DATE,
        
        CONSTRAINT CBFKMB
			foreign key(BID) REFERENCES Motorbikes(BikeID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE,
            
		CONSTRAINT CBFKCU
			foreign key(CustID) REFERENCES Customer(CustomerID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Customer_Car(
		CustID INTEGER,
        CID INTEGER,
		RentedDate DATE,
        
        CONSTRAINT CCFKCA
			foreign key(CID) REFERENCES Cars(CarID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE,
            
		CONSTRAINT CCFKCU
			foreign key(CustID) REFERENCES Customer(CustomerID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Returned_Car(
		CustID INTEGER,
        CID INTEGER,
        ReturnedDate Date,
        
        CONSTRAINT RCFKCA
			foreign key(CID) REFERENCES Cars(CarID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE,
            
		CONSTRAINT RCFKCU
			foreign key(CustID) REFERENCES Customer(CustomerID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Returned_Bike(
		CustID INTEGER,
        BID INTEGER,
		ReturnedDate DATE,
        
        CONSTRAINT RBFKMB
			foreign key(BID) REFERENCES Motorbikes(BikeID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE,
            
		CONSTRAINT RBFKCU
			foreign key(CustID) REFERENCES Customer(CustomerID) 
			ON DELETE SET NULL 		ON UPDATE CASCADE
);

/*Adding Customer Constraints*/
ALTER TABLE Customer
ADD CONSTRAINT CUFKCC
			foreign key(CustomerID) REFERENCES Customer_Car(CustID);
            
ALTER TABLE Customer
ADD CONSTRAINT CUFKCB
			foreign key(CustomerID) REFERENCES Customer_Bike(CustID);
            
ALTER TABLE Customer
ADD CONSTRAINT CUFKRC
			foreign key(CustomerID) REFERENCES Returned_Car(CustID);
            
ALTER TABLE Customer
ADD CONSTRAINT CUFKEB
			foreign key(CustomerID) REFERENCES Returned_Bike(CustID);
            
            
            
/*Adding Car Contraints*/
ALTER TABLE Cars
ADD CONSTRAINT CAFKCC
			FOREIGN KEY (CarID) REFERENCES Customer_Car(CID);

ALTER TABLE Cars
ADD CONSTRAINT CAFKRC
			FOREIGN KEY (CarID) REFERENCES Returned_Car(CID);
            
            
            
/*Adding Bike Constraints*/
ALTER TABLE Motorbikes
ADD CONSTRAINT MBFKCB
			FOREIGN KEY (BikeID) REFERENCES Customer_Bike(BID);
	
ALTER TABLE Motorbikes
ADD CONSTRAINT MBFKRB
			FOREIGN KEY (BikeID) REFERENCES Returned_Bike(BID);
            
USE u20456078_CARRENTALS;
/*Inserting data*/
INSERT INTO Customer VALUES('1','Mohammed', 'Abraham', 'Mr', '2 Jean Drive');
INSERT INTO Customer VALUES('2','Abby', 'Smith', 'Ms', '514 Mackenzie St');
INSERT INTO Customer VALUES('3','Refiloe', 'Molete', 'Mrs', '6 Joker St');
INSERT INTO Customer VALUES('4','Corlize', 'Van Heerden', 'Ms', '12 Lotus Ave');
INSERT INTO Customer VALUES('5','Simone', 'Fourie', 'Dr', '2 Duncan St');
INSERT INTO Customer VALUES('6','Samantha', 'Hanna', 'Mrs', '34 Lynwood St');
INSERT INTO Customer VALUES('7','Rebecca', 'Duncan', 'Ms', '111 Bondev Drive');
INSERT INTO Customer VALUES('8','Gary', 'Lou', 'Mr', '5555 Rands St');
INSERT INTO Customer VALUES('9','Ronald', 'Wang', 'Prof', '65 Quinton Ave');
INSERT INTO Customer VALUES('10','Fatima', 'Vallee', 'Ms', '987 Sabie Road');
INSERT INTO Customer VALUES('11','Thando', 'Moloi', 'Dr', '9 Lira St');
INSERT INTO Customer VALUES('12','Sphesihle', 'Mangena', 'Ms', '3333 Warden St');
INSERT INTO Customer VALUES('13','Daniel', 'Alberts', 'Mrs', '3 Peso St');
INSERT INTO Customer VALUES('14','Jason', 'Mackenzie', 'Mr', '98 Theo St');
INSERT INTO Customer VALUES('15','CustomerMichael', 'Nouwens', 'Mr', '18 De Villiers St');

INSERT INTO Cars VALUES('1', 'Red Mercedez AMG', '2020');
INSERT INTO Cars VALUES('2', 'White BMW X5', '2017');
INSERT INTO Cars VALUES('3', 'Grey Mini Copper JCW', '2020');
INSERT INTO Cars VALUES('4', 'Silver Toyota Corolla', '2015');
INSERT INTO Cars VALUES('5', 'Yellow Honda Jazz Sport', '2021');
INSERT INTO Cars VALUES('6', 'Blue Nissan Amra', '2018');
INSERT INTO Cars VALUES('7', 'Orange Toyota Hilux', '2020');

INSERT INTO Motorbikes VALUES('1', 'Ducati V4S', '2021');
INSERT INTO Motorbikes VALUES('2', 'BMW S1000RR', '2020');
INSERT INTO Motorbikes VALUES('3', 'Honda Fireblade SP', '2018');
INSERT INTO Motorbikes VALUES('4', 'Yamaha YZF-R1M', '2015');
INSERT INTO Motorbikes VALUES('5', 'Kawasaki Ninja H2', '2017');
INSERT INTO Motorbikes VALUES('6', 'Kawasaki ZX-10R SE', '2019');
INSERT INTO Motorbikes VALUES('7', 'Yamaha YZF-R1', '2020');

INSERT INTO Returned_Bike VALUES('4', '2', '2020/12/14');
INSERT INTO Returned_Bike VALUES('9', '4', '2020/08/06');
INSERT INTO Returned_Bike VALUES('15', '6', '2021/02/14');
INSERT INTO Returned_Bike VALUES('14', '7', '2021/01/11');

INSERT INTO Returned_Car VALUES('4', '2', '2020/12/14');
INSERT INTO Returned_Car VALUES('8', '3', '2020/02/16');
INSERT INTO Returned_Car VALUES('9', '4', '2020/08/06');
INSERT INTO Returned_Car VALUES('4', '7', '2020/12/14');

INSERT INTO Customer_Car VALUES('1', '1', '2021/11/11');
INSERT INTO Customer_Car VALUES('4', '2', '2020/11/09');
INSERT INTO Customer_Car VALUES('8', '3', '2020/02/14');
INSERT INTO Customer_Car VALUES('9', '4', '2020/06/06');
INSERT INTO Customer_Car VALUES('14', '5', '2021/11/11');
INSERT INTO Customer_Car VALUES('1', '6', '2021/01/01');
INSERT INTO Customer_Car VALUES('4', '7', '2020/11/09');

INSERT INTO Customer_Bike VALUES('1', '1', '2021/11/11');
INSERT INTO Customer_Bike VALUES('4', '2', '2020/12/10');
INSERT INTO Customer_Bike VALUES('8', '3', '2020/08/14');
INSERT INTO Customer_Bike VALUES('9', '4', '2020/07/06');
INSERT INTO Customer_Bike VALUES('14', '5', '2021/11/11');
INSERT INTO Customer_Bike VALUES('15', '6', '2020/11/11');
INSERT INTO Customer_Bike VALUES('14', '7', '2020/11/11');

/*Queries*/

/*1*/
SELECT C.Name, COUNT(CC.CustID) AS Rented_Cars 
	FROM Customer AS C INNER JOIN Customer_Car AS CC
		ON C.CustomerID=CC.CustID
    GROUP BY C.CustomerID
    HAVING Rented_Cars>1;
    
/*2*/
SELECT Type, MIN(YearModel) AS YearModel
	FROM Motorbikes;
    
/*3*/
SELECT C.* 
	FROM (Customer AS C INNER JOIN Customer_Bike AS CB
		ON C.CustomerID=CB.CustID) LEFT JOIN Customer_Car AS CC
        ON C.CustomerID=CC.CustID
	WHERE CC.CustID IS NULL;
    
/*4*/
SELECT C.*
	FROM Customer AS C LEFT JOIN Customer_Car AS CC
        ON C.CustomerID=CC.CustID
	WHERE CC.CustID IS NULL;
    
/*5*/
SELECT *
	FROM Cars
    WHERE YearModel='2020';
    
/*6*/
SELECT MB.Type
	FROM (Customer AS C INNER JOIN Customer_Bike AS CB
		ON C.CustomerID=CB.CustID) INNER JOIN Motorbikes AS MB
        ON CB.BID=MB.BikeID
	WHERE C.Surname='Mackenzie' AND MB.YearModel='2020';

/*7*/
SELECT C.Name
	FROM (Customer AS C INNER JOIN Customer_Bike AS CB
            ON C.CustomerID=CB.CustID ) LEFT JOIN Returned_Bike AS RB
			ON C.CustomerID=RB.CustID
        WHERE RB.ReturnedDate IS NULL 
			AND CB.RentedDate=(SELECT RentedDate 
								FROM Customer_Bike INNER JOIN Motorbikes 
									ON BID=BikeID
								WHERE Type='Kawasaki ZX-10R SE');