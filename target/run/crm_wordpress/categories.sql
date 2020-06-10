insert into CRM_EDW.WORDPRESS.categories ("ID", "COUNT", "DESCRIPTION", "LINK", "NAME", "SLUG", "TAXONOMY", "PARENT", "RECORD_LOADED_AT")
        (
            select "ID", "COUNT", "DESCRIPTION", "LINK", "NAME", "SLUG", "TAXONOMY", "PARENT", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.categories__dbt_tmp
        );