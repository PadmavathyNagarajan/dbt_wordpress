{{ config(
    materialized='view',
    alias = 'users'
)
}}
select 
    parse_json(src):id::number as id,
    parse_json(src):name::varchar as name,
    parse_json(src):url::varchar as url,
    parse_json(src):description::varchar as description,
    parse_json(src):link::varchar as link,
    parse_json(src):slug::varchar as slug,
    parse_json(src):avatar_urls::varchar as avatar_urls,
    parse_json(src):meta::variant as meta,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'users')}}