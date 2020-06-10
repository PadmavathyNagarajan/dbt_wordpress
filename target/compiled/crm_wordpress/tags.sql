
select 
    id::number as id,
    count::number as count,
    link::varchar as link,
    name::varchar as name,
    slug::varchar as slug,
    taxonomy::varchar as taxonomy,
    _fivetran_synced as record_loaded_at
from raw.crm_wordpress_af.tags
where record_loaded_at > (select max(record_loaded_at) from CRM_EDW.WORDPRESS.tags)