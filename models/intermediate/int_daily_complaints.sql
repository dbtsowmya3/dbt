{{
    config(
        materialized = 'incremental',
        unique_key = 'COMPLAINT_ID'
    )
}}
select * from {{ref("stg_cfpb_complaints")}}
{% if is_incremental() %}
where DATE_RECEIVED > ( select max(DATE_RECEIVED) from {{this}} )
{% endif %}