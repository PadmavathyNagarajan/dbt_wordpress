{{ config(
    materialized='incremental',
    transient = false,
    alias = 'tags'
)
}}
select 
    id::number as id,
    count::number as count,
    link::varchar as link,
    name::varchar as name,
    slug::varchar as slug,
    taxonomy::varchar as taxonomy,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'tb_tags_document')}}
{{ incremental_logic()}}