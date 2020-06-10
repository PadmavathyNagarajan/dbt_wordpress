insert into CRM_EDW.WORDPRESS.post_categories ("ID", "CATEGORIES", "RECORD_LOADED_AT")
        (
            select "ID", "CATEGORIES", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.post_categories__dbt_tmp
        );