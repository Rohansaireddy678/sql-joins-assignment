} create table customers (
	customer_id int primary key,
  	customer_name varchar(50),
  	city varchar(50)
);
create table orders (
	order_id int primary key,
    	customer_id varchar(50),
 	   order_date date,
  	  amount int
);
create table payments (
	payment_id varchar(50) primary key,
  	customer_id int,
  	payment_date date,
  	amount int
);
create table employees (
	employee_id int primary key,
  	employee_name varchar(50),
  	manager_id int
);
insert into customers (customer_id,customer_name,city)
values   (1,'john smith', 'new york'),
	  (2,'mary johnson', 'chicago'),
     	   (3,'peter adams', 'los angeles'),
        (4,'nancy miller', 'houston'),
        (5,'robert white', 'miami');        

insert into orders (order_id,customer_id,order_date,amount)
values (101,1,'2024-10-01',250),
	(102,2,'2024-10-05',300),
        (103,1,'2024-10-07',150),
        (104,3,'2024-10-10',450),
        (105,6,'2024-10-12',400);
        
insert into payments (payment_id,customer_id,payment_date,amount)
values ('P001', 1 ,'2024-10-02', 250),
	('P002', 2 ,'2024-10-06', 300),
        ('P003', 3 ,'2024-10-11', 450),
        ('P004', 4 ,'2024-10-15', 200);
        
 insert into employees (employee_id,employee_name,manager_id)
 values (1,'alex green', null),
 	(2,'brian lee', 1),
        (3,'carol ray', 1),
        (4,'david kim', 2),
        (5,'eva smith', 2);

  -- Q 1} 	select customers.customer_id,customers.customer_name, count(orders.order_id)
from customers inner join orders
on customers.customer_id = orders.customer_id
where orders.order_id > 1
group by orders.order_id;

-- Q 2}  select customers.customer_id, customers.customer_name ,orders.customer_id
from customers left join orders
on customers.customer_id = orders.customer_id;

-- Q 3}  select customers.customer_id, customers.customer_name ,orders.customer_id
from customers right join orders
on customers.customer_id = orders.customer_id;

-- Q 4}  select customers.customer_id, customers.customer_name ,orders.order_id, orders.customer_id
from customers left join orders
on customers.customer_id = orders.customer_id;

-- Q 5} select customers.customer_id, customers.customer_name ,orders.order_id, orders.customer_id
from customers left join orders
on customers.customer_id = orders.customer_id
where order_id is null;

-- Q 6} select customers.customer_name, payments.payment_id,customers.customer_id
from customers join payments 
on customers.customer_id = payments.customer_id
left join orders on customers.customer_id = orders.customer_id
where  orders.customer_id is null;



-- Q 7} select customers.customer_name, orders.order_id,customers.customer_id
from customers cross join orders;

-- Q 8}  select customers.customer_name, orders.order_id, payments.amount, payments.customer_id
from customers left join orders
on customers.customer_id = orders.customer_id
left join payments on customers.customer_id = payments.customer_id;

-- Q 9} select customers.customer_name, orders.order_id,  payments.payment_id
from customers inner join orders
on customers.customer_id = orders.customer_id
inner join payments on customers.customer_id = payments.customer_id;
