load data
into table sales
truncate
fields terminated by "," optionally enclosed by '"' trailing nullcols 
(
Row_ID,	   
Order_ID,   
Order_Date  date "mm/dd/yyyy",  		
Ship_Date   date "mm/dd/yyyy",   	 	
Ship_Mode,   	
Customer_ID,	
Customer_Name,	
Segments,	        
Country,	        
City,	        
States,	        
Postal_Code,	
Region,	        
Product_ID,	
Category,
Sub_Category,	
Product_Name,	
Sales,		
Quantity,	
Discount,	
Profit          
)