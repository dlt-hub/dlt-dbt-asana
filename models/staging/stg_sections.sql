/* Table: sections */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'sections' */
    gid,
    created_at,
    name,
    project__gid,
    project__resource_type,
    resource_type,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'sections') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )