Flush privileges;
-- drop user 'supportstaff'@'localhost';
-- drop user 'nursingstaff'@'localhost';
-- drop user 'careprovider'@'localhost';
create user 'supportstaff'@'localhost' identified by 'supportstaff';
create user 'nursingstaff'@'localhost' identified by 'nursingstaff';
create user 'careprovider'@'localhost' identified by 'careprovider';

grant all privileges on emrs_er.patientInformation to 'supportstaff'@'localhost';
grant all privileges on emrs_er.patientAdmission to 'supportstaff'@'localhost';
grant select on emrs_er.careproviderinformation to 'supportstaff'@'localhost';
grant update,select on emrs_er.discharge to 'supportstaff'@'localhost';
grant update,select on emrs_er.audit_discharge to 'supportstaff'@'localhost';
grant select on emrs_er.billing to 'supportstaff'@'localhost';
grant select on emrs_er.audit_patientInformation to 'supportstaff'@'localhost';
grant select on emrs_er.audit_careproviderinformation to 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.insert_patientInformation TO 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.update_patientInformation TO 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.delete_patientInformation TO 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.insert_patientadmission TO 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.delete_patientadmission TO 'supportstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.select_AdmittedPatients_requireUrgentCareRequired TO 'supportstaff'@'localhost';
grant execute on procedure emrs_er.select_patients_discharged_OnGivenDay to 'supportstaff'@'localhost';
grant execute on procedure emrs_er.select_count_patients_admitted_on_a_given_Day to 'supportstaff'@'localhost';
grant execute on procedure emrs_er.select_patients_admitted_between_two_Dates to 'supportstaff'@'localhost';

-- nursing staff grants

grant all privileges on emrs_er.discharge to 'nursingstaff'@'localhost';
grant all privileges on emrs_er.audit_discharge to 'nursingstaff'@'localhost';
grant select on emrs_er.patientinformation to 'nursingstaff'@'localhost';
grant select on emrs_er.audit_patientinformation to 'nursingstaff'@'localhost';
grant select on emrs_er.careproviderinformation to 'nursingstaff'@'localhost';
grant select on emrs_er.audit_careproviderinformation to 'nursingstaff'@'localhost';
grant update, select on emrs_er.patientvitals to 'nursingstaff'@'localhost';
grant select on emrs_er.medications_prescribed to 'nursingstaff'@'localhost';
grant select on emrs_er.audit_medications_prescribed to 'nursingstaff'@'localhost';
grant select on emrs_er.ordered_tests_procedures to 'nursingstaff'@'localhost';
grant select on emrs_er.audit_ordered_tests_procedures to 'nursingstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.insert_discharge TO 'nursingstaff'@'localhost';
grant execute on procedure emrs_er.delete_discharge to 'nursingstaff'@'localhost';
grant execute on procedure emrs_er.insert_patientvitals to 'nursingstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.select_concerning_patientvitals TO 'nursingstaff'@'localhost';
GRANT execute ON PROCEDURE emrs_er.select_AdmittedPatients_requireUrgentCareRequired TO 'nursingstaff'@'localhost';
grant execute on procedure emrs_er.select_careproviders_whoareactive_inactive to 'nursingstaff'@'localhost';
grant execute on procedure emrs_er.select_labresults_status to 'nursingstaff'@'localhost';
grant execute on procedure emrs_er.select_patientinfo_cost_treatedbyacertaindoctor to 'nursingstaff'@'localhost';

-- care provider grants

grant all privileges on emrs_er.ordered_tests_procedures to 'careprovider'@'localhost';
grant all privileges on emrs_er.audit_ordered_tests_procedures to 'careprovider'@'localhost';
grant select on emrs_er.patientinformation to 'careprovider'@'localhost';
grant select on emrs_er.audit_patientinformation to 'careprovider'@'localhost';
grant select on emrs_er.patientvitals to 'careprovider'@'localhost';
grant all privileges on emrs_er.medications_prescribed to 'careprovider'@'localhost';
grant all privileges on emrs_er.audit_medications_prescribed to 'careprovider'@'localhost';
grant select on emrs_er.labresults to 'careprovider'@'localhost';

GRANT execute ON PROCEDURE emrs_er.insert_ordered_tests_procedures TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.update_ordered_tests_procedures TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.delete_ordered_tests_procedures TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.insert_medications_prescribed TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.update_medications_prescribed TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.delete_medications_prescribed TO 'careprovider'@'localhost';
GRANT execute ON PROCEDURE emrs_er.select_AdmittedPatients_requireUrgentCareRequired TO 'careprovider'@'localhost';
grant execute on procedure emrs_er.select_medicationsprescribed to 'careprovider'@'localhost';
grant execute on procedure emrs_er.select_careproviders_whoareactive_inactive to 'careprovider'@'localhost';
grant execute on procedure emrs_er.select_concerning_patientvitals to 'careprovider'@'localhost';


