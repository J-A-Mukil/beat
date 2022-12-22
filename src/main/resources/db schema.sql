CREATE DATABASE IF NOT EXISTS TEST_BEAT_DB;
USE TEST_BEAT_DB;

CREATE TABLE IF NOT EXISTS `EMPLOYEE`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(50) NOT NULL,
    `LOCATION` VARCHAR(50) NOT NULL,
    `GENDER` VARCHAR(50) NOT NULL,
    `DATE_OF_JOINING` DATE NOT NULL,
    `DESIGNATION` VARCHAR(50) NOT NULL,
    `CATEGORY` VARCHAR(50) NOT NULL,
    `PROJECT_ID` BIGINT NOT NULL,
    `LEAD_ID` BIGINT NOT NULL,
    `ORGANIZATION_ID` BIGINT NOT NULL,
    `BAND` BIGINT NOT NULL,
    `DATE_OF_LEAVING` DATE NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `SKILLS`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `SKILL` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `SKILL_AND_EXPERIENCE`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `EMP_ID` BIGINT NOT NULL,
    `SKILLS` VARCHAR(50) NOT NULL,
    `EXP_AT` DATE NOT NULL,
    `EXP` INT NOT NULL,
    `STATUS` BOOLEAN NOT NULL,
    `UPDATED_ON` DATE NOT NULL,
    `EDITOR_ID` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `PROJECT`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(50) NOT NULL,
    `ORGANIZATION` VARCHAR(50) NOT NULL,
    `PROJECT_MANAGER` VARCHAR(50) NOT NULL,
    `START_DATE` DATE NOT NULL,
    `LOCATION` VARCHAR(50) NOT NULL,
    `END_DATE` DATE NULL,
    `DESCRIPTION` VARCHAR(200) NULL,
    `PROJECT_TYPE` VARCHAR(50) NOT NULL,
    `EDITOR_ID` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `EMPLOYEE_HISTORY`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `EMP_ID` BIGINT NOT NULL,
    `NAME` VARCHAR(50) NOT NULL,
    `LEAD_ID` BIGINT NOT NULL,
    `CLIENT_COUNTERPART_ID` BIGINT NULL,
    `ORGANIZATION_ID` VARCHAR(50) NOT NULL,
    `ORGANIZATION_DEPARTMENT` VARCHAR(50) NOT NULL,
    `ACCOLITE_DEPARTMENT` VARCHAR(50) NOT NULL,
    `FROM_DATE` DATE NOT NULL,
    `TO_DATE` DATE NULL,
    `EDITOR_ID` BIGINT NOT NULL,
    `PROJECT_ID` BIGINT NOT NULL,
    `DATE_OF_JOINING_PROJECT` BIGINT NOT NULL,
    `DATE_OF_LEAVING_PROJECT` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `EXP_SLABS`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `SLAB` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`ID`)
);

insert into EXP_SLABS (SLAB) Select '0-2' Where not exists(select * from EXP_SLABS where SLAB='0-2');
insert into EXP_SLABS (SLAB) Select '2-4' Where not exists(select * from EXP_SLABS where SLAB='2-4');
insert into EXP_SLABS (SLAB) Select '4-6' Where not exists(select * from EXP_SLABS where SLAB='4-6');
insert into EXP_SLABS (SLAB) Select '6-8' Where not exists(select * from EXP_SLABS where SLAB='6-8');
insert into EXP_SLABS (SLAB) Select '8-10' Where not exists(select * from EXP_SLABS where SLAB='8-10');
insert into EXP_SLABS (SLAB) Select '10-14' Where not exists(select * from EXP_SLABS where SLAB='10-14');
insert into EXP_SLABS (SLAB) Select '14-18' Where not exists(select * from EXP_SLABS where SLAB='14-18');
insert into EXP_SLABS (SLAB) Select '18-22' Where not exists(select * from EXP_SLABS where SLAB='18-22');
insert into EXP_SLABS (SLAB) Select '22-26' Where not exists(select * from EXP_SLABS where SLAB='22-26');
insert into EXP_SLABS (SLAB) Select '26-30' Where not exists(select * from EXP_SLABS where SLAB='26-30');
insert into EXP_SLABS (SLAB) Select '30-35' Where not exists(select * from EXP_SLABS where SLAB='30-35');
insert into EXP_SLABS (SLAB) Select '35-40' Where not exists(select * from EXP_SLABS where SLAB='35-40');
insert into EXP_SLABS (SLAB) Select '40-50' Where not exists(select * from EXP_SLABS where SLAB='40-50');



CREATE TABLE IF NOT EXISTS `SLAB_CHARGES`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `SLAB_ID` BIGINT NOT NULL,
    `ORG_ID` BIGINT NOT NULL,
    `COST` BIGINT NOT NULL,
    `STATUS` boolean NOT NULL,
    `EDITOR_ID` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `ROLES`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ACCESS_NAME` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `LOGIN`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `EMPID` BIGINT NOT NULL,
    `NAME` VARCHAR(50) NOT NULL,
    `EMAIL` VARCHAR(50) NOT NULL,
    `PASSWORD` VARCHAR(50) NOT NULL,
    `ACCESS_ID` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `ORGANIZATION`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ORG_NAME` VARCHAR(50) NOT NULL,
    `LOCATION` VARCHAR(50) NOT NULL,
    `OWNER` BIGINT NOT NULL,
    `PARENT_ORG` BIGINT NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `ROLE_GROUPS`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(50) NOT NULL,
    `ACCESS` VARCHAR(50) NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `CLIENT_COUNTERPART`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(50) NOT NULL,
    `DESIGNATION` VARCHAR(50) NOT NULL,
    `CLIENT_ID` BIGINT NOT NULL,
    `ORG_ID` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`ID`)
);

CREATE TABLE IF NOT EXISTS `BAND`(
    `ID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `BAND` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`ID`)
); 
insert into BAND (BAND)
 Select 'B2' Where not exists(select * from BAND where BAND='B2');
 insert into BAND (BAND)
 Select 'B2' Where not exists(select * from BAND where BAND='B2');
 insert into BAND (BAND)
 Select 'B3' Where not exists(select * from BAND where BAND='B3');
 insert into BAND (BAND)
 Select 'B4H' Where not exists(select * from BAND where BAND='B4H');
 insert into BAND (BAND)
 Select 'B4L' Where not exists(select * from BAND where BAND='B4L');
 insert into BAND (BAND)
 Select 'B5H' Where not exists(select * from BAND where BAND='B5H');
 insert into BAND (BAND)
 Select 'B5L' Where not exists(select * from BAND where BAND='B5L');
 insert into BAND (BAND)
 Select 'B6' Where not exists(select * from BAND where BAND='B6');
  insert into BAND (BAND)
 Select 'B7' Where not exists(select * from BAND where BAND='B7');

