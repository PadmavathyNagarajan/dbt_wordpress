{{ config(
    materialized='incremental',
    transient = false,
    alias = 'posts'
)
}}
select 
    id::number as id,
    date::timestamp as date,
    date_gmt::timestamp as date_gmt,
    parse_json(guid):"rendered"::varchar as guid,
    modified::timestamp as modified,
    modified_gmt::timestamp as modified_gmt,
    slug::varchar as slug,
    status::varchar as status,
    type::varchar as type,
    parse_json(title):"rendered"::varchar as title,
    parse_json(excerpt):"protected"::boolean as excerpt_protected,
    parse_json(excerpt):"rendered"::varchar as excerpt,
    author::number as author,
    featured_media::number as featured_media,
    comment_status::varchar as comment_status,
    ping_status::varchar as ping_status,
    sticky::varchar as sticky,
    format::varchar as format,
    _fivetran_synced as record_loaded_at,
    categories::variant as categories,
    tags::variant as tags
from {{ source('wordpress_sources', 'tb_posts_document')}}
{{ incremental_logic()}}