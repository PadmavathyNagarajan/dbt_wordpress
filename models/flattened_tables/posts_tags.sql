{{ config(
    materialized='incremental',
    transient = false,
    alias = 'post_tags'
)
}}
select * from (
    select PARSE_JSON(SRC):id as id,
    tags.value::number as tags,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'posts')}},
lateral flatten(input => PARSE_JSON(SRC):tags, outer => true) tags) 
{{ incremental_logic()}}
{%- if is_incremental() -%}
and 
{% else %}
where 
{% endif -%}
tags is not null
