{{ config(
    materialized='incremental',
    transient = false,
    alias = 'post_categories'
)
}}
select * from (
    select PARSE_JSON(SRC):id as id,
    categories.value::number as categories,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'posts')}},
lateral flatten(input => PARSE_JSON(SRC):categories, outer => true) categories) 
{{ incremental_logic()}}
{%- if is_incremental() -%}
and 
{% else %}
where 
{% endif -%}
categories is not null