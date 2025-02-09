/* Table: tags */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.color,
    t.created_at,
    t.name,
    t.notes,
    t.permalink_url,
    t.resource_type,
    t.workspace__gid,
    t.workspace__resource_type,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_tags') }} as t