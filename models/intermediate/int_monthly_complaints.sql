with complaints_by_product_month AS
(
    select * from {{ref("stg_cfpb_complaints")}}
)
select
    MONTH(DATE_SENT_TO_COMPANY) AS Month,
    COUNT(*) AS no_of_complaints
from
    complaints_by_product_month
group by MONTH(DATE_SENT_TO_COMPANY)