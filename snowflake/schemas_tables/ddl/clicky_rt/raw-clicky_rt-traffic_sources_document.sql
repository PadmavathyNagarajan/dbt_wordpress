use role crm_developer;
use warehouse crm_wh;
use database raw;
use schema clicky;

create or replace transient table traffic_sources_document (
    document variant,
    record_captured_at timestamp_ntz,
    blob_file_name varchar
) comment = 'Traffic sources information as raw JSON data';