with company_response_rate AS
(
    select * from {{ref("stg_cfpb_complaints")}}
),
responses AS
(
    select
        COMPANY_RESPONSE,
        count(*) total_responses
    from
        company_response_rate
    group by 
        COMPANY_RESPONSE
)
select 
    *,
    ROUND(total_responses * 100 / (select count(*) from company_response_rate),2) AS response_rate
from
    responses