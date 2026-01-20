
-- 1.Retrieve the all records
select * from Zepto;

-- 2.Retrieve  the total potential revenue for the store
	select sum(discountedsellingprice * availablequantity) as Total_potential_revenue
      	from Zepto;


--3.Retrieve Which category has the highest number of out-of-stock items
	select distinct(category),outofstock,quantity 
		from Zepto
		where outofstock = 'true'
   		order by quantity desc
   		limit 1

 --4. Retreive Count how many unique products exist in each Category.Sort them from highest to lowest to show the store's variety.
	select Distinct(category),count(name) as Products
    	from Zepto
		group by name,category
		order by Products desc;

--5. Retreive the top 5 products with the highest Discount Percent. Do these products belong to a specific category?
	select distinct(name) as  Products, discountpercent as Discount 
		from Zepto
		order by Discount desc 
		limit 5;

--6.Categorize products into three price tiers based on mrp:'Budget' (MRP < 100)',Mid-Range' (100 <= MRP <= 2000),'Premium' (MRP > 2000);		
	select distinct(name) as Product,mrp as Price ,
		case
			when mrp < 100  then 'Budget'
			when mrp <= 1000 then 'Mid-Range' 
			when mrp  >= 2000 then 'Primium'
		else 'Premium'
		end as  MRP
		from  Zepto
		order by Price desc;


--7.Retrieve These are products with an mrp > 1500 and Available Quantity < 3.	
	select Distinct(name) as Product, availablequantity as Stock_in,mrp as Price
		from Zepto
		where mrp > 1100 
		and availablequantity <= 3
		order by Stock_in desc;

--8.Retrieve the average Discounted selling Price per gram (Price / WeightInGms) for the 'Fruits & Vegetables' category.		
	select  distinct(name) as Products,category, round(discountedsellingprice/weightingram,2) as price_per_gram from Zepto
		where category like  '%Fruit%'
		order by price_per_gram desc;
		
		




 