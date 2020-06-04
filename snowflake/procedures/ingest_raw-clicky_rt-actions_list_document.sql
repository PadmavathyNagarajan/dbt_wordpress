use role crm_developer;
use warehouse crm_wh;
use database crm_edw;
use schema clicky;

create or replace procedure sp_actions_list_document_ingest()
returns boolean
language javascript
execute as caller
as
$$
  snowflake.createStatement({sqlText: "copy into raw.clicky.actions_list_document from (select $1, convert_timezone('UTC', current_timestamp(2))::timestamp_ntz as record_captured_at, metadata$filename as blob_file_name from @raw.clicky.stg_clicky) pattern='.*actions_list_.*'"}).execute();
  return true;
$$;