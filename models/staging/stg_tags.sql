/* Table: tags */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'tags' */
    gid,
    color,
    created_at,
    name,
    notes,
    permalink_url,
    resource_type,
    workspace__gid,
    workspace__resource_type,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'tags') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )