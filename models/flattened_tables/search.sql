{{ config(
    materialized='incremental',
    transient = false,
    alias = 'search'
)
}}
select 
    parse_json(src):id::number as id,
    parse_json(src):title::varchar as title,
    parse_json(src):url::varchar as url,
    parse_json(src):type::varchar as type,
    parse_json(src):subtype::varchar as subtype,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'search')}}
{{ incremental_logic()}}