
  create or replace  view CRM_EDW.WORDPRESS.test  as (
    select * from raw.crm_wordpress_af.fivetran_audit
  );
