
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
    link::varchar as link,
    parse_json(title):"rendered"::varchar as title,
    author::number as author,
    comment_status::varchar as comment_status,
    ping_status::varchar as ping_status,
    parse_json(description):"rendered"::varchar as description,
    parse_json(caption):"rendered"::varchar as caption,
    alt_text::varchar as alt_text,
    media_type::varchar as media_type,
    mime_type::varchar as mime_type,
    media_details::variant as media_details,
    post::number as post,
    source_url::varchar as source_url,
    _fivetran_synced as record_loaded_at
from raw.crm_wordpress_af.media
where record_loaded_at > (select max(record_loaded_at) from CRM_EDW.WORDPRESS.media)