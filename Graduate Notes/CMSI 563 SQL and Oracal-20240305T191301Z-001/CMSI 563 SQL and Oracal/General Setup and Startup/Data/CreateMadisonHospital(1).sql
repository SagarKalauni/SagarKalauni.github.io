-- Script to create the MadisonHospital database
-- Modified March 10, 2022
--
--
-- First drop the tables prior to creating the database in reverse order of
-- table creation to avoid referential integrity constraint
-- violations during the table drop processing. 
-- Drop the FOREIGN KEY constraint between the Department 
-- and Employee tables to remove the relationship SupervisesDepartment.
ALTER TABLE Department DROP CONSTRAINT FK_DepartmentToEmployee;  

DROP TABLE Prescription;
DROP TABLE Medicine;
DROP TABLE Treatment;
DROP TABLE Service;
DROP TABLE ServiceCategory;
DROP TABLE Equipment;
DROP TABLE ProjectAssignment;
DROP TABLE Project;
DROP TABLE EmployeeSpecialty;
DROP TABLE Specialty;
DROP TABLE Dependent;
DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE PatientNote;
DROP TABLE Patient;
DROP TABLE Bed;
DROP TABLE BedClassification;
DROP TABLE Room;
COMMIT;

-- Create the base tables for the database and populate the tables

-- Room table
CREATE TABLE Room (
    RoomNumber            CHAR(6) CONSTRAINT PK_Room PRIMARY KEY,
    Description           VARCHAR2(30) );
COMMIT;

-- Populate Room – 62 rows
 
INSERT INTO Room VALUES ('MSS001', 'Medical Surgical, Single');
INSERT INTO Room VALUES ('MSS002', 'Medical Surgical, Single');
INSERT INTO Room VALUES ('MSS003', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSS004', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSS005', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSS006', 'Medical Surgical, Single');
INSERT INTO Room VALUES ('MSS010', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSS011', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSS012', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSS013', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSS014', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSS015', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN201', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSN202', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSN203', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSN204', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSN205', 'Medical Surgical, Single'); 
INSERT INTO Room VALUES ('MSN210', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN211', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN212', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN213', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN214', 'Medical Surgical, Double'); 
INSERT INTO Room VALUES ('MSN215', 'Medical Surgical, Double');
INSERT INTO Room VALUES ('RA0075', 'Radiology Ward');
INSERT INTO Room VALUES ('RA0076', 'Radiology Ward');
INSERT INTO Room VALUES ('RA0077', 'Radiology Ward');
INSERT INTO Room VALUES ('RA0078', 'Radiology Ward');
INSERT INTO Room VALUES ('ER0001', 'Emergency Room 1');
INSERT INTO Room VALUES ('ER0002', 'Emergency Room 2');
INSERT INTO Room VALUES ('RE0001', 'Recovery Room 1');
INSERT INTO Room VALUES ('RE0023', 'Recovery Room 2');
INSERT INTO Room VALUES ('RE0024', 'Recovery Room 3');
INSERT INTO Room VALUES ('RE0031', 'Recovery Room 4');
INSERT INTO Room VALUES ('RE0032', 'Recovery Room 5');
INSERT INTO Room VALUES ('SUR001', 'Surgery Room 1'); 
INSERT INTO Room VALUES ('SUR002', 'Surgery Room 2');
INSERT INTO Room VALUES ('SUR003', 'Surgery Room 3');
INSERT INTO Room VALUES ('SUR004', 'Surgery Room 4');
INSERT INTO Room VALUES ('SW3001', 'Oncology Ward, Single');
INSERT INTO Room VALUES ('SW3002', 'Oncology Ward, Single'); 
INSERT INTO Room VALUES ('SW3003', 'Oncology Ward, Single'); 
INSERT INTO Room VALUES ('SW3004', 'Oncology Ward, Single');
INSERT INTO Room VALUES ('SW3005', 'Oncology Ward, Double');
INSERT INTO Room VALUES ('SW3006', 'Oncology Ward, Double');
INSERT INTO Room VALUES ('SW3007', 'Oncology Ward, Double');
INSERT INTO Room VALUES ('SW3008', 'Oncology Ward, Double');
INSERT INTO Room VALUES ('CC1001', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1011', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1021', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1031', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1041', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1051', 'Critical Care, Single');
INSERT INTO Room VALUES ('CC1061', 'Critical Care, Single');
INSERT INTO Room VALUES ('PED101', 'Pediatric, Single');
INSERT INTO Room VALUES ('PED102', 'Pediatric, Single');
INSERT INTO Room VALUES ('PED103', 'Pediatric, Single');
INSERT INTO Room VALUES ('PED104', 'Pediatric, Single');
INSERT INTO Room VALUES ('PED105', 'Pediatric, Single');
INSERT INTO Room VALUES ('PED111', 'Pediatric, Double');
INSERT INTO Room VALUES ('PED112', 'Pediatric, Double');
INSERT INTO Room VALUES ('PED113', 'Pediatric, Double');
INSERT INTO Room VALUES ('PED114', 'Pediatric, Double');
COMMIT;

-- BedClassification table
CREATE TABLE BedClassification (
    BedType               CHAR(2) CONSTRAINT PK_BedClassification PRIMARY KEY,
    Description           VARCHAR2(50) );
COMMIT;

-- Populate BedClassification – 10 rows
INSERT INTO BedClassification VALUES ('R1', 'Medical Surgical-Fixed');
INSERT INTO BedClassification VALUES ('R2', 'Medical Surgical-Adjustable');
INSERT INTO BedClassification VALUES ('R3', 'Medical Surgical-Elevated Leg');
INSERT INTO BedClassification VALUES ('E1', 'Emergency Room-Rollaround');
INSERT INTO BedClassification VALUES ('E2', 'Emergency Room-Fixed');
INSERT INTO BedClassification VALUES ('E3', 'Emergency Room-Portable');
INSERT INTO BedClassification VALUES ('RA', 'Radiology Ward');
INSERT INTO BedClassification VALUES ('SU', 'Surgery Room-Rollaround');
INSERT INTO BedClassification VALUES ('P1', 'Pediatric-Child');
INSERT INTO BedClassification VALUES ('P2', 'Pediatric-Adolescent');
COMMIT;

-- Bed table
CREATE TABLE Bed (
    BedNumber             NUMBER(4)
        CONSTRAINT PK_Bed PRIMARY KEY,
    RoomNumber            CHAR(6) 
        CONSTRAINT FK_BedToRoom REFERENCES Room(RoomNumber),
    BedType               CHAR(2) 
        CONSTRAINT FK_BedToBedClassification 
        REFERENCES BedClassification(BedType),
    Availability          CHAR(1) );       
COMMIT;

-- Populate Bed – 97 rows
-- Medical Surgical Ward-South Wing
 
INSERT INTO Bed VALUES (1, 'MSS001', 'R1', 'Y');
INSERT INTO Bed VALUES (2, 'MSS002', 'R1', 'N'); 
INSERT INTO Bed VALUES (3, 'MSS003', 'R2', 'N');
INSERT INTO Bed VALUES (4, 'MSS004', 'R1', 'Y');
INSERT INTO Bed VALUES (5, 'MSS005', 'R2', 'N'); 
INSERT INTO Bed VALUES (6, 'MSS006', 'R1', 'Y'); 
INSERT INTO Bed VALUES (7, 'MSS010', 'R1', 'Y'); 
INSERT INTO Bed VALUES (8, 'MSS010', 'R2', 'N'); 
INSERT INTO Bed VALUES (9, 'MSS011', 'R2', 'N');
INSERT INTO Bed VALUES (10, 'MSS011', 'R2', 'N'); 
INSERT INTO Bed VALUES (11, 'MSS012', 'R1', 'Y'); 
INSERT INTO Bed VALUES (12, 'MSS012', 'R3', 'N');
INSERT INTO Bed VALUES (13, 'MSS013', 'R3', 'N'); 
INSERT INTO Bed VALUES (14, 'MSS013', 'R1', 'Y'); 
INSERT INTO Bed VALUES (15, 'MSS014', 'R1', 'Y'); 
INSERT INTO Bed VALUES (16, 'MSS014', 'R1', 'Y'); 
INSERT INTO Bed VALUES (17, 'MSS015', 'R3', 'N');
INSERT INTO Bed VALUES (18, 'MSS015', 'R3', 'Y'); 

-- Medical Surgical Ward-North Wing
INSERT INTO Bed VALUES (19, 'MSN201', 'R1', 'N'); 
INSERT INTO Bed VALUES (20, 'MSN202', 'R1', 'Y'); 
INSERT INTO Bed VALUES (21, 'MSN203', 'R1', 'N'); 
INSERT INTO Bed VALUES (22, 'MSN204', 'R2', 'N'); 
INSERT INTO Bed VALUES (23, 'MSN205', 'R2', 'Y'); 
INSERT INTO Bed VALUES (25, 'MSN210', 'R1', 'N'); 
INSERT INTO Bed VALUES (26, 'MSN210', 'R3', 'Y'); 
INSERT INTO Bed VALUES (27, 'MSN211', 'R2', 'N'); 
INSERT INTO Bed VALUES (28, 'MSN211', 'R2', 'Y'); 
INSERT INTO Bed VALUES (29, 'MSN212', 'R1', 'N'); 
INSERT INTO Bed VALUES (30, 'MSN212', 'R3', 'Y'); 
INSERT INTO Bed VALUES (31, 'MSN213', 'R2', 'Y'); 
INSERT INTO Bed VALUES (32, 'MSN213', 'R1', 'N'); 
INSERT INTO Bed VALUES (33, 'MSN214', 'R1', 'N'); 
INSERT INTO Bed VALUES (34, 'MSN214', 'R1', 'Y'); 
INSERT INTO Bed VALUES (35, 'MSN215', 'R3', 'N'); 
INSERT INTO Bed VALUES (36, 'MSN215', 'R1', 'Y'); 

-- Radiology Ward
INSERT INTO Bed VALUES (100, 'RA0075', 'RA', 'Y');
INSERT INTO Bed VALUES (101, 'RA0075', 'RA', 'N');
INSERT INTO Bed VALUES (102, 'RA0076', 'RA', 'Y');
INSERT INTO Bed VALUES (103, 'RA0077', 'RA', 'Y');
INSERT INTO Bed VALUES (104, 'RA0077', 'RA', 'N');
INSERT INTO Bed VALUES (105, 'RA0077', 'RA', 'Y');
INSERT INTO Bed VALUES (106, 'RA0078', 'RA', 'N');
INSERT INTO Bed VALUES (107, 'RA0078', 'RA', 'N');

-- Emergency Room
INSERT INTO Bed VALUES (50, 'ER0001', 'E1', 'Y');
INSERT INTO Bed VALUES (51, 'ER0001', 'E1', 'N');
INSERT INTO Bed VALUES (52, 'ER0001', 'E2', 'Y');
INSERT INTO Bed VALUES (53, 'ER0001', 'E2', 'Y');
INSERT INTO Bed VALUES (59, 'ER0001', 'E3', 'Y');
INSERT INTO Bed VALUES (54, 'ER0002', 'E1', 'N');
INSERT INTO Bed VALUES (55, 'ER0002', 'E1', 'Y');
INSERT INTO Bed VALUES (56, 'ER0002', 'E2', 'Y');
INSERT INTO Bed VALUES (57, 'ER0002', 'E2', 'N');
INSERT INTO Bed VALUES (58, 'ER0002', 'E3', 'Y');

-- Recovery Room Ward
INSERT INTO Bed VALUES (70, 'RE0001', 'R2', 'Y');
INSERT INTO Bed VALUES (71, 'RE0023', 'R2', 'N');
INSERT INTO Bed VALUES (72, 'RE0023', 'R2', 'Y');
INSERT INTO Bed VALUES (73, 'RE0024', 'R2', 'N');
INSERT INTO Bed VALUES (74, 'RE0031', 'R3', 'Y');
INSERT INTO Bed VALUES (75, 'RE0032', 'R2', 'Y');
INSERT INTO Bed VALUES (76, 'RE0032', 'R2', 'Y');
INSERT INTO Bed VALUES (77, 'RE0032', 'R1', 'Y');

-- Surgery Ward
INSERT INTO Bed VALUES (1001, 'SUR001', 'SU', NULL); 
INSERT INTO Bed VALUES (1002, 'SUR002', 'SU', NULL);
INSERT INTO Bed VALUES (1003, 'SUR003', 'SU', NULL);
INSERT INTO Bed VALUES (1004, 'SUR004', 'SU', NULL);

-- Oncology Ward
INSERT INTO Bed VALUES (2001, 'SW3001', 'R1', 'Y');
INSERT INTO Bed VALUES (2002, 'SW3002', 'R2', 'N');
INSERT INTO Bed VALUES (2003, 'SW3003', 'R2', 'Y');
INSERT INTO Bed VALUES (2004, 'SW3004', 'R3', 'N');
INSERT INTO Bed VALUES (2005, 'SW3005', 'R1', 'Y');
INSERT INTO Bed VALUES (2006, 'SW3005', 'R1', 'N');
INSERT INTO Bed VALUES (2007, 'SW3006', 'R2', 'Y');
INSERT INTO Bed VALUES (2008, 'SW3006', 'R2', 'Y');
INSERT INTO Bed VALUES (2009, 'SW3007', 'R1', 'N');
INSERT INTO Bed VALUES (2010, 'SW3007', 'R1', 'Y');
INSERT INTO Bed VALUES (2011, 'SW3008', 'R3', 'Y');
INSERT INTO Bed VALUES (2012, 'SW3008', 'R3', 'Y');

-- Critical Care Ward
INSERT INTO Bed VALUES (2100, 'CC1001', 'R2', 'Y');
INSERT INTO Bed VALUES (2101, 'CC1011', 'R2', 'Y');
INSERT INTO Bed VALUES (2102, 'CC1021', 'R2', 'N');
INSERT INTO Bed VALUES (2103, 'CC1031', 'R2', 'Y');
INSERT INTO Bed VALUES (2104, 'CC1031', 'R2', 'Y');
INSERT INTO Bed VALUES (2105, 'CC1051', 'R2', 'Y');
INSERT INTO Bed VALUES (2106, 'CC1061', 'R2', 'N');

-- Pediatric Ward
INSERT INTO Bed VALUES (5001, 'PED101', 'P1', 'N');
INSERT INTO Bed VALUES (5002, 'PED102', 'P1', 'Y');
INSERT INTO Bed VALUES (5003, 'PED103', 'P1', 'N');
INSERT INTO Bed VALUES (5004, 'PED104', 'P2', 'Y');
INSERT INTO Bed VALUES (5005, 'PED105', 'P2', 'Y');
INSERT INTO Bed VALUES (5006, 'PED111', 'P2', 'N');
INSERT INTO Bed VALUES (5007, 'PED111', 'P2', 'N');
INSERT INTO Bed VALUES (5008, 'PED112', 'P1', 'Y');
INSERT INTO Bed VALUES (5009, 'PED112', 'P1', 'Y');
INSERT INTO Bed VALUES (5010, 'PED113', 'P1', 'N');
INSERT INTO Bed VALUES (5011, 'PED113', 'P2', 'Y');
INSERT INTO Bed VALUES (5012, 'PED114', 'P2', 'N');
INSERT INTO Bed VALUES (5013, 'PED114', 'P2', 'Y');
COMMIT;

-- Patient table
CREATE TABLE Patient ( 
    PatientID             CHAR(6) CONSTRAINT PK_Patient PRIMARY KEY, 
    SSN                   CHAR(9) NOT NULL, 
    LastName              VARCHAR2(25) NOT NULL,
    FirstName             VARCHAR2(20) NOT NULL,
    Middlename            VARCHAR2(15),
    Address               VARCHAR2(50),
    City                  VARCHAR2(25),
    StateCode             CHAR(2),
    ZipCode               CHAR(10),
    BirthDate             DATE,
    TelephoneNumber       CHAR(10),
    BedNo                 NUMBER(4) 
        CONSTRAINT FK_PatientToBed REFERENCES Bed(BedNumber) );
COMMIT;

-- Populate Patient – 60 rows
-- Patients in Medical Surgical Ward-South Wing
 
INSERT INTO Patient VALUES ('100001', '111111111', 'Able', 'Andrew', 'Arnold', '100 East Aardvark Avenue', 'Alton', 'IL', '62022', 
'2-JAN-16', '1005551212', 5001);
INSERT INTO Patient VALUES ('100002', '222222222', 'Benton', 'Barbara', 'Betty', 'Route #5, Box 4100', 'Alton', 'IL', '62022', 
'2-FEB-87', '1005551000', 1);
INSERT INTO Patient VALUES ('100003', '333333333', 'Chen', 'Rue', 'Phan', 'Southwest Clarice Drive', 'Collinsville', 'IL', '62021', 
'14-FEB-99', '1005552000', 4);
INSERT INTO Patient VALUES ('100024', '444444444', 'Davis', 'David', 'Daniel', 'South Davison Drive', 'Collinsville', 'IL', '62021', '14-MAR-09', '1005552002', 6);
INSERT INTO Patient VALUES ('100025', '555555555', 'Earnhardt', 'Earnest', 'Ezekiel', '400 Main St.', 'Edwardsville', 'IL', '62025', '15-DEC-95', '1005552001', 7);
INSERT INTO Patient VALUES ('100026', '666666666', 'Franken', 'Frank', 'Frederick', '401 Main St.', 'Edwardsville', 'IL', '62025', 
'16-DEC-02', '1005552004', 11);
INSERT INTO Patient VALUES ('100027', '777777777', 'Grant', 'Gregory', NULL, 'Gregorian Drive #62', 'Alton', 'IL', '62022', 
'5-DEC-77', '1005551001', 14);
INSERT INTO Patient VALUES ('100028', '888888888', 'Harnett', 'Harold', NULL, 'Northwest Harvest Road #42', 'Alton', 'IL', '62022', 
'3-NOV-74', '1005551002', 15);
INSERT INTO Patient VALUES ('100029', '999999999', 'Iona', 'Ivy', 'I', 'Northwest Illinois St. Apt. 12', 'Alton', 'IL', '62022', 
'13-OCT-99', '1005551004', 16);
INSERT INTO Patient VALUES ('100030', '111000000', 'Juneau', 'Juliet', 'June', 'Northwest Illinois St. Apt. 14', 'Alton', 'IL', '62022', '15-OCT-01', '1005551005', 18);

-- Patients in Medical Surgical Ward-North Wing
INSERT INTO Patient VALUES ('100031', '111000031', 'Kraut', 'Keith', 'K', 'Overland Park Apt. 405A', 'Alton', 'IL', '62022', 
'11-OCT-05', '1005551006', 20);
INSERT INTO Patient VALUES ('100050', '111000050', 'Lima', 'Linda', 'Lou', 'Overland Park Apt. 406A', 'Alton', 'IL', '62022', 
'21-MAY-05', '1005551007', 23);
INSERT INTO Patient VALUES ('100051', '111000051', 'Monday', 'Mandy', 'M', 'Mooresville Pike #555', 'Edwardsville', 'IL', '62025', 
'21-MAY-78', '1005551007', 21);
INSERT INTO Patient VALUES ('100301', '222333301', 'Nunn', 'Nancy', 'Near', '201 Northeast Nunn Drive', 'Edwardsville', 'IL', '62025', '21-JUN-89', '1005551034', 26);
INSERT INTO Patient VALUES ('100302', '222333302', 'Ophelia', 'Opal', NULL, '202 Northeast Nunn Drive', 'Edwardsville', 'IL', '62025', '4-JUN-98', '1005551035', 28);
INSERT INTO Patient VALUES ('100303', '222333303', 'Pauley', 'Paul', 'Prentice', '22 Pound Avenue', 'Edwardsville', 'IL', '62025', 
'4-JUN-09', '1005551036', 30);
INSERT INTO Patient VALUES ('100304', '222333304', 'Quentin', 'Quincy', NULL, 'Quark Drive #76', 'Edwardsville', 'IL', '62025', 
'7-JUN-10', '1005551037', 31);
INSERT INTO Patient VALUES ('100305', '222333305', 'Ridgeway', 'Ricardo', 'Santiago', 'Quark Drive #105', 'Edwardsville', 'IL', '62025', '7-JUN-10', '1005551038', 34);
INSERT INTO Patient VALUES ('100306', '222333306', 'Santiago', 'Samuel', 'Sampson', 'Southwest Drive #22', 'Edwardsville', 'IL', '62025', '7-JUN-11', '1005551039', 36);

-- Patients in Radiology Department 
INSERT INTO Patient VALUES ('100422', '222422001', 'Tempest', 'Teresa', NULL, 'North Tempest Avenue #452', 'O Fallon', 'IL', '62333', '30-JUL-02', '1005551111', 100);
INSERT INTO Patient VALUES ('100423', '222422003', 'Unicorn', 'Ulysses', 'U', '#16C Northwest Unicorn Road', 'O Fallon', 'IL', '62333', '28-JUL-09', '1005551112', 102);
INSERT INTO Patient VALUES ('100424', '222422004', 'Victory', 'Victor', 'Vic', '#16D Northwest Unicorn Road', 'Edwardsville', 'IL', '62025', '4-JUL-02', '1005551114', 103);
INSERT INTO Patient VALUES ('100425', '222422005', 'Williams', 'William', 'Willard', '#16E Northwest Unicorn Road', 'Edwardsville', 'IL', '62025', '5-JUL-93', '1005551115', 105);

-- Patients in Emergency Room 
INSERT INTO Patient VALUES ('100500', '222500001', 'Young', 'Yancey', NULL, '505 Main St.', 'Edwardsville', 'IL', '62025', 
'15-MAR-09', '1005555001', 50);
INSERT INTO Patient VALUES ('100501', '222500002', 'Zebulon', 'Zeb', 'Z', '5105 South Main St.', 'Edwardsville', 'IL', '62025', 
'1-MAY-95', '1005555001', 52);
INSERT INTO Patient VALUES ('100502', '222500000', 'Ashcroft', 'Arthur', 'Avery', 'Ashcroft Drive #1', 'O Fallon', 'IL', '62333', 
'12-MAY-94', '1005555002', 53);
INSERT INTO Patient VALUES ('100503', '222500003', 'Boudreaux', 'Billy', 'Bob', '50033 Wayout Bobcat Dr.', 'O Fallon', 'IL', '62333', 
'22-APR-1969', '1005555003', 59);
INSERT INTO Patient VALUES ('100504', '222500004', 'Chang', 'Charlie', NULL, 'West Overwest Way #14', 'O Fallon', 'IL', '62333', 
'20-APR-89', '1005555004', 55);
INSERT INTO Patient VALUES ('100505', '222500005', 'Davidson', 'Darlene', 'Diana', 'Middleburry Road #114', 'Edwardsville', 'IL', '62025', '2-JAN-05', '1005555050', 56);
INSERT INTO Patient VALUES ('100506', '222500006', 'Earnhardt', 'Earlene', 'E', 'North Earnhardt Ave. #45C', 'Edwardsville', 'IL', '62025', '5-JAN-04', '1005555051', 58);

-- Patients in Recovery Room Ward
INSERT INTO Patient VALUES ('222001', '222252003', 'Fender', 'Freddy', 'Freud', 'West Overfold Fork, Apt 77', 'Edwardsville', 'IL', '62025', '5-JUN-92', '1005556101', 70);
INSERT INTO Patient VALUES ('222002', '222252002', 'Gentry', 'Gina', 'Georgette', 'West Overfold Fork, Apt 79', 'Edwardsville', 'IL', '62025', '22-JUN-08', '1005556102', 72);
INSERT INTO Patient VALUES ('555003', '222555003', 'Henderson', 'Hank', 'H', 'Southwest Henderson Drive, Apt 801', 'Alton', 'IL', '62022', '22-JUN-09', '1005556103', 74);
INSERT INTO Patient VALUES ('555004', '222555004', 'Ilama', 'Ilama', 'I', 'Northeast Henderson Drive, Apt 9022', 'Alton', 'IL', '62022', '2-JUL-04', '1005556104', 75);
INSERT INTO Patient VALUES ('555005', '222555005', 'Jupiter', 'James', 'Jimmy', '42 Main St.', 'O Fallon', 'IL', '62333', 
'30-JUL-04', '1005556105', 76);
INSERT INTO Patient VALUES ('222006', '222555006', 'Khan', 'Krakatoa', 'K', '423 North South St.', 'O Fallon', 'IL', '62333', 
'1-JAN-90', '1005556110', 77);

-- Patients in Surgery Ward-Patients are not assigned to these beds

-- Patients in Oncology Ward
INSERT INTO Patient VALUES ('333110', '333333110', 'Mousseau', 'Mickey', 'Michelle', '53 Main St.', 'O Fallon', 'IL', '62333', 
'12-JAN-00', '1005556110', 2001);
INSERT INTO Patient VALUES ('333111', '333333111', 'Lakeside', 'Lillian', 'Lee', '54 Main St.', 'Edwardsville', 'IL', '62025', 
'24-JAN-01', '1005556111', 2003);
INSERT INTO Patient VALUES ('333112', '333333112', 'Overstreet', 'Oliver', 'O', '#73 North Overstreet', 'Edwardsville', 'IL', '62025', '16-FEB-74', '1005556112', 2005);
INSERT INTO Patient VALUES ('333113', '333333113', 'November', 'Norman', 'N', '100 Northern Avenue', 'Alton', 'IL', '62022', 
'14-NOV-75', '1005556113', 2007);
INSERT INTO Patient VALUES ('333114', '333333114', 'Pappa', 'Rudolph', 'Pistol', '105 Northern Avenue', 'Alton', 'IL', '62022', 
'1-APR-18', '1005556114', 2008);
INSERT INTO Patient VALUES ('333115', '333333115', 'Reinhardt', 'Renny', NULL, 'Rural Route #4-Box 101A', 'Alton', 'IL', '62022', 
'11-APR-1959', '1005556115', 2010);
INSERT INTO Patient VALUES ('333116', '333333116', 'Queen', 'Quentin', NULL, 'North Quenton Road', 'O Fallon', 'IL', '62333', 
'21-AUG-1967', '1005556116', 2011);
INSERT INTO Patient VALUES ('333117', '333333117', 'Surrey', 'Sally', 'Sue', 'South Sue Street #6A', 'O Fallon', 'IL', '62333', 
'22-SEP-1970', '1005556117', 2012);

-- Patients in Critical Care Ward
INSERT INTO Patient VALUES ('666117', '333666117', 'Teal', 'Thomas', 'Tommy', 'South Turnover Street #77BA', 'O Fallon', 'IL', '62333', '2-SEP-92', '1005557001', 2100);
INSERT INTO Patient VALUES ('666118', '333666118', 'Vanquish', 'Vanna', 'Vanity', 'Rural Route #3-Box 42B', 'Edwardsville', 'IL', '62025', '3-OCT-72', '1005557002', 2101);
INSERT INTO Patient VALUES ('666119', '333666119', 'Uniform', 'Uley', 'U', 'Northern Uniform Road, #3', 'Edwardsville', 'IL', '62025', '13-AUG-1957', '1005557003', 2103);
INSERT INTO Patient VALUES ('666120', '333666120', 'Youngman', 'Yvonne', 'Y', 'Rural Route #3-Box 42B', 'Edwardsville', 'IL', '62025', 
'3-OCT-1966', '1005557003', 2104);
INSERT INTO Patient VALUES ('666121', '333666121', 'Zenna', 'Zina', NULL, 'Old Overhold Road #38', 'Alton', 'IL', '62022', '31-OCT-1967', '1005557003', 2105);

-- Patients in Pediatric Ward
INSERT INTO Patient VALUES ('421221', '777343221', 'Algebra', 'Albert', 'A', 'New Overhold Road #338', 'Alton', 'IL', '62022', 
'31-OCT-16', '1005558021', 5002);
INSERT INTO Patient VALUES ('421222', '777343222', 'Beaufort', 'Bradley', 'Bob', 'Southfork #8', 'Alton', 'IL', '62022', 
'30-NOV-18', '1005558022', 5004);
INSERT INTO Patient VALUES ('421223', '777343223', 'Crawford', 'Clyde', NULL, '100 Main St.', 'Edwardsville', 'IL', '62025', 
'3-SEP-19', '1005558023', 5005);
INSERT INTO Patient VALUES ('421224', '777343224', 'Dunland', 'Danny', 'Dresden', '42 Madison Avenue', 'Alton', 'IL', '62022', 
'13-JAN-17', '1005558024', 5008);
INSERT INTO Patient VALUES ('421225', '777343225', 'Ezzra', 'Ertha', 'Kit', '105 Troy Road', 'Edwardsville', 'IL', '62025', 
'15-MAR-16', '1005558025', 5009);
INSERT INTO Patient VALUES ('421226', '777343226', 'Funk', 'Filbert', NULL, 'North Funk Freeway #8', 'O Fallon', 'IL', '62333', 
'16-JAN-21', '1005558026', 5011); 
INSERT INTO Patient VALUES ('421227', '777343227', 'Greathouse', 'Gretchen', 'G', 'New Overhold Road #341', 'Alton', 'IL', '62022', '31-OCT-20', '1005558027', 5013);

-- OutPatients not currently in the hospital, not assigned to beds
INSERT INTO Patient VALUES ('421228', '777343228', 'Howard', 'Ronald', 'H', '15 Main St.', 'Alton', 'IL', '62022', 
'31-OCT-11', '1005558028', NULL);
INSERT INTO Patient VALUES ('421229', '777343229', 'Mullins', 'Mildred', NULL, '16 North Avenue', 'Edwardsville', 'IL', '62025', 
'5-JAN-92', '1005558029', NULL);
INSERT INTO Patient VALUES ('181230', '888343230', 'North', 'Norbert', 'Oliver', '205 Southwest Avenue', 'O Fallon', 'IL', '62333', 
'15-JAN-82', '1005558030', NULL);
INSERT INTO Patient VALUES ('191449', '222343529', 'Overstreet', 'Orville', NULL, '167 North Avenue', 'O Fallon', 'IL', '62333', '22-FEB-04', '1005558031', NULL);
COMMIT;

-- PatientNote table
CREATE TABLE PatientNote ( 
    PatientID             CHAR(6), 
    NoteID                DATE,
    PhysicianComment      VARCHAR2(4000),
    CONSTRAINT PK_PatientNote PRIMARY KEY (PatientID, NoteID),
    CONSTRAINT FK_PatientNoteToPatient FOREIGN KEY (PatientID) 
        REFERENCES Patient ON DELETE CASCADE );
COMMIT;

-- Populate PatientNote – 174 rows
INSERT INTO PatientNote VALUES ('100001', SYSDATE + 1, 
'Patient admitted from surgery at 1715 hours');
INSERT INTO PatientNote VALUES ('100001', SYSDATE + 1.2, 
'Abdominal dressing dry and intact following liver surgery.  Biliary drainage tube with moderate amount (50cc) of dark greenish drainage noted this shift.');
INSERT INTO PatientNote VALUES ('100002', SYSDATE, 
'Patient admitted from surgery at 0810 hours');
INSERT INTO PatientNote VALUES ('100002', SYSDATE + 0.3, 
'Patient appeared cyanotic with circumoral cyanosis (respiratory).');
INSERT INTO PatientNote VALUES ('100002', SYSDATE + 0.35, 
'Respiratory rate 24 and slightly labored.  O2 on at 3 liters per minute.');

INSERT INTO PatientNote VALUES ('100003', SYSDATE, 
'Patient admitted from ER at 2145 hours');
INSERT INTO PatientNote VALUES ('100003', SYSDATE + 0.1, 
'Patient complained of abdominal pain x2.  Abdomen distended with positive bowel sounds in all four quadrants.');
INSERT INTO PatientNote VALUES ('100024', SYSDATE + 2, 
'Patient admitted from ER at 2200 hours');
INSERT INTO PatientNote VALUES ('100024', SYSDATE + 2.01, 
'Dressing to Patients left toe changed x1 (diabetic).');
INSERT INTO PatientNote VALUES ('100024', SYSDATE + 2.02, 'Serosanguanous exudate noted on old dressing.  No purulent drainage noted.');

INSERT INTO PatientNote VALUES ('100025', SYSDATE, 
'Patient admitted from Admin and Records at 0730 hours');
INSERT INTO PatientNote VALUES ('100025', SYSDATE + 0.1, 
'Traction to Patients left leg intact.  Good CSM to toes which are warm and pink.');
INSERT INTO PatientNote VALUES ('100025', SYSDATE + 0.2, 
'Patient complained of left leg (thigh) pain.  Medicated x3 with Demerol 75mg and Phenegran 25mg with good relief from pain.');
INSERT INTO PatientNote VALUES ('100025', SYSDATE + 1.1, 
'Patient complained of left leg (thigh) pain.  Medicated x5 with Demerol 75mg and Phenegran 25mg with good relief from pain.');
INSERT INTO PatientNote VALUES ('100026', SYSDATE + 10, 
'Patient admitted from surgery at 1456 hours');

INSERT INTO PatientNote VALUES ('100026', SYSDATE + 10.01, 
'Patient complained of sharp stabbing pain in right elbow.  Cast intact.');
INSERT INTO PatientNote VALUES ('100026', SYSDATE + 10.02, 
'Medicated with 10mg Morphine x2 for each complaint.');
INSERT INTO PatientNote VALUES ('100026', SYSDATE + 11, 
'Patient complained of dull ache pain in right elbow.  Cast intact.');
INSERT INTO PatientNote VALUES ('100026', SYSDATE + 11.02, 
'Medicated with 10mg Morphine x2 for each complaint.');
INSERT INTO PatientNote VALUES ('100027', SYSDATE + 5, 
'Patient admitted from ER at 0245 hours');

INSERT INTO PatientNote VALUES ('100027', SYSDATE + 5.1, 
'Left femur shows compound fracture just below knee.  Will schedule for surgery in AM.');
INSERT INTO PatientNote VALUES ('100027', SYSDATE + 5.2, 
'Medicated with 10mg Morphine for pain 1x/hour.');
INSERT INTO PatientNote VALUES ('100028', SYSDATE + 6, 
'Patient admitted from surgery at 1755 hours');
INSERT INTO PatientNote VALUES ('100028', SYSDATE + 6.1, 
'Patient log rolled x4 this shift for hip surgery treatment.  Left hip dressing dry and intact.  Good movement to left toes.');
INSERT INTO PatientNote VALUES ('100028', SYSDATE + 6.2, 
'Patient complained of hip (thigh) pain.  Medicated x3 with Demerol 75mg and Phenegran 25mg with good relief from pain.');

INSERT INTO PatientNote VALUES ('100029', SYSDATE + 2, 
'Patient admitted as scheduled at 0710 hours.  Prepare for surgery at 1400.');
INSERT INTO PatientNote VALUES ('100030', SYSDATE + 3.8, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100030', SYSDATE + 3.9, 
'Patient continues in reverse isolation.');
INSERT INTO PatientNote VALUES ('100030', SYSDATE + 4, 
'White count continues to be low at 2000 (oncology).  No complaints of pain, but Patient is lethargic.');
INSERT INTO PatientNote VALUES ('100031', SYSDATE + 4, 
'Patient admitted from surgery at 1645 hours');

INSERT INTO PatientNote VALUES ('100031', SYSDATE + 4.1, 
'Abdominal dressing changed. Old dressing has moderate amount of serosanguanous drainage.');
INSERT INTO PatientNote VALUES ('100031', SYSDATE + 4.2, 
'Staples to incision intact. No purulent drainage noted.');
INSERT INTO PatientNote VALUES ('100051', SYSDATE + 4, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100051', SYSDATE + 4.2, 
'Patients right side --ains flaccid. Negative Babinski to left foot (stroke).');
INSERT INTO PatientNote VALUES ('100051', SYSDATE + 4.25, 
'Pupil --ains dilated on right side.  No response to verbal stimuli.');

INSERT INTO PatientNote VALUES ('100301', SYSDATE, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100301', SYSDATE + 0.1, 
'Patients 3rd left digit lacerated between 1st and 2nd phalanx.  Area cleansed and sutured with 14 stitches.');
INSERT INTO PatientNote VALUES ('100301', SYSDATE + 0.15, 
'Patient complained of left hand pain.  Medicated x3 with Demerol 50mg and Phenegran 25mg with little relief from pain.');
INSERT INTO PatientNote VALUES ('100302', SYSDATE + 14, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100302', SYSDATE + 14.1, 
'Patient contraction timed at 8 minutes apart.  Patient manually checked and dilated 4cm.');

INSERT INTO PatientNote VALUES ('100302', SYSDATE + 14.2, 
'Patient contraction timed at 6 minutes apart.  Patient manually checked and dilated 4cm.');
INSERT INTO PatientNote VALUES ('100302', SYSDATE + 14.3, 
'Patient contraction timed at 4 minutes apart.  Patient manually checked and dilated 4cm.');
INSERT INTO PatientNote VALUES ('100303', SYSDATE + 12, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100303', SYSDATE + 12.1, 
'Pins sites to halo traction cleansed with peroxide x2. Pin sites without drainage.  Halo traction intact.');
INSERT INTO PatientNote VALUES ('100303', SYSDATE + 12.2, 
'Dressing to head laceration with dime-sized drainage on lower left corner.');

INSERT INTO PatientNote VALUES ('100303', SYSDATE + 12.25, 
'Patient complained of left hand pain.  Medicated x3 with Demerol 75mg and Phenegran 25mg with little relief from pain.');
INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6.1, 
'Patient sleeping and resting easy.');
INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6.2, 
'L chest tube inserted without difficulty by M.D. for knife wound.   Attached to Pluravac on floor at bedside.');
INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6.25, 
'Pluravac draining greenish purulent fluid (75cc this shift.');

INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6.3, 
'IV site in L anticubital reddened and puffy. IV --oved from L arm and warm compress applied. Left arm elevated on pillow.');
INSERT INTO PatientNote VALUES ('100304', SYSDATE + 6.35, 
'IV 22g intracath inserted into R hand with good blood return.');
INSERT INTO PatientNote VALUES ('100305', SYSDATE + 2, 
'Patient admitted from ER at 0400 hours');
INSERT INTO PatientNote VALUES ('100305', SYSDATE + 2.1, 
'Patient had tachycardia episode x1.  Heart rate 120 and racing.');
INSERT INTO PatientNote VALUES ('100305', SYSDATE + 2.2, 
'Patient complained of shortness of breath.');

INSERT INTO PatientNote VALUES ('100305', SYSDATE + 2.3, 
'IV Valium 10mg given with good results.  Heart rate returned to normal (84 within 10 minutes).');
INSERT INTO PatientNote VALUES ('100306', SYSDATE + 2, 
'Patient admitted from surgery at 0400 hours');
INSERT INTO PatientNote VALUES ('100306', SYSDATE + 2.1, 
'NG tube inserted into L nostril without resistance. Hooked to low wall suction. NG draining clear green fluid 125cc this shift.');
INSERT INTO PatientNote VALUES ('100422', SYSDATE + 2, 
'Patient admitted from ER at 1125 hours');
INSERT INTO PatientNote VALUES ('100422', SYSDATE + 2.2, 
'12 inch laceration to left arm with bone fragments protruding.  On call surgeon called—immediate surgery pending.  Vital signs stable.');

INSERT INTO PatientNote VALUES ('100422', SYSDATE + 2.3, 
'Patient complained of left humerus pain.  Medicated x3 with Demerol 75mg and Phenegran 25mg with little relief from pain.');
INSERT INTO PatientNote VALUES ('100423', SYSDATE, 
'Patient admitted from ER at 0650 hours');
INSERT INTO PatientNote VALUES ('100423', SYSDATE + 0.1, 
'Patient twisted ankle—Xray for possible fracture.');
INSERT INTO PatientNote VALUES ('100424', SYSDATE + 1, 
'Patient admitted from surgery at 0115 hours');
INSERT INTO PatientNote VALUES ('100424', SYSDATE + 1.1, 
'Pupils equal and reactive to light bilaterally.  Oriented to person, place and time x3.');

INSERT INTO PatientNote VALUES ('100424', SYSDATE + 1.2, 
'Laceration to scalp requiring 12 stitches.');
INSERT INTO PatientNote VALUES ('100424', SYSDATE + 1.25, 
'MRI to rule out fracture to cranium.');
INSERT INTO PatientNote VALUES ('100425', SYSDATE + 3, 
'Patient admitted from ER at 0100 hours');
INSERT INTO PatientNote VALUES ('100425', SYSDATE + 3.1, 
'Patient with feeding tube inserted this morning.  Dressing around tube dry and intact.  Will go for placement verification this AM via radiology.');
INSERT INTO PatientNote VALUES ('100500', SYSDATE, 
'Patient admitted to ER at 1440 hours');

INSERT INTO PatientNote VALUES ('100500', SYSDATE + 0.1, 
'Breath sounds diminished in left lower lobe.  Respiratory rate 24 and shallow.');
INSERT INTO PatientNote VALUES ('100500', SYSDATE + 0.2, 
'Continues on IV Aminophylline drip at 250mg/hr.');
INSERT INTO PatientNote VALUES ('100500', SYSDATE + 0.4, 
'L chest tube inserted without difficulty by M.D. Attached to Pluravac on floor at bedside.');
INSERT INTO PatientNote VALUES ('100500', SYSDATE + 0.45, 
'Pluravac draining greenish purulent fluid (75cc this shift.');
INSERT INTO PatientNote VALUES ('100501', SYSDATE + 1, 
'Patient admitted to ER at 0145 hours');

INSERT INTO PatientNote VALUES ('100501', SYSDATE + 1.1, 
'Pt. complains of shortness of breath. Respiratory rate 28 and labored.  O2 increased from 2L/min to 4L/min. M.D. notified.');
INSERT INTO PatientNote VALUES ('100501', SYSDATE + 1.2, 
'IV Valium 2.5mg given at 0215 hours.');
INSERT INTO PatientNote VALUES ('100502', SYSDATE + 3, 
'Patient admitted to ER at 0815 hours');
INSERT INTO PatientNote VALUES ('100502', SYSDATE + 3.1, 
'Patient slightly disoriented.  Skim clammy.  Acucheck results at 42 (diabetic).');
INSERT INTO PatientNote VALUES ('100502', SYSDATE + 3.2, 
'Given 15U regular Insulin along with sugar and orange juice.');

INSERT INTO PatientNote VALUES ('100502', SYSDATE + 3.25, 
'Patient rechecked in 30 minutes.  Skin dry.  Acucheck results 102.');
INSERT INTO PatientNote VALUES ('100503', SYSDATE + 2, 
'Patient admitted to ER at 0930 hours');
INSERT INTO PatientNote VALUES ('100503', SYSDATE + 2.1, 
'EKG has elevated ST wave.  Will place Patient on Procardia and monitor next EKG in 3 days.');
INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5, 
'Patient admitted to ER at 1123 hours');
INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5.1, 
'Pt. complains of shortness of breath. Respiratory rate 28 and labored.');

INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5.2, 
'O2 increased from 2L/min to 4L/min. M.D. notified.');
INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5.3, 
'Patient had tachycardia episode x1.  Heart rate 120 and racing.');
INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5.35, 
'Patient complained of shortness of breath.');
INSERT INTO PatientNote VALUES ('100504', SYSDATE + 5.4, 
'IV Valium 10mg given with good results.  Heart rate returned to 84 within 10 minutes.');
INSERT INTO PatientNote VALUES ('100505', SYSDATE + 7, 
'Patient admitted to ER at 1540 hours');

INSERT INTO PatientNote VALUES ('100505', SYSDATE + 7.1, 
'Patient complained of right arm pain.  Medicated x3 with Demerol 50mg and Phenegran 25mg with moderate relief from pain.');
INSERT INTO PatientNote VALUES ('100505', SYSDATE + 7.2, 
'Foreign object observed (splinter) under 4th left digit.  Area injected with Lidocaine and splinter --oved.  Digit dressed after betadine application to area.');
INSERT INTO PatientNote VALUES ('100506', SYSDATE + 2, 
'Patient admitted to ER at 0530 hours');
INSERT INTO PatientNote VALUES ('100506', SYSDATE + 2.1, 
'Patient complained of abdominal pain.  Medicated x3 with Demerol 50mg and Phenegran 25mg with moderate relief from pain.');
INSERT INTO PatientNote VALUES ('222001', SYSDATE, 
'Patient admitted from ER at 0730 hours');

INSERT INTO PatientNote VALUES ('222001', SYSDATE + 0.1, 
'Abdominal dressing dry and intact following hepatic revision.  Biliary drainage tube with moderate amount of dark greenish drainage.');
INSERT INTO PatientNote VALUES ('222002', SYSDATE + 1, 
'Patient admitted from ER at 0830 hours');
INSERT INTO PatientNote VALUES ('222002', SYSDATE + 1.1, 
'Patients left eye dressing and shield dry and intact.  No complaints of pain.');
INSERT INTO PatientNote VALUES ('555003', SYSDATE + 3, 
'Patient admitted from ER at 0920 hours');
INSERT INTO PatientNote VALUES ('555003', SYSDATE + 3.1, 
'Traction to Patients left leg intact.  Good CSM to toes which are warm and pink.');

INSERT INTO PatientNote VALUES ('555004', SYSDATE + 5, 
'Patient admitted from ER at 1200 hours');
INSERT INTO PatientNote VALUES ('555004', SYSDATE + 5.1, 
'Patient left chest tube milked x3.');
INSERT INTO PatientNote VALUES ('555005', SYSDATE + 1, 
'Patient admitted from ER at 1445 hours');
INSERT INTO PatientNote VALUES ('555005', SYSDATE + 1.1, 
'Patient Foley catheter draining well.');
INSERT INTO PatientNote VALUES ('222006', SYSDATE, 
'Patient admitted from ER at 0530 hours');

INSERT INTO PatientNote VALUES ('222006', SYSDATE + 0.1, 
'NG tube draining 300cc clear greenish fluid.  Bowel sounds absent.');
INSERT INTO PatientNote VALUES ('333110', SYSDATE + 2, 
'Patient admitted from ER at 1530 hours');
INSERT INTO PatientNote VALUES ('333110', SYSDATE + 2.1, 
'Pt. transfused with 4 Units packed cells and 10 Units of platelets. No signs of reaction. Tolerated procedure well.');
INSERT INTO PatientNote VALUES ('333111', SYSDATE, 
'Patient admitted from ER at 1235 hours');
INSERT INTO PatientNote VALUES ('333111', SYSDATE + 0.2, 
'Pt. continues to C/O sore mouth. Hydrogen peroxide 1-1/2 percent mouthwash used.');

INSERT INTO PatientNote VALUES ('333111', SYSDATE + 0.4, 
'Viscous Xylocaine jelly applied to oral mucous membranes for comfort with some relief of mouth discomfort.');
INSERT INTO PatientNote VALUES ('333111', SYSDATE + 1.1, 
'Patients family and M.D. had conference today regarding his stem cell transplant next week. Reverse isolation --ains in force due to pts low WBC (3500 today).');
INSERT INTO PatientNote VALUES ('333112', SYSDATE + 1, 
'Patient admitted from Admitting at 0948 hours');
INSERT INTO PatientNote VALUES ('333112', SYSDATE + 1.1, 'Hyper alimentation and lipids continue to infuse via R subclavian catheter at 125cc/hr.');
INSERT INTO PatientNote VALUES ('333112', SYSDATE + 2, 
'No redness or swelling noted at IV insertion site during dressing change. New Op-Site dressing applied without difficulty.');

INSERT INTO PatientNote VALUES ('333113', SYSDATE + 2, 
'Patient admitted from Surgery at 1005 hours');
INSERT INTO PatientNote VALUES ('333113', SYSDATE + 2.1, 
'Pt. continues with diarrhea and vomiting. IV started-22g angiocath in L anticubital with D5NS at 200cc/hr.');
INSERT INTO PatientNote VALUES ('333113', SYSDATE + 3, 
'Pt. attempted to crawl over railings of bed. Is disoriented to time and place.  Posey vest applied and bed rails raised.');
INSERT INTO PatientNote VALUES ('333113', SYSDATE + 5, 
'Pt. ambulatory in hallways X3 this shift. States he feels he has more strength today than any other day since surgery 3 days ago.');
INSERT INTO PatientNote VALUES ('333114', SYSDATE + 1, 
'Patient admitted from ER at 1450 hours');

INSERT INTO PatientNote VALUES ('333114', SYSDATE + 1.1, 
'Pt. continues with diarrhea and vomiting. IV started-22g angiocath in L anticubital with D5NS at 90cc/hr.');
INSERT INTO PatientNote VALUES ('333114', SYSDATE + 2, 
'Pt. had a moderate nosebleed which lasted for 20 minutes. It was stopped by slight pressure and a supine position. Pt platelet count this a.m. is 150,000.');
INSERT INTO PatientNote VALUES ('333115', SYSDATE + 2, 
'Patient admitted from ER at 1500 hours');
INSERT INTO PatientNote VALUES ('333115', SYSDATE + 2.1, 
'Pt C/O dentures poor fit since weight loss from cancer and chemotherapy. Also has stomatitis for which viscous Lidocaine mouthwash given.');
INSERT INTO PatientNote VALUES ('333115', SYSDATE + 2.3, 
'Pt diet changed from regular to soft foods this evening. Tolerated soft diet well for dinner.');

INSERT INTO PatientNote VALUES ('333116', SYSDATE + 1, 
'Patient admitted from Admitting at 0725 hours');
INSERT INTO PatientNote VALUES ('333116', SYSDATE + 1.1, 
'Pt. tolerated IV Oncovin treatment well. (Leukemia) WBC count pre-treatment 9800.');
INSERT INTO PatientNote VALUES ('333116', SYSDATE + 1.3, 
'No C/O nausea, but some chills during treatment which stopped within 30 minutes after start of treatment.');
INSERT INTO PatientNote VALUES ('333117', SYSDATE + 3, 
'Patient admitted from Admitting at 0725 hours');
INSERT INTO PatientNote VALUES ('333117', SYSDATE + 3.1, 'Hyper alimentation and lipids continue to infuse via R subclavian catheter at 125cc/hr.');

INSERT INTO PatientNote VALUES ('333117', SYSDATE + 3.3, 
'No redness or swelling noted at IV insertion site during dressing change. New Op-Site dressing applied without difficulty.');
INSERT INTO PatientNote VALUES ('666117', SYSDATE + 3, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('666117', SYSDATE + 3.2, 'Hyper alimentation and lipids continue to infuse via R subclavian catheter at 125cc/hr.');
INSERT INTO PatientNote VALUES ('666117', SYSDATE + 4, 
'No redness or swelling noted at IV insertion site during dressing change. New Op-Site dressing applied without difficulty.');
INSERT INTO PatientNote VALUES ('666118', SYSDATE, 
'Patient admitted from ER at 0725 hours');

INSERT INTO PatientNote VALUES ('666118', SYSDATE + 1, 
'IV site in L anticubital reddened and puffy. IV --oved from L arm and warm compress applied. Left arm elevated on pillow.');
INSERT INTO PatientNote VALUES ('666118', SYSDATE + 2, 
'IV 22g intracath inserted into R hand with good blood return.');
INSERT INTO PatientNote VALUES ('666118', SYSDATE + 2.2, 
'NG tube inserted into L nostril without resistance. Hooked to low wall suction. NG draining clear green fluid 125cc this shift.');
INSERT INTO PatientNote VALUES ('666119', SYSDATE + 2, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('666119', SYSDATE + 3, 
'Skin turgor poor. Lips dry and cracked. Skin jaundiced and eyes icteric.');

INSERT INTO PatientNote VALUES ('666119', SYSDATE + 4, 
'Foley catheter draining dark brown urine - 30cc in last eight hours. Pt lethargic and only responding to name.');
INSERT INTO PatientNote VALUES ('666119', SYSDATE + 4.7, 
'Patient RHCD at 2018 hours with family in attendance.  Body released to morgue at 2230 hours.');
INSERT INTO PatientNote VALUES ('666120', SYSDATE, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('666120', SYSDATE + 1, 
'Patient had tachycardia episode x1.  Heart rate 120 and racing.');
INSERT INTO PatientNote VALUES ('666120', SYSDATE + 1.2, 
'Patient complained of shortness of breath.');

INSERT INTO PatientNote VALUES ('666120', SYSDATE + 1.22, 
'IV Valium 10mg given with good results.  Heart rate returned to 84 within 10 minutes.');
INSERT INTO PatientNote VALUES ('666121', SYSDATE + 1, 
'Patient admitted from Surgery at 2225 hours');
INSERT INTO PatientNote VALUES ('666121', SYSDATE + 2, 
'Abdominal dressing changed. Old dressing has moderate amount of serosanguanous drainage.');
INSERT INTO PatientNote VALUES ('666121', SYSDATE + 2.1, 
'Staples to incision intact. No purulent drainage noted.');
INSERT INTO PatientNote VALUES ('666121', SYSDATE + 3, 
'Patient complained of abdominal pain.  Medicated x3 with Demerol 50mg and Phenegran 25mg with moderate relief from pain.');

INSERT INTO PatientNote VALUES ('421221', SYSDATE, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('421221', SYSDATE + 0.2, 
'Spinal tap done by M.D. Spinal fluid collected appeared clear and colorless. Sent to lab. Pt tolerated procedure well.');
INSERT INTO PatientNote VALUES ('421222', SYSDATE + 3, 'Patient admitted from Admitting at 0725 hours');
INSERT INTO PatientNote VALUES ('421222', SYSDATE + 3.1, 
'Pt. R arm --ains in cast with sling on. R fingers warm, pink and dry with good movement to all digits.');
INSERT INTO PatientNote VALUES ('421222', SYSDATE + 4, 
'Patient complained of arm pain.  Medicated with Demerol 10mg and Phenegran 10mg with good relief from pain.');

INSERT INTO PatientNote VALUES ('421223', SYSDATE + 3, 
'Patient admitted from Admitting at 0725 hours');
INSERT INTO PatientNote VALUES ('421223', SYSDATE + 3.2, 
'Factor VIII infusing into R arm without difficulty. No signs of bleeding or other distress noted.');
INSERT INTO PatientNote VALUES ('421223', SYSDATE + 4, 
'Pt. ambulatory in hallways X3 this shift.');
INSERT INTO PatientNote VALUES ('421224', SYSDATE + 3, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('421224', SYSDATE + 3.2, 
'Skin turgor fair, mucous membranes moist, crying tears. Diapers changed X3-weighed 75ccs, 55ccs, and 60ccs.');

INSERT INTO PatientNote VALUES ('421225', SYSDATE + 3, 
'Patient admitted from ER at 0725 hours');
INSERT INTO PatientNote VALUES ('421225', SYSDATE + 3.4, 
'Pt took total of 80ccs Pedilyte this shift. Suck fair, but continues lethargic with weak cry.');
INSERT INTO PatientNote VALUES ('421225', SYSDATE + 4, 
'#26 angiocath inserted into scalp vein without difficulty. IV infusing: D5NS at 25cc/hr.');
INSERT INTO PatientNote VALUES ('421226', SYSDATE, 'Patient admitted from Admitting at 1005 hours');
INSERT INTO PatientNote VALUES ('421226', SYSDATE + 0.2, 
'Inspiratory and expiratory wheeze still audible. Some rales noted in LLL. Respiratory rate shallow but unlabored at 28.');

INSERT INTO PatientNote VALUES ('421226', SYSDATE + 0.4, 
'Temp up to 101.4 this p.m. Given liquid Tylenol every 4 hours.');
INSERT INTO PatientNote VALUES ('421226', SYSDATE+ 1, 
'IV continues to infuse in L arm (D5NS at 125cc/hr.');
INSERT INTO PatientNote VALUES ('421227', SYSDATE + 2, 
'Patient admitted from Admitting at 0022 hours');
INSERT INTO PatientNote VALUES ('421227', SYSDATE + 2.2, 
'Heparin well in R hand flushed X2 without difficulty. Good blood return. Site without swelling or reddens.');
INSERT INTO PatientNote VALUES ('421227', SYSDATE + 3, 
'Pt. had restless night due to the fact her R arm was restrained for safety to protect IV site.');

INSERT INTO PatientNote VALUES ('421227', SYSDATE + 3.1, 
'Pt C/O stomach cramps with diarrhea X3.  Clear liquid diet tolerated well but Patient says she is hungry for more solid food.');
INSERT INTO PatientNote VALUES ('421228', SYSDATE - 30, 
'Patient admitted from ER at 0022 hours');
INSERT INTO PatientNote VALUES ('421228', SYSDATE - 29, 
'Pt. R arm-pains in cast with sling on. R fingers warm, pink and dry with good movement to all digits.');
INSERT INTO PatientNote VALUES ('421228', SYSDATE - 28, 
'Patient discharged at 08015 hours');
COMMIT;

-- Department table
CREATE TABLE Department (
    DepartmentNumber      NUMBER(4) 
        CONSTRAINT PK_Department PRIMARY KEY,
    DepartmentName        VARCHAR2(25) 
        CONSTRAINT NN_DepartmentName NOT NULL,
    ManagerID             CHAR(5),
    ManagerAssignedDate   DATE);
COMMIT;

-- Populate Department – 9 rows
 
-- supervisor is Eakin
INSERT INTO Department VALUES (1, 'Medical Surgical Ward 1', '23232', '21-AUG-17');
-- supervisor is Webber
INSERT INTO Department VALUES (2, 'Radiology', '23244', '10-JAN-21');
-- supervisor is Sumner
INSERT INTO Department VALUES (3, 'Emergency-Surgical', '10044', '15-SEP-21');
-- supervisor is Klepper
INSERT INTO Department VALUES (4, 'Oncology Ward', '66432', '10-DEC-16');
-- supervisor is Quattromani
INSERT INTO Department VALUES (5, 'Critical Care-Cardiology', '66425', '12-FEB-17');
-- supervisor is Becker, Roberta
INSERT INTO Department VALUES (6, 'Pediatrics-Gynecology', '88202', '29-MAR-08');
-- supervisor is Boudreaux, Betty
INSERT INTO Department VALUES (7, 'Pharmacy Department', '33356', '2-FEB-14');
-- supervisor is Boudreaux, Beverly
INSERT INTO Department VALUES (8, 'Admin/Labs', '33355', '15-JUN-15');
-- supervisor is Schultheis
INSERT INTO Department VALUES (9, 'OutPatient Clinic', '66427', '2-MAR-13');
COMMIT;

-- Employee table
CREATE TABLE Employee (
    EmployeeID            CHAR(5) CONSTRAINT PK_Employee PRIMARY KEY,
    SSN                   CHAR(9) 
        CONSTRAINT NN_EmpSSN NOT NULL,
    LastName              VARCHAR2(50) 
        CONSTRAINT NN_EmpLastName NOT NULL,
    FirstName             VARCHAR2(50) 
        Constraint NN_EmpFirstName NOT NULL,
    Middlename            VARCHAR2(50),
    DepartmentNumber      NUMBER(4) 
        CONSTRAINT FK_EmployeeToDepartment
            REFERENCES Department(DepartmentNumber)
            ON DELETE SET NULL,
    Office                VARCHAR2(10),
    DateHired             DATE,
    Title                 VARCHAR2(50) 
        Constraint NN_EmpTitle NOT NULL,
    WorkPhone             CHAR(10),
    PhoneExtension        VARCHAR2(4),
    LicensureNumber       VARCHAR2(20),
    Salary                NUMBER(9,2)
        CONSTRAINT CK_EmployeeSalary CHECK (Salary <= 50000),
    WageRate              NUMBER(7,2)
        CONSTRAINT CK_EmployeeWageRate CHECK (WageRate <= 150),
    ParkingSpace          NUMBER(5)
        CONSTRAINT UN_EmployeeParkingSpace UNIQUE,
    Gender                CHAR(1) NULL,
    SupervisorID          CHAR(5),
    CONSTRAINT FK_EmployeeSupervisorID 
        FOREIGN KEY (SupervisorID)
        REFERENCES Employee );
COMMIT;

-- Populate Employee – 24 rows
 
INSERT INTO Employee VALUES ('67555', '981789642', 'Simmons', 'Lester', 'Lloyd', 8, 'SW4801', '3-MAR-18', 'Hospital Chief', '1005559401', '0031', 'ILRN763345', 22000, NULL, 24, 'M', NULL);
INSERT INTO Employee VALUES ('33355', '890536222', 'Boudreaux', 'Beverly', 'B', 8, 'NW0105', '15-OCT-21', 'V.P. Admin', '1005558287', '1213', NULL, 17520, NULL, 31, 'F',  '67555');
INSERT INTO Employee VALUES ('33344', '890563287', 'Adams', 'Adam', 'Allen', 8, 'NW0105', '29-JAN-05', 'Records Clerk', '1005558287', '1212', NULL, 5500, NULL, 30, 'M', '33355');
INSERT INTO Employee VALUES ('33358', '834576129', 'Thornton', 'Billy', 'Bob', 8, 'NW0220', '14-APR-20', 'Building Custodian', 1005558287, '1213', NULL, NULL, 8.28, 71, 'M', '33355');
INSERT INTO Employee VALUES ('33359', '457890233', 'Clinton', 'William', 'Wilder', 8, 'NW0220', '5-JAN-21', 'Building Custodian', 1005558287, '1213', NULL, NULL, 7.35, 70, 'M', '33355');
INSERT INTO Employee VALUES ('23232', '310223232', 'Eakin', 'Maxwell', 'E', 1, 'SW4208', '6-JAN-18', 'M.D.', '1005559268', '0001', 'IL54386', 15000, NULL, 12, 'M', '67555');
INSERT INTO Employee VALUES ('01885', '215243964', 'Bock', 'Douglas', 'B', 1, 'SW4209', '11-AUG-07', 'M.D.', '1005559268', '0011', 'IL234576', 16250, NULL, 8, 'M', '23232');
INSERT INTO Employee VALUES ('23244', '316223244', 'Webber', 'Eugene', NULL, 2, 'SW4392', '6-FEB-15', 'M.D.', '1005559270', '4410', 'IL38385', 17500, NULL, 11, 'M', '67555');
INSERT INTO Employee VALUES ('23100', '261223803', 'Bordoloi', 'Bijoy', NULL, 2, 'SW4392', '23-AUG-19', 'M.D.', '1005559270', '4411', 'IL8398663', 17850, NULL, 9, 'M', '23244');
INSERT INTO Employee VALUES ('88777', '664865650', 'Smith', 'Alyssa', 'Michelle', 2, 'SW4414', '10-JUN-19', 'Rad. Tech.', '1005559267', '3444', 'IL98993455', 4550, NULL, 42, 'F', '23244');
INSERT INTO Employee VALUES ('10044', '216223308', 'Sumner', 'Elizabeth', NULL, 3, 'SW4393', '16-FEB-21', 'M.D.-Chief of Surgery', '1005559271', '3201', 'IL419057', 16500, NULL, 10, 'F', '67555');
INSERT INTO Employee VALUES ('88101', '347889991', 'Becker', 'Robert', 'B', 3, 'SW4408', '14-DEC-02', 'M.D.', '1005559284', '0355', 'IL2398457', 23545, NULL, 43, 'M', '10044');
INSERT INTO Employee VALUES ('88303', '654339993', 'Jones', 'Quincey', NULL, 3, 'SW4408', '1-JAN-10', 'M.D.', '1005559284', '0355', 'MO8935781', 30550, NULL, 44, 'M', '10044');
INSERT INTO Employee VALUES ('88404', '787249002', 'Barlow', 'William', 'Allen', 3, 'SW4408', '16-MAY-21', 'M.D.', '1005559284', '0355', 'MO9873346', 27500, NULL, 45, 'M', '10044');
INSERT INTO Employee VALUES ('88505', '548865540', 'Smith', 'Susan', 'Anne', 3, 'SW4408', '19-JUN-20', 'M.D.', '1005559284', '0355', 'IL4590225', 32500, NULL, 46, 'F', '10044');
INSERT INTO Employee VALUES ('66432', '980789632', 'Klepper', 'Robert', NULL, 4, 'SW4422', '1-FEB-04', 'M.D.', '1005559268', '0201', 'MO55662398', 15055, NULL, 22, 'M', '67555');
INSERT INTO Employee VALUES ('66444', '980789632', 'Zumwalt', 'Mary', 'Sue', 4, 'SW4804', '3-JAN-16', 'R.N.', '1005559401', '0033', 'ILRN872589', 6500, NULL, 47, 'F', '66432');
INSERT INTO Employee VALUES ('66425', '261803223', 'Quattromani', 'Toni', 'A', 5, 'SW4410', '10-NOV-09', 'M.D.', '1005559280', '0222', 'MO4398777', 22325, NULL, 20, 'F', '66432');
INSERT INTO Employee VALUES ('88202', '232888647', 'Becker', 'Roberta', 'G', 6, 'SW4408', '14-DEC-02', 'M.D.', '1005559284', '0355', 'IL4455872', 23000, NULL, 50, 'F', '67555');
INSERT INTO Employee VALUES ('66532', '980789632', 'Brockwell', 'Mary Ellen', NULL, 6, 'SW4800', '23-FEB-16', 'R.N.', '1005559401', '0030', 'ILRN435576', 4800, NULL, 23, 'F', '88202');
INSERT INTO Employee VALUES ('67585', '445667323', 'Simmons', 'Leslie', 'Lloyd', 6, 'SW4802', '30-MAR-18', 'L.P.N.', '1005559401', '0032', 'ILLPN478892', 2200, NULL, 51, 'F', '88202');
INSERT INTO Employee VALUES ('67666', '732971001', 'Young', 'Yvonne', 'Elaine', 6, 'SW4803', '26-FEB-20', 'L.P.N.', '1005559401', '0033', 'ILLPN478892', 2200, NULL, 52, 'F', '88202');
INSERT INTO Employee VALUES ('33356', '790543232', 'Boudreaux', 'Betty', NULL, 7, 'NW0106', '5-NOV-20', 'Pharmacist', '1005558287', '1214', NULL, 4895, NULL, NULL, 'F', '33355');
INSERT INTO Employee VALUES ('66427', '348789991', 'Schultheis', 'Robert', 'A', 9, 'SW4408', '14-DEC-99', 'M.D.', '1005559284', '0333', 'IL45982245', 17525, NULL, 21, 'M', '23232');
COMMIT;

-- Dependent table
CREATE TABLE Dependent (
    EmployeeID                CHAR(5),
    Name                      VARCHAR2(40),
    Gender                    CHAR(1),
    BirthDate                 DATE,
    RelationshipToEmployee    VARCHAR2(15),
    CONSTRAINT PK_Dependent PRIMARY KEY (EmployeeID, Name),
    CONSTRAINT FK_DependentToEmployee FOREIGN KEY (EmployeeID) 
        REFERENCES Employee ON DELETE CASCADE );
COMMIT;

-- Populate Dependent – 13 rows
 
INSERT INTO dependent VALUES ('67555', 'Jo Ellen', 'F', 
    TO_DATE('04-05-2016', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('67555', 'Andrew', 'M', 
    TO_DATE('10-25-2018', 'MM-DD-YYYY'), 'SON');
INSERT INTO dependent VALUES ('67555', 'Susan', 'F', 
    TO_DATE('05-03-1995', 'MM-DD-YYYY'), 'SPOUSE');
INSERT INTO dependent VALUES ('33355', 'Allen', 'M', 
    TO_DATE('02-29-1988', 'MM-DD-YYYY'), 'SPOUSE');
INSERT INTO dependent VALUES ('01885', 'Jeffery', 'M', 
    TO_DATE('01-01-2008', 'MM-DD-YYYY'), 'SON');
INSERT INTO dependent VALUES ('01885', 'Deanna', 'F', 
    TO_DATE('12-31-2009', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('01885', 'Rachael', 'F',
    TO_DATE('10-04-2015', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('01885', 'Michelle', 'F',
    TO_DATE('03-17-2004', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('01885', 'Mary Ellen', 'F', 
    TO_DATE('05-05-1976', 'MM-DD-YYYY'), 'SPOUSE');
INSERT INTO dependent VALUES ('23100', 'Mita', 'F',
    TO_DATE('06-04-1976', 'MM-DD-YYYY'), 'SPOUSE');
INSERT INTO dependent VALUES ('23100', 'Anita', 'F',
    TO_DATE('07-06-2014', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('23100', 'Monica', 'F',
    TO_DATE('12-30-2016', 'MM-DD-YYYY'), 'DAUGHTER');
INSERT INTO dependent VALUES ('23100', 'Rita', 'F',
    TO_DATE('05-11-2018', 'MM-DD-YYYY'), 'DAUGHTER');
COMMIT;


-- Specialty table
CREATE TABLE Specialty ( 
    SpecialtyID           CHAR(6) CONSTRAINT PK_Specialty PRIMARY KEY, 
    Title                 VARCHAR2(50) NOT NULL,
    AwardedBy             VARCHAR2(100) );
COMMIT;

-- Populate Specialty – 15 rows
 
INSERT INTO Specialty VALUES ('OPT', 'Optometrist', 
'Complete certified program of instruction for Optometry.');
INSERT INTO Specialty VALUES ('ONC', 'Oncologist', 
'Complete Medical Doctor of Oncology board certification.');
INSERT INTO Specialty VALUES ('RAD', 'Radiologist', 
'Complete Medical Doctor of Radiology board certification.');
INSERT INTO Specialty VALUES ('CAR', 'Cardiologist', 
'Complete Medical Doctor of Cardiology board certification.');
INSERT INTO Specialty VALUES ('GYN', 'Gynecologist', 
'Complete Medical Doctor of Gynecology board certification.');
INSERT INTO Specialty VALUES ('GMD', 'General Practitioner', 'Complete Medical School.'); 
INSERT INTO Specialty VALUES ('SU1', 'Surgeon-Thoracic', 'Complete Thoracic Surgeon board certification.');
INSERT INTO Specialty VALUES ('SU2', 'Surgeon-General', 
'Complete General Surgeon board certification.');
INSERT INTO Specialty VALUES ('SU3', 'Neurosurgeon', 
'Complete Neurosurgery board certification.');
INSERT INTO Specialty VALUES ('PED', 'Pediatrician', 
'Complete Medical Doctor of Pediatrics board certification.');
INSERT INTO Specialty VALUES ('SU4', 'Surgeon-Abdominal Cavity', 'Complete Abdominal Surgical Procedures board certification.');
INSERT INTO Specialty VALUES ('RN1', 'Registered Nurse', 'Complete Registered Nurse board certification.');
INSERT INTO Specialty VALUES ('LPN', 'Licensed Practicing Nurse', 'Complete Licensed Practicing Nurse board certification.');
INSERT INTO Specialty VALUES ('NPR', 'Nurse-Practitioner', 'Complete Nurse-Practitioner board certification.');
INSERT INTO Specialty VALUES ('RA2', 'Radiology Technologist', 'Complete program of instruction in radiology technology.');
COMMIT;

-- EmployeeSpecialty table - associates Employee and Specialty tables
CREATE TABLE EmployeeSpecialty (
    EmployeeID            CHAR(5),
    SpecialtyID           CHAR(6),
    DateReceived          DATE DEFAULT SYSDATE,
    CONSTRAINT PK_EmployeeSpecialty PRIMARY KEY (EmployeeID, SpecialtyID),
    CONSTRAINT FK_EmployeeSpecialtyToEmployee 
        FOREIGN KEY (EmployeeID) REFERENCES Employee,
    CONSTRAINT FK_EmplSpecialtyToSpecialty 
        FOREIGN KEY (SpecialtyID) REFERENCES Specialty );
COMMIT;

-- Populate EmployeeSpecialty – 21 rows
 
INSERT INTO EmployeeSpecialty VALUES ('23232', 'GMD', '4-DEC-16');
INSERT INTO EmployeeSpecialty VALUES ('23244', 'RAD', '4-MAY-12');
INSERT INTO EmployeeSpecialty VALUES ('10044', 'GMD', '5-DEC-14');
INSERT INTO EmployeeSpecialty VALUES ('23100', 'RAD', '11-AUG-07');
INSERT INTO EmployeeSpecialty VALUES ('01885', 'GMD', '12-FEB-07');
INSERT INTO EmployeeSpecialty VALUES ('66425', 'CAR', '25-MAY-12');
INSERT INTO EmployeeSpecialty VALUES ('66427', 'GMD', '10-DEC-99');
INSERT INTO EmployeeSpecialty VALUES ('66432', 'ONC', '4-JAN-03');
INSERT INTO EmployeeSpecialty VALUES ('66532', 'NPR', '6-DEC-15');
INSERT INTO EmployeeSpecialty VALUES ('67555', 'RN1', '4-FEB-12');
INSERT INTO EmployeeSpecialty VALUES ('67585', 'LPN', '22-MAR-18');
INSERT INTO EmployeeSpecialty VALUES ('67666', 'LPN', '15-DEC-15');
INSERT INTO EmployeeSpecialty VALUES ('66444', 'RN1', '8-MAR-08');
INSERT INTO EmployeeSpecialty VALUES ('88101', 'SU1', '2-NOV-00');
INSERT INTO EmployeeSpecialty VALUES ('88202', 'SU4', '4-DEC-02');
INSERT INTO EmployeeSpecialty VALUES ('88303', 'SU2', '15-DEC-09');
INSERT INTO EmployeeSpecialty VALUES ('88404', 'SU3', '12-MAY-15');
INSERT INTO EmployeeSpecialty VALUES ('88505', 'SU2', '22-AUG-16');
INSERT INTO EmployeeSpecialty VALUES ('88777', 'RA2', '4-DEC-08');
INSERT INTO EmployeeSpecialty VALUES ('23232', 'SU2', '4-DEC-19');
INSERT INTO EmployeeSpecialty VALUES ('10044', 'SU2', '15-DEC-14');
COMMIT;

-- Project table
CREATE TABLE Project (
    ProjectNumber             NUMBER(4)
        CONSTRAINT PK_Project PRIMARY KEY,
    ProjectTitle              VARCHAR2(25) NOT NULL,
    Location                  VARCHAR2(15),
    DepartmentNumber          NUMBER(4),
CONSTRAINT FK_ProjectToDepartment FOREIGN KEY (DepartmentNumber)
    REFERENCES department ON DELETE SET NULL );
COMMIT;

-- Populate Project – 8 rows
 
INSERT INTO Project VALUES (1, 'New Surgical Suite', 'St. Louis', 1);
INSERT INTO Project VALUES (2, 'Remodel Surgical Suite', 'Alton', 1);
INSERT INTO Project VALUES (3, 'New MRI Installation', 'Maryville', 2);
INSERT INTO Project VALUES (4, 'Remodel ER Suite', 'Maryville', 3);
INSERT INTO Project VALUES (5, 'Personnel Records Update', 'Maryville', 8);
INSERT INTO Project VALUES (6, 'Add Crash Cart Equipment', 'Edwardsville', 3);
INSERT INTO Project VALUES (7, 'New Pediatric Monitors', 'St. Louis', 6);
INSERT INTO Project VALUES (8, 'Child Care Center', 'Alton', 6);
COMMIT;

-- ProjectAssignment table - associates Project and Employee tables
CREATE TABLE ProjectAssignment (
    EmployeeID                CHAR(5),
    ProjectNumber             NUMBER(4),
    HoursWorked               NUMBER(5,1),
    PlannedHours              NUMBER(5,1),
CONSTRAINT PK_ProjectAssignment PRIMARY KEY (ProjectNumber, EmployeeID),
CONSTRAINT FK_ProjectAssignmentToEmployee 
    FOREIGN KEY (EmployeeID) REFERENCES Employee ON DELETE CASCADE,
CONSTRAINT FK_ProjectAssignmentToProject 
    FOREIGN KEY (ProjectNumber) REFERENCES Project ON DELETE CASCADE );
COMMIT;

-- Populate ProjectAssignment – 19 rows
 
INSERT INTO ProjectAssignment VALUES ('23232', 1, 14.2, 15.5);
INSERT INTO ProjectAssignment VALUES ('23232', 2, 10.6, 30.0);
INSERT INTO ProjectAssignment VALUES ('01885', 3, 10.2, 10.5);
INSERT INTO ProjectAssignment VALUES ('66432', 3, 11.8, 10.2);
INSERT INTO ProjectAssignment VALUES ('88777', 3, 30.8, 25.5);
INSERT INTO ProjectAssignment VALUES ('23100', 4, 10.3, 15.0);
INSERT INTO ProjectAssignment VALUES ('88505', 4, 34.5, 42.3);
INSERT INTO ProjectAssignment VALUES ('33344', 4, 5.1, 11.8);
INSERT INTO ProjectAssignment VALUES ('66432', 4, 19.2, 18.3);
INSERT INTO ProjectAssignment VALUES ('67555', 5, 35.4, 35.0);
INSERT INTO ProjectAssignment VALUES ('33344', 5, 9.5, 10.5);
INSERT INTO ProjectAssignment VALUES ('33358', 5, 41.2, 65.0);
INSERT INTO ProjectAssignment VALUES ('66425', 6, NULL, 15.5);
INSERT INTO ProjectAssignment VALUES ('66532', 7, 14.8, NULL);
INSERT INTO ProjectAssignment VALUES ('67555', 7, 12.2, 15.8);
INSERT INTO ProjectAssignment VALUES ('23100', 7, NULL, 25.0);
INSERT INTO ProjectAssignment VALUES ('33344', 8, 23.0, 21.0);
INSERT INTO ProjectAssignment VALUES ('67555', 8, 24.1, 18.0);
INSERT INTO ProjectAssignment VALUES ('23232', 8, NULL, NULL);
COMMIT;

-- Equipment table
CREATE TABLE Equipment (
    EquipmentNumber           CHAR(4) CONSTRAINT PK_Equipment PRIMARY KEY,
    Description               VARCHAR2(25) NOT Null,
    OriginalCost              NUMBER(7,2),
    QuantityAvailable         NUMBER(4),
    ProjectNumber             NUMBER(4)
        CONSTRAINT FK_EquipmentToProject REFERENCES Project(ProjectNumber) 
            ON DELETE CASCADE );
COMMIT;

-- Populate Equipment – 9 rows
 
INSERT INTO Equipment VALUES ('1000', 'Tanks, Oxygen', 800.30, 8, 1);
INSERT INTO Equipment VALUES ('2000', 'Tanks, Nitrous Oxide', 355.55, 10, 2);
INSERT INTO Equipment VALUES ('3000', 'Scanner, MRI', 12849.99, 2, 3);
INSERT INTO Equipment VALUES ('4000', 'Table, MRI Scanner', 1269.85, 2, 3);
INSERT INTO Equipment VALUES ('5000', 'Printer', 172.00, 2, 5);
INSERT INTO Equipment VALUES ('5001', 'Computer, Desktop', 1489.95, 2, 5);
INSERT INTO Equipment VALUES ('6000', 'Computer, Notepad', 890.23, 3, 8);
INSERT INTO Equipment VALUES ('7000', 'Desk, Child', 285.40, 6, 8);
INSERT INTO Equipment VALUES ('8000', 'Chair, Child', 65.40, 12, 8);
COMMIT;

-- ServiceCategory table
CREATE TABLE ServiceCategory ( 
    CategoryID                 CHAR(3) CONSTRAINT PK_ServiceCategory PRIMARY KEY, 
    Description                VARCHAR2(50) NOT NULL );
COMMIT;

-- Populate ServiceCategory – 9 rows
 
INSERT INTO ServiceCategory VALUES ('OF1', 'Office Department Service Examinations');
INSERT INTO ServiceCategory VALUES ('GYN', 'Gynecology');
INSERT INTO ServiceCategory VALUES ('SUR', 'Surgery');
INSERT INTO ServiceCategory VALUES ('OLA', 'Office-Department Laboratory');
INSERT INTO ServiceCategory VALUES ('LAB', 'Laboratory-General');
INSERT INTO ServiceCategory VALUES ('PRO', 'Procedures-General');
INSERT INTO ServiceCategory VALUES ('RAD', 'Radiology');
INSERT INTO ServiceCategory VALUES ('INJ', 'Injections');
INSERT INTO ServiceCategory VALUES ('CAR', 'Cardiology');
COMMIT;

-- Service table
CREATE TABLE Service ( 
    ServiceID             CHAR(5) CONSTRAINT PK_Service PRIMARY KEY, 
    Description           VARCHAR2(50) NOT NULL,
    StandardCharge        NUMBER(7,2) CONSTRAINT CK_StandardCharge 
        CHECK (StandardCharge >= 0),
    Comments              VARCHAR2(2000),
    CategoryID            CHAR(3) CONSTRAINT FK_ServiceToServiceCategory
        REFERENCES ServiceCategory(CategoryID) );
COMMIT;

-- Populate Service – 105 rows
 
INSERT INTO Service VALUES ('36415', 'Blood Draw', 35.55, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('82947', 'Blood Glucose', 20.40, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('85018', 'Hemoglobin', 25.00, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('82270', 'Hemocult', 15.40, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('87220', 'KOH', 15.00, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('81025', 'Prognosis, Urine', 12.00, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('87430', 'Strep Screen', 13.50, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('81002', 'Urine/Dip', 10.75, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('81000', 'Urine/Micro', 12.90, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('99000', 'Special Handling', 35.75, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('87210', 'Wet Smear', 15.00, 
'Office Lab or Bedside Procedure', 'OLA');
INSERT INTO Service VALUES ('99201', 'Problem Focused', 55.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('99202', 'Expanded Problem ', 75.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('99203', 'Detailed Problem', 95.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('99204', 'Comprehensive. Moderate', 75.00, 'Office Service', 'OLA');
INSERT INTO Service VALUES ('99205', 'Comprehensive High', 95.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('99050', 'After Hours ', 125.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('99058', 'Emergency', 155.00, 
'Office Service', 'OLA');
INSERT INTO Service VALUES ('46600', 'Anoscopy', 21.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('92551', 'Audiometry', 45.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('69210', 'Cerumen-oval', 35.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('G0102', 'DRE', 30.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('93000', 'EKG/Interp', 85.00, 
'Office or Bedside Procedure', 'CAR');
INSERT INTO Service VALUES ('94010', 'Spirometry', 55.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('92567', 'Tympanometry', 40.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('94664', 'Breathing TX', 35.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('94760', 'Pulse Oxygen', 25.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('16020', 'Burn Debridement', 35.00, 
'Office or Bedside Procedure', 'PRO');
INSERT INTO Service VALUES ('85022', 'CBC', 21.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80053', 'Complete Metabolic', 115.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80072', 'Arthritis Panel (RA, ANA, UA, ESR)', 75.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80050', 'General Panel', 55.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80076', 'Hepatic Function', 95.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80048', 'Basic Metabolic', 35.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80061', 'Lipid Panel', 45.00, 
'Laboratory Analysis', 'LAB');

INSERT INTO Service VALUES ('84450', 'SGOT', 30.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('83036', 'Hgb A1C', 95.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('88142', 'Pap Smear', 75.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('88304', 'Pathology-General', 50.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('80055', 'Prenatal Panel', 110.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('85610', 'Protime/INR', 75.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('84152', 'PSA', 85.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('84443', 'TSH', 90.00, 'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('87060', 'Throat Culture', 45.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('87088', 'Urine Culture', 45.00, 
'Laboratory Analysis', 'LAB');
INSERT INTO Service VALUES ('72050', 'C-Spine (4 view min)', 205.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('70360', 'Soft Tissue Neck', 275.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('71020', 'CXR (2 view)', 225.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('71010', 'CXR (1 view)', 170.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('74000', 'Abdomen (KUB)', 240.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('74020', 'Abdomen Obst Series', 340.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('72110', 'Lumbar Spine (5 view)', 675.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73000', 'Clavicle (2 view)', 250.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73030', 'Shoulder (2 view min)', 250.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73070', 'Elbow (2 view)', 225.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73110', 'Wrist (3 view min)', 285.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73130', 'Hand (3 view)', 280.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73140', 'Finger (2 view)', 225.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73510', 'Hip (2 view min)', 275.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73562', 'Knee (3 view)', 325.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73610', 'Ankle (3 view)', 325.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73630', 'Foot (3 view)', 325.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73650', 'Calcaneus (2 view min)', 275.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('73660', 'Toe (2 view min)', 225.00, 'Radiological Procedures and Analysis', 'RAD');
INSERT INTO Service VALUES ('95115', 'Allergy #1', 25.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('95117', 'Allergy #2 + more', 55.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('J1055', 'Depo Provera Contracept', 85.00, 'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('J1050', 'Depo Provera Hormone tx', 95.00, 'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90700', 'DPT-AC VFC', 75.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90721', 'DPT-AC /HIB', 75.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90648', 'HIB VFC', 65.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90707', 'MMR VFC', 55.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90713', 'IPV VFC', 55.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90744', 'Hep B 0-19 VFC', 185.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90746', 'Hep B 20-adult', 195.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90718', 'dT Adult VFC', 75.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90716', 'Varicella Vac VFC', 65.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90633', 'Hep A vaccine', 175.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90657', 'Fluvax', 55.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90732', 'Pneumovax adult', 88.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90669', 'Prevnar Pedi', 92.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90788', 'Antibiotic Inj', 110.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90782', 'Therapeutic Inj', 75.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90471', 'Vaccine Inj #1', 45.00, 
'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('90472', 'Vaccine Inj #2 + more', 75.00, 'Office and Bedside Injections', 'INJ');
INSERT INTO Service VALUES ('11730', 'Nail Avulsion', 175.00, 
'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('11750', 'Nail Bed Destruct', 185.00, 
'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('10060', 'I and D Simple', 258.00, 
'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('10061', 'I and D Comp. Multiple', 320.00, 'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('10120', 'Cerumen-oval F.B.', 230.00, 
'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('11056', 'Skin Lesion Paring', 225.00, 
'Minor Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12000', 'Appendectomy', 555.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12001', 'Thoracic-General Exploratory', 6200.00, 'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12002', 'Thoracic-Lung', 6500.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12003', 'Thoracic-Heart', 9500.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12004', 'Abdominal-General', 6000.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12005', 'Pancreatic', 6500.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12006', 'Abdominal-Intestine', 7800.00, 'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12007', 'Cranial', 10000.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12008', 'Kidneys', 7500.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12009', 'Liver', 7800.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12010', 'Spinal-Exploratory', 3500.00, 'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12011', 'Spinal-Disc', 3800.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12012', 'Fracture-Simple', 1500.00, 
'Major Surgical Procedures', 'SUR');
INSERT INTO Service VALUES ('12013', 'Fracture-Complex', 2500.00, 
'Major Surgical Procedures', 'SUR');
COMMIT;

-- Treatment table - associates Patient, Employee, and Service tables
CREATE TABLE Treatment ( 
    TreatmentNumber       NUMBER(4),
    DateTreated           DATE,
    PatientID             CHAR(6) NOT NULL,
    EmployeeID            CHAR(5) NOT NULL,
    ServiceID             CHAR(5) NOT NULL,
    ChargeAmount          NUMBER(7,2) CONSTRAINT CK_ChargeAmount  
        CHECK (ChargeAmount >= 0),
    Comments              VARCHAR2(2000),
    CONSTRAINT PK_Treatment PRIMARY KEY (TreatmentNumber, DateTreated), 
    CONSTRAINT FK_TreatmentToPatient FOREIGN KEY (PatientID) REFERENCES Patient,
    CONSTRAINT FK_TreatmentToEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee,
    CONSTRAINT FK_TreatmentToService FOREIGN KEY (ServiceID) REFERENCES Service );
COMMIT;

-- Populate Treatment – 124 rows

INSERT INTO Treatment VALUES ( 1, SYSDATE - 29, '421228', '23232', '99203', 75.00, 'Examine cast.');
INSERT INTO Treatment VALUES ( 2, SYSDATE - 29, '421228', '23232', '73070', 250.00, 'Xray right arm at elbow.');

-- Treatments on SYSDATE
INSERT INTO Treatment VALUES ( 1, SYSDATE, '100002', '01885', '94664', 35.00, 'Breathing procedure completed.');
INSERT INTO Treatment VALUES ( 2, SYSDATE, '100002', '01885', '94760', 30.00, 'Pulse Ox 92%.');
INSERT INTO Treatment VALUES ( 3, SYSDATE, '100003', '23232', '99058', 155.00, 'Examined in Emergency Room – sent to Radiology for MRI.');
INSERT INTO Treatment VALUES ( 4, SYSDATE, '100003', '23100', '74000', 240.00, 'Completed abdominal MRI revealed probably appendicitis.');
INSERT INTO Treatment VALUES ( 5, SYSDATE, '100003', '88202', '12000', 555.00, 'Completed appendectomy without complication.');
INSERT INTO Treatment VALUES ( 6, SYSDATE, '100025', '10044', '90782', 75.00, 'Injection completed.');
INSERT INTO Treatment VALUES ( 7, SYSDATE, '100301', '66427', '99058', 155.00, 'Laceration treated-Patient admitted for observation.');
INSERT INTO Treatment VALUES ( 8, SYSDATE, '100301', '66427', '90782', 75.00, 'Injection completed.');
INSERT INTO Treatment VALUES ( 9, SYSDATE, '100423', '01885', '99058', 155.00, 'ER MD seen for possible fracture – sent to Radiology for Xray of Ankle.');
INSERT INTO Treatment VALUES ( 10, SYSDATE, '100500', '66427', '99058', 155.00, 'Emergency room screening for breathing problem.');
INSERT INTO Treatment VALUES ( 11, SYSDATE, '100500', '66427', '94010', 55.00, 'Breathing Treatment completed.');
INSERT INTO Treatment VALUES ( 12, SYSDATE, '100500', '23100', '71020', 225.00, 'Chest Xray completed.');
INSERT INTO Treatment VALUES ( 13, SYSDATE, '100500', '88101', '12002', 6500.00, 'Lung Thoracic surgery completed.');
INSERT INTO Treatment VALUES ( 14, SYSDATE, '222001', '88202', '12009', 7800.00, 'Hepatic revision completed.');
INSERT INTO Treatment VALUES ( 15, SYSDATE, '222006', '23232', '10060', 258.00, 'Insert NG tube-incision.');
INSERT INTO Treatment VALUES ( 16, SYSDATE, '333111', '66432', '99203', 95.00, 'Oncology exam for mouth sores-Thrush found.');
INSERT INTO Treatment VALUES ( 17, SYSDATE, '333111', '66444', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 18, SYSDATE, '333111', '66444', '80050', 55.00, 'General blood panel completed.');
INSERT INTO Treatment VALUES ( 19, SYSDATE, '421221', '66532', '99058', 155.00, 'ER-spinal meningitis diagnosed.');
INSERT INTO Treatment VALUES ( 20, SYSDATE, '421221', '23100', '12010', 1480.00, 'Spinal tap completed.');
INSERT INTO Treatment VALUES ( 21, SYSDATE, '421226', '23232', '80048', 35.00, 'Complete metabolic.');
INSERT INTO Treatment VALUES ( 22, SYSDATE, '421226', '66532', '36415', 35.55, 'Blood draw completed.');

-- Treatments on SYSDATE + 1
INSERT INTO Treatment VALUES ( 1, SYSDATE + 1, '100001', '01885', '87220', 15.40, 'Procedure completed without complication.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 1, '100025', '10044', '90782', 75.00, 'Injection #2 completed.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 1, '100424', '88404', '12007', 8500.00, 'Cranial surgery completed.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 1, '100424', '23100', '72050', 205.00, 'Cranial MRI results to surgeon.');
INSERT INTO Treatment VALUES ( 5, SYSDATE + 1, '100501', '66427', '99058', 155.00, 'ER screening for possible myocardial infarction.');
INSERT INTO Treatment VALUES ( 6, SYSDATE + 1, '100501', '66532', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 7, SYSDATE + 1, '100501', '66532', '85022', 21.00, 'Blood gases analysis.');
INSERT INTO Treatment VALUES ( 8, SYSDATE + 1, '100501', '66532', '94760', 25.00, 'Pulse Oxygen taken – 93%.');
INSERT INTO Treatment VALUES ( 9, SYSDATE + 1, '100501', '66532', '90782', 95.00, 'Valium injection completed.');
INSERT INTO Treatment VALUES ( 10, SYSDATE + 1, '222002', '23232', '99202', 75.00, 'Eye exam completed.');
INSERT INTO Treatment VALUES ( 11, SYSDATE + 1, '555005', '67585', 'G0102', 30.00, 'DRE- check Foley catheter.');
INSERT INTO Treatment VALUES ( 12, SYSDATE + 1, '333112', '10044', '10061', 320.00, 'Incision for lipid infusion completed.');
INSERT INTO Treatment VALUES ( 13, SYSDATE + 1, '333112', '66444', '90788', 110.00, 'IV insertion after surgery.');
INSERT INTO Treatment VALUES ( 14, SYSDATE + 1, '333114', '66444', '90788', 110.00, 'Reposition new IV insertion completed.');
INSERT INTO Treatment VALUES ( 15, SYSDATE + 1, '333114', '66444', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 16, SYSDATE + 1, '333114', '23232', '87220', 45.00, 'KOH completed.');
INSERT INTO Treatment VALUES ( 17, SYSDATE + 1, '333116', '67555', '90788', 135.00, 'IV Oncovin administered.');
INSERT INTO Treatment VALUES ( 18, SYSDATE + 1, '333116', '66432', '99203', 95.00, 'Oncology exam – leukemia treatment completed.');
INSERT INTO Treatment VALUES ( 19, SYSDATE + 1, '333116', '67555', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 20, SYSDATE + 1, '333116', '67555', '87220', 45.00, 'White blood cell completed.');
INSERT INTO Treatment VALUES ( 21, SYSDATE + 1, '666118', '66432', '90788', 110.00, 'IV site reinserted.');
INSERT INTO Treatment VALUES ( 22, SYSDATE + 1, '666118', '66432', '80053', 115.00, 'Complete metabolic series.');
INSERT INTO Treatment VALUES ( 23, SYSDATE + 1, '666120', '01885', '93000', 85.00, 'EKG completed.');
INSERT INTO Treatment VALUES ( 24, SYSDATE + 1, '666120', '01885', '94760', 25.00, 'Pulse oxygen taken – 94%.');
INSERT INTO Treatment VALUES ( 25, SYSDATE + 1, '666120', '01885', '90782', 75.00, 'Valium injection administered.');
INSERT INTO Treatment VALUES ( 26, SYSDATE + 1, '666121', '88202', '12005', 6500.00, 'Abdominal pancreatic surgery completed.');
INSERT INTO Treatment VALUES ( 27, SYSDATE + 1, '421226', '66532', '90788', 140.00, 'IV Tylenol administered.');

-- Treatments on SYSDATE + 2
INSERT INTO Treatment VALUES ( 1, SYSDATE + 2, '100024', '66444', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 2, '100024', '10044', '82947', 20.40, 'Blood Glucose normal.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 2, '100029', '88101', '99205', 125.00, 'Surgical consult.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 2, '100030', '66432', '99205', 125.00, 'Oncology consult.');

INSERT INTO Treatment VALUES ( 5, SYSDATE + 2, '100030', '67555', '36415', 35.55, 'Completed blood draw.');
INSERT INTO Treatment VALUES ( 6, SYSDATE + 2, '100030', '66432', '80050', 55.00, 'Completed general panel-returned results to consulting physician.');
INSERT INTO Treatment VALUES ( 7, SYSDATE + 2, '100305', '66425', '93000', 85.00, 'EKG shows periodic sinus wave abnormality approaching ventricular tachycardia.');
INSERT INTO Treatment VALUES ( 8, SYSDATE + 2, '100305', '66425', '90782', 110.00, 'IV Valium administered');
INSERT INTO Treatment VALUES ( 9, SYSDATE + 2, '100306', '67555', '99201', 55.00, 'Insert NG Tube');
INSERT INTO Treatment VALUES ( 10, SYSDATE + 2, '100306', '10044', '12001', 6200.00, 'Exploratory Thoracic completed.  Reschedule for Thoracic-Lung surgery.');
INSERT INTO Treatment VALUES ( 11, SYSDATE + 2, '100422', '66427', '99058', 150.00, 'ER-wrap laceration—refer to Xray.');
INSERT INTO Treatment VALUES ( 12, SYSDATE + 2, '100422', '23100', '73110', 285.00, 'ER-wrap laceration—refer to Xray.');
INSERT INTO Treatment VALUES ( 13, SYSDATE + 2, '100422', '66444', '90782', 75.00, 'Pain injection completed.');
INSERT INTO Treatment VALUES ( 14, SYSDATE + 2, '100506', '01885', '99203', 95.00, 'Examine abdomen for pain – negative.');
INSERT INTO Treatment VALUES ( 15, SYSDATE + 2, '100506', '67555', '90782', 75.00, 'Demerol injection completed.');
INSERT INTO Treatment VALUES ( 16, SYSDATE + 2, '333110', '66444', '90788', 110.00, 'IV antibiotic administered.');
INSERT INTO Treatment VALUES ( 17, SYSDATE + 2, '333113', '66444', '90788', 110.00, 'IV antibiotic administered.');
INSERT INTO Treatment VALUES ( 18, SYSDATE + 2, '333113', '23232', '99201', 55.00, 'Physical examination to determine cause of diarrhea.');
INSERT INTO Treatment VALUES ( 19, SYSDATE + 2, '333115', '66432', '99203', 95.00, 'Oncology examination – weight loss/stomatitis noted.');
INSERT INTO Treatment VALUES ( 20, SYSDATE + 2, '666119', '23232', '99058', 155.00, 'ER – End stage Hepatic carcinoma.');
INSERT INTO Treatment VALUES ( 21, SYSDATE + 2, '666119', '66432', '99203', 75.00, 'Oncology exam.');
INSERT INTO Treatment VALUES ( 22, SYSDATE + 2, '666119', '66432', '90782', 125.00, 'Morphine drip administered for pain.');
INSERT INTO Treatment VALUES ( 23, SYSDATE + 2, '421227', '66532', '90782', 115.00, 'Heparin well placed in right hand.');

-- Treatments on SYSDATE + 3
INSERT INTO Treatment VALUES ( 1, SYSDATE + 3, '100425', '66427', '99058', 175.00, 'Emergency room screening.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 3, '100425', '67555', '90782', 75.00, 'Pain injection.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 3, '100502', '66532', '99058', 155.00, 'ER screening for possible diabetic shock.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 3, '100502', '66532', '80050', 55.00, 'Blood panel completed.');
INSERT INTO Treatment VALUES ( 5, SYSDATE + 3, '100502', '66532', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 6, SYSDATE + 3, '100503', '01885', '99058', 155.00, 'ER screening following tachycardia episode.');
INSERT INTO Treatment VALUES ( 7, SYSDATE + 3, '100503', '01885', '93000', 85.00, 'EKG completed.');
INSERT INTO Treatment VALUES ( 8, SYSDATE + 3, '555003', '01885', '99058', 155.00, 'ER screening for left leg injury.');
INSERT INTO Treatment VALUES ( 9, SYSDATE + 3, '555003', '23232', '73510', 275.00, 'Hip Xray completed.');
INSERT INTO Treatment VALUES ( 10, SYSDATE + 3, '333117', '10044', '10061', 325.00, 'I and D for lipid infusion completed.');
INSERT INTO Treatment VALUES ( 11, SYSDATE + 3, '333117', '66432', '90788', 110.00, 'IV site reinserted.');
INSERT INTO Treatment VALUES ( 12, SYSDATE + 3, '666117', '10044', '10061', 325.00, 'I and D for lipid infusion completed.');
INSERT INTO Treatment VALUES ( 13, SYSDATE + 3, '666117', '66432', '90788', 110.00, 'IV site reinserted.');
INSERT INTO Treatment VALUES ( 14, SYSDATE + 3, '666121', '66532', '90782', 75.00, 'Demerol injection for pain administered.');
INSERT INTO Treatment VALUES ( 15, SYSDATE + 3, '421222', '23100', '73070', 250.00, 'Xray right elbow.');
INSERT INTO Treatment VALUES ( 16, SYSDATE + 3, '421222', '67555', '90782', 75.00, 'Demerol injection for pain administered.');
INSERT INTO Treatment VALUES ( 17, SYSDATE + 3, '421223', '66532', '90788', 145.00, 'IV for Factor III started.');
INSERT INTO Treatment VALUES ( 18, SYSDATE + 3, '421224', '66427', '36415', 35.55, 'Blood draw completed.');
INSERT INTO Treatment VALUES ( 19, SYSDATE + 3, '421224', '66427', '85018',  25.00, 'Hemoglobin.');
INSERT INTO Treatment VALUES ( 20, SYSDATE + 3, '421225', '23232', '99202',  75.00, 'Examine infant for lethargy.');

-- Treatments on SYSDATE + 4
INSERT INTO Treatment VALUES ( 1, SYSDATE + 4, '100031', '88202', '12000', 600.00, 'Completed appendectomy.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 4, '100051', '23232', '99202', 75.00, 'Examined for progress from stroke.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 4, '421225', '23232', '90788',  140.00, 'IV in scalp vein for D5NS started.');

-- Treatments on SYSDATE + 5
INSERT INTO Treatment VALUES ( 1, SYSDATE + 5, '100027', '10044', '99058', 155.00, 'Seen in ER.  Sent to Radiology for MRI left leg.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 5, '100027', '23244', '73562', 325.00, 'Xray ankle negative.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 5, '100027', '23244', '73610', 325.00, 'Xray shows fracture just below left knee in femur.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 5, '100027', '66444', '90782', 75.00, 'Injection completed.');
INSERT INTO Treatment VALUES ( 5, SYSDATE + 5, '100504', '66532', '99058', 155.00, 'ER examined following tachycardia episode.');
INSERT INTO Treatment VALUES ( 6, SYSDATE + 5, '100504', '66532', '94760', 25.00, 'Pulse oxygen completed – 93%.');
INSERT INTO Treatment VALUES ( 7, SYSDATE + 5, '100504', '67555', '90782', 95.00, 'Valium injection completed.');
INSERT INTO Treatment VALUES ( 8, SYSDATE + 5, '100504', '66532', '93000', 85.00, 'EKG completed.');
INSERT INTO Treatment VALUES ( 9, SYSDATE + 5, '555004', '01885', '99058', 435.00, 'ER-Insert chest tube completed.');

-- Treatments on SYSDATE + 6
INSERT INTO Treatment VALUES ( 1, SYSDATE + 6, '100028', '67555', '90782', 75.00, 'Injection completed.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 6, '100304', '66427', '90788', 110.00, 'Injection for antibiotic completed.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 6, '100304', '88101', '12001', 450.00, 'Thoracic exploratory to repair knife wound and insert chest tube.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 6, '100304', '66427', '88304', 50.00, 'General pathology report negative.');

-- Treatments on SYSDATE + 7
INSERT INTO Treatment VALUES ( 1, SYSDATE + 7, '100505', '01885', '99058', 155.00, 'ER screening for right arm pain and splinter under 4th left digit.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 7, '100505', '67555', '90782', 70.00, 'Injection Demerol completed.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 7, '100505', '01885', '99201', 75.00, '--ove splinter and bind.');

-- Treatments on SYSDATE + 10
INSERT INTO Treatment VALUES ( 1, SYSDATE + 10, '100026', '67555', '90716', 65.00, 'Injection completed.');

-- Treatments on SYSDATE + 11
INSERT INTO Treatment VALUES ( 2, SYSDATE + 11, '100026', '66444', '90716', 65.00, 'Injection completed.');

-- Treatments on SYSDATE + 12
INSERT INTO Treatment VALUES ( 1, SYSDATE + 12, '100303', '88777', '93000', 85.00, 'Completed EKG normal.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 12, '100303', '66444', '90716', 65.00, 'Injection completed.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 12, '100303', '23100', '72050', 205.00, 'C-spine Xray reveals no injury.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 12, '100303', '23100', '70360', 275.00, 'Soft tissue Xray reveals no injury.');

-- Treatments on SYSDATE + 14
INSERT INTO Treatment VALUES ( 1, SYSDATE + 14, '100302', '66427', '99058', 155.00, 'Seen in ER-admitted for childbirth delivery.');
INSERT INTO Treatment VALUES ( 2, SYSDATE + 14, '100302', '67585', '99201', 55.00, 'Completed examination for cervical dilation.');
INSERT INTO Treatment VALUES ( 3, SYSDATE + 14, '100302', '67585', '94760', 25.00, 'Check Pulse OX 98%.');
INSERT INTO Treatment VALUES ( 4, SYSDATE + 14, '100302', '66444', '36415', 35.55, 'Completed blood draw.');
INSERT INTO Treatment VALUES ( 5, SYSDATE + 14, '100302', '67585', '80050', 55.00, 'Completed general panel - negative.');
COMMIT;

-- Medicine table
CREATE TABLE Medicine ( 
    MedicineCode          CHAR(7) CONSTRAINT PK_Medicine PRIMARY KEY, 
    ScientificName        VARCHAR2(50) NOT NULL,
    Commonname            VARCHAR2(50) NOT NULL,
    Dosage                VARCHAR2(300) NOT NULL,
    Comments              VARCHAR2(500),
    QuantityOnhand        NUMBER(10) CONSTRAINT CK_MedicineQuantityOnHand 
        CHECK (QuantityOnHand >= 0),
    UnitOfMeasure         VARCHAR2(20) );
COMMIT;

-- Populate Medicine – 20 rows
 
INSERT INTO Medicine  VALUES ( 9999001, 'Promethazine', 'Phenegran', 
'25-50 Mg. IM or IV every 4 hours.', 'For nausea/vomiting potientitates narcotic administer.', 1200, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999002, 'Meperidine', 'Demerol', 
'25-100 Mg. (adult dosage) IM or IV every 4 hours.', 'For pain - narcotic.', 14000, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999003, 'Diazepam', 'Valium', 
'2-10 Mg. Oral 2 to 4 times/day.', 'Anti-anxiety.', 36000, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999004, 'Flurazepam', 'Dalmane', '15-30 Mg. at bedtime.  Oral.', 'Hypnotic for sleep.', 855, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999005, 'Potassium Penicillin V', 
'PenVK', '125-500 Mg. Oral every 4-6 hours.', 'Antibiotic.', 34365, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999006, 'Ampicillin', 'Ampicillin', 
'250-500 Mg. (adult dosage).  IV every 6 hours.', 'Antibiotic.', 16550, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999007, 'Hydroxyzine', 'Atarax', 
'10, 25, 50, 100 Mg (adult).  Oral every 4 hours.  Oral suspension (older child)-25 Mg / 5 Cc. Oral.', 'Antihistamine and sedative.', 855, 'M.Gram/C.Centimeter');
INSERT INTO Medicine  VALUES ( 9999008, 'Cyclobenzaprine', 'Flexeril', 
'10 Mg. every 6 hours.', 'Muscle relaxant.', 1450, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999009, 'Nitrofurantoin', 'Macradantin', '100 Mg. Oral 4 times/day.', 'Urinary antiseptic.', 5435, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999010, 'Chlorpropamide', 'Diabinese', '100-500 Mg.  Oral 1 time/day.', 'Oral antidiabetic.', 23500, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999011, 'Chlorothiazide', 'Diuril', 
'0.5-2.0 G.  One time/day or Two times for 1 day.', 'Diuretic (water pill).', 1830, 'G.');
INSERT INTO Medicine  VALUES ( 9999012, 'Digoxin', 'Lanoxin', 
'0.5-1.5 Mg. (adult).  Oral one time/day.', 'Strengthen heart efficiency (cardiac drug).', 1525, 'G.');
INSERT INTO Medicine  VALUES ( 9999013, 'Metaproterenol', 'Alupent', 
'20 Mg. (adult dosage).  Oral 3 times/day.', 'For asthma-relax bronchial muscle.', 7210, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999014, 'Clindamycin', 'Cleocin', 
'150-450 Mg. Oral every 6 hours (adult).  Up to 600 Mg. IM or IV every 6 hours in severe illness.', 'IM or IV antibiotic.', 8775, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999015, 'Nystatin', 'Nystatin', 
'400-600 Ku. 4/day Oral adult.  250-500 Ku. 4/day (suspension) infant ov. 3 mths. 100 Ku. 4/day newborn.', 'Antifungal for oral thrush and intestinal problems', 45000000, 'Kilo unit');
INSERT INTO Medicine  VALUES ( 9999016, 'Cimetidine', 'Tagamet', 
'300 Mg. Oral 4 times/day with meals adult or child.', 'For gastric acid secretion-gastric distress.', 72050, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999017, 'Ceftriaxone Sodium', 'Rocephin', '1-2 G. every day IM or IV adult – 50-75 MG 1 every 12 hours child.', 'Broad spectrum antibiotic.', 4255, 'Gram');
INSERT INTO Medicine  VALUES ( 9999018, 'Mupirocin', 
'Bactroban Ung. Ointment', 'Apply small amount topical to affected area 3 times/day.', 'Topical anti-infective for children for Impetigo.', 367, 'Tube');
INSERT INTO Medicine  VALUES ( 9999019, 'Ibuprofen', 'Motrin', 
'200-800 Mg. 4 times/day (adult).', 'Anti-inflammatory.', 23752, 'Milligram');
INSERT INTO Medicine  VALUES ( 9999020, 'Glycerin', 'Glycerol', 
'3 G. suppository or 5-15 Ml. Enema (adult and child over 6 years).  1-1.5 G. suppository or 2-5 Ml. Enema (child under 6 years).', 'For constipation.', 1452, 'Gram or Milliliter');
COMMIT;

-- Prescription table - associates Patient, Employee, and Medicine  tables
CREATE TABLE Prescription ( 
    PrescriptionNumber    NUMBER(9) CONSTRAINT PK_Prescription PRIMARY KEY, 
    DateIssued            DATE,
    MedicineCode          CHAR(7) NOT NULL,
    PatientID             CHAR(6) NOT NULL, 
    EmployeeID            CHAR(5) NOT NULL,
    DosagePrescribed      VARCHAR2(50) NOT NULL,
    Directions            VARCHAR2(500),
    CONSTRAINT FK_PrescriptionToMedicine 
        FOREIGN KEY (MedicineCode) REFERENCES Medicine,
    CONSTRAINT FK_PrescriptionToPatient 
        FOREIGN KEY (PatientID) REFERENCES Patient,
    CONSTRAINT FK_PrescriptionToEmployee 
        FOREIGN KEY (EmployeeID) REFERENCES Employee ); 
COMMIT;

-- Populate Prescription – 25 rows.
INSERT INTO Prescription VALUES (755444001, SYSDATE, '9999001', '222001', '88202', '200 Mg. 4 times/day.', 'Take after meal and before bedtime.');
INSERT INTO Prescription VALUES (755444011, SYSDATE, '9999002', '421228', '23232', '100 Mg. IV 4 times/day.', NULL);
INSERT INTO Prescription VALUES (755444014, SYSDATE, '9999019', '100301', '66427', '800 Mg. Tablets 3 times/day.', 'Take after meals.');
INSERT INTO Prescription VALUES (755444017, SYSDATE, '9999002', '100500', '88101', '100 Mg. IV.', 'Administer as needed for pain.');
INSERT INTO Prescription VALUES (755444020, SYSDATE, '9999017', '421221', '10044', '2 G. daily in IV.', NULL);
INSERT INTO Prescription VALUES (755445301, SYSDATE + 1, '9999017', '100424', '88404', '2 G. daily in IV.', NULL);
INSERT INTO Prescription VALUES (755445302, SYSDATE + 1, '9999003', '100501', '66532', '8 Mg. Oral 4/day.', 'Discontinue if Patient shows negative reaction.');
INSERT INTO Prescription VALUES (755445305, SYSDATE + 1, '9999001', '333112', '10044', '50 Mg. IV every 4 hours.', 'Do not give other narcotic pain meds with this med.');
INSERT INTO Prescription VALUES (755445308, SYSDATE + 1, '9999006', '666118', '66432', '400 Mg. IV every 6 hours.', NULL);
INSERT INTO Prescription VALUES (755445311, SYSDATE + 1, '9999003', '666120', '01885', '10 Mg. Oral 4/day.', 'Discontinue if Patient shows negative reaction.');
INSERT INTO Prescription VALUES (755445445, SYSDATE + 2, '9999012', '100305', '66425', '1.0 Mg.  One time/day.', 'Contraindicated for Flexeril.');
INSERT INTO Prescription VALUES (755445446, SYSDATE + 2, '9999003', '100305', '66425', '6 Mg. Oral 4/day.', 'Discontinue if Patient shows negative reaction.');
INSERT INTO Prescription VALUES (755445448, SYSDATE + 2, '9999002', '100422', '23100', '75 Mg. IM every 4 hours.', 'Do not administer other narcotic pain meds with this med.');
INSERT INTO Prescription VALUES (755445551, SYSDATE + 2, '9999017', '333110', '23232', '2 G. IV daily.', NULL);
INSERT INTO Prescription VALUES (755445553, SYSDATE + 2, '9999001', '333115', '66432', '50 Mg. IV every 4 hours.', 'May administer other narcotic pain meds for pain.');
INSERT INTO Prescription VALUES (755445554, SYSDATE + 3, '9999012', '100503', '01885', '1.5 Mg. Oral 1 time/day.', 'Discontinue in 4 days or if released from hospital stay.');
INSERT INTO Prescription VALUES (755445555, SYSDATE + 3, '9999006', '333117', '10044', '300 Mg. IV every 6 hours.', 'IV delivery x 5 days.');
INSERT INTO Prescription VALUES (755445558, SYSDATE + 3, '9999006', '421225', '23232', '100 Mg. IV every 6 hours.', 'IV delivery x 3 days.');
INSERT INTO Prescription VALUES (755445652, SYSDATE + 4, '9999017', '421225', '23232', '50 Mg. once every 12 hours.', 'IV delivery x 3 days.');
INSERT INTO Prescription VALUES (755445655, SYSDATE + 6, '9999002', '100304', '66427', '50 Mg. IM every 4 hours.', 'Change injection site with each administration.');
INSERT INTO Prescription VALUES (755445670, SYSDATE + 5, '9999012', '100504', '66425', '1.0 Mg. Oral 1 time/day.', NULL);
INSERT INTO Prescription VALUES (755445671, SYSDATE + 5, '9999013', '100504', '66425', '20 Mg. Oral 3 times/day.', NULL);
INSERT INTO Prescription VALUES (755445667, SYSDATE + 3, '9999012', '100502', '66532', '400 Mg. Oral 1 time/day.', NULL);
INSERT INTO Prescription VALUES (755445672, SYSDATE + 12, '9999013', '100303', '66425', '20 Mg. Oral 3 times/day.', 'Discontinue after 2 days.');
INSERT INTO Prescription VALUES (755445666, SYSDATE + 2, '9999002', '100306', '10044', '100 Mg. IM every 4 hours.', 'May be given with additional meds for pain.');
COMMIT;

-- Updates and Foreign Key Constraint Additions
-- Add FOREIGN KEY constraint between the Department 
-- and Employee tables to create a relationship SupervisesDepartment.
 ALTER TABLE Department ADD CONSTRAINT FK_DepartmentToEmployee 
    FOREIGN KEY (ManagerID) REFERENCES Employee (EmployeeID); 

-- End of table and index definitions 

-- Verify Row Count in Tables.
SELECT COUNT(*) As Room_62_rows 
    FROM Room;
SELECT COUNT(*) As BedClassification_10_rows 
    FROM BedClassification;
SELECT COUNT(*) As Bed_97_rows 
    FROM Bed;
SELECT COUNT(*) As Patient_60_rows 
    FROM Patient;
SELECT COUNT(*) As PatientNote_174_rows 
    FROM PatientNote;
SELECT COUNT(*) As Department_9_rows 
    FROM Department;
SELECT COUNT(*) As Employee_24_rows 
    FROM Employee;
SELECT COUNT(*) AS Dependent_13_rows 
    FROM Dependent;
SELECT COUNT(*) As Specialty_15_rows 
    FROM Specialty;
SELECT COUNT(*) As EmployeeSpecialty_21_rows 
    FROM EmployeeSpecialty;
SELECT COUNT(*) AS Project_8_rows FROM Project;
SELECT COUNT(*) As ProjectAssignment_19_rows 
    FROM ProjectAssignment;
SELECT COUNT(*) AS Equipment_9_rows 
    FROM Equipment;
SELECT COUNT(*) As ServiceCategory_9_rows 
    FROM ServiceCategory;
SELECT COUNT(*) As Service_105_rows 
    FROM Service;
SELECT COUNT(*) As Treatment_124_rows 
    FROM Treatment;
SELECT COUNT(*) As Medicine_20_rows 
    FROM Medicine;
SELECT COUNT(*) As Prescription_25_rows 
    FROM Prescription;

-- End of Script


