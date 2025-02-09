/* Table: tasks__memberships */
/* Parent: tasks */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.project__gid,
    t.project__name,
    t.section__gid,
    t.section__name,
    t._dlt_root_id,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_tasks__memberships') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_tasks') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)