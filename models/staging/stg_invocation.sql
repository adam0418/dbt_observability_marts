{{
    config(
        enabled=var('dbt_observability:marts_enabled', true)
    )
}}
select
    command_invocation_id,
    dbt_version,
    project_name,
    run_started_at,
    dbt_command,
    full_refresh_flag,
    target_type,
    target_profile_name,
    target_name,
    target_schema,
    target_threads,
    dbt_cloud_project_id,
    dbt_cloud_job_id,
    dbt_cloud_run_id,
    dbt_cloud_run_reason_category,
    dbt_cloud_run_reason,
    env_vars,
    dbt_vars
from {{ ref('invocations__unioned') }}
