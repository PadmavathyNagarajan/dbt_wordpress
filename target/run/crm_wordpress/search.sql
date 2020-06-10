insert into CRM_EDW.WORDPRESS.search ("ID", "TITLE", "URL", "TYPE", "SUBTYPE", "RECORD_LOADED_AT")
        (
            select "ID", "TITLE", "URL", "TYPE", "SUBTYPE", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.search__dbt_tmp
        );