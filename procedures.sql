USE emrs_er;
DROP PROCEDURE IF EXISTS insert_patientInformation;
DELIMITER //
CREATE PROCEDURE insert_patientInformation
(patientId INT ,patient_LastName VARCHAR(50),patient_FirstName varchar(50),patient_MiddleName varchar(50),Patient_gender char(20),patient_DoB date,patient_BloodGroup varchar(10),
patient_addressLine1 varchar(100),patient_addressLine2 varchar(100),city char(20),state char(2),Zipcode char(5),countyCode char(5),country char(50),patient_primaryPhone varchar(15),
patient_emailId varchar(50),patient_InsuranceProvider varchar(50),patient_InsuranceGroupId varchar(20),Patient_InsuranceUserId varchar(20),Patient_InsuranceExpirationDate date)
BEGIN
INSERT INTO patientInformation
VALUES ( patientId,patient_LastName,patient_FirstName,patient_MiddleName,Patient_gender,patient_DoB,patient_BloodGroup,patient_addressLine1,patient_addressLine2,city,
 state,Zipcode,countyCode,country,patient_primaryPhone,patient_emailId,patient_InsuranceProvider,patient_InsuranceGroupId,Patient_InsuranceUserId,Patient_InsuranceExpirationDate);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_careproviderInformation;
DELIMITER //
CREATE PROCEDURE insert_careproviderInformation
(providerId INT,provider_fullName varchar(50),provider_gender char(20),provider_DoB varchar(10),provider_status char(20),provider_rating int,provider_LicenseID varchar(20),
provider_LicenseExpirationDate date,provider_speciality1_name char(50),provider_speciality1_Id varchar(50),provider_speciality2_name char(50),provider_speciality2_Id varchar(50),
provider_AddressLine1 varchar(100),provider_AddressLine2 varchar(100),city char(20),state char(2),Zipcode char(5),country char(50),provider_primaryPhone varchar(15),provider_emailID varchar(50))
BEGIN
INSERT INTO careproviderinformation
VALUES (providerId,provider_fullName,provider_gender,provider_DoB,provider_status,provider_rating,provider_LicenseID,provider_LicenseExpirationDate,provider_speciality1_name,
provider_speciality1_Id,provider_speciality2_name,provider_speciality2_Id,provider_AddressLine1,provider_AddressLine2,city,state,Zipcode,country,provider_primaryPhone,provider_emailID);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_patientadmission;
DELIMITER //
CREATE PROCEDURE insert_patientadmission
(admissionId int,provider_Id int,patient_Id int,department_id char(10),emergency_level char(50),admission_date date,admin_comments varchar(200),locationId INT,location_country varchar(20),
location_state varchar(20),location_city varchar(20),location_county varchar(20),location_address varchar(20))
BEGIN
INSERT INTO patientadmission
VALUES (admissionId,provider_Id,patient_Id,department_id,emergency_level,admission_date,admin_comments,locationId,location_country,location_state,location_city,location_county,location_address);
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS insert_patientvitals;
DELIMITER //
CREATE PROCEDURE insert_patientvitals
(vitalId int,admissionId int,patientId int,locationId int,vital_Type_and_values varchar(200),patient_comments varchar(200), staff_comments varchar(200))
BEGIN
INSERT INTO patientvitals
VALUES (vitalId,admissionId,patientId,locationId,vital_Type_and_values,patient_comments, staff_comments);
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS insert_ordered_tests_procedures;
DELIMITER //
CREATE PROCEDURE insert_ordered_tests_procedures
(testId int,patientId int,vitalId int,providerId int,testName varchar(200),lab_staff_comments varchar(200))
BEGIN
INSERT INTO ordered_tests_procedures
VALUES (testId,patientId,vitalId,providerId,testName,lab_staff_comments);
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS insert_labresults;
DELIMITER //
CREATE PROCEDURE insert_labresults
(Lab_resultId int,admissionId int,patientId int,lab_authID int,testId int,lab_verificationId int,testComments1 varchar(100),testComments2 varchar(100),lab_resultStatus char(20),
result_description varchar(200),result_values varchar(200),reference_range varchar(20),summary_comments varchar(200))
BEGIN
INSERT INTO labresults
VALUES (Lab_resultId,admissionId,patientId,lab_authID,testId,lab_verificationId,testComments1,testComments2,lab_resultStatus,result_description,result_values,reference_range,summary_comments);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_medications_prescribed;
DELIMITER //
CREATE PROCEDURE insert_medications_prescribed
(medicationId int,admissionId int,patientId int,providerId int,drug_prescriptionId int,drug_name varchar(50),drug_dosage varchar(20),drug_unitOfMeasurement char(10),drug_route char(10),
drug_startDate date,drug_endDate date,drug_daily_intake int)
BEGIN
INSERT INTO medications_prescribed
VALUES (medicationId,admissionId,patientId,providerId,drug_prescriptionId,drug_name,drug_dosage,drug_unitOfMeasurement,drug_route,drug_startDate,drug_endDate,drug_daily_intake);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_billing;
DELIMITER //
CREATE PROCEDURE insert_billing
(billingId int,medicationId int,testId int,patientId int,providerId int,admissionId int,totalBill int,amount_paid_by_InsuranceProvider int)
BEGIN
INSERT INTO billing
VALUES (billingId,medicationId,testId,patientId,providerId,admissionId,totalBill,amount_paid_by_InsuranceProvider);
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_discharge;
DELIMITER //
CREATE PROCEDURE insert_discharge
(dischargeId int,admissionId int,patientId int,providerId int,discharge_date date,discharge_location varchar(20),Discharge_comments varchar(150),billingId int)
BEGIN
INSERT INTO discharge
VALUES (dischargeId,admissionId,patientId,providerId,discharge_date,discharge_location,Discharge_comments,billingId);
end//
DELIMITER ;

############################################################################################################################
-- delete stored procedures
############################################################################################################################

DROP PROCEDURE IF EXISTS delete_patientInformation;
DELIMITER //
CREATE PROCEDURE delete_patientInformation
(new_patientId INT)
BEGIN
delete from patientinformation where patientid= new_patientid;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_careproviderInformation;
DELIMITER //
CREATE PROCEDURE delete_careproviderInformation
(new_providerId INT)
BEGIN
delete from careproviderinformation where providerid=new_providerid;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_patientadmission;
DELIMITER //
CREATE PROCEDURE delete_patientadmission
(new_admissionId int)
BEGIN
delete from patientadmission where admissionid=new_admissionid;
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS delete_patientvitals;
DELIMITER //
CREATE PROCEDURE delete_patientvitals
(new_vitalId int)
BEGIN
delete from patientvitals where vitalid = new_vitalid;
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS delete_ordered_tests_procedures;
DELIMITER //
CREATE PROCEDURE delete_ordered_tests_procedures
(new_testId int)
BEGIN
delete from ordered_tests_procedures where testid = new_testid;
end//
DELIMITER ; 

DROP PROCEDURE IF EXISTS delete_labresults;
DELIMITER //
CREATE PROCEDURE delete_labresults
(new_Lab_resultId int)
BEGIN
delete from labresults where Lab_resultId = new_Lab_resultId;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_medications_prescribed;
DELIMITER //
CREATE PROCEDURE delete_medications_prescribed
(new_medicationId int)
BEGIN
delete from medications_prescribed where medicationid = new_medicationid;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_billing;
DELIMITER //
CREATE PROCEDURE delete_billing
(new_billingId int)
BEGIN
delete from billing where billingid = new_billingid;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_discharge;
DELIMITER //
CREATE PROCEDURE delete_discharge
(new_dischargeId int)
BEGIN
delete from discharge where dischargeid = new_dischargeid;
end//
DELIMITER ;

############################################################################################################################
-- update stored procedures
############################################################################################################################
USE emrs_er;
DROP PROCEDURE IF EXISTS update_patientInformation;
DELIMITER //
CREATE PROCEDURE update_patientInformation
(new_patientId INT ,new_patient_LastName VARCHAR(50),new_patient_FirstName varchar(50),new_patient_MiddleName varchar(50),new_patient_addressLine1 varchar(100),
new_patient_addressLine2 varchar(100),new_city char(20),new_state char(2),new_Zipcode char(5),new_countyCode char(5),new_country char(50),new_patient_primaryPhone varchar(15),
new_patient_emailId varchar(50),new_patient_InsuranceProvider varchar(50),new_patient_InsuranceGroupId varchar(20),new_Patient_InsuranceUserId varchar(20),new_Patient_InsuranceExpirationDate date)
BEGIN
update patientInformation
set patient_LastName=new_patient_lastname,patient_FirstName=new_patient_firstname,patient_MiddleName=new_patient_middlename,
patient_addressLine1=new_patient_addressline1,patient_addressLine2=new_patient_addressline2,city=new_city,state=new_state,Zipcode=new_zipcode,countyCode=new_countycode,
country=new_country,patient_primaryPhone=new_patient_primaryPhone,patient_emailId=new_patient_emailId,patient_InsuranceProvider=new_patient_InsuranceProvider,
patient_InsuranceGroupId=new_patient_InsuranceGroupId,Patient_InsuranceUserId=new_Patient_InsuranceUserId,Patient_InsuranceExpirationDate=new_Patient_InsuranceExpirationDate
where patientid = new_patientid;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS update_careproviderInformation;
DELIMITER //
CREATE PROCEDURE update_careproviderInformation
(new_providerId INT,new_provider_fullName varchar(50),new_provider_status char(20),new_provider_rating int,new_provider_LicenseID varchar(20),new_provider_LicenseExpirationDate date,
new_provider_speciality1_name char(50),new_provider_speciality1_Id varchar(50),new_provider_speciality2_name char(50),new_provider_speciality2_Id varchar(50),
new_provider_AddressLine1 varchar(100),new_provider_AddressLine2 varchar(100),new_city char(20),new_state char(2),new_Zipcode char(5),new_country char(50),
new_provider_primaryPhone varchar(15),new_provider_emailID varchar(50))
BEGIN
update careproviderinformation
set provider_fullName=new_provider_fullName,provider_status=new_provider_status,provider_rating=new_provider_rating,provider_LicenseID=new_provider_LicenseID,
provider_LicenseExpirationDate=new_provider_LicenseExpirationDate,provider_speciality1_name=new_provider_speciality1_name,provider_speciality1_Id=new_provider_speciality1_Id,
provider_speciality2_name=new_provider_speciality2_name,provider_speciality2_Id=new_provider_speciality2_Id,provider_AddressLine1=new_provider_AddressLine1,provider_AddressLine2=new_provider_AddressLine2,
city=new_city,state=new_state,Zipcode=new_zipcode,country=new_country,provider_primaryPhone=new_provider_primaryPhone,provider_emailID=new_provider_emailID
where providerId=new_providerid;
end//
DELIMITER ;


DROP PROCEDURE IF EXISTS update_ordered_tests_procedures;
DELIMITER //
CREATE PROCEDURE update_ordered_tests_procedures
(new_testId int,new_patientId int,new_vitalId int,new_providerId int,new_testName varchar(200),new_lab_staff_comments varchar(200))
BEGIN
update ordered_tests_procedures
set patientId=new_patientId,vitalId=new_vitalId,providerId=new_providerId,testName=new_testName,lab_staff_comments=new_lab_staff_comments
where testid = new_testid;
end//
DELIMITER ; 


DROP PROCEDURE IF EXISTS update_medications_prescribed;
DELIMITER //
CREATE PROCEDURE update_medications_prescribed
(new_medicationId int,new_admissionId int,new_patientId int,new_providerId int,new_drug_prescriptionId int,new_drug_name varchar(50),new_drug_dosage varchar(20),new_drug_unitOfMeasurement char(10),new_drug_route char(10),
new_drug_startDate date,new_drug_endDate date,new_drug_daily_intake int)
BEGIN
update medications_prescribed
set admissionId=new_admissionId,patientId=new_patientId,providerId=new_providerId,drug_prescriptionId=new_drug_prescriptionId,drug_name=new_drug_name,drug_dosage=new_drug_dosage,
drug_unitOfMeasurement=new_drug_unitOfMeasurement,drug_route=new_drug_route,drug_startDate=new_drug_startDate,drug_endDate=new_drug_endDate,drug_daily_intake=new_drug_daily_intake
where medicationId=new_medicationId; 
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS update_billing;
DELIMITER //
CREATE PROCEDURE update_billing
(new_billingId int,new_medicationId int,new_testId int,new_patientId int,new_providerId int,new_admissionId int,new_totalBill int,new_amount_paid_by_InsuranceProvider int)
BEGIN
update billing
set medicationId=new_medicationId,testId=new_testId,patientId=new_patientId,providerId=new_providerId,admissionId=new_admissionId,totalBill=new_totalBill,amount_paid_by_InsuranceProvider=new_amount_paid_by_InsuranceProvider
where billingId=new_billingId; 
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_discharge;
DELIMITER //
CREATE PROCEDURE insert_discharge
(new_dischargeId int,new_admissionId int,new_patientId int,new_providerId int,new_discharge_date date,new_discharge_location varchar(20),new_Discharge_comments varchar(150),new_billingId int)
BEGIN
update discharge
set admissionId=new_admissionId,patientId=new_patientId,providerId=new_providerId,discharge_date=new_discharge_date,discharge_location=new_discharge_location,Discharge_comments=new_Discharge_comments,billingId=new_billingId
where dischargeId=new_dischargeId; 
end//
DELIMITER ;

#######################################################################################################################################
-- stored procedures for select
#######################################################################################################################################
-- procedure that fetch number of patients patients admitted on a given day
DROP PROCEDURE IF EXISTS select_count_patients_admitted_on_a_given_day;
DELIMITER //
CREATE PROCEDURE select_count_patients_admitted_on_a_given_day
(admissiondate date)
BEGIN
select count(*) from patientAdmission where admission_date = admissiondate; 
end//
DELIMITER ;

-- procedure that fetch patients details admitted between two days
DROP PROCEDURE IF EXISTS select_patients_admitted_between_two_dates;
DELIMITER //
CREATE PROCEDURE select_patients_admitted_between_two_dates
(startdate date, enddate date)
BEGIN
select concat(patient_FirstName, ', ', patient_lastname) as patient_fullname, provider_fullname, admission_date
from patientInformation pi, careproviderinformation cpi,patientAdmission pa 
where pi.patientid=pa.patient_id and cpi.providerid=pa.provider_id and admission_date between startdate and enddate
order by patient_fullname desc; 
end//
DELIMITER ;

-- procedure that fetch patients details admitted with urgent care required
DROP PROCEDURE IF EXISTS select_AdmittedPatients_requireUrgentCareRequired;
DELIMITER //
CREATE PROCEDURE select_AdmittedPatients_requireUrgentCareRequired
(emergency_level char(50), admissionDate date)
BEGIN
select concat(patient_FirstName, ', ', patient_lastname) as patient_fullname, patient_bloodgroup, admission_date, admin_comments from patientInformation, patientAdmission 
where patientinformation.patientId = patientAdmission.patient_Id and emergency_level like concat('%',emergency_level,'%') and admission_date=admissiondate
group by patient_bloodgroup order by patient_firstname desc;
end//
DELIMITER ;


-- procedure that fetch patients payments above certain amount
DROP PROCEDURE IF EXISTS select_patientPayment_aboveCertainAmount;
DELIMITER //
CREATE PROCEDURE select_patientPayment_aboveCertainAmount
(patientpays int)
BEGIN
select concat(patient_Firstname,', ', patient_lastname) as patient_fullName, (totalbill - amount_paid_by_InsuranceProvider) as patient_pays
from billing join patientInformation on patientInformation.patientId = billing.patientid where patient_pays > patientpays order by patient_pays desc;
end//
DELIMITER ;


-- procedure that fetch patient information and cost of services who are treated by particular doctor
DROP PROCEDURE IF EXISTS select_patientinfo_Cost_treatedByACertainDoctor;
DELIMITER //
CREATE PROCEDURE select_patientinfo_Cost_treatedByACertainDoctor
(doctorname char(20))
BEGIN
select pi.patientid, concat(patient_Firstname,', ', patient_lastname) as patient_fullName, cpi.provider_fullname,(totalbill - amount_paid_by_InsuranceProvider) as patient_pays
from patientInformation as pi join billing on pi.patientid = billing.patientid ,careproviderInformation as cpi
where pi.patientid in (select patient_id from patientAdmission as pa,careproviderinformation as cpi  where pa.provider_id=cpi.providerid and provider_fullname like concat('%',doctorname,'%'))
group by patient_fullname order by patient_pays desc;
end//
DELIMITER ;

-- procedure that fetch patient vitals that were concerning
DROP PROCEDURE IF EXISTS select_concerning_patientvitals;
DELIMITER //
CREATE PROCEDURE select_concerning_patientvitals
(staffcomments char(20))
BEGIN
select pi.patientid, concat(patient_Firstname,', ', patient_lastname) as patient_fullName,vital_type_and_values as vitals, staff_comments
from patientInformation as pi join patientvitals on pi.patientid = patientVitals.patientid
where  staff_comments like concat('%',staffcomments,'%')
group by patient_fullname;
end//
DELIMITER ;

-- procedure that fetch careproviders who are active/inactive
DROP PROCEDURE IF EXISTS select_careproviders_whoareactive_inactive;
DELIMITER //
CREATE PROCEDURE select_careproviders_whoareactive_inactive
(doctorstatus char(20))
BEGIN
select providerid, provider_fullname,provider_status
from careproviderInformation 
where  provider_status = doctorstatus group by provider_fullname;
end//
DELIMITER ;

-- procedure that fetch patients discharged on any given day
DROP PROCEDURE IF EXISTS select_patients_discharged_OnGivenDay;
DELIMITER //
CREATE PROCEDURE select_patients_discharged_OnGivenDay
(dischargedate date)
BEGIN
select pi.patientid,concat(patient_Firstname,', ', patient_lastname) as patient_fullName, discharge_date,discharge_location
from patientinformation as pi join discharge on pi.patientid = discharge.patientid
where  discharge_date = dischargedate;
end//
DELIMITER ;

-- procedure that fetch labresults
DROP PROCEDURE IF EXISTS select_labresults_status;
DELIMITER //
CREATE PROCEDURE select_labresults_status
(labresultstatus char(20))
BEGIN
select pi.patientid,concat(patient_Firstname,', ', patient_lastname) as patient_fullName,vital_type_and_values,testname,otp.testname, lr.lab_resultstatus
from patientinformation as pi, patientvitals as pv, ordered_tests_procedures as otp, labresults as lr
where  pi.patientid = otp.patientid and otp.vitalid = pv.vitalid and lr.patientId = pi.patientid and lab_resultstatus like concat('%',labresultstatus,'%');
end//
DELIMITER ;

-- procedure that fetch medications prescribed
DROP PROCEDURE IF EXISTS select_medicationsprescribed;
DELIMITER //
CREATE PROCEDURE select_medicationsprescribed
(drugname char(20))
BEGIN
select pi.patientid,concat(patient_Firstname,', ', patient_lastname) as patient_fullName,drug_name,drug_dosage,drug_daily_intake,drug_startdate,drug_enddate
from patientinformation as pi, medications_prescribed as mp
where  pi.patientid = mp.patientid and drug_name like concat('%',drugname,'%');
end//
DELIMITER ;