/* Table: tasks__custom_fields__enum_options */
/* Parent: tasks__custom_fields */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.color,
    t.enabled,
    t.name,
    t.resource_type,
    t._dlt_root_id,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_tasks__custom_fields__enum_options') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_tasks__custom_fields') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)