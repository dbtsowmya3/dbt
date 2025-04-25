with most_complaints_by_company_statewise AS
(
    select * from {{ref("stg_cfpb_complaints")}}
),
complaints_count AS
(
    select  
        STATE, 
        COMPANY,
        COUNT(*) AS count_of_complaints
    from    
        most_complaints_by_company_statewise
    group by
        STATE, COMPANY
),
complaints_ranking AS
(
    select
        *,
        RANK() OVER(partition by STATE order by count_of_complaints desc) AS rn
    from    
        complaints_count
)
select
    STATE,
    COMPANY,
    count_of_complaints
from    
    complaints_ranking
where   
    rn = 1