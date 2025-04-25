{% snapshot COMPANY_RESPONSE %}
    {{
        config(
            database = "CFPB_DEV",
            target_schema = "SNAPSHOTS",
            unique_key = "COMPLAINT_ID",
            strategy = "check",
            check_cols = ["company_response", "consumer_disputed"]
        )
    }}

select * from {{ ref("stg_cfpb_complaints") }}

{% endsnapshot %}