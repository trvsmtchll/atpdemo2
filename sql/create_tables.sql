--------------------------------------------------------
--  File created - Wednesday-March-20-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table DRUGS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."DRUGS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"PRICE" NUMBER(15,0), 
	"VERSION" NUMBER
   );
--------------------------------------------------------
--  DDL for Table PATIENTS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."PATIENTS" 
   (	"ID" NUMBER, 
	"DOB" DATE, 
	"EMAIL" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"GENDER" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"PASSWORD" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"PHONE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"SSN" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"STATUS" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"USERNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"VERSION" NUMBER, 
	"CITY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"COUNTRY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"STATE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"STREET1" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"STREET2" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"ZIP" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"FIRSTNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"LASTNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"MIDDLENAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP"
   );
--------------------------------------------------------
--  DDL for Table PATIENTS_RECORDS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."PATIENTS_RECORDS" 
   (	"PATIENT_ID" NUMBER, 
	"RECORDS_ID" NUMBER
   );
--------------------------------------------------------
--  DDL for Table PHYSICIANS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."PHYSICIANS" 
   (	"ID" NUMBER, 
	"EMAIL" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"PASSWORD" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"PHONE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"USERNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"VERSION" NUMBER, 
	"FIRSTNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"LASTNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"MIDDLENAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP"
   );
--------------------------------------------------------
--  DDL for Table PRESCRIPTIONS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."PRESCRIPTIONS" 
   (	"ID" NUMBER, 
	"DATE_PRESCRIBED" DATE, 
	"DOSAGE" NUMBER, 
	"FREQUENCY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"INSTRUCTIONS" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"REFILLS_REMAINING" NUMBER, 
	"VERSION" NUMBER, 
	"DRUG_ID" NUMBER
   );
--------------------------------------------------------
--  DDL for Table RECORDS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."RECORDS" 
   (	"ID" NUMBER, 
	"CREATE_DATE" DATE, 
	"DIAGNOSIS" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"NOTES" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"SYMPTOMS" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"VERSION" NUMBER, 
	"DIASTOLIC_BLOOD_PRESSURE" NUMBER, 
	"HEIGHT" NUMBER, 
	"PULSE" NUMBER, 
	"SYSTOLIC_BLOOD_PRESSURE" NUMBER, 
	"TEMPERATURE" NUMBER, 
	"WEIGHT" NUMBER, 
	"PATIENT_ID" NUMBER, 
	"PHYSICIAN_ID" NUMBER
   );
--------------------------------------------------------
--  DDL for Table RECORDS_PRESCRIPTIONS
--------------------------------------------------------

  CREATE TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" 
   (	"RECORD_ID" NUMBER, 
	"PRESCRIPTIONS_ID" NUMBER
   );
--------------------------------------------------------
--  DDL for Table SEQUENCE
--------------------------------------------------------

  CREATE TABLE "MEDREC"."SEQUENCE" 
   (	"SEQ_NAME" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"SEQ_COUNT" NUMBER(15,0)
   );
   
REM INSERTING into MEDREC.DRUGS
SET DEFINE OFF;
Insert into MEDREC.DRUGS (ID,NAME,PRICE,VERSION) values (7,'Advil',4,1);
Insert into MEDREC.DRUGS (ID,NAME,PRICE,VERSION) values (8,'Drixoral',12,1);
Insert into MEDREC.DRUGS (ID,NAME,PRICE,VERSION) values (12,'Codeine',8,1);

REM INSERTING into MEDREC.PATIENTS
SET DEFINE OFF;
Insert into MEDREC.PATIENTS (ID,DOB,EMAIL,GENDER,PASSWORD,PHONE,SSN,STATUS,USERNAME,VERSION,CITY,COUNTRY,STATE,STREET1,STREET2,ZIP,FIRSTNAME,LASTNAME,MIDDLENAME) values (2,to_date('26-APR-75','DD-MON-RR'),'fred@golf.com','MALE','weblogic','4151234564','123456789','APPROVED','fred@golf.com',1,'San Francisco','United States','California','1224 Post St','Suite 100','94115','Fred','Winner','I');
Insert into MEDREC.PATIENTS (ID,DOB,EMAIL,GENDER,PASSWORD,PHONE,SSN,STATUS,USERNAME,VERSION,CITY,COUNTRY,STATE,STREET1,STREET2,ZIP,FIRSTNAME,LASTNAME,MIDDLENAME) values (3,to_date('13-MAR-69','DD-MON-RR'),'larry@bball.com','MALE','weblogic','4151234564','777777777','APPROVED','larry@bball.com',1,'San Francisco','United States','California','1224 Post St','Suite 100','94115','Larry','Parrot','J');
Insert into MEDREC.PATIENTS (ID,DOB,EMAIL,GENDER,PASSWORD,PHONE,SSN,STATUS,USERNAME,VERSION,CITY,COUNTRY,STATE,STREET1,STREET2,ZIP,FIRSTNAME,LASTNAME,MIDDLENAME) values (4,to_date('29-NOV-83','DD-MON-RR'),'charlie@star.com','MALE','weblogic','4151234564','444444444','REGISTERED','charlie@star.com',1,'Ponte Verde','United States','Florida','235 Montgomery St','Suite 15','32301','Charlie','Florida','E');
Insert into MEDREC.PATIENTS (ID,DOB,EMAIL,GENDER,PASSWORD,PHONE,SSN,STATUS,USERNAME,VERSION,CITY,COUNTRY,STATE,STREET1,STREET2,ZIP,FIRSTNAME,LASTNAME,MIDDLENAME) values (5,to_date('17-SEP-81','DD-MON-RR'),'volley@ball.com','MALE','weblogic','4151234564','333333333','APPROVED','volley@ball.com',1,'San Francisco','United States','California','1224 Post St','Suite 100','94115','Gabrielle','Spiker','H');
Insert into MEDREC.PATIENTS (ID,DOB,EMAIL,GENDER,PASSWORD,PHONE,SSN,STATUS,USERNAME,VERSION,CITY,COUNTRY,STATE,STREET1,STREET2,ZIP,FIRSTNAME,LASTNAME,MIDDLENAME) values (6,to_date('18-MAR-82','DD-MON-RR'),'page@fish.com','MALE','weblogic','4151234564','888888888','APPROVED','page@fish.com',1,'Ponte Verde','United States','Florida','235 Montgomery St','Suite 15','32301','Page','Trout','A');

REM INSERTING into MEDREC.PATIENTS_RECORDS
SET DEFINE OFF;

REM INSERTING into MEDREC.PHYSICIANS
SET DEFINE OFF;
Insert into MEDREC.PHYSICIANS (ID,EMAIL,PASSWORD,PHONE,USERNAME,VERSION,FIRSTNAME,LASTNAME,MIDDLENAME) values (1,'mary@md.com','weblogic','1234567812','mary@md.com',1,'Mary','Oblige','J');

REM INSERTING into MEDREC.PRESCRIPTIONS
SET DEFINE OFF;
Insert into MEDREC.PRESCRIPTIONS (ID,DATE_PRESCRIBED,DOSAGE,FREQUENCY,INSTRUCTIONS,REFILLS_REMAINING,VERSION,DRUG_ID) values (10,to_date('18-JUL-09','DD-MON-RR'),100,'1/4hrs',null,0,1,7);
Insert into MEDREC.PRESCRIPTIONS (ID,DATE_PRESCRIBED,DOSAGE,FREQUENCY,INSTRUCTIONS,REFILLS_REMAINING,VERSION,DRUG_ID) values (11,to_date('18-JUL-09','DD-MON-RR'),16,'1tspn/4hrs',null,0,1,8);
Insert into MEDREC.PRESCRIPTIONS (ID,DATE_PRESCRIBED,DOSAGE,FREQUENCY,INSTRUCTIONS,REFILLS_REMAINING,VERSION,DRUG_ID) values (14,to_date('30-JUN-08','DD-MON-RR'),10,'1/6hrs',null,1,1,12);

REM INSERTING into MEDREC.RECORDS
SET DEFINE OFF;
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (9,to_date('18-JUL-09','DD-MON-RR'),'Mild stroke.  Aspirin advised.','Patient needs to stop smoking.','Complains about chest pain.',1,85,70,75,125,98,180,2,1);
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (13,to_date('30-JUN-08','DD-MON-RR'),'Common cold. Prescribed codeine cough syrup.','Call back if not better in 10 days.','Sneezing, coughing, stuffy head.',1,85,70,75,125,98,180,2,1);
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (15,to_date('05-AUG-10','DD-MON-RR'),'Severely sprained interior ligament.  Surgery required.','Cast will be necessary before and after.','Twisted knee while playing soccer.',1,85,70,75,125,98,180,2,1);
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (16,to_date('01-MAY-11','DD-MON-RR'),'Allergic to coffee.  Drink tea.',null,'Drowsy all day.',1,85,70,75,125,98,180,6,1);
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (17,to_date('01-MAY-10','DD-MON-RR'),'Patient is crazy.  Recommend politics.',null,'Overjoyed with everything.',1,85,70,75,125,98,180,3,1);
Insert into MEDREC.RECORDS (ID,CREATE_DATE,DIAGNOSIS,NOTES,SYMPTOMS,VERSION,DIASTOLIC_BLOOD_PRESSURE,HEIGHT,PULSE,SYSTOLIC_BLOOD_PRESSURE,TEMPERATURE,WEIGHT,PATIENT_ID,PHYSICIAN_ID) values (18,to_date('01-MAY-10','DD-MON-RR'),'Light cast needed.','At least 20 sprained ankles since 15.','Sprained ankle.',1,85,70,75,125,98,180,5,1);

REM INSERTING into MEDREC.RECORDS_PRESCRIPTIONS
SET DEFINE OFF;
Insert into MEDREC.RECORDS_PRESCRIPTIONS (RECORD_ID,PRESCRIPTIONS_ID) values (9,10);
Insert into MEDREC.RECORDS_PRESCRIPTIONS (RECORD_ID,PRESCRIPTIONS_ID) values (9,11);
Insert into MEDREC.RECORDS_PRESCRIPTIONS (RECORD_ID,PRESCRIPTIONS_ID) values (13,14);

REM INSERTING into MEDREC.SEQUENCE
SET DEFINE OFF;
Insert into MEDREC.SEQUENCE (SEQ_NAME,SEQ_COUNT) values ('SEQ_GEN',50);

commit;

--------------------------------------------------------
--  DDL for Index SQL170817135708840
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708840" ON "MEDREC"."DRUGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708690
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708690" ON "MEDREC"."PATIENTS" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708691
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708691" ON "MEDREC"."PATIENTS" ("SSN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708692
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708692" ON "MEDREC"."PATIENTS" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708693
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708693" ON "MEDREC"."PATIENTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708920
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708920" ON "MEDREC"."PATIENTS_RECORDS" ("PATIENT_ID", "RECORDS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708790
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708790" ON "MEDREC"."PHYSICIANS" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708791
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708791" ON "MEDREC"."PHYSICIANS" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708792
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708792" ON "MEDREC"."PHYSICIANS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708870
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708870" ON "MEDREC"."PRESCRIPTIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708900
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708900" ON "MEDREC"."RECORDS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135708950
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135708950" ON "MEDREC"."RECORDS_PRESCRIPTIONS" ("RECORD_ID", "PRESCRIPTIONS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SQL170817135709130
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEDREC"."SQL170817135709130" ON "MEDREC"."SEQUENCE" ("SEQ_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table DRUGS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."DRUGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."DRUGS" ADD CONSTRAINT "SQL170817135708840" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PATIENTS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PATIENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PATIENTS" ADD CONSTRAINT "SQL170817135708690" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MEDREC"."PATIENTS" ADD CONSTRAINT "SQL170817135708691" UNIQUE ("SSN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MEDREC"."PATIENTS" ADD CONSTRAINT "SQL170817135708692" UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MEDREC"."PATIENTS" ADD CONSTRAINT "SQL170817135708693" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PATIENTS_RECORDS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PATIENTS_RECORDS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PATIENTS_RECORDS" MODIFY ("RECORDS_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PATIENTS_RECORDS" ADD CONSTRAINT "SQL170817135708920" PRIMARY KEY ("PATIENT_ID", "RECORDS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PHYSICIANS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PHYSICIANS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PHYSICIANS" ADD CONSTRAINT "SQL170817135708790" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MEDREC"."PHYSICIANS" ADD CONSTRAINT "SQL170817135708791" UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "MEDREC"."PHYSICIANS" ADD CONSTRAINT "SQL170817135708792" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PRESCRIPTIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PRESCRIPTIONS" MODIFY ("DRUG_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."PRESCRIPTIONS" ADD CONSTRAINT "SQL170817135708870" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECORDS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."RECORDS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."RECORDS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."RECORDS" MODIFY ("PHYSICIAN_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."RECORDS" ADD CONSTRAINT "SQL170817135708900" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECORDS_PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" MODIFY ("RECORD_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" MODIFY ("PRESCRIPTIONS_ID" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" ADD CONSTRAINT "SQL170817135708950" PRIMARY KEY ("RECORD_ID", "PRESCRIPTIONS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SEQUENCE
--------------------------------------------------------

  ALTER TABLE "MEDREC"."SEQUENCE" MODIFY ("SEQ_NAME" NOT NULL ENABLE);
  ALTER TABLE "MEDREC"."SEQUENCE" ADD CONSTRAINT "SQL170817135709130" PRIMARY KEY ("SEQ_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PATIENTS_RECORDS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PATIENTS_RECORDS" ADD CONSTRAINT "PTNTSRECORDSRCRDSD" FOREIGN KEY ("RECORDS_ID")
	  REFERENCES "MEDREC"."RECORDS" ("ID") ENABLE;
  ALTER TABLE "MEDREC"."PATIENTS_RECORDS" ADD CONSTRAINT "PTNTSRECORDSPTNTID" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "MEDREC"."PATIENTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."PRESCRIPTIONS" ADD CONSTRAINT "PRSCRIPTIONSDRUGID" FOREIGN KEY ("DRUG_ID")
	  REFERENCES "MEDREC"."DRUGS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECORDS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."RECORDS" ADD CONSTRAINT "RECORDS_PATIENT_ID" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "MEDREC"."PATIENTS" ("ID") ENABLE;
  ALTER TABLE "MEDREC"."RECORDS" ADD CONSTRAINT "RECORDSPHYSICIANID" FOREIGN KEY ("PHYSICIAN_ID")
	  REFERENCES "MEDREC"."PHYSICIANS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECORDS_PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" ADD CONSTRAINT "RCRDSPRSCRPTNRCRDD" FOREIGN KEY ("RECORD_ID")
	  REFERENCES "MEDREC"."RECORDS" ("ID") ENABLE;
  ALTER TABLE "MEDREC"."RECORDS_PRESCRIPTIONS" ADD CONSTRAINT "RCRDSPRSPRSCRPTNSD" FOREIGN KEY ("PRESCRIPTIONS_ID")
	  REFERENCES "MEDREC"."PRESCRIPTIONS" ("ID") ENABLE;
