insert into CRM_EDW.WORDPRESS.post_tags ("ID", "TAGS", "RECORD_LOADED_AT")
        (
            select "ID", "TAGS", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.post_tags__dbt_tmp
        );