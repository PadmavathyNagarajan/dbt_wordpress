{{ config(
    materialized='incremental',
    transient = false,
    alias = 'post_tags'
)
}}
select * from (
    select id,
    tags.value::number as tags,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'tb_posts_document')}},
lateral flatten(input => tags, outer => true) tags) 
{{ incremental_logic()}}
{%- if is_incremental() -%}
and 
{% else %}
where 
{% endif -%}
tags is not null
