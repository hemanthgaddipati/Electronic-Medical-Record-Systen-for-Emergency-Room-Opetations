# Electronic-Medical-Record-Systen-for-Emergency-Room-Opetations
EMRS/EHRS database system for Emergency Room department of the hospital


submitted to University of North Carolina at Charlotte
ITCS 6120 Applied Databases
Project 2
04th May 2020
A database for an Electronic Medical Record System based on daily Emergency Room operations
By Hemanth Gaddipati.

Introduction

An EMR (Electronic Medical Record)/ EHR (Electronic Health Record) provide an effective way to solve the problem of managing medical/clinical data. An EMR system is a great way to store and maintain medical data easily when compared to the conventional paper storage techniques which takes a lot of effort searching and maintaining such huge number of records that occupy a lot of physical space in the hospitals. Using EMR we can tackle this problem with a few manageable exceptions.
What is an EMR exactly?
Electronic Medical Recording – All the data in a doctor’s office is usually collected in the form of charts and forms on papers. Using the paper record creates piles of papers and it is difficult to manage and utilize these records. Electronic Medical Record is the term given to medical record of patients collected in electronic format. Electronic records are easily portable and accessible anytime and from anywhere. It is easy to transfer electronic records to several different entities at a time. This helps patients and doctors who can access previous health records quickly and plan a treatment process quickly.

Requirement Analysis

It is hard to implement an end to end EMR system so for this project I choose a part of hospital and created a data base with all the knowledge I have of the ER. Emergency room has patients walk in daily to get medical treatment for various symptoms they have. For this DB we need patient information, doctors/nurses information, patient visit information, patient admissions, patient initial vitals, tests and procedures done/ordered by providers to patients at the ER, Results of the tests, prescriptions, billing details, insurance details of the patients and discharge information of the patients.
I created a Database with tables which has columns covering all the above-mentioned details. Typical scenario is a patient walks in and gets medical attention and then gets discharged from the ER or gets admitted to the hospital if the patient needs any additional treatment. ER provides primary care and then works as a initial screening tool to the hospital. Most of the cases they see are minimal severity and does not require extensive care.
Normal scenario would be a patient walks in fills out his details both personal and insurance related if he/her is new or provide a user ID to fetch the existing details then get an appointment with a care provider and then get his initial vitals checked by staff. Then the doctor would evaluate the symptoms based on the initial rests and then if any other tests are required, they’d order it and reevaluate the scenario. Once the doctor has all the information, he will prescribe medications and then the patient is discharged and now he checks out of the ER paying the bill after insurance coverage.
We have audit tables keep track of all the changes made to parent tables. The audit tables will keep track of all the updates, insert and delete queries that are and will be performed on the parent/main tables.
Stored procedures improve the time of execution and is way simpler when you need to run the same query multiple times. The stored procedure with pre-defined conditions will help the users to perform tasks with more ease with the help of MySQL workbench application programming interface.

UML Diagram

All the parent tables are created with primary and foreign keys are defined in the UML diagram above along with a few audit tables that will keep track of changes made to parent tables. The triggers are created on parent tables so that audit tables are updated accordingly. The stored procedures and views help users with no experience with SQL execute operations with ease.

Triggers

A database trigger is a stored procedure that is invoked automatically when a predefined event occurs. Database triggers enable DBAs (Data Base Administrators) to create additional relationships between separate databases. In other ways, a trigger can be defined to execute before or after an INSERT, UPDATE, or DELETE operation, either once per modified row, or once per SQL statement. If a trigger event occurs, the trigger's function is called at the appropriate time to handle the event. Triggers can be assigned to tables and are called every time trigger is triggered.

Stored Procedures

SQL Server stored procedures are used to group one or more Transact-SQL statements into logical units. The stored procedures are stored as named objects in the SQL Server Database Server. When you call a stored procedure for the first time, SQL Server creates an execution plan and stores it in the cache. In the subsequent executions of the stored procedure, SQL Server reuses the plan so that the stored procedure can execute very fast with reliable performance.

User profiles and Access permissions

I created three user roles namely “nursingstaff, careprovider and supportstaff” and they have their own appropriate tables access along with stored procedures and triggers access once logged in using user name and user password.
After running the below query please proceed to root user and give permissions and privileges to the below users.
Step 1: please login to root user and go to management and click on “users and privileges”
Step 2: select each user role separately and proceed to “Administrative roles”
Step 3: select (delete, index, insert, select, show view, trigger and update) for each role then save and now login to respective users and execute the stored procedures.

References

1) Murach’s MySQL version 2
2) W3 schools-SQL
3) CodeProject.com/articles/Overview-of-SQL
