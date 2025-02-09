/* Table: tasks__custom_fields */
/* Parent: tasks */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.enabled,
    t.enum_value__gid,
    t.enum_value__color,
    t.enum_value__enabled,
    t.enum_value__name,
    t.enum_value__resource_type,
    t.name,
    t.description,
    t.display_value,
    t.resource_subtype,
    t.resource_type,
    t.is_formula_field,
    t.is_value_read_only,
    t.type,
    t._dlt_root_id,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.created_by__gid,
    t.created_by__name,
    t.created_by__resource_type,
FROM  {{ ref('stg_tasks__custom_fields') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_tasks') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)