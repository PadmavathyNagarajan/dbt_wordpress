{{ config(
    materialized='incremental',
    transient = false,
    alias = 'users'
)
}}
select 
    id::number as id,
    name::varchar as name,
    url::varchar as url,
    description::varchar as description,
    link::varchar as link,
    slug::varchar as slug,
    avatar_urls::varchar as avatar_urls,
    meta::variant as meta,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'tb_users_document')}}
{{ incremental_logic()}}