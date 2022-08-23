{{ config(enabled=var('ad_reporting__snapchat_ads_enabled', true)) }}

with base as (

    select * 
    from {{ ref('stg_snapchat_ads__campaign_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_snapchat_ads__campaign_history_tmp')),
                staging_columns=get_campaign_history_columns()
            )
        }}
    from base
),

final as (
    
    select
        id as campaign_id,
        ad_account_id,
        cast (created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        name as campaign_name,
        cast (updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        row_number() over (partition by id order by updated_at desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
