{{ config(
    materialized='incremental',
    transient = false,
    alias = 'categories'
)
}}
select 
    id::number as id,
    count::number as count,
    description::varchar as description,
    link::varchar as link,
    name::varchar as name,
    slug::varchar as slug,
    taxonomy::varchar as taxonomy,
    parent::number as parent,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'tb_categories_document')}}
{{ incremental_logic()}}