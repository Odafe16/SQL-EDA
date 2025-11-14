# The aim of using mySQL on this dataset is to calculate the profit  by region, segment the customer
# then calculate profit from each category

SELECT * FROM super_store.`sample - superstore`;

SELECT Region, AVG(Sales)
FROM super_store.`sample - superstore`
GROUP BY Region ;

SELECT Region, AVG(Profit) as 'Profit by region'
FROM super_store.`sample - superstore`
GROUP BY Region ;


SELECT Segment, COUNT(`Customer ID`) as 'Customer Segmentation'
FROM super_store.`sample - superstore`
GROUP BY Segment ;

SELECT Segment, AVG(Profit) as 'Profit By Category'
FROM super_store.`sample - superstore`
GROUP BY Segment ;

