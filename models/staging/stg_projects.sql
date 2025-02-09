/* Table: projects */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'projects' */
    gid,
    archived,
    color,
    completed,
    created_at,
    default_view,
    icon,
    modified_at,
    name,
    notes,
    owner__gid,
    owner__resource_type,
    permalink_url,
    public,
    resource_type,
    team__gid,
    team__resource_type,
    workspace__gid,
    workspace__resource_type,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'projects') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )