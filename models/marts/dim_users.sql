/* Table: users */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.email,
    t.name,
    t.resource_type,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_users') }} as t