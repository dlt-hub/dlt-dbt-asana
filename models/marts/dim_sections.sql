/* Table: sections */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.created_at,
    t.name,
    t.project__gid,
    t.project__resource_type,
    t.resource_type,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_sections') }} as t