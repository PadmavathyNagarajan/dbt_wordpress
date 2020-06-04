{%- macro incremental_logic() -%}
{%- if is_incremental() -%}
    where record_loaded_at > (select max(record_loaded_at) from {{this}})
{%- endif -%}
{%- endmacro -%}