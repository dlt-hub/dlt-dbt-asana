/* Table: tasks */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.assignee__gid,
    t.assignee__resource_type,
    t.assignee_status,
    t.completed,
    t.created_at,
    t.due_on,
    t.modified_at,
    t.name,
    t.notes,
    t.num_subtasks,
    t.permalink_url,
    t.resource_type,
    t.resource_subtype,
    t.workspace__gid,
    t.workspace__resource_type,
    t._dlt_load_id,
    t._dlt_id,
    t.start_on,
FROM  {{ ref('stg_tasks') }} as t