{{ config(
    materialized='view',
    alias = 'post_categories'
)
}}
select * from (
    select PARSE_JSON(SRC):id as id,
    categories.value::number as categories,
    record_captured_at as record_loaded_at
from {{ source('wordpress_sources', 'posts')}},
lateral flatten(input => PARSE_JSON(SRC):categories, outer => true) categories) 
where categories is not null