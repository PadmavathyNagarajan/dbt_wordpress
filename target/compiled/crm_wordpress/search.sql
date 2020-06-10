
select 
    id::number as id,
    title::varchar as title,
    url::varchar as url,
    type::varchar as type,
    subtype::varchar as subtype,
    _fivetran_synced as record_loaded_at
from raw.crm_wordpress_af.search
where record_loaded_at > (select max(record_loaded_at) from CRM_EDW.WORDPRESS.search)