# Data Generated from Data Preparation, PCA, Customer Segmentation and Recommender
#### CSVs
- customer_order_history.zip: csv file storing number of purchases by aisle/department/organic product category by `user_id`
- customer_order_train.csv: 20% of customer history as training set
- customer_order_train_rescale.csv: training data transformed by RobustScaler
- customer_order_rescale.zip: csv file of entire order transformed by RobustScaler
- customer_order_train_reduced.csv: training data transformed by RobustScaler and PCA
- [>100mb, not uploaded] customer_order_reduced.zip: csv file of order data after transformed by RobustScaler and PCA
- customer_group_Kmeans.csv: customer group # assuming 5 clusters

#### Charts
- customer_order_freq: histogram of # of products purchased by customer
- PCA_variance: % of variance vs. number of principal components
- Kmeans_cluster_scores: inertia, Sihouette and Calinksi-Harabasz scores by number of cluster
- Kmeans_customer_groupX: purchase pattern by customer group