/*Writting queries for performing various task*/

/*3. Query to display the no. of customer group by their genders who have placed any order 
of amount greater than or equal to Rs.3000. */

select cus_gender, count(*)
from orders
inner join customer
on orders.CUS_ID = customer.CUS_ID
where ORD_AMOUNT>=3000
group by customer.CUS_GENDER;

/*4.Query to display all the orders along with the product name ordered by a customer having 
Customer_Id=2*/

SELECT o.*, p.pro_name 
FROM `orders` o, product_details prod, product p 
WHERE o.cus_id = 2 
AND o.prod_id = prod.prod_id 
AND prod.pro_id = p.pro_id;
        
/*5.Query to display the Supplier details who can supply more than one product.*/

select s.* from supplier s, product_details p
 where s.supp_id =p. supp_id 
 having count(p.supp_id)>   1; 

 /*6.Query to Find the category of the product whose order amount is minimum. */

select * from Category where CAT_ID in
(select CAT_ID from Product where PRO_ID in
( select PRO_ID from product_details P inner join Orders O on O.PROD_ID=P.PROD_ID
 where O.ORD_AMOUNT=(select min(ORD_AMOUNT) from Orders)));

/*7.Query to display the Id and Name of the Product ordered after “2021-10-05”*/

select Product.PRO_ID, Product.PRO_NAME from Orders 
INNER JOIN product_details on product_details.PROD_ID = Orders.PROD_ID 
inner join Product on Product.PRO_ID= product_details.PRO_ID 
WHERE Orders.ORD_DATE > '2021-10-05';

/*8.Query to print the top 3 supplier name and id and their rating on the basis of their rating along 
with the customer name who has given the rating.*/

 select supplier.supp_id, supp_name, cus_name, rating.rat_ratstars
	from rating
		inner join supplier on supplier.supp_id = rating.supp_id
		inner join customer on customer.cus_id = rating.cus_id
	order by rating.rat_ratstars desc limit 3;
    
    /*9.Query to display customer name and gender whose names start or end with character 'A'*/
    
 select cus_name, cus_gender
	from `customer`
	where cus_name like 'A%' or cus_name like '%A';
   
   /*10.Query to display the total order amount of the male customers.*/
    
    select cus_gender, sum(ord_amount)
	from `orders` 
		inner join customer on `orders`.cus_id = customer.cus_id
	where cus_gender = 'M';
    
    /*11.Query to  Display all the Customers left outer join with the orders.*/

    select *
	from customer 
		left outer join `orders` on `orders`.cus_id = customer.cus_id;
    
    /*12.Query to create a stored procedure to display the Rating for a Supplier if any along with the 
Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average 
Supplier” else “Supplier should not be considered”*/

     DELIMITER //
CREATE PROCEDURE `supplierRatings` ()
BEGIN
select s.supp_id, s.supp_name, r.rat_ratstars,
case
when r.rat_ratstars > 4 then 'Genuine supplier'
when r.rat_ratstars > 2 then 'Average Supplier'
else 'Supplier should not be considered'
end as verdict from rating r inner join supplier s on s.supp_id = r.supp_id;
END //
DELIMITER ;

call supplierRatings();