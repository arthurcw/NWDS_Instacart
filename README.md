# Instacart Customers Insights
### Team: Arthur Chan, Lei Gu, Cindy Wagner and Jun Yang (May 2020)

### Description
This is an exercise to apply different machine-learning algorithms to understand customer consumption behavior and predict what customer would buy next.

## 0. The Instacart dataset
Instacart operates a grocery delivery and pick-up service in the US and Canada. The company released an anonymized dataset in 2017 with over 3.4 million orders from 206,000+ Instacart users. Data were downloaded in May 2020 from [Instacart](https://www.instacart.com/datasets/grocery-shopping-2017).

## 1. Database Setup
Data were imported into PostgreSQL. Database structure is shown in the diagram below. They are linked by `product_id`, `aisle_id`, `department_id`,and  `order_id`

![Diagram](./SQL/Database_Diagram.PNG)

- `products`: contains product name and the assigned `aisle` and `department id`
- `aisles`: aisle name, a product sub-category under department
- `departments`: department name, product category
- `orders`: has info on customer, when order was placed and days since prior order
- `order_products`: stores info on what items were bought in each order, the order that item was added to cart, and if item has been ordered previously 

## 2. Exploratory Data Analysis
The dataset has over 49,000 products classified into 134 `aisles` and 21 `departments`. 
Theere were 206,200 unique user buying more than 33.8 million items in 3.4 million orders. See the full EDA notebook [here](https://github.com/arthurcw/NWDS_Instacart/blob/master/ExploratoryDataAnalysis/DataVisual.ipynb)

#### a. Customers usually bought 5 - 8 products per order
![Products](./Outputs/EDA_Images/productsPerOrder.png)

#### b. 1/3 of purchased products are produce, and mostly fresh fruits and fresh veges
![DeptAisle](./Outputs/EDA_Images/popularDeptAisle.png)

#### c. Bananas are everyone's favorite
![PopProduct](./Outputs/EDA_Images/popularProducts.PNG)

#### d. Daily food items are more often reordered
![reOrder](./Outputs/EDA_Images/reorderDept.png)

#### e. Most people placed orders at 3pm on Weekday 0 or 10am on Weekday 1
![When](./Outputs/EDA_Images/freqHeatMap.png)

#### f. For frequent customers, they usually place order once a week
![Often](./Outputs/EDA_Images/freqBetweenOrders.png)

## 3. Customer Segmentation
We attempt to divide customers into groups based on their purchase history. The groups are then fed into the recommender system to tailor product recommendation for each target group. Because there is no pre-assigned group, we deploy unsupervised learning methods such as `K-means`, `DBSCAN` and `hierarichal clustering` to find underlying pattern and classify customers into groups.

##### i. Order History for Each Customer
Data were aggregated by creating a purchase summary matrix for each customer. Rows represent each individual customer (`user_id`), columns represent product categories, and the resulting matrix is total number of products in each category. We have decided to aggregate purchases by both `department` and `aisle`, and an additional `organic` product category that was not classified in the original dataset. See the full data pareparation notebok [here](https://github.com/arthurcw/NWDS_Instacart/blob/master/CustomerSegmentation/0_DataPrep.ipynb)
Image

##### ii. Training Size: 20,000 were randomly selected from 90,000+ customers with over 100 products purchased

##### iii. Principal Component Analysis
With 157 product categories and sub-categories (`department`, `aisle`, and `organic`), we applied PCA to reduce the number of dimensions to 71 that explains 95% of the variance in data. 
![PCA](https://github.com/arthurcw/NWDS_Instacart/blob/master/Outputs/PCA_variance.png)

## 4. Recommendation System
