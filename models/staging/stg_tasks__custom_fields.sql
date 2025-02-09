/* Table: tasks__custom_fields */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_tasks') }}

SELECT
/* select which columns will be available for table 'tasks__custom_fields' */
    gid,
    enabled,
    enum_value__gid,
    enum_value__color,
    enum_value__enabled,
    enum_value__name,
    enum_value__resource_type,
    name,
    description,
    display_value,
    resource_subtype,
    resource_type,
    is_formula_field,
    is_value_read_only,
    type,
    _dlt_root_id,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    created_by__gid,
    created_by__name,
    created_by__resource_type,
FROM {{ source('raw_data', 'tasks__custom_fields') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_tasks') }} )
