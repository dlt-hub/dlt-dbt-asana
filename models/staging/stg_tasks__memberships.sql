/* Table: tasks__memberships */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_tasks') }}

SELECT
/* select which columns will be available for table 'tasks__memberships' */
    project__gid,
    project__name,
    section__gid,
    section__name,
    _dlt_root_id,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'tasks__memberships') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_tasks') }} )
