with most_reported_issues_for_each_product AS
(
    select * from {{ref("stg_cfpb_complaints")}}
),
issue_count AS
(
    select
        PRODUCT,
        issue,
        COUNT(*) AS no_of_issues
    from    
        most_reported_issues_for_each_product
    where
        PRODUCT is not null AND
        issue is not NULL
    group by 
        PRODUCT, issue
)
select  
    *,
    RANK() OVER(partition by PRODUCT order by no_of_issues desc) AS RANK
from    
    issue_count 
