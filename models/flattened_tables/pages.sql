{{ config(
    materialized='view',
    alias = 'pages'
)
}}
select
    parse_json(SRC):id::number as id,
    parse_json(SRC):date::timestamp as date,
    parse_json(SRC):date_gmt::timestamp as date_gmt,
    parse_json(SRC):guid:"rendered"::varchar as guid,
    parse_json(SRC):modified::timestamp as modified,
    parse_json(SRC):modified_gmt::timestamp as modified_gmt,
    parse_json(SRC):slug::varchar as slug,
    parse_json(SRC):status::varchar as status,
    parse_json(SRC):type::varchar as type,
    parse_json(SRC):link::varchar as link,
    parse_json(SRC):title:"rendered"::varchar as title,
    parse_json(SRC):excerpt:"protected"::boolean as excerpt_protected,
    parse_json(SRC):excerpt:"rendered"::varchar as excerpt,
    parse_json(SRC):author::number as author,
    parse_json(SRC):featured_media::number as featured_media,
    parse_json(SRC):parent::number as parent,
    parse_json(SRC):menu_order::number as menu_order,
    parse_json(SRC):comment_status::varchar as comment_status,
    parse_json(SRC):ping_status::varchar as ping_status,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'pages')}}