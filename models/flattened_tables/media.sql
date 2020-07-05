{{ config(
    materialized='incremental',
    transient = false,
    alias = 'media'
)
}}
select 
    parse_json(SRC):id::number as id,
    parse_json(SRC):date::timestamp as date,
    parse_json(SRC):date_gmt::timestamp as date_gmt,
    parse_json(SRC):uid:"rendered"::varchar as guid,
    parse_json(SRC):modified::timestamp as modified,
    parse_json(SRC):modified_gmt::timestamp as modified_gmt,
    parse_json(SRC):slug::varchar as slug,
    parse_json(SRC):status::varchar as status,
    parse_json(SRC):type::varchar as type,
    parse_json(SRC):link::varchar as link,
    parse_json(SRC):title:"rendered"::varchar as title,
    parse_json(SRC):author::number as author,
    parse_json(SRC):comment_status::varchar as comment_status,
    parse_json(SRC):ping_status::varchar as ping_status,
    parse_json(SRC):description:"rendered"::varchar as description,
    parse_json(SRC):caption:"rendered"::varchar as caption,
    parse_json(SRC):alt_text::varchar as alt_text,
    parse_json(SRC):media_type::varchar as media_type,
    parse_json(SRC):mime_type::varchar as mime_type,
    parse_json(SRC):media_details::variant as media_details,
    parse_json(SRC):post::number as post,
    parse_json(SRC):source_url::varchar as source_url,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'media')}}
{{ incremental_logic()}}