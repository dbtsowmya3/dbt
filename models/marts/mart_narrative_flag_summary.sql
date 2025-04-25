with narrative_flag_summary AS
(
    select * from {{ref("stg_cfpb_complaints")}}
)
select  
    HAS_NARRATIVE,
    count(*) AS count
from
    narrative_flag_summary
where
    HAS_NARRATIVE = 'true'
group by 
    HAS_NARRATIVE