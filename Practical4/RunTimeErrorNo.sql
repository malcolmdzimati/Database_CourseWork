CREATE DATABASE DCIM_Solution_Normalized;

USE DCIM_Solution_Normalized;

CREATE TABLE ROOMSINDC(
		MTXId CHAR(8), 
        RoomId CHAR(12),
        
        CONSTRAINT RFKRM
			foreign key (RoomId) references ROOMS(RoomId),
		
        CONSTRAINT RFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
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

CREATE TABLE ENERGYEQUIPMENT(
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
			primary key(EquipmentId)
);

CREATE TABLE MODELENERGYEQUIPMENT(
		Model VARCHAR(45),
        Rating DOUBLE,
        
        CONSTRAINT MOPK
			primary key(Model)
);

CREATE TABLE UPS(
		UPSNo INTEGER, /*ID of UPS where by each id is a unique number*/
        UPSCapacity DOUBLE, /*Stored in units of power supplable by the ups stored in KWatts*/
        UPSUtilization DOUBLE, /*Utilization is a percentage with a value ranging from 0 to 100*/
        UPSStatus VARCHAR(45),
        MXTID CHAR(8),
        
        CONSTRAINT UPSPK
			primary key(UPSNo),
            
		CONSTRAINT UPFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
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

CREATE TABLE TRANSFORMER(
		TransformerId CHAR(8), /*transformerid, where by the id is a unique 12 character string*/
        TransformerRating DOUBLE, /*rating out of 5*/
        TransformerUtilization DOUBLE,
		MTXId CHAR(8),
        
        CONSTRAINT TRANSPK
			primary key(TransformerId),
            
		CONSTRAINT TFKDC
			foreign key (MTXId) references DATACENTRE(MTXId)
);

CREATE TABLE SERVER(
		ServerId CHAR(8), /*serverid, where by the id is a unique 12 character string*/
        RackId INTEGER, /*ID of Rack where by each id is a unique number*/
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
			foreign key (ResponsibleStaff) references STAFF(EmplId)
);

CREATE TABLE MODELSERVER(
        Model VARCHAR(45), 
		ServerName VARCHAR(45),
        
        CONSTRAINT MODSERPK
			primary key(Model)
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

CREATE TABLE STAFF(
		Names VARCHAR(45), 
        Address VARCHAR(45), 
        EmplId CHAR(12), 
        PhoneNumber CHAR(10), 
        Department VARCHAR(45),
        HoursInDataCentre INTEGER, 
        Age TINYINT, 
        HealthStatus VARCHAR(45),
        
        CONSTRAINT STPK
			primary key(EmplID)
);

CREATE TABLE PROJECT(
        ProjectId CHAR(8), 
        ProjectName VARCHAR(45),
        
        CONSTRAINT PRPK
			primary key(ProjectId)
);

CREATE TABLE DEPARTMENTPROJECT(
        ProjectId CHAR(8), 
        Department VARCHAR(45), 
        Supervisor CHAR(12), 
        
        CONSTRAINT DEPRPK
			primary key(Department)
);

CREATE TABLE DEPARTMENTS(
		DepartmentID CHAR(8),
        DepartmentName VARCHAR(45),
        MTXId CHAR(8),
        Location VARCHAR(45),
        Address VARCHAR(45),
        
        CONSTRAINT DEPARPK
			primary key(DepartmentID)
);

CREATE TABLE EQUIPMENTINDATACENTRE(
		EquipmentId CHAR(8),
        SerialNumber CHAR(13), 
        MTXId CHAR(8)
);

CREATE TABLE EQUIPRATING(
		MODEL VARCHAR(45),
        RATING TINYINT
);

CREATE TABLE EQUIPMENTS(
		EquipmentId CHAR(8),
        SerialNumber CHAR(13), 
		EquipmentName VARCHAR(45),
         
         CONSTRAINT EQUIPK
			primary key(EquipmentId)
);

CREATE TABLE EMERGENCYCONTACTS(
		EmplId CHAR(12), 
        Names VARCHAR(45), 
        PhoneNumber CHAR(10), 
        Address VARCHAR(45),
        
        CONSTRAINT EMCPK
			primary key(EmplID)
);

insert into DATACENTRE(Name,  Location, Address,  PlantSpecialists, EnergyConsumption,
        NumberOfServers, RackCount,  MTXId)
        VALUES ("CPT DCIM", "CPT", "2002 VVV", "10111", 25.25, 250, 50, 10);
        
insert into dcim_solution_normalized.datacentre(Name,  Location, Address,  PlantSpecialists, EnergyConsumption,
        NumberOfServers, RackCount,  MTXId)
        VALUES ("JHB DCIM", "JHB", "1010 X", "00111", 50.25, 50, 25, 1);