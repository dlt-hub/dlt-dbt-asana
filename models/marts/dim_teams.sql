/* Table: teams */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.description,
    t.name,
    t.organization__gid,
    t.organization__resource_type,
    t.permalink_url,
    t.resource_type,
    t.visibility,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_teams') }} as t