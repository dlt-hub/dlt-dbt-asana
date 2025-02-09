{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_workspaces') }}
-- depends_on: {{ ref('dim_tags') }}
-- depends_on: {{ ref('dim_teams') }}
-- depends_on: {{ ref('dim_users') }}
-- depends_on: {{ ref('dim_projects') }}
-- depends_on: {{ ref('dim_tasks') }}
-- depends_on: {{ ref('dim_stories') }}
-- depends_on: {{ ref('dim_sections') }}
-- depends_on: {{ ref('dim_workspaces__email_domains') }}
-- depends_on: {{ ref('dim_users__workspaces') }}
-- depends_on: {{ ref('dim_tasks__custom_fields') }}
-- depends_on: {{ ref('dim_tasks__custom_fields__enum_options') }}
-- depends_on: {{ ref('dim_tasks__followers') }}
-- depends_on: {{ ref('dim_tasks__memberships') }}
-- depends_on: {{ ref('dim_projects__custom_field_settings') }}
-- depends_on: {{ ref('dim_projects__followers') }}
-- depends_on: {{ ref('dim_projects__members') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}