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
The metrics were calculated based on the net sale values without outliers. The AOV was calculated using net sales instead of total revenue because it takes discounts and refunds into account. Through this method, the impact of the goods that SWO gives away can be analysed.

#### New Customers
The most popular items by both quantity sold and revenue were the socks (SWOCKETS), wrist/elbow sleeves and training shorts. Those 4 items made for around 90 percent of all items sold and revenue. Darkness (black) and lightning (white) SWOCKETS were released at SWO's inception and they are still what attracts new customers, but the new training shorts is also playing a role in bringing them in.

Here are some notes on the different products:
- **Training Shorts**: orders with this product had the highest AOV of over 80 euros. The price of the item is the highest, positively skewing the AOV, but despite that, people are purchasing more than just that item with around 70 percent of orders consisting of other items. A few customers bought multiple shorts. Out of the 16 orders, 6 of those consisted of both black and white shorts.
- **SWOCKETS**: Orders with lightning and darkness SWOCKETS had an AOV of almost 65 euros and 55 euros respectively. Lightning SWOCKETS were easily the best complementary item as almost 90 percent of orders with that product contained other items. However, customers had the tendency to make more purchases of darkness SWOCKETS on their own as the proportion is the lowest at 60 percent. People had a higher tendency to buy multiple darkness SWOCKETS than lightning SWOCKETS with there being 5 orders with multiple darkness SWOCKETS and only 1 with lightning SWOCKETS.
- **Wrist/Elbow sleeves**: orders with this product had an AOV of over 60 euros. The AOV being that high was due to people buying other items as 60 percent of orders with this item came with other products and the quantity per item was a little over 1. 

In general, 45 out of 46 orders made by new customers contained one of the four items discussed.

#### Repeat Customers
The 4 most popular items based on this were the same as that of the recent customers. Training shorts dominated when it came to both the number of orders and revenue but it’s interesting that the top 2 products based on number of orders were for newer products.
