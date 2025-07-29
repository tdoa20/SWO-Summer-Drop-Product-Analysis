# Street Workout Official Summer Drop Analysis

## Project Background
Calisthenics is a brand of strength training done with one's own bodyweight. Street Workout Official (SWO), as an e-commerce company, caters to calisthenics practitioners and professional athletes worldwide by selling sports apparel through its website and sponsoring various live competitions. At these competitions, people can get a chance to see the products SWO has in-person and make purchases.

The company's growth in the past year has allowed there to be enough transactional data to fully implement a data analytics initiative to take steps towards profitability. International Strength Nights (ISN) is posed to be their biggest competition yet presenting an opportunity to leverage its potential success by introducing more people to the brand and making sales through a limited edition release. This project aims to analyse the transactions done after their summer release to understand customer preferences and optimise sales.

Insights and recommendations will be provided on the following areas:
- **Monthly Sales**: an evaluation of patterns in monthly sales and order frequency from January to June in comparison to last year.
- **Product Performance**: an analysis of the different products released during the summer drop with a focus on the average order value (AOV), quantity per order, and product combinations. This will be split between new customers and repeat customers. Repeat customers is defined as customers who purchased SWO products before and after the summer release.

## Data Structure & Cleaning Process
This entity-relational-diagram shows tables that were derived from a Shopify orders export file that provides transactional information. It has an orders and product fact table and dimension tables consisting of: Order Details, Product Details, Customer Details, Unfulfilled Orders, Refunded Orders, and Date. Orders fact is the central fact table and product fact is a table used to be able to make certain product insights as the product names on Shopify differ from the names SWO provides. 
<br><img src = "SWO ERD.png" width = 600 height = 600>

The SQL queries used to form the tables can be found <a href = "Data-Cleaning-Procedure/SQL_Queries">here</a>. The Product_Details table was made in Power BI. The table can be found <a href = "Data-Cleaning-Procedure/Product_Details.csv">here.</a> The Shopify orders exports file used in this analysis can be found <a href = "Data-Cleaning-Procedure/orders_export_1.csv">here</a>. The customer's names and addresses have been anonymised for privacy purposes.


## Executive Summary

### Overview of Findings

### Recommendations

## Insights
### Monthly Sales
<img src = "Charts/Monthly_Net_Sales2024.png">
<img src = "Charts/Monthly_Net_Sales2025.png">
These bar charts highlight the increase in SWO'S net sales through a decrease in variability from 2024 to 2025. The sharp increase in the minimum value from 45 euros in 2024 to almost 700 euros in 2025 was a key factor in the almost 3x increase in average monthly net sales. The product release in the winter of 2024 worked to capture lots of new customers and introduce a collection of products that are still attracting customers past its release. This provides a reliable revenue stream as the outcome of new drops can vary.
<br>
<br>
By learning about the products that attract the most customers, SWO can increase the margin of error of the new drop at ISN and make a substantial amount of net sales.



### Product Performance


