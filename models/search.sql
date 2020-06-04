{{ config(
    materialized='incremental',
    transient = false,
    alias = 'search'
)
}}
select 
    id::number as id,
    title::varchar as title,
    url::varchar as url,
    type::varchar as type,
    subtype::varchar as subtype,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'tb_search_document')}}
{{ incremental_logic()}}