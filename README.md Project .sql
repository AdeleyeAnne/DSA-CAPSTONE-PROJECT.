---- Taking a view look of our data set---
 select *
 from KMS_Inventory
--- The table has 6929 and 21 columns--- 

--- using the Row id as our primary key(unique identifier since it contains no duplicate value
Alter Table KMS_Inventory
add primary key( Row_id)


---- Answering our case study Question----

----1 Which product category had the highest sales?----
select product_category, sum(sales)as Highest_sales
from KMS_Inventory
group by product_category
Order by  Highest_sales desc 
---Techlology has the highest sales with total of 4739149 approximately


----2a.What are the Top 3 and Bottom 3 regions in terms of sales?---
select Top 3 region, sum (sales) as Top3_region
from KMS_Inventory
group by region
order by Top3_region desc
----- Ontario was the top region in sales, followed by Prarie and Atlantic---

---2b bottom 3 b region---
select top 3 region, sum (sales) as bottom3_region
from KMS_Inventory
group by region
order by bottom3_region asc
-----Nunavut was the least sales region, follwed by Northwest Territories and Yukon---

---- 3.What were the total sales of appliances in Ontario?----
select Product_Sub_Category,
   sum (Sales) as Appliance_sales_Ontario
from  KMS_Inventory
where Product_Sub_Category = 'Appliances' and province ='Ontario'
group by Product_Sub_Category
order by  Appliance_sales_Ontario desc
--- Total sales for appliances in Ontanio is 202347 approximately

----4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers----
select Top 10 Customer_Name, sum (Sales) as Revenue
from KMS_Inventory 
group by Customer_Name
order by Revenue asc
--- Identify who the bottom 10 customers and understand their preference( what they need at each point in time)---
---understand their buying behaviour, budgt, ensure timely delivery of goods, and ensure friendly customer service---
--- Offer bundle offers, volume discount, additional free gift on purchase----
---attractive packages,and also offer promos to enable them make larger purchase---
---create more awareness and engagement on social media platforms keeping product in mind of customers-----
---Engage with bottom customers, educate them on the use of product---
---- encourage and appreciate feedbacks about their expeiences and where they will like improvement----
---flexibility in payment option: like accepting installmental payment or subcription mode---
--- Identify churn customers, reach out to them and create a  come back relationship with good welcome package


---5. KMS incurred the most shipping cost using which shipping method?---
select Ship_Mode, sum(Shipping_Cost) as Incurred_cost
from KMS_Inventory
group by Ship_Mode
order by Incurred_cost desc
---KMS incurred the most shipping cost from Delivery Truck

--- 6. Who are the most valuable customers, and what products or services do they typically purchase?---
select top  10 * from (
select Customer_Name,Product_Category
from KMS_Inventory) as Valuable_customer
order by Product_category desc


--- our 10 most valuable customers are:
---Keith Dawkins
---Helen Wasserman
---Liz Pelletier
---Tamara Dahlen
---Julie Creighton
---Roy Collins
---Emily Phan
---Anne Pryor
---Valerie Takahito
---Erin Creighton
---They typically purchase Technology---

---7. Which small business customer had the highest sales?----
select top 5
Customer_Name, sum( sales) as Highest_sales
from KMS_Inventory
where customer_segment = 'Small Business'
group by Customer_Name
order by Highest_sales desc

--- The top 5 small business customer with Highest sales are:
Names                 Sales
Dennis Kane         75967.5932159424
John Lucas          72331.8783340454
Deborah Brumfield   59408.42993927
Grant Carroll       56894.6676940918
John Stevenson      48660.8737764359


--- 8. Which Corporate Customer placed the most number of orders in 2009 – 2012?---
select Customer_Name, sum( Order_Quantity) as Highest_order
from KMS_Inventory
where Customer_Segment ='Corporate' and order_date between'2009-01-01'and'2012-12-31'
group by Customer_Name
order by Highest_order desc
--- The coperate customer with most number of orders in 2009_2012 is Roy Skaria with 773 order quantity


---9. Which consumer customer was the most profitable one?---
select top 1 Customer_Name, sum(profit) as Most_profitable
from KMS_Inventory
where Customer_segment ='Consumer'
group by customer_Name
order by Most_profitable desc
--- the profitable customer is Emily Phan with 27973 approximately generated

----10. Which customer returned items, and what segment do they belong to?---
--- JOINING THE TWO TABLES TOGETHER--

----10. Which customer returned items, and what segment do they belong to?---
select distinct customer_name, customer_segment 
from KMS_inventory
JOIN 
 order_status on KMS_inventory .order_id = order_status .order_id
 where 
 order_status .[status] = 'returned'
---- 348 customers returned items from all segment-=---


---11. If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company
appropriately spent shipping costs based on the Order Priority? Explain your answer---

 select ship_mode,order_priority,  sum(shipping_cost) as cost
 from  KMS_inventory
 group by ship_mode,order_priority
 order by cost desc

 --- To interpret this, we need to understand what each order priority stands for
 Critical: This piority requires highest urgency, which require immediate action
 High: A high piority requiresprompt processing, but not as as urgent critical order . it needs to be attended to meet up customers needs
 Medium : orders are important, but not urgent , can be deliver within the timeframe
 Low : they are least important and can be, they can be processed at later time
 Not specified: No specific priority was specify.

 With this understanding we have an idea on our order priority 
 ---- From the analysis its clearly shows
 Appropriate use of delivery cost is economical because it helps to reduce the shipping cost but its not appropriate for critical and high order priority, its efficient for low , medium and non specified orders.
Delay in critical and high order priority may lead to loss of high influential customers, loss of trust from both current customers and potential customers.
In case of emergency truck delivery should not be considered for critical and high to avoid violation and penalties
Truck deliveries are prone and have high rate of defect items which might not be idea or critical and high order priority.
Kultra Mega Stores  is spending shipping cost appropriately low order priority but not spending it appropriately with high and critical order priority.
Express air shipping mode stands appropriate for high and critical priority order to avoid losing of customer due to delay in delivery.

