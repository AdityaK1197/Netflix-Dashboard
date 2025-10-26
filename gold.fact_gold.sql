

CREATE OR ALTER VIEW gold.fact_gold AS

SELECT
    Year,
    Revenue,
    subscription_cost,
    Fulfillment_cost,
    Technology_development,
    Marketing,
    General_administrative,
    Interest,
    Disposals_DVD,
	 (subscription_cost + Fulfillment_cost + Marketing + Technology_development + General_administrative + Disposals_DVD) AS total_cost,
    -- Must recalculate here instead of using alias
    (Revenue - (subscription_cost + Fulfillment_cost + Marketing + Technology_development + General_administrative +Disposals_DVD)) AS operating_income,
   (
        ((Revenue -  (subscription_cost + Fulfillment_cost + Marketing + Technology_development + General_administrative + Disposals_DVD))
        - Interest)
        + Income - Expense
    ) AS PBT,
	avg_paid_sub + trial_sub_attheend as 'total_subsribers',

	(Revenue/(avg_paid_sub + trial_sub_attheend))/12 as 'ARPU $',

	Marketing/(avg_paid_sub + trial_sub_attheend) as 'costofaquisition $',

	COALESCE(LAG(avg_paid_sub + trial_sub_attheend) OVER (ORDER BY year),(avg_paid_sub + trial_sub_attheend)) as 'previousyearsuscount',

	(avg_paid_sub + trial_sub_attheend)	- COALESCE(LAG(avg_paid_sub + trial_sub_attheend) OVER (ORDER BY year),(avg_paid_sub + trial_sub_attheend)) as 'newsubcount',

    ISNULL(
	CAST(
        ROUND(
            (
                (avg_paid_sub + trial_sub_attheend) -
                LAG(avg_paid_sub + trial_sub_attheend) OVER (ORDER BY year)
            ) * 100.0 /
            NULLIF(LAG(avg_paid_sub + trial_sub_attheend) OVER (ORDER BY year), 0),
        2) AS DECIMAL(10,2)
    ),0) AS 'subsriber growth %',

ISNULL(LAG(revenue) OVER (ORDER BY YEAR),0) as 'previousyearrevenue',

ISNULL(
CAST(
ROUND(
((Revenue - LAG(revenue) OVER (ORDER BY YEAR)) * 100.00 )/ 
NULLIF(LAG(revenue) OVER (ORDER BY YEAR),0),2) as decimal(10,2)),0) as 'revenuegrowth%'

FROM silver.netflix_financials;


