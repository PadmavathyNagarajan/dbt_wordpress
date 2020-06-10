insert into CRM_EDW.WORDPRESS.tags ("ID", "COUNT", "LINK", "NAME", "SLUG", "TAXONOMY", "RECORD_LOADED_AT")
        (
            select "ID", "COUNT", "LINK", "NAME", "SLUG", "TAXONOMY", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.tags__dbt_tmp
        );