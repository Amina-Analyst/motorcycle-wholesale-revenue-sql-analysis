select 
    product_line,
    case
	when month(date) =6 then 'June'
	when month(date)=7 then 'July'
	when month(date) =8 then 'August'
	end as month_wise,
    warehouse,
    (sum(total) - sum(payment_fee)) as net_revenue
from sales
where client_type='Wholesale'
group by product_line, month(date), warehouse
order by net_revenue,month_wise,net_revenue desc;