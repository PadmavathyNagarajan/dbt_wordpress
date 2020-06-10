insert into CRM_EDW.WORDPRESS.users ("ID", "NAME", "URL", "DESCRIPTION", "LINK", "SLUG", "AVATAR_URLS", "META", "RECORD_LOADED_AT")
        (
            select "ID", "NAME", "URL", "DESCRIPTION", "LINK", "SLUG", "AVATAR_URLS", "META", "RECORD_LOADED_AT"
            from CRM_EDW.WORDPRESS.users__dbt_tmp
        );