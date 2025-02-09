/* Table: users__workspaces */
/* Parent: users */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.resource_type,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_users__workspaces') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_users') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)