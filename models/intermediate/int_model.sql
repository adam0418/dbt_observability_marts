{{
    config(
        enabled=var('dbt_observability:marts_enabled', true)
    )
}}
select
    command_invocation_id,
    node_id,
    {{ dbt.split_part(string_text='node_id', delimiter_text="'.'", part_number=1) }} as resource_type,
    {{ dbt.split_part(string_text='node_id', delimiter_text="'.'", part_number=2) }} as project,
    {{ dbt.split_part(string_text='node_id', delimiter_text="'.'", part_number=3) }} as resource_name,
    run_started_at,
    database_name,
    schema_name,
    name,
    depends_on_nodes,
    package_name,
    path,
    checksum,
    materialization,
    tags,
    meta,
    description,
    total_rowcount
from {{ ref('dbt_observability_marts', 'stg_model') }}
