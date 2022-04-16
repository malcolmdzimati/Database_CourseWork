CREATE DATABASE u20575085_NormalisedDCIM;

USE u20575085_NormalisedDCIM;

CREATE TABLE DATACENTRE(
		Name VARCHAR(45),
        Location VARCHAR(45), /*Kinda of like the province branch*/
        Address VARCHAR(45),
        PlantSpecialists CHAR(12), /*foreign key to table staff, where ID is a unique 12 characters string*/
        EnergyConsumption DOUBLE, /*Is a float stored in KWatts*/
        NumberOfServers INTEGER, 
        RackCount INTEGER,
        MTXId CHAR(8),
        
        CONSTRAINT DCPK
			primary key(MTXId),
		
		CONSTRAINT PSFKDC
			foreign key (PlantSpecialists) references STAFF(EmplID)

);

CREATE TABLE ROOMS(
		RoomId CHAR(12), /*room id, where by the id is a unique 12 character string*/
        Capacity INTEGER, /*Stored in units of equipment to be possible stored there*/
        Status VARCHAR(45), /*Describes the current functional state of the room, eg: functional*/
        RoomType VARCHAR(45), /*Describes type of room whether server, storage, etc etc*/
        RoomName VARCHAR(45),
        
        CONSTRAINT RMPK
			primary key(RoomId)
);

CREATE TABLE ROOMSINDC(
		MTXId CHAR(8), 
        RoomId CHAR(12),
        
        CONSTRAINT RFKRM
			foreign key (RoomId) references ROOMS(RoomId),
		
        CONSTRAINT RFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE WAREHOUSES(
		WarehouseNo INTEGER, /*ID of warehouse where by each id is a unique number*/
        Capacity INTEGER, /*Stored in units of rooms to be possible used there*/
        WarehouseName VARCHAR(45),
        WarehouseStatus VARCHAR(45), /*Describes the current functional state of the room, eg: functional, abandond etc*/
        MTXId CHAR(8),
        
        CONSTRAINT WHPK
			primary key(WarehouseNo),
            
        CONSTRAINT WhKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE MODELENERGYEQUIPMENT(
		Model VARCHAR(45),
        Rating DOUBLE,
        
        CONSTRAINT MOPK
			primary key(Model)
);

CREATE TABLE ENERGYEQUIPMENT(
		-- made changes
		EquipmentId CHAR(12), /*equipmentid, where by the id is a unique 12 character string*/
        EqName VARCHAR(45),
        Utilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ServiceStatus VARCHAR(45), /*Describes the current functional state of the equipment, eg: functional, abandond etc*/ 
        CommsProtocol VARCHAR(45),/*Describes the communication protocal used by that equipment*/
        Location VARCHAR(45), /*Kinda of like the province branch*/
        MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
        Model VARCHAR(45),/*describes the model of the equipment*/ 
        SerialNumber CHAR(8),
        
        CONSTRAINT EEPK
			primary key(EquipmentId),
            
            foreign key(Model) references MODELENERGYEQUIPMENT(Model)
);

CREATE TABLE RECTIFIER(
		RectId CHAR(8), /*rectid, where by the id is a unique 12 character string*/
        RectCapacity INTEGER, /*Stored in units of rectificers to be possible stored there*/
        RectUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ActiveAlarms INTEGER, /*Number of active alarms*/
        ServiceDate DATE,
        
        CONSTRAINT RECPK
			primary key(RectId)
);

CREATE TABLE GENERATOR(
		GenId CHAR(8), /*genid, where by the id is a unique 12 character string*/
        GenCapacity INTEGER, /*Stored in units of power generatorable by generator stored in KWatts*/
        GenUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ActiveAlarms INTEGER, /*Number of active alarms*/
        ServiceDate DATE,
        
        CONSTRAINT GENPK
			primary key(GenId)
);

CREATE TABLE RECTIFORENERGYEQUIP(
		EquipmentId CHAR(12), 
        RectId CHAR(8),
        
        CONSTRAINT RKEE
			foreign key (EquipmentId) references ENERGYEQUIPMENT(EquipmentId),
		
        CONSTRAINT RFKREC
			foreign key (RectId) references RECTIFIER(RectId)
);

CREATE TABLE GENERFORENERGYEQUIP(
		EquipmentId CHAR(12), 
        GenId CHAR(8), 
        
        CONSTRAINT GKEE
			foreign key (EquipmentId) references ENERGYEQUIPMENT(EquipmentId),
		
        CONSTRAINT GFKGE
			foreign key (GenId) references GENERATOR(GenId)
);

CREATE TABLE UPS(
		-- made changes
		UPSNo INTEGER, /*ID of UPS where by each id is a unique number*/
        UPSCapacity DOUBLE, /*Stored in units of power supplable by the ups stored in KWatts*/
        UPSUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        UPSStatus VARCHAR(45),
        -- MTXId CHAR(8), (Not including this here should actually be EquipmentId)
        EquipmentId CHAR(12),
        
        CONSTRAINT UPSPK
			primary key(UPSNo),
            
            foreign key(EquipmentId) references ENERGYEQUIPMENT(EquipmentId)
            
		-- CONSTRAINT UPFKDC
-- 			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE TRANSFORMER(
		-- made changes
		TransformerId CHAR(8), /*transformerid, where by the id is a unique 12 character string*/
        TransformerRating DOUBLE, /*rating out of 5*/
        TransformerUtilization DOUBLE,
		-- MTXId CHAR(8), (Not including this here should actually be EquipmentId)
        EquipmentId CHAR(12),
        
        CONSTRAINT TRANSPK
			primary key(TransformerId),
            
            foreign key(EquipmentId) references ENERGYEQUIPMENT(EquipmentId)
		-- CONSTRAINT TFKDC
-- 			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE DEPARTMENTS(
		-- suggestions
		DepartmentId CHAR(8),
        DepartmentName VARCHAR(45),
        MTXId CHAR(8),
        Location VARCHAR(45),
        Address VARCHAR(45),
        
        CONSTRAINT DEPARPK
			primary key(DepartmentID),
            
            foreign key(MTXId) references DATACENTRE(MTXId)
			-- forgot relation between department table 
);

CREATE TABLE STAFF(
		-- suggestions
		Name VARCHAR(45), 
        Address VARCHAR(45), 
        EmplId CHAR(12), 
        PhoneNumber CHAR(10), 
        Department VARCHAR(8),
        HoursInDataCentre INTEGER, 
        Age TINYINT, 
        HealthStatus VARCHAR(45),
        
        CONSTRAINT STPK
			primary key(EmplID),
            
            foreign key(Department) references DEPARTMENTPROJECT(DepartmentId)
		
		-- forgot relation between department table
        -- maybe relation between address here and address in DATACENTRE..(question mark) 
);

CREATE TABLE SERVERNAME(
        ServerName VARCHAR(45), 
        ProcessorDetails VARCHAR(45),
        
        CONSTRAINT MODSERPK
			primary key(ServerName)
);

CREATE TABLE RACK(
		RackId INTEGER, /*ID of Rack where by each id is a unique number*/
        RackLabel VARCHAR(45), 
        VMNames VARCHAR(45), 
        VMCount INTEGER, 
        Utilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        
        CONSTRAINT RACKPK
			primary key(RackId)
);

CREATE TABLE SERVER(
		-- made changes
		ServerId CHAR(8), /*serverid, where by the id is a unique 12 character string*/
        RackId INTEGER, /*ID of Rack where by each id is a unique number*/ -- changed
        ServerName VARCHAR(45),
        SerialNumber CHAR(8), 
        ResponsibleStaff CHAR(12), /*foreign key to table staff, where ID is a unique 12 characters string*/
        Vendor VARCHAR(45), 
        RoomId CHAR(12), /*primary key of Datacentre, where id is a unique 8 character string*/
        
        CONSTRAINT SEPK
			primary key(ServerId),
            
		CONSTRAINT SEFKDC
			foreign key (RoomId) references ROOMS(RoomID),
            
		CONSTRAINT SEFKST
			foreign key (ResponsibleStaff) references STAFF(EmplId),
            
            foreign key (RackId) references	RACK(RackId),
            foreign key (ServerName) references SERVERNAME(ServerName)
);

CREATE TABLE MODELSERVER(
        Model VARCHAR(45), 
		ServerName VARCHAR(45),
        
        CONSTRAINT MODSERPK
			primary key(Model),
            
            foreign key(ServerName) references SERVERNAME(ServerName)
);

CREATE TABLE PROJECT(
        ProjectId CHAR(8), 
        ProjectName VARCHAR(45),
        Supervisor CHAR(12), 
        
        CONSTRAINT PRPK
			primary key(ProjectId),
            
            foreign key(Supervisor) references STAFF(EmplId)
		
);

CREATE TABLE DEPARTMENTPROJECT(
		-- suggestions
        ProjectId CHAR(8), 
        Department VARCHAR(8) unique,
        
        foreign key(Department) references DEPARTMENTS(DepartmentId)
            -- forgot relation between department table, project table and staff table 
);

CREATE TABLE EQUIPMENTINDATACENTRE(
		-- made changes
		EquipmentId CHAR(8),
        SerialNumber CHAR(13) unique, 
        MTXId CHAR(8),
        Model VARCHAR(45),
        
        primary key(EquipmentId),
        foreign key (MTXId) references DATACENTRE(MTXId),
        foreign key (Model) references EQUIPRATING(Model)
);

CREATE TABLE EQUIPRATING(
		-- made changes
		Model VARCHAR(45),
        Rating TINYINT,
        
        primary key(Model)
        
);

CREATE TABLE EQUIPMENTS(
		EquipmentId CHAR(8),
        SerialNumber CHAR(13), 
		EquipmentName VARCHAR(45),
         
         CONSTRAINT EQUIPK
			primary key(EquipmentId)
);

CREATE TABLE EMERGENCYCONTACTS(
		-- made changes
		EmplId CHAR(12), 
        Names VARCHAR(45), 
        PhoneNumber CHAR(10), 
        Address VARCHAR(45),
        
        CONSTRAINT EMCPK
			foreign key(EmplID) references STAFF(EmplId)
);

insert into STAFF 
values
	("Tlholo Koma","45 Long Street, Vereeniging, Gauteng","14023","0728412356","Technical", 45,26,"Excellent"),
	("Jacob van Zyl","1012 That Street, Midrand, Gauteng","10111","0814526214","Technical", 36, 41,"Excellent"),
    ("Isheneanesu Dzingirai","10 This Avenue, Witbank, Mpumalanga","20145","0668942510","Information Technology",62,29,"Excellent"),
    ("Sarah Williams","521 Here Street, George, Western Cape", "41203","0745214152","Administration",23,25,"Good"),
    ("Njabulo Khosi", "62 Down Street, The Valley, Mpumalanga","12345","0651234587","Technical",51,22,"Excellent"),
    ("Mandla Sisulu", "12 Under Avenue, Alberton, Gauteng","44521","0852367412","Administration",28,27,"Excellent"),
    ("Batsirai Dzimati","471 Over Street, Cosmo City, Gauteng","16012","0785146984","Maintenance", 44,29,"Excellent"),
	("Patrick Williams","521 Here Street, George, Western Cape","47852","0812359745","Information Technology",61,28,"Excellent");
    
insert into DATACENTRE
VALUES
	("MP Terror DCIM","Mpumalanga","74 Invisible Avenue","12345",47.92,42,6,"61235"),
    ("WC Terror DCIM","Western Cape","125 Downcity Street","47852",36.12,157,16,"71235"),
	("GP Terror DCIM", "GP", "2002 VVV", "10111", 25.25, 250, 50, "11235");
    
insert into ROOMS
values
	("MPTD12458",10,"Good","Server","Ruby"),
    ("MPTD12457",40,"Good","Server","Lisp"),
    ("MPTD12456",10,"Excellent","Storage","Perl"),
    ("WCTC23456",20,"Excellent","Storage","PHP"),
    ("WCTC23455",50,"Average","Server","JavaScript"),
    ("GPTD74562",60,"Excellent","Server","CPlusPlus"),
    ("GPTD74561",17,"Excellent","Server","COnly"),
    ("GPTD74560",50,"Good","Storage","Java");
    
insert into ROOMINDC
values
	("61235","MPTD12458"),
    ("61235","MPTD12457"),
    ("61235","MPTD12456"),
    ("71235","WCTC23456"),
    ("71235","WCTC23455"),
    ("11235","GPTD74562"),
    ("11235","GPTD74561"),
    ("11235","GPTD74560");
    
insert into WAREHOUSES
values
	(60,270,"SegFault","Good","61235"),
    (70,100,"NullPoiner","Good","71235"),
    (71,100,"OutOfBounds","Excellent","71235"),
    (110,50,"IO","Good","11235"),
    (111,70,"Syntax","Excellent","11235"),
    (112,100,"Linkers","Excellent","11235"),
    (113,20,"Runtime","Bad","11235");

insert into MODELENERGYEQUIPMENT
values
	("Ryobi 74Hx-6",7.2),
    ("Ryobi 451cvx",8.6),
    ("Ryobi 987pvc-fcl",6.9);
    
insert into ENERGYEQUIPMENT
values
	("AC11GP112","Happiness",14.12,"Functional","Don't really know","11235","Ryobi 987pvc-fcl","12-745-6"),
    ("AC11GP113","Joy",26.74,"Functional","Don't really know","11235","Ryobi 74Hx-6","6-278-74"),
    ("AC71WC210","Anxious",36.8,"Abandoned","Don't really know","71235","Ryobi 987pvc-fcl","74-85-74"),
    ("AC71WC211","Excite",14.8,"Functional","Don't really know","71235","Ryobi 451cvx","417-7497"),
    ("AC61MP311","Peachy",8.16,"Functional","Don't really know","61235","Ryobi 451cvx","127-9612");

insert into RECTIFIER
values
	("RC61MP20",2,17.32,6,"2021-01-11"),
    ("RC61MP21",4,32.87,4,"2021-06-18"),
    ("RC71WC00",1,74.13,7,"2021-04-30"),
    ("RC71WC01",6,13.24,2,"2021-05-10"),
    ("RC71WC02",3,29.10,3,"2021-02-28"),
    ("RC11GP50",7,25.19,2,"2021-01-08"),
    ("RC11GP51",5,41.62,1,"2021-01-06"),
    ("RC11GP52",6,13.24,2,"2021-05-10"),
    ("RC11GP53",1,74.13,7,"2021-04-30");

insert into GENERATOR
values
	("GN61MP20",2,17.32,6,"2021-01-11"),
    ("GN61MP21",4,32.87,4,"2021-06-18"),
    ("GN71WC00",1,74.13,7,"2021-04-30"),
    ("GN71WC01",6,13.24,2,"2021-05-10"),
    ("GN71WC02",3,29.10,3,"2021-02-28"),
    ("GN11GP50",7,25.19,2,"2021-01-08"),
    ("GN11GP51",5,41.62,1,"2021-01-06"),
    ("GN11GP52",6,13.24,2,"2021-05-10"),
    ("GN11GP53",1,74.13,7,"2021-04-30");
    
insert into RECTIFORENERGYEQUIP
values
	("AC11GP112","RC11GP51"),
    ("AC11GP112","RC11GP53"),
    ("AC11GP113","RC11GP50"),
    ("AC11GP112","RC11GP52"),
    ("AC71WC211","RC71WC01"),
    ("AC71WC210","RC71WC02"),
    ("AC71WC210","RC71WC00"),
    ("AC61MP311","RC61MP21"),
    ("AC61MP311","RC61MP20");
    
insert into GENERFORENERGYEQUIP
values
	("AC11GP112","GN11GP51"),
    ("AC11GP112","GN11GP53"),
    ("AC11GP113","GN11GP50"),
    ("AC11GP112","GN11GP52"),
    ("AC71WC211","GN71WC01"),
    ("AC71WC210","GN71WC02"),
    ("AC71WC210","GN71WC00"),
    ("AC61MP311","GN61MP21"),
    ("AC61MP311","GN61MP20");
    
insert into UPS
values
	(41,1200,42.6,"Good","AC71WC211"),
    (42,2230,37.41,"Excellent","AC71WC211"),
    (47,3600,14.87,"Excellent","AC71WC211"),
    (51,1140,25.33,"Good","AC71WC210"),
    (12,1500,33.51,"Good","AC11GP113"),
    (14,1400,32.57,"Good","AC11GP113"),
    (17,2400,55.7,"Poor","AC11GP113"),
    (9,1340,61.32,"Poor","AC11GP112"),
    (86,2100,24.95,"Excellent","AC61MP311"),
    (85,1200,12.23,"Excellent","AC61MP311"),
    (89,1620,19.41,"Excellent","AC61MP311");
    
insert into TRANSFORMER
values
	(41,4.2,42.6,"AC71WC211"),
    (42,4.6,37.41,"AC71WC211"),
    (47,4.7,14.87,"AC71WC211"),
    (51,3.7,25.33,"AC71WC210"),
    (12,3.9,33.51,"AC11GP113"),
    (14,3.2,32.57,"AC11GP113"),
    (17,4.0,55.7,"AC11GP113"),
    (9,4.0,61.32,"AC11GP112"),
    (86,3.9,24.95,"AC61MP311"),
    (85,3.7,12.23,"AC61MP311"),
    (89,3.4,19.41,"AC61MP311");
    
insert into SERVERNAME
values
	("Hybrid","i7-Intel"),
    ("Python","i5-Intel"),
    ("Lighthouse","i5-Intel"),
    ("Dove","AMD Ryzen 9 5900X"),
    ("Plague","17-Intel"),
    ("Maze","AMD Ryzen Threadripper 3960X");
    
insert into MODEL
values
	("Gigabyte MT75","Hybrid"),
    ("HP bc213-x","Python"),
    ("Samsung Y23","Hybrid"),
    ("Samsung G230-xc12","Plague"),
    ("Gigabyte XC123","Dove"),
    ("HP i123XD","Maze"),
    ("HP acV1129","Plague"),
    ("Samsung qn123","Lighthouse"),
    ("Acer w123-rg12x","Maze");
    
insert into RACK
values
	(77,"Polar","Cobra",20),
    (61,"Giant","Viper",12),
    (84,"Sun","Anaconda",60),
    (14,"Pizzly","Garter",40),
    (22,"Sloth","Taipan",14),
    (19,"Spectacled","Boas",15);
    
insert into SERVER
values
	("SV11GP10",77),
    ("SV11GP11",77),
    ("SV11GP12",77),
    ("SV61MP60"),
    ("SV61MP61"),
    ("SV61MP62"),
    ("SV61MP63"),
    ("SV61MP64"),
    ("SV11GP13",77),
    ("SV11GP14",77),
    ("SV11GP15",77),
    (""),
    (),
    (),
    (),
    ();
    


