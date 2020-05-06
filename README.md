# Final Project
## Instacart Customer Insights
### Team: Arthur Chan, Lei Gu, Cindy Wagner and Jun Yang (May 2020)

### Description
This is an exercise to apply different machine-learning algorithms to understand customer consumption behavior and predict what customer would buy next.

### 0. The Instacart dataset
Instacart operates a grocery delivery and pick-up service in the US and Canada. The company released an anonymized dataset in 2017 with over 3.4 million orders from 206,000+ Instacart users. Data were obtained from https://www.instacart.com/datasets/grocery-shopping-2017.

### 1. Database Setup
Data were imported into PostgreSQL. Database structure is shown in the diagram below. They are linked by `product_id`, `aisle_id`, `department_id`,and  `order_id`

![Diagram](./SQL/Database_Diagram.PNG)

- `products`: contains product name and the assigned `aisle` and `department id`
- `aisles`: contains name of aisle
- `departments`: contains name of department
- `orders`: has info on customer, when order was placed and days since prior order
- `order_products`: stores info on what items were bought in each order, the order that item was added to cart, and if item has been ordered previously 

### 2. Exploratory Data Analysis
The dataset has over 49,000 products classified into 134 `aisles` and 21 `departments`. 
Theere were 206,200 unique user buying more than 33.8 million items in 3.4 million orders.

![Products](./Outputs/EDA_Images/productsPerOrder.png)

![DeptAisle](./Outputs/EDA_Images/popularDeptAisle.png)

![PopProduct](./Outputs/EDA_Images/popularProducts.PNG)

![reOrder](./Outputs/EDA_Images/reorderDept.png)

![When](./Outputs/EDA_Images/freqHeatMap.png)

![Often](./Outputs/EDA_Images/freqBetweenOrders.png)

### 3. Customer Clustering

### 4. Recommendation System
