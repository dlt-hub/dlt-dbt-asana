/* Table: projects__members */
/* Parent: projects */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.gid,
    t.resource_type,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_projects__members') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_projects') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)