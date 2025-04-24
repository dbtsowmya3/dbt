with stg_cfpb_complaints AS
(
    select * from {{ source('consumer_complaints', 'CFPB_DATA') }}
)
select
  product ,
  sub_product,
  issue,
  sub_issue,
  company,
  state,
  CASE
    WHEN REGEXP_LIKE(zip_code, '^[0-9]{5}$') THEN zip_code
    ELSE NULL
  END AS zip_code,
  date_received,
  date_sent_to_company,
  submitted_via,
  consumer_consent_provided,
  company_response,
  company_public_response,
  cast(complaint_id AS INT) AS complaint_id,
  consumer_disputed,
  has_narrative 
from    
    stg_cfpb_complaints
where  REGEXP_LIKE(zip_code, '^[0-9]{5}$')