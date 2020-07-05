{{ config(
    materialized='incremental',
    transient = false,
    alias = 'tags'
)
}}
select 
    parse_json(src):id::number as id,
    parse_json(src):count::number as count,
    parse_json(src):link::varchar as link,
    parse_json(src):name::varchar as name,
    parse_json(src):slug::varchar as slug,
    parse_json(src):taxonomy::varchar as taxonomy,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'tags')}}
{{ incremental_logic()}}