
with base as (

    select * 
    from {{ ref('stg_snapchat_ads__ad_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_snapchat_ads__ad_history_tmp')),
                staging_columns=get_ad_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as ad_id,
        name as ad_name,
        cast (created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        ad_squad_id,
        creative_id,
        cast (updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        row_number() over (partition by ad_id order by updated_at desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
