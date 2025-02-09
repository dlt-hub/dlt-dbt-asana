/* Table: workspaces */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.is_organization,
    t.name,
    t.resource_type,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_workspaces') }} as t