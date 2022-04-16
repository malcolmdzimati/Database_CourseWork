CREATE DATABASE  IEC_VotingSystem;

USE IEC_VotingSystem;

CREATE TABLE Person(
	National_Id VARCHAR(13) UNIQUE NOT NULL,
    Last_Name VARCHAR(45),
    First_Name VARCHAR(45),
    Initials VARCHAR(5),
    Sex VARCHAR(1),
    Birth_Date Date,
    Address VARCHAR(50),
    has_Voted boolean,
    Ward_Num VARCHAR(8),
    UPassword VARCHAR(20),
    
    CONSTRAINT PPK
			primary key(National_Id)
);

CREATE TABLE Electoral_Staff(
	Emp_Id VARCHAR(6) UNIQUE NOT NULL,
    Job_Title VARCHAR(30),
    Department VARCHAR(30),
    National_Id VARCHAR(13) UNIQUE,
    
    CONSTRAINT EIPK
			primary key(Emp_Id),
	
    CONSTRAINT ESFKP
			foreign key(National_Id) REFERENCES Person(National_Id) 
				ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Independent_Candidate(
	National_Id VARCHAR(13) UNIQUE,
    
    CONSTRAINT ICFKP
			foreign key(National_Id) REFERENCES Person(National_Id) 
				ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Party_Member(
	National_Id VARCHAR(13) UNIQUE,
    Party VARCHAR(10) UNIQUE,
    
    CONSTRAINT PMFKP
			foreign key(National_Id) REFERENCES Person(National_Id) 
				ON DELETE SET NULL 		ON UPDATE CASCADE,
                
	CONSTRAINT PMFKCP
			foreign key(Party) REFERENCES Candidate_Party(Party) 
				ON DELETE SET NULL 		ON UPDATE CASCADE
);

CREATE TABLE Candidate_Party(
	PName VARCHAR(50),
    Party VARCHAR(10),
	Votes INTEGER,
    
    CONSTRAINT PPK
			primary key(Party)
);

CREATE TABLE Individual_Contestant(
	National_Id VARCHAR(13) UNIQUE,
    Ward_Num VARCHAR(8),
	Votes INTEGER,
    Post VARCHAR(20),
    
    CONSTRAINT ICOFKIC
			foreign key(National_Id) REFERENCES Independent_Candidate(National_Id) 
				ON DELETE CASCADE 		ON UPDATE CASCADE,
                
	CONSTRAINT ICOFKW
			foreign key(Ward_Num) REFERENCES Ward(Ward_Num) 
				ON DELETE CASCADE 		ON UPDATE CASCADE,
                
	CONSTRAINT ICFKPM
			foreign key(National_Id) REFERENCES Party_Member(National_Id) 
				ON DELETE CASCADE 		ON UPDATE CASCADE
);

ALTER TABLE Person
ADD CONSTRAINT PFKW
			foreign key(Ward_Num) REFERENCES Ward(Ward_Num);

CREATE TABLE Municipality(
	MDB_Code VARCHAR(20),
    MName VARCHAR(50),
    MType VARCHAR(20),
    Province VARCHAR(30),
    Num_Of_Seats int,
    
    CONSTRAINT MPK
			primary key(MDB_Code)
);

CREATE TABLE Running_For(
	MDB_Code VARCHAR(20),
    Party VARCHAR(10),
    
    CONSTRAINT RFFKCP
			foreign key(Party) REFERENCES Candidate_Party(Party) 
				ON DELETE CASCADE 		ON UPDATE CASCADE,
                
	CONSTRAINT RFFKM
			foreign key(MDB_Code) REFERENCES Municipality(MDB_Code) 
				ON DELETE CASCADE 		ON UPDATE CASCADE
);

CREATE TABLE Ward(
	Ward_Num VARCHAR(8) UNIQUE,
    MDB_Code VARCHAR(20)  UNIQUE,
	
    CONSTRAINT WPK
			primary key(Ward_Num),
            
	CONSTRAINT WFKMU
			foreign key(MDB_Code) REFERENCES Municipality(MDB_Code) 
				ON DELETE CASCADE 		ON UPDATE CASCADE
);