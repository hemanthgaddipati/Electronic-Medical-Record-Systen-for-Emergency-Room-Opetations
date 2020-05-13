use emrs_er;
-- trigger to update patient information
drop trigger if exists patientInformation_after_update;
DELIMITER //
create trigger patientInformation_after_update
after update on patientinformation
for each row
begin
insert into audit_patientInformation values
(old.patientId,old.patient_LastName,old.patient_FirstName,old.patient_MiddleName,old.patient_addressLine1,old.patient_addressLine2,old.city,old.state,old.Zipcode,old.countyCode,
old.country,old.patient_primaryPhone,old.patient_emailId,old.patient_InsuranceProvider,old.patient_InsuranceGroupId,old.Patient_InsuranceUserId,old.Patient_InsuranceExpirationDate,
 'updated', now());
end//
DELIMITER ;

-- trigger to insert patient information
drop trigger if exists patientInformation_after_insert;
DELIMITER //
create trigger patientInformation_after_insert
after insert on patientinformation
for each row
begin
insert into audit_patientInformation values
(new.patientId,new.patient_LastName,new.patient_FirstName,new.patient_MiddleName,new.patient_addressLine1,new.patient_addressLine2,new.city,new.state,new.Zipcode,new.countyCode,
new.country,new.patient_primaryPhone,new.patient_emailId,new.patient_InsuranceProvider,new.patient_InsuranceGroupId,new.Patient_InsuranceUserId,new.Patient_InsuranceExpirationDate,
 'inserted', now());
end//
DELIMITER ;

-- trigger to delete patient information
drop trigger if exists patientInformation_before_delete;
DELIMITER //
create trigger patientInformation_before_delete
before delete on patientinformation
for each row
begin
insert into audit_patientInformation values
(old.patientId,old.patient_LastName,old.patient_FirstName,old.patient_MiddleName,old.patient_addressLine1,old.patient_addressLine2,old.city,old.state,old.Zipcode,old.countyCode,
old.country,old.patient_primaryPhone,old.patient_emailId,old.patient_InsuranceProvider,old.patient_InsuranceGroupId,old.Patient_InsuranceUserId,old.Patient_InsuranceExpirationDate,
 'deleted', now());
end//
DELIMITER ;

####################################################################################################################################

-- trigger to update audit_careproviderinformation
drop trigger if exists providerInformation_after_update;
DELIMITER //
create trigger providerInformation_after_update
after update on careproviderinformation
for each row
begin
insert into audit_careproviderInformation values
(old.providerId,old.provider_fullName,old.provider_status,old.provider_rating,old.provider_LicenseID,old.provider_LicenseExpirationDate,old.provider_speciality1_name,old.provider_speciality1_Id,
old.provider_speciality2_name,old.provider_speciality2_Id,old.provider_AddressLine1,old.provider_AddressLine2,old.city,old.state,old.Zipcode,old.country,old.provider_primaryPhone,old.provider_emailID,
 'updated', now());
end//
DELIMITER ;

-- trigger to insert careproviderinformation
drop trigger if exists careproviderInformation_after_insert;
DELIMITER //
create trigger careproviderInformation_after_insert
after insert on careproviderinformation
for each row
begin
insert into audit_careproviderInformation values
(new.providerId,new.provider_fullName,new.provider_status,new.provider_rating,new.provider_LicenseID,new.provider_LicenseExpirationDate,new.provider_speciality1_name,new.provider_speciality1_Id,
new.provider_speciality2_name,new.provider_speciality2_Id,new.provider_AddressLine1,new.provider_AddressLine2,new.city,new.state,new.Zipcode,new.country,new.provider_primaryPhone,new.provider_emailID,
 'inserted', now());
end//
DELIMITER ;

-- trigger to delete careproviderinformation
drop trigger if exists careproviderInformation_before_delete;
DELIMITER //
create trigger careproviderInformation_before_delete
before delete on careproviderinformation
for each row
begin
insert into audit_careproviderInformation values
(old.providerId,old.provider_fullName,old.provider_status,old.provider_rating,old.provider_LicenseID,old.provider_LicenseExpirationDate,old.provider_speciality1_name,old.provider_speciality1_Id,
old.provider_speciality2_name,old.provider_speciality2_Id,old.provider_AddressLine1,old.provider_AddressLine2,old.city,old.state,old.Zipcode,old.country,old.provider_primaryPhone,old.provider_emailID,
 'deleted', now());
end//
DELIMITER ;

####################################################################################################################################

-- trigger to update patientadmission
drop trigger if exists patientadmission_after_update;
DELIMITER //
create trigger patientadmission_after_update
after update on patientadmission
for each row
begin
insert into audit_patientadmission values
(old.admissionId,old.provider_Id,old.patient_Id,old.department_id,old.emergency_level,old.admission_date,old.admin_comments,old.locationId,old.location_country,
old.location_state,old.location_city,old.location_county,old.location_address,'updated', now());
end//
DELIMITER ;

-- trigger to insert patient admission
drop trigger if exists patientadmission_after_insert;
DELIMITER //
create trigger patientadmission_after_insert
after insert on patientadmission
for each row
begin
insert into audit_patientadmission values
(new.admissionId,new.provider_Id,new.patient_Id,new.department_id,new.emergency_level,new.admission_date,new.admin_comments,new.locationId,new.location_country,
new.location_state,new.location_city,new.location_county,new.location_address,'inserted', now());
end//
DELIMITER ;

-- trigger to delete patientadmission
drop trigger if exists patientadmission_before_delete;
DELIMITER //
create trigger patientadmission_before_delete
before delete on patientadmission
for each row
begin
insert into audit_patientadmission values
(old.admissionId,old.provider_Id,old.patient_Id,old.department_id,old.emergency_level,old.admission_date,old.admin_comments,old.locationId,old.location_country,
old.location_state,old.location_city,old.location_county,old.location_address,'deleted', now());
end//
DELIMITER ;
########################################################################################################################

-- trigger to update discharge
drop trigger if exists discharge_after_update;
DELIMITER //
create trigger discharge_after_update
after update on discharge
for each row
begin
insert into audit_discharge values
(old.dischargeId,old.admissionId,old.patientId,old.providerId,old.discharge_date,old.discharge_location,old.Discharge_comments,old.billingId,'updated', now());
end//
DELIMITER ;

-- trigger to insert discharge
drop trigger if exists discharge_after_insert;
DELIMITER //
create trigger discharge_after_insert
after insert on discharge
for each row
begin
insert into audit_discharge values
(new.dischargeId,new.admissionId,new.patientId,new.providerId,new.discharge_date,new.discharge_location,new.Discharge_comments,new.billingId,'inserted', now());
end//
DELIMITER ;

-- trigger to delete discharge
drop trigger if exists discharge_before_delete;
DELIMITER //
create trigger discharge_before_delete
before delete on discharge
for each row
begin
insert into audit_discharge values
(old.dischargeId,old.admissionId,old.patientId,old.providerId,old.discharge_date,old.discharge_location,old.Discharge_comments,old.billingId,'deleted', now());
end//
DELIMITER ;
########################################################################################################################

-- trigger to update medications prescribed
drop trigger if exists medications_prescribed_after_update;
DELIMITER //
create trigger medications_prescribed_after_update
after update on medications_prescribed
for each row
begin
insert into audit_medications_prescribed values
(old.medicationId,old.admissionId,old.patientId,old.providerId,old.drug_prescriptionId,old.drug_name,old.drug_dosage,old.drug_unitOfMeasurement,old.drug_route,old.drug_startDate,
old.drug_endDate,old.drug_daily_intake,'updated', now());
end//
DELIMITER ;

-- trigger to insert medication
drop trigger if exists medications_prescribed_after_insert;
DELIMITER //
create trigger medications_prescribed_after_insert
after insert on medications_prescribed
for each row
begin
insert into audit_medications_prescribed values
(new.medicationId,new.admissionId,new.patientId,new.providerId,new.drug_prescriptionId,new.drug_name,new.drug_dosage,new.drug_unitOfMeasurement,new.drug_route,new.drug_startDate,
new.drug_endDate,new.drug_daily_intake,'inserted', now());
end//
DELIMITER ;

-- trigger to delete medications
drop trigger if exists medications_prescribed_before_delete;
DELIMITER //
create trigger medications_prescribed_before_delete
before delete on medications_prescribed
for each row
begin
insert into audit_medications_prescribed values
(old.medicationId,old.admissionId,old.patientId,old.providerId,old.drug_prescriptionId,old.drug_name,old.drug_dosage,old.drug_unitOfMeasurement,old.drug_route,old.drug_startDate,
old.drug_endDate,old.drug_daily_intake,'deleted', now());
end//
DELIMITER ;
########################################################################################################################

-- trigger to update ordered_tests_procedures
drop trigger if exists ordered_tests_procedures_after_update;
DELIMITER //
create trigger ordered_tests_procedures_after_update
after update on ordered_tests_procedures
for each row
begin
insert into audit_ordered_tests_procedures values
(old.testId,old.patientId,old.vitalId,old.providerId,old.testName,old.lab_staff_comments,'updated', now());
end//
DELIMITER ;

-- trigger to insert ordered_tests_procedures
drop trigger if exists ordered_tests_procedures_after_insert;
DELIMITER //
create trigger ordered_tests_procedures_after_insert
after insert on ordered_tests_procedures
for each row
begin
insert into audit_ordered_tests_procedures values
(new.testId,new.patientId,new.vitalId,new.providerId,new.testName,new.lab_staff_comments,'inserted', now());
end//
DELIMITER ;

-- trigger to delete ordered_tests_procedures
drop trigger if exists ordered_tests_procedures_before_delete;
DELIMITER //
create trigger ordered_tests_procedures_before_delete
before delete on ordered_tests_procedures
for each row
begin
insert into audit_ordered_tests_procedures values
(old.testId,old.patientId,old.vitalId,old.providerId,old.testName,old.lab_staff_comments,'deleted', now());
end//
DELIMITER ;
########################################################################################################################
