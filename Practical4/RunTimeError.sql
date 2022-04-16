CREATE DATABASE DCIM_Solution_Unormalized;

USE DCIM_Solution_Unormalized;

CREATE TABLE DATACENTRE(
        Name VARCHAR(45),
        Location VARCHAR(45), /*Kinda of like the province branch*/
        Address VARCHAR(45),
        PlantSpecialists CHAR(12), /*foreign key to table staff, where ID is a unique 12 characters string*/
        EnergyConsumption DOUBLE, /*Is a float stored in KWatts*/
        NumberOfServers INTEGER, 
        RackCount INTEGER,
        MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
        RoomId CHAR(12), /*room id, where by the id is a unique 12 character string*/
        Capacity INTEGER, /*Stored in units of equipment to be possible stored there*/
        Status VARCHAR(45), /*Describes the current functional state of the room, eg: functional*/
        RoomType VARCHAR(45), /*Describes type of room whether server, storage, etc etc*/
        RoomName VARCHAR(45),
        WarehouseNo INTEGER, /*ID of warehouse where by each id is a unique number*/
        Capacity INTEGER, /*Stored in units of rooms to be possible used there*/
        WarehouseName VARCHAR(45),
        WarehouseStatus VARCHAR(45), /*Describes the current functional state of the room, eg: functional, abandond etc*/
        
        CONSTRAINT DCPK
			primary key(MTXId),
            
		CONSTRAINT DCFKST
			foreign key (PlantSpecialists) references STAFF(EmplId)
);

CREATE TABLE ENERGYEQUIPMENT(
		EquipmentId CHAR(12), /*equipmentid, where by the id is a unique 12 character string*/
        EqName VARCHAR(45), 
        Rating DOUBLE, /*rating out of 5*/
        Utilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ServiceStatus VARCHAR(45), /*Describes the current functional state of the equipment, eg: functional, abandond etc*/ 
        CommsProtocol VARCHAR(45),/*Describes the communication protocal used by that equipment*/
        Location VARCHAR(45), /*Kinda of like the province branch*/
        MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
        Model VARCHAR(45),/*describes the model of the equipment*/ 
        SerialNumber CHAR(8),/*serial number of equipment where by a serial number is 8 characters long"*/
        RectId CHAR(8), /*rectid, where by the id is a unique 12 character string*/
        RectCapacity INTEGER, /*Stored in units of rectificers to be possible stored there*/
        RectUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ActiveAlarms INTEGER, /*Number of active alarms*/
        ServiceDate DATE, /*Date of next service*/ 
        UPSNo INTEGER, /*ID of UPS where by each id is a unique number*/
        UPSCapacity DOUBLE, /*Stored in units of power supplable by the ups stored in KWatts*/
        UPSUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        UPSStatus VARCHAR(45), /*Describes the current functional state of the ups, eg: functional, abandond etc*/ 
        GenId CHAR(8), /*genid, where by the id is a unique 12 character string*/
        GenCapacity INTEGER, /*Stored in units of power generatorable by generator stored in KWatts*/
        GenUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        ActiveAlarms INTEGER, /*Number of active alarms*/
        ServiceDate DATE, /*Date of next service*/ 
        TransformerId CHAR(8), /*transformerid, where by the id is a unique 12 character string*/
        TransformerRating DOUBLE, /*rating out of 5*/
        TransformerUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        
        CONSTRAINT EEPK
			primary key(EquipmentId),
            
		CONSTRAINT EEFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE SERVER(
		ServerId CHAR(8), /*serverid, where by the id is a unique 12 character string*/
        RackId INTEGER, /*ID of Rack where by each id is a unique number*/
        ServerName VARCHAR(45), 
        RackLabel VARCHAR(45), 
        Model VARCHAR(45), 
        SerialNumber CHAR(8), 
        ResponsibleStaff CHAR(12), /*foreign key to table staff, where ID is a unique 12 characters string*/
        Utilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        Vendor VARCHAR(45), 
        VMNames VARCHAR(45), 
        VMCount INTEGER, 
        ProcessorDetails VARCHAR(45),
        MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
        
        CONSTRAINT SEPK
			primary key(ServerId),
            
		CONSTRAINT SEFKDC
			foreign key (MTXId) references DATACENTRE(MTXId),
            
		CONSTRAINT SEFKST
			foreign key (ResponsibleStaff) references STAFF(EmplId)
);

CREATE TABLE STAFF(
		Names VARCHAR(45), 
        Address VARCHAR(45), 
        EmplId CHAR(12), 
        PhoneNumber CHAR(10), 
        Department VARCHAR(45), 
        EmergencyContacts CHAR(10), 
        ProjectId CHAR(8), 
        ProjectName VARCHAR(45),
        HoursInDataCentre INTEGER, 
        Supervisor CHAR(12), 
        Age TINYINT, 
        HealthStatus VARCHAR(45),
        
        CONSTRAINT STPK
			primary key(EmplID)
);

CREATE TABLE DEPARTMENTS(
	departmentId CHAR(8), 
    departmentName VARCHAR(45), 
    Location VARCHAR(45),
    Address VARCHAR(45),
    MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
    
    CONSTRAINT OPK
			primary key(OffId),
	
    CONSTRAINT OFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE EQUIPMENTS(
	EquipmentId CHAR(8),
    Equipmentname VARCHAR(45), 
    SerialNumber CHAR(13),
    Rating tinyint, 
    Model VARCHAR(45),
    MTXId CHAR(8), /*primary key of Datacentre, where id is a unique 8 character string*/
    
    CONSTRAINT OPK
			primary key(OffId),
	
    CONSTRAINT OFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

