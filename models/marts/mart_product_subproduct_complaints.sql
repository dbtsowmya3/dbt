with product_subproduct_complaints AS
(
    select * from {{ref("stg_cfpb_complaints")}}
)
select  
    PRODUCT,
    SUB_PRODUCT,
    count(COMPLAINT_ID) AS COMPLAINT_count
from    
    product_subproduct_complaints
where 
    COMPLAINT_ID is not null
group by 
    PRODUCT,
    SUB_PRODUCT