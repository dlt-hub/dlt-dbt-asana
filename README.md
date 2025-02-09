# Asana dlt-dbt Package

### Overview
The Asana dlt-dbt package offers data models to help you transform and analyze Asana data. It's designed to integrate seamlessly with the dlt Asana pipeline, which extracts and loads Asana data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Asana data into their analytics workflows without building models from scratch.


### Key Features
- **Staging Models:** Clean and prepare raw Asana data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Asana entities like tasks, stories, etc.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Asana pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Asana pipeline is set up and running.

### Step 1: Set Up the dlt Asana Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt [Asana pipeline documentation](https://dlthub.com/docs/dlt-ecosystem/verified-sources/asana) to set up your pipeline. Ensure you have your Asana API key and destination credentials configured.

3. **Run the Pipeline:**
   Extract and load data from Asana into your data warehouse by running the pipelines.

### Step 2: Install and Configure the dbt Project

1. Install the Asana dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Asana pipeline is available in your warehouse.

This is how the tables in dbt packages look like:
```text
dbt_asana/
├── analysis/
├── macros/
├── marts/
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── dim_projects__custom_field_settings.sql
│   │   ├── dim_projects__followers.sql
│   │   ├── dim_projects__members.sql
│   │   ├── dim_projects.sql
│   │   ├── dim_sections.sql
│   │   ├── dim_stories.sql
│   │   ├── dim_tags.sql
│   │   ├── dim_tasks__custom_fields__enum_options.sql
│   │   ├── dim_tasks__custom_fields.sql
│   │   ├── dim_tasks__followers.sql
│   │   ├── dim_tasks__memberships.sql
│   │   ├── dim_tasks.sql
│   │   ├── dim_teams.sql
│   │   ├── dim_users__workspaces.sql
│   │   ├── dim_users.sql
│   │   ├── dim_workspaces__email_domains.sql
│   │   └── dim_workspaces.sql
│   ├── staging/
│   │   ├── stg__dlt_loads.sql
│   │   ├── stg_projects__custom_field_settings.sql
│   │   ├── stg_projects__followers.sql
│   │   ├── stg_projects__members.sql
│   │   ├── stg_projects.sql
│   │   ├── stg_sections.sql
│   │   ├── stg_stories.sql
│   │   ├── stg_tags.sql
│   │   ├── stg_tasks__custom_fields__enum_options.sql
│   │   ├── stg_tasks__custom_fields.sql
│   │   ├── stg_tasks__followers.sql
│   │   ├── stg_tasks__memberships.sql
│   │   ├── stg_tasks.sql
│   │   ├── stg_teams.sql
│   │   ├── stg_users__workspaces.sql
│   │   ├── stg_users.sql
│   │   ├── stg_workspaces__email_domains.sql
│   │   └── stg_workspaces.sql
│   ├── dlt_active_load_ids.sql
│   ├── dlt_processed_load_ids.sql
│   └── sources.yml
├── tests/
├── dbt_project.yml
├── requirements.txt
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Asana data into useful tables:

```sh
dbt build
```

### Customization
While this package provides a solid foundation, you can customize it to suit your specific needs:

- Modify the models to align with your business logic.
- Add relationships between tables by modifying your dlt pipeline schema.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of Asana data modelled above using dlt-dbt-generator:
    
   ![picture](https://storage.googleapis.com/dlt-blog-images/asana_dlt_dbt_v0.1.0.png)


> ⚠️ **Note:**
> 
> Please note that this is a starting template for your data model and is not the final product. It is advised to customize the data model as per your needs.

   Here's the link to the DB diagram: [link](https://dbdiagram.io/d/asana_dlt_dbt_v0-1-0-67a82ba3263d6cf9a080224d).

#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation](https://dlt-plus.netlify.app/docs/plus/intro/). To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlthub.com/blog/dbt-gen) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.
