use role crm_developer;
use warehouse crm_wh;
use database raw;
use schema clicky;

create or replace transient table pages_document (
    document variant,
    record_captured_at timestamp_ntz,
    blob_file_name varchar
) comment = 'Pages information as raw JSON data';