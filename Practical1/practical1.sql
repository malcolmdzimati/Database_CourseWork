SHOW databases;

/*Creation of librarysystem database*/
CREATE database u20456078_librarysystem;

/*Task 4*/
USE u20456078_librarysystem;

/*Task 5*/
/*Creation of Book table*/
CREATE TABLE Book(
	isbn varchar(17),
    book_title varchar(45),
    book_author varchar(45),
    book_genre varchar(45),
    year_published integer(4),
    
    CONSTRAINT BKPK
		primary key(isbn)
);

/*Creation of Member table*/
CREATE TABLE Member(
	member_id varchar(4),
    mem_Iname varchar(45),
    mem_fname varchar(45),
    mem_initial varchar(4),
    mem_phone integer(10),
    
    CONSTRAINT MRPK
    primary key(member_id)
);

/*Creation of Borrowed table*/
CREATE TABLE Borrowed(
	borrowed_id integer(4),
    isbn varchar(17),
    member_id integer(4),
    taken_date date,
    
    CONSTRAINT BDPK
		primary key(borrowed_id), 
    
    CONSTRAINT BDFKBK
		foreign key(isbn) REFERENCES Book(isbn) 
		ON DELETE SET NULL 		ON UPDATE CASCADE, 
    
    CONSTRAINT BDFKM
		foreign key(member_id) REFERENCES Member(member_id)
		ON DELETE SET NULL 		ON UPDATE CASCADE
);
SHOW tables;

USE u20456078_librarysystem;

/*Task 6*/
/*Insertation into Book table*/
INSERT INTO Book VAlUES("978-0-7981-8166-2", "Donkerdrif", "Deon Meyer", "Crime", "2020");
INSERT INTO Book VAlUES("978-0307474278", "The Da Vinci Code", "Dan Brown", "Mystery", "2003");
INSERT INTO Book VAlUES("978-0345391803", "The Hitchhiker's Guide to the Galaxy", "Douglas Adams", "Science Fiction", "1979");
INSERT INTO Book VAlUES("978-1455519132", "Egghead", "Bo Burnham", "Poetry", "2013");
INSERT INTO Book VAlUES("978-1983699740", "The Prince Of Milk", "Exurb1a", "Science Fiction", "2018");
INSERT INTO Book VAlUES("9780241257265", "How to Play Chess", "Claire Summerscale", "Non Fiction", "2016");
INSERT INTO Book VAlUES("9780330241182", "To Kill a Mockingbird", "Harper Lee", "Domestic Fiction", "1960");
INSERT INTO Book VAlUES("9780451532244", "Frankenstein", "Mary Shelley", "Horror Fiction", "2013");
INSERT INTO Book VAlUES("9780804172264", "Inferno", "Dan Brown", "Mystery", "2013");
INSERT INTO Book VAlUES("9781250010292", "White Crow", "Marcus Sedgwick", "Horror Fiction", "2010");
INSERT INTO Book VAlUES("9781439149034", "Under the Dome", "Stephen King", "Horror Fiction", "2009");
INSERT INTO Book VAlUES("9781841351414", "The Secret Island", "Enid Blyton", "Adventure", "2002");

/*Insertation into Member table*/
INSERT INTO Member VALUES("1010", "Jefferson", "Mike", "W", "0833335345");
INSERT INTO Member VALUES("1011", "Smith", "Kayla", "A", "0844842223");
INSERT INTO Member VALUES("1012", "Botha", "Kyle", "F", "0623478921");
INSERT INTO Member VALUES("1013", "Thomas", "George", "H", "0849236712");
INSERT INTO Member VALUES("1014", "Dunne", "Amy", "Y", "0612783490");
INSERT INTO Member VALUES("1015", "Williams", "Michelle", "M", "0825280001");
INSERT INTO Member VALUES("1016", "De Beer", "Johan", "B", "0725142783");
INSERT INTO Member VALUES("1017", "Hoenderdos", "Dylan", "D", "0831119081");
INSERT INTO Member VALUES("1018", "Govender", "Brent", "E", "0741789012");
INSERT INTO Member VALUES("1019", "Meyer", "Marlize", "P", "0824462842");

/*Insertation into Borrowed*/
INSERT INTO Borrowed VALUES("1110", "978-0345391803", "1013", "2021-02-10");
INSERT INTO Borrowed VALUES("1111", "9780241257265", "1018", "2021-02-15");
INSERT INTO Borrowed VALUES("1112", '9781250010292', "1016", "2021-02-12");
INSERT INTO Borrowed VALUES("1113", "9780330241182", "1010", "2021-02-20");
INSERT INTO Borrowed VALUES("1114", "978-0-7981-8166-2", "1016", "2021-02-22");
INSERT INTO Borrowed VALUES("1115", "9781841351414", "1012", "2021-02-26");
INSERT INTO Borrowed VALUES("1116", "9781439149034", "1019", "2021-03-05");
INSERT INTO Borrowed VALUES("1117", "978-0307474278", "1018", "2021-03-10");
INSERT INTO Borrowed VALUES("1118", "9780451532244", "1010", "2021-03-14");


/*Task 7*/
SELECT * 
		FROM Book 
		WHERE book_genre='Horror Fiction';
        
drop table Book;
drop table Borrowed;
drop table Member;

