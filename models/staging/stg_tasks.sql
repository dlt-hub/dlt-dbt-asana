/* Table: tasks */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'tasks' */
    gid,
    assignee__gid,
    assignee__resource_type,
    assignee_status,
    completed,
    created_at,
    due_on,
    modified_at,
    name,
    notes,
    num_subtasks,
    permalink_url,
    resource_type,
    resource_subtype,
    workspace__gid,
    workspace__resource_type,
    _dlt_load_id,
    _dlt_id,
    start_on,
FROM {{ source('raw_data', 'tasks') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )