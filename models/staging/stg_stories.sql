/* Table: stories */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'stories' */
    gid,
    assignee__gid,
    assignee__resource_type,
    created_at,
    created_by__gid,
    created_by__resource_type,
    resource_type,
    source,
    text,
    type,
    resource_subtype,
    target__gid,
    target__resource_type,
    _dlt_load_id,
    _dlt_id,
    project__gid,
    project__resource_type,
FROM {{ source('raw_data', 'stories') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )