insert into CRM_EDW.WORDPRESS.posts ("ID", "DATE", "DATE_GMT", "GUID", "MODIFIED", "MODIFIED_GMT", "SLUG", "STATUS", "TYPE", "TITLE", "EXCERPT_PROTECTED", "EXCERPT", "AUTHOR", "FEATURED_MEDIA", "COMMENT_STATUS", "PING_STATUS", "STICKY", "FORMAT", "RECORD_LOADED_AT", "CATEGORIES", "TAGS")
        (
            select "ID", "DATE", "DATE_GMT", "GUID", "MODIFIED", "MODIFIED_GMT", "SLUG", "STATUS", "TYPE", "TITLE", "EXCERPT_PROTECTED", "EXCERPT", "AUTHOR", "FEATURED_MEDIA", "COMMENT_STATUS", "PING_STATUS", "STICKY", "FORMAT", "RECORD_LOADED_AT", "CATEGORIES", "TAGS"
            from CRM_EDW.WORDPRESS.posts__dbt_tmp
        );