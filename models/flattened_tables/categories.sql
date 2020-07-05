{{ config(
    materialized='view',
    alias = 'categories'
)
}}
select 
    parse_json(src):id::number as id,
    parse_json(src):count::number as count,
    parse_json(src):description::varchar as description,
    parse_json(src):link::varchar as link,
    parse_json(src):name::varchar as name,
    parse_json(src):slug::varchar as slug,
    parse_json(src):taxonomy::varchar as taxonomy,
    parse_json(src):parent::number as parent,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'categories')}}