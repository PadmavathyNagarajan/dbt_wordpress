
select * from (
    select id,
    tags.value::number as tags,
    _fivetran_synced as record_loaded_at
from raw.crm_wordpress_af.posts,
lateral flatten(input => tags, outer => true) tags) 
where record_loaded_at > (select max(record_loaded_at) from CRM_EDW.WORDPRESS.post_tags)and 
tags is not null