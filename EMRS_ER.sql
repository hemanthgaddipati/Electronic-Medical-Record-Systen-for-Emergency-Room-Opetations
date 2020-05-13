-- **********************************************************************************************************************************
-- This script creates my Electronic Medical Record System for ER admissions through ER discharge for hospitals particularly in USA
-- Created by HEMANTH CHOWDARY GADDIPATI for Applied DataBases(6120) project 1 
-- **********************************************************************************************************************************

-- createing the database Electronic Medical Record System for Emergency Room
DROP DATABASE IF EXISTS EMRS_ER;
CREATE DATABASE EMRS_ER;

-- selecting the above created database
USE EMRS_ER;

-- creating table
-- Tabe 1,2,3 is PATIENT INFORMATION

CREATE TABLE patientInformation
(
  patientId INT  PRIMARY KEY not null,
  patient_LastName   VARCHAR(50) not null,
  patient_FirstName varchar(50) not null,
  patient_MiddleName varchar(50),
  Patient_gender char(20) not null,
  patient_DoB date not null,
  patient_BloodGroup varchar(10),
  patient_addressLine1 varchar(100) not null,
  patient_addressLine2 varchar(100),
  city char(20) not null,
  state char(2) not null,
  Zipcode char(5) not null,
  countyCode char(5),
  country char(50) not null,
  patient_primaryPhone varchar(15) not null,
  patient_emailId varchar(50),
  patient_InsuranceProvider varchar(50) not null,
  patient_InsuranceGroupId varchar(20) not null,
  Patient_InsuranceUserId varchar(20) not null,
  Patient_InsuranceExpirationDate date not null
);

CREATE TABLE Audit_patientInformation
(
  patientId INT not null,
  patient_LastName   VARCHAR(50) not null,
  patient_FirstName varchar(50) not null,
  patient_MiddleName varchar(50),
  patient_addressLine1 varchar(100) not null,
  patient_addressLine2 varchar(100),
  city char(20) not null,
  state char(2) not null,
  Zipcode char(5) not null,
  countyCode char(5),
  country char(50) not null,
  patient_primaryPhone varchar(15) not null,
  patient_emailId varchar(50),
  patient_InsuranceProvider varchar(50) not null,
  patient_InsuranceGroupId varchar(20) not null,
  Patient_InsuranceUserId varchar(20) not null,
  Patient_InsuranceExpirationDate date not null,
  action_performed char(20),
  action_time datetime
);
-- Table 4,5,6 is CARE PROVIDER INFORMATION 

create table careProviderInformation
(
  providerId INT PRIMARY KEY not null,
  provider_fullName varchar(50) not null,
  provider_gender char(20) not null,
  provider_DoB varchar(10) not null,
  provider_status char(20) not null,
  provider_rating int,
  provider_LicenseID varchar(20) not null,
  provider_LicenseExpirationDate date not null,
  provider_speciality1_name char(50) not null,
  provider_speciality1_Id varchar(50) not null,
  provider_speciality2_name char(50),
  provider_speciality2_Id varchar(50),
  provider_AddressLine1 varchar(100) not null,
  provider_AddressLine2 varchar(100),
  city char(20) not null,
  state char(2) not null,
  Zipcode char(5) not null,
  country char(50) not null,
  provider_primaryPhone varchar(15) not null, 
  provider_emailID varchar(50) not null
);

create table Audit_careProviderInformation
(
  providerId INT not null,
  provider_fullName varchar(50) not null,
  provider_status char(20) not null,
  provider_rating int,
  provider_LicenseID varchar(20) not null,
  provider_LicenseExpirationDate date not null,
  provider_speciality1_name char(50) not null,
  provider_speciality1_Id varchar(50) not null,
  provider_speciality2_name char(50),
  provider_speciality2_Id varchar(50),
  provider_AddressLine1 varchar(100) not null,
  provider_AddressLine2 varchar(100),
  city char(20) not null,
  state char(2) not null,
  Zipcode char(5) not null,
  country char(50) not null,
  provider_primaryPhone varchar(15) not null, 
  provider_emailID varchar(50) not null,
  action_taken char(20),
  action_time datetime
);

-- Table 7 is patient's VISIT LOCATION and admission details

create table patientAdmission
(
  admissionId int auto_increment primary key not null,
  provider_Id int not null,
  patient_Id int not null,
  department_id char(10) not null, 
  emergency_level char(50),
  admission_date date not null,
  admin_comments varchar(200), 
  locationId INT not null,
  location_country varchar(20) not null,
  location_state varchar(20) not null,
  location_city varchar(20) not null,
  location_county varchar(20) not null,
  location_address varchar(20) not null,
  
CONSTRAINT providerID_fk
	FOREIGN KEY (provider_Id)
	REFERENCES careProviderInformation (providerId) on update cascade on delete cascade,
CONSTRAINT patientID_fk
	FOREIGN KEY (patient_Id)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade
);

create table Audit_patientAdmission
(
  admissionId int not null,
  provider_Id int not null,
  patient_Id int not null,
  department_id char(10) not null, 
  emergency_level char(50),
  admission_date date not null,
  admin_comments varchar(200), 
  locationId INT not null,
  location_country varchar(20) not null,
  location_state varchar(20) not null,
  location_city varchar(20) not null,
  location_county varchar(20) not null,
  location_address varchar(20) not null,
  action_taken char(20),
  action_time datetime
);

-- Table 9 is PATIENT VITALS details at the time of admission to the ER

create table patientVitals
(
  vitalId int auto_increment primary key not null,
  admissionId int not null,
  patientId int not null,
  locationId int not null,
  vital_Type_and_values varchar(200) not null,
  patient_comments varchar(200),
  staff_comments varchar(200),
  
CONSTRAINT admissionId_fk
	FOREIGN KEY (admissionId)
	REFERENCES patientAdmission (admissionId) on update cascade on delete cascade,
CONSTRAINT patientID1_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade
);

-- Table 10 is TESTS & PROCEDURES ordered

create table ordered_tests_procedures
(
  testId int auto_increment primary key not null,
  patientId int not null,
  vitalId int not null,
  providerId int not null,
  testName varchar(200),
  lab_staff_comments varchar(200),
  
CONSTRAINT providerID1_fk
	FOREIGN KEY (providerId)
	REFERENCES careProviderInformation (providerId) on update cascade on delete cascade,
CONSTRAINT patientID2_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade,
CONSTRAINT vitalsId0_fk
	FOREIGN KEY (vitalId)
	REFERENCES patientVitals (vitalId) on update cascade on delete cascade  
);

create table Audit_ordered_tests_procedures
(
  testId int not null,
  patientId int not null,
  vitalId int not null,
  providerId int not null,
  testName varchar(200),
  lab_staff_comments varchar(200),
  action_performed char(20),
  action_time datetime
);


-- Table 11 is RESULTS of the tests and procedures done on the patient

create table labResults
(
  Lab_resultId int auto_increment primary key not null,
  admissionId int not null,
  patientId int not null,
  lab_authID int not null,
  testId int not null,
  lab_verificationId int not null,
  testComments1 varchar(100),
  testComments2 varchar(100),
  lab_resultStatus char(20) not null,
  result_description varchar(200) not null,
  result_values varchar(200) not null,
  reference_range varchar(20) not null,
  summary_comments varchar(200),
  
CONSTRAINT admissionId1_fk
	FOREIGN KEY (admissionId)
	REFERENCES patientAdmission (admissionId) on update cascade on delete cascade,
CONSTRAINT patientID3_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade,
CONSTRAINT testId_fk
	FOREIGN KEY (testId)
	REFERENCES ordered_tests_procedures (testId) on update cascade on delete cascade
);

-- Table 12 is DRUGS & PRISCRIPTION details

create table Medications_prescribed
(
  medicationId int primary key not null,
  admissionId int not null,
  patientId int not null,
  providerId int not null,
  drug_prescriptionId int not null,
  drug_name varchar(50),
  drug_dosage varchar(20),
  drug_unitOfMeasurement char(10),
  drug_route char(10),
  drug_startDate date,
  drug_endDate date,
  drug_daily_intake int,
  
CONSTRAINT admissionId2_fk
	FOREIGN KEY (admissionId)
	REFERENCES patientAdmission (admissionId) on update cascade on delete cascade,
CONSTRAINT patientID4_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade,
CONSTRAINT providerID2_fk
	FOREIGN KEY (providerId)
	REFERENCES careProviderInformation (providerId) on update cascade on delete cascade
);

create table Audit_Medications_prescribed
(
  medicationId int not null,
  admissionId int not null,
  patientId int not null,
  providerId int not null,
  drug_prescriptionId int not null,
  drug_name varchar(50),
  drug_dosage varchar(20),
  drug_unitOfMeasurement char(10),
  drug_route char(10),
  drug_startDate date,
  drug_endDate date,
  drug_daily_intake int,
  action_performed char(20),
  action_time datetime
);


-- Table 13 is BILLING details

create table billing
(
  billingId int auto_increment primary key not null,
  medicationId int not null,
  testId int not null,
  patientId int not null,
  providerId int not null,
  admissionId int not null,
  totalBill int,
  amount_paid_by_InsuranceProvider int,
  
CONSTRAINT admissionId3_fk
	FOREIGN KEY (admissionId)
	REFERENCES patientAdmission (admissionId) on update cascade on delete cascade,
CONSTRAINT patientID5_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade,
CONSTRAINT providerID3_fk
	FOREIGN KEY (providerId)
	REFERENCES careProviderInformation (providerId) on update cascade on delete cascade,
CONSTRAINT testId1_fk
	FOREIGN KEY (testId)
	REFERENCES ordered_tests_procedures (testId) on update cascade on delete cascade,
CONSTRAINT medicationId_fk
	FOREIGN KEY (medicationId)
	REFERENCES Medications_prescribed (medicationId) on update cascade on delete cascade
);

-- Table 14 is DISCHARGE details

create table DISCHARGE
(
  dischargeId int auto_increment primary key not null,
  admissionId int not null,
  patientId int not null,
  providerId int not null,
  discharge_date date not null,
  discharge_location varchar(20) not null,
  Discharge_comments varchar(150),
  billingId int not null,
    
CONSTRAINT admissionId4_fk
	FOREIGN KEY (admissionId)
	REFERENCES patientAdmission (admissionId) on update cascade on delete cascade,
CONSTRAINT patientID6_fk
	FOREIGN KEY (patientId)
	REFERENCES patientInformation (patientId) on update cascade on delete cascade,
CONSTRAINT providerID4_fk
	FOREIGN KEY (providerId)
	REFERENCES careProviderInformation (providerId) on update cascade on delete cascade,
CONSTRAINT billingId_fk
	FOREIGN KEY (billingId)
	REFERENCES billing (billingId) on update cascade on delete cascade
);

create table Audit_DISCHARGE
(
  dischargeId int not null,
  admissionId int not null,
  patientId int not null,
  providerId int not null,
  discharge_date date not null,
  discharge_location varchar(20) not null,
  Discharge_comments varchar(150),
  billingId int not null,
  action_performed char(20),
  action_time datetime
);

-- create the indexes
CREATE INDEX patient_information ON patientInformation (patientId DESC);
CREATE INDEX Doctor_information ON careProviderInformation (providerId DESC);
CREATE INDEX hospitals_available ON patientAdmission (locationId DESC);
CREATE INDEX patient_discharges ON discharge (discharge_date DESC);
CREATE INDEX patient_billing ON discharge (billingId DESC);

-- inserting data to the DB

insert into patientInformation values (101, 'alex', 'john', 'davis', 'male', '1992-01-01', 'O-ve', '9101 Apt A', 'room 1', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1111', 'alex@john.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000101', '2022-01-01'),
									  (102, 'alex', 'anderson', 'xyz', 'Female', '1993-01-01', 'O+ve', '9101 Apt A', 'room 2', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1112', 'anderson@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000102', '2022-02-01'),
									  (103, 'doe', 'john', 'a1b2', 'male', '1992-02-01', 'A-ve', '9101 Apt A', 'room 3', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1113', 'john@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000103', '2022-01-01'),
                                      (104, 'grey', 'merideth', 'francis', 'Female', '1993-02-01', 'A+ve', '9101 Apt A', 'room 4', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1114', 'grey@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000104', '2022-02-01'),
                                      (105, 'karev', 'Alex', 'doe', 'male', '1992-03-01', 'B-ve', '9101 Apt A', 'room 5', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1115', 'karev@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000105', '2022-01-01'),
                                      (106, 'wilson', 'joe', 'jack', 'Female', '1993-03-01', 'B+ve', '9101 Apt A', 'room 6', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1116', 'wilson@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000106', '2022-02-01'),
                                      (107, 'oMalley', 'George', 'david', 'male', '1992-04-01', 'AB-ve', '9101 Apt A', 'room 7', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1117', 'omalley@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000107', '2022-01-01'),
                                      (108, 'torez', 'callie', 'ephigenia', 'Female', '1993-04-01', 'AB+ve', '9101 Apt A', 'room 8', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1118', 'torez@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000108', '2022-02-01'),
                                      (109, 'shepard', 'derek', 'awesome', 'male', '1992-05-01', 'o-ve', '9101 Apt A', 'room 9', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1119', 'derek@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000109', '2022-01-01'),
                                      (110, 'shepard', 'adisom', 'montgomery', 'Female', '1993-05-01', 'O+ve', '9101 Apt A', 'room 10', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1110', 'adison@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000110', '2022-02-01'),
                                      (111, 'sloan', 'mark', 'everett', 'male', '1992-06-01', 'o-ve', '9101 Apt A', 'room 11', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1121', 'mark@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000111', '2022-01-01'),
                                      (112, 'grey', 'lexie', 'francis', 'Female', '1993-06-01', 'O+ve', '9101 Apt A', 'room 12', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1122', 'lexie@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000112', '2022-02-01'),
                                      (113, 'altman', 'teddy', 'grace', 'Female', '1992-07-01', 'AB-ve', '9101 Apt A', 'room 13', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1123', 'teddy@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000113', '2022-01-01'),
                                      (114, 'hunt', 'owen', 'tragic', 'male', '1993-07-01', 'B+ve', '9101 Apt A', 'room 14', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1124', 'owen@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000114', '2022-02-01'),
                                      (115, 'perkins', 'andrew', 'who', 'male', '1992-08-01', 'B-ve', '9101 Apt A', 'room 15', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1125', 'andrew@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000115', '2022-01-01'),
                                      (116, 'koracick', 'tom', 'douche', 'male', '1993-08-01', 'A+ve', '9101 Apt A', 'room 16', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1126', 'tom@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000116', '2022-02-01'),
                                      (117, 'burke', 'preston', 'stupid', 'male', '1992-09-01', 'o-ve', '9101 Apt A', 'room 17', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1127', 'burke@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000117', '2022-01-01'),
                                      (118, 'yang', 'christina', 'fucking', 'Female', '1993-09-01', 'O+ve', '9101 Apt A', 'room 18', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1128', 'yang@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000118', '2022-02-01'),
                                      (119, 'riggs', 'nathen', 'good', 'male', '1992-10-01', 'B-ve', '9101 Apt A', 'room 19', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1129', 'riggs@mychoice.com', 'abc insurance', 'a1b2c3d4e5', 'abcdefgh000119', '2022-01-01'),
                                      (120, 'bailey', 'miranda', 'the boss', 'Female', '1993-10-01', 'AB+ve', '9101 Apt A', 'room 20', 'charlotte', 'NC', '28000', '0000','USA','+1-111-111-1120', 'bailey@mychoice.com', 'xyz insurance', 'x1y2z3a4b5', 'xyzdefgh000110', '2022-02-01');

insert into careProviderInformation values (201, 'Hemanth', 'Male', '1980-01-01', 'active',5, 'abc123201', '2050-01-01', 'neuro', 'A001', 'ENT','A002', '910 Apt A', 'room 1', 'charlotte', 'NC', '28000','USA','+1-111-111-2111', 'hemanth@mychoice.com'),
										   (202, 'Leela', 'female', '1980-01-01', 'active',5, 'abc123202', '2050-02-01', 'pediatric', 'A006', 'general','A004', '910 Apt A', 'room 2', 'charlotte', 'NC', '28000','USA','+1-111-111-2112', 'leela@mychoice.com'),
										   (203, 'Harish', 'Male', '1980-01-01', 'active',5, 'abc123203', '2050-01-01', 'cardio', 'A003', 'general','A004', '910 Apt A', 'room 3', 'charlotte', 'NC', '28000','USA','+1-111-111-2113', 'harish@mychoice.com'),
                                           (204, 'Jyothi', 'female', '1980-01-01', 'inactive',4, 'abc123204', '2050-02-01', 'general', 'A004', 'pediatric','A006', '910 Apt A', 'room 4', 'charlotte', 'NC', '28000','USA','+1-111-111-2114', 'jyothi@mychoice.com'),
                                           (205, 'Prashanth', 'Male', '1980-01-01', 'active',3, 'abc123205', '2050-01-01', 'plastic', 'A005', 'ENT','A002', '910 Apt A', 'room 5', 'charlotte', 'NC', '28000','USA','+1-111-111-2115', 'prashanth@mychoice.com'),
                                           (206, 'Dedeepya', 'female', '1980-01-01', 'active',5, 'abc123206', '2050-02-01', 'neuro', 'A001', 'General','A004', '910 Apt A', 'room 6', 'charlotte', 'NC', '28000','USA','+1-111-111-2116', 'dedeepya@mychoice.com'),
                                           (207, 'Shashank', 'Male', '1980-01-01', 'Inactive',4, 'abc123207', '2050-01-01', 'ortho', 'A007', 'ENT','A002', '910 Apt A', 'room 7', 'charlotte', 'NC', '28000','USA','+1-111-111-2117', 'shashank@mychoice.com'),
                                           (208, 'Poojitha', 'female', '1980-01-01', 'active',2, 'abc123208', '2050-02-01', 'obgyn', 'A010', 'pediatric','A006', '910 Apt A', 'room 8', 'charlotte', 'NC', '28000','USA','+1-111-111-2118', 'poojitha@mychoice.com');

                                       
insert into patientAdmission values (null, 201, 101, 'A001', 'urgent care Required', '2020-01-01', 'sick',801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
									(null,205, 111, 'A005', 'precaution care Required', '2020-01-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
									(null, 201, 102, 'A001', 'care Required', '2020-02-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null,205, 112, 'A005', 'urgent care Required', '2020-01-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null, 201, 103, 'A001', 'urgent care Required', '2020-03-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null,206, 113, 'A001', 'care Required', '2020-01-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null, 202, 104, 'A006', 'care Required', '2020-04-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null,206, 114, 'A001', 'urgent care Required', '2020-01-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null, 202, 105, 'A006', 'urgent care Required', '2020-05-01', 'sick', 801, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '801 UH drive'),
                                    (null,206, 115, 'A001', 'precaution care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 202, 106, 'A006', 'care Required', '2020-06-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null,208, 116, 'A010', 'care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 203, 107, 'A003', 'urgent care Required', '2020-07-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null,208, 117, 'A010', 'urgent care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 203, 108, 'A003', 'care Required urgent', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null,208, 118, 'A010', 'care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 203, 109, 'A003', 'urgent care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 201, 119, 'A001', 'care Required', '2020-03-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 205, 110, 'A005', 'urgent care Required', '2020-01-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive'),
                                    (null, 202, 120, 'A006', 'urgent care Required', '2020-05-01', 'sick', 802, 'USA', 'NC', 'Charlotte', 'Mecklenburg', '802 UH drive');

                                    
insert into patientVitals values (null, 1, 101, 801, 'BP:120/80, fever: 98.4, so2: normal', 'Patient says he has headaches', 'initial vitals look ok'),
								 (null, 2, 102, 801, 'BP:130/90, fever: 99.4, so2: high', 'Patient says he has fever and bodyaches', 'initial vitals look ok'),
                                 (null, 3, 103, 801, 'BP:131/90, fever: 99.4, so2: low', 'Patient says he has fever and cold', 'initial vitals look concerning'),
                                 (null, 4, 104, 801, 'BP:140/100, fever: 99.4, so2: normal', 'Patient says he has fever', 'initial vitals look ok'),
                                 (null, 5, 105, 801, 'BP:120/80, fever: 100.4, so2: normal', 'Patient says he has severe cold', 'initial vitals look ok'),
                                 (null, 6, 106, 801, 'BP:125/84, fever: 100.4, so2: low', 'Patient says he has fever and bodyaches', 'initial vitals look connerning'),
                                 (null, 7, 107, 801, 'BP:125/85, fever: 100.4, so2: high', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 8, 108, 801, 'BP:130/90, fever: 101.4, so2: low', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 9, 109, 801, 'BP:140/90, fever: 101.4, so2: low', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 10, 110, 801, 'BP:150/100, fever: 101.4, so2: low', 'Patient says he has fever and headaches', 'initial vitals look concerning'),
                                 (null, 11, 111, 802, 'BP:120/80, fever: 101.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 12, 112, 802, 'BP:120/80, fever: 102.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 13, 113, 802, 'BP:120/80, fever: 102.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 14, 114, 802, 'BP:120/80, fever: 102.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 15, 115, 802, 'BP:120/80, fever: 101.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 16, 116, 802, 'BP:130/90, fever: 100.4, so2: high', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 17, 117, 802, 'BP:140/90, fever: 103.4, so2: low', 'Patient says he has fever and headaches', 'initial vitals look concerning'),
                                 (null, 18, 118, 802, 'BP:140/90, fever: 99.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok'),
                                 (null, 19, 119, 802, 'BP:100/70, fever: 100.4, so2: low', 'Patient says he has migraine', 'initial vitals look ok'),
                                 (null, 20, 120, 802, 'BP:120/80, fever: 98.4, so2: normal', 'Patient says he has fever and headaches', 'initial vitals look ok');
                                 
insert into ordered_tests_procedures values (null, 101, 1, 201, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
											(null, 102, 2, 201, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 103, 3, 201, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 104, 4, 201, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 105, 5, 202, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 106, 6, 202, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 107, 7, 202, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 108, 8, 202, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 109, 9, 202, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 110, 10, 203, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 111, 11, 203, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 112, 12, 205, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 113, 13, 205, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 114, 14, 203, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 115, 15, 205, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 116, 16, 205, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 117, 17, 201, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 118, 18, 202, 'complete blood test', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 119, 19, 206, 'complete blood work up', 'test for common flu, typhoid and normal blood levels'),
                                            (null, 120, 20, 206, 'complete blood test', 'test for common flu, typhoid and normal blood levels');

									
insert into labResults values (null, 1, 101, 901, 1, 901, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
							  (null, 2, 102, 901, 2, 901, '','', 'complete', 'normal Elevated white cells level', 120000, 90000, 'Rest of the values are within normal range'),
                              (null, 3, 103, 901, 3, 901, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 4, 104, 901, 4, 901, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 5, 105, 901, 5, 901, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 6, 106, 902, 6, 902, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 7, 107, 902, 7, 902, '','', 'complete', 'normal Elevated blood preassure level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 8, 108, 902, 8, 902, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 9, 109, 902, 9, 902, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 10, 110, 902, 10, 902, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 11, 111, 903, 11, 903, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 12, 112, 903, 12, 903, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 13, 113, 903, 13, 903, '','', 'complete', 'normal Elevated blood hemoglobin level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 14, 114, 903, 14, 903, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 15, 115, 903, 15, 903, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 16, 116, 904, 16, 904, '','', 'complete', 'normal Elevated blood white cells level', 1400000, 90000, 'Rest of the values are within normal range'),
                              (null, 17, 117, 904, 17, 904, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 18, 118, 904, 18, 904, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 19, 119, 904, 19, 904, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range'),
                              (null, 20, 120, 904, 20, 904, '','', 'complete', 'normal Elevated blood glucose level', 140, 90, 'Rest of the values are within normal range');
                              
insert into medications_prescribed values (3001, 1, 101, 201, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
										  (3002, 2, 102, 201, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-02-01', '2020-01-20',2),
                                          (3003, 3, 103, 201, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-03-01', '2020-01-20',2),
                                          (3004, 4, 104, 201, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-04-01', '2020-01-20',2),
                                          (3005, 5, 105, 202, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-05-01', '2020-01-20',2),
                                          (3006, 6, 106, 202, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-06-01', '2020-01-20',2),
                                          (3007, 7, 107, 202, 4001, 'tylenol', '200', 'mg/ml', 'oral', '2020-07-01', '2020-01-20',2),
                                          (3008, 8, 108, 202, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-08-01', '2020-01-20',2),
                                          (3009, 9, 109, 202, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-09-01', '2020-01-20',2),
                                          (3010, 10, 110, 203, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-10-01', '2020-01-20',2),
                                          (3011, 11, 111, 203, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3012, 12, 112, 205, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3013, 13, 113, 205, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3014, 14, 114, 203, 4002, 'advil', '200', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3015, 15, 115, 205, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3016, 16, 116, 205, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3017, 17, 117, 201, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3018, 18, 118, 202, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-01-01', '2020-01-20',2),
                                          (3019, 19, 119, 206, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-03-01', '2020-01-20',2),
                                          (3020, 20, 120, 206, 4003, 'augmentin', '875-125', 'mg/ml', 'oral', '2020-05-01', '2020-01-20',2);

                                          
insert into billing values (null,3001,1,101,201,1,200,150),(null,3005,5,105,202,5,500,450),  (null,3009,9,109,202,9,200,150),(null,3013,13,113,205,13,300,250),(null,3017,17,117,201,17,400,150),
						   (null,3002,2,102,201,2,150,100),(null,3006,6,106,202,6,600,250),(null,3010,10,110,203,10,200,150),(null,3014,14,114,203,14,400,150),(null,3018,18,118,202,18,900,550),
                           (null,3003,3,103,201,3,300,150),(null,3007,7,107,202,7,700,350),(null,3011,11,111,203,11,300,150),(null,3015,15,115,205,15,500,350),(null,3019,19,119,206,19,500,450),
                           (null,3004,4,104,201,4,400,250),(null,3008,8,108,202,8,800,150),(null,3012,12,112,205,12,400,150),(null,3016,16,116,205,16,700,250),(null,3020,20,120,206,20,600,350);
                           
insert into discharge values (null, 1,101,201,'2020-01-01','ER', 'comments',1),(null, 11,111,203,'2020-01-01','ER', 'comments',11),
							 (null, 2,102,201,'2020-02-01','OP', 'comments',2),(null, 12,112,205,'2020-01-01','OP', 'comments',12),
                             (null, 3,103,201,'2020-03-01','ER', 'comments',3),(null, 13,113,205,'2020-01-01','ER', 'comments',13),
                             (null, 4,104,201,'2020-04-01','OP', 'comments',4),(null, 14,114,203,'2020-01-01','ER', 'comments',14),
                             (null, 5,105,202,'2020-05-01','ER', 'comments',5),(null, 15,115,205,'2020-03-01','OP', 'comments',15),
                             (null, 6,106,202,'2020-06-01','OP', 'comments',6),(null, 16,116,205,'2020-01-01','ER', 'comments',16),
                             (null, 7,107,202,'2020-08-01','ER', 'comments',7),(null, 17,117,201,'2020-04-01','ER', 'comments',17),
                             (null, 8,108,202,'2020-09-01','OP', 'comments',8),(null, 18,118,202,'2020-01-01','OP', 'comments',18),
                             (null, 9,109,202,'2020-09-01','ER', 'comments',9),(null, 19,119,206,'2020-08-01','ER', 'comments',19),
                             (null, 10,110,203,'2020-10-01','OP', 'comments',10),(null, 20,120,206,'2020-07-01','ICU-ER', 'comments',20);
                             
Create view patientBasicInfo as select patientId,patient_LastName,Patient_Firstname,patient_DoB,patient_emailId,patient_primaryPhone from patientInformation ;
create view providerBasicInfo as select provider_fullName,provider_rating,provider_status,provider_speciality1_name,provider_primaryPhone,provider_emailId from careProviderInformation;
create view patientAdmissionInfo as select patientInformation.PatientId,admissionId, locationId, admission_date from patientInformation, patientAdmission where patientInformation.PatientId=patientAdmission.patient_Id