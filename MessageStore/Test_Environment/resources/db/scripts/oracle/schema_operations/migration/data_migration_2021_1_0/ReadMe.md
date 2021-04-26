## Introduction:

This is a one time execution to move to 2020.1.0 version of Message Store. 

## Pre-requisites: 

Please create the schema by following steps in *schema_creation* folder.

## Procedure:

Run the scripts in the numbered order(01 to 03) as database admin user task for data migration. 

| Name | Type | Description |
|---|---|---|
01_clob_to_blob.sql| Function | This will create function to convert clob to blob object |
02_create_sp_dataMigrationFrom2020300To2021100 | Stored Procedure | Creates stored procedure to facilitate data migration |
03_sequence_maintenance.md | documented instruction | maintenance of identity column involved into migration script |
04_exec_migration | Execution Script | Describes the sample command to execute stored procedure in step 01 |
05_clean_up | Execution Script | Drops the stored procedure created in step 01 |

**Note** To run these, Please make sure you enable the script execution in your tooling.

| Tool Name | How to enable| 
|---|---|
| **Oracle SQL Developer** | Got to **File -> new **  and execute the scripts|