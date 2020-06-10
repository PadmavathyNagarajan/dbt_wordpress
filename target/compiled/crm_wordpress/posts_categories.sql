
select * from (
    select id,
    categories.value::number as categories,
    _fivetran_synced as record_loaded_at
from raw.crm_wordpress_af.posts,
lateral flatten(input => categories, outer => true) categories) 
where record_loaded_at > (select max(record_loaded_at) from CRM_EDW.WORDPRESS.post_categories)and 
categories is not null