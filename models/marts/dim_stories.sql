/* Table: stories */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.assignee__gid,
    t.assignee__resource_type,
    t.created_at,
    t.created_by__gid,
    t.created_by__resource_type,
    t.resource_type,
    t.source,
    t.text,
    t.type,
    t.resource_subtype,
    t.target__gid,
    t.target__resource_type,
    t._dlt_load_id,
    t._dlt_id,
    t.project__gid,
    t.project__resource_type,
FROM  {{ ref('stg_stories') }} as t