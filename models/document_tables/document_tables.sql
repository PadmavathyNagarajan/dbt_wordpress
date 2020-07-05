{{ config(
    materialized='table',
    transient = false,
    tags = ["delta_load"]
)
}}
{% set view_list = ['posts', 'categories', 'tags', 'pages', 'media', 'users', 'search'] %}

{% set delta_query %}
    {% for view in view_list %}
        merge into "RAW"."WORDPRESS"."{{view|upper}}_DOCUMENT" as target using
            (select convert_timezone('UTC', current_timestamp(2))::timestamp_ntz as "RECORD_CAPTURED_AT", $1 as "SRC1" from @"RAW"."WORDPRESS".stg_wordpress/{{view}}/{{view}}.json (file_format=> FF_JSON_WORDPRESS)) as sources on
            parse_json(sources."SRC1"):id = target.SRC:id
        when matched then 
            update set target."RECORD_CAPTURED_AT" = sources."RECORD_CAPTURED_AT", target."SRC" = sources."SRC1"
        when not matched then
            insert ("RECORD_CAPTURED_AT", SRC) values(sources."RECORD_CAPTURED_AT", sources."SRC1");
        
    {% endfor %}
{% endset %}

{% do run_query(delta_query) %}

select convert_timezone('UTC', current_timestamp(2))::timestamp_ntz as last_delta_load
