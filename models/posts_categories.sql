{{ config(
    materialized='incremental',
    transient = false,
    alias = 'post_categories'
)
}}
select * from (
    select id,
    categories.value::number as categories,
    _fivetran_synced as record_loaded_at
from {{ source('wordpress_sources', 'posts')}},
lateral flatten(input => categories, outer => true) categories) 
{{ incremental_logic()}}
{%- if is_incremental() -%}
and 
{% else %}
where 
{% endif -%}
categories is not null