with submission_channels AS
(
    select * from {{ref("stg_cfpb_complaints")}}
)
select
    SUBMITTED_VIA,
    count(*) AS count
from    
    submission_channels
group by 
    SUBMITTED_VIA
