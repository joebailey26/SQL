/* 1. Maximum Salary, Minimum Salary, Average Salary, No of Employees 
ROUNDING TO 3 DECIMAL POINTS*/
SELECT MAX(monthly_sal) "Maximum Salary", MIN(monthly_sal) "Minimum Salary", ROUND(AVG(monthly_sal),3) "Average Salary", COUNT(ename) "No of Employees" FROM MYSPORTS.EMP;

/* 2. Display the total qty sold for product no 100870 (qty is in the item table)*/
SELECT SUM(qty) FROM MYSPORTS.ITEM WHERE prodid = 100870;

/* 3. Display the qty of each product sold.*/
SELECT i.prodid, SUM(i.qty) "Quantity Sold" FROM MYSPORTS.ITEM i GROUP BY i.prodid;

/* 4. Display the total value (cost) of each order up to and including order 
id 605 (the total of qty * actualprice for each item in an order)*/
SELECT i.ordid, sum(i.qty * i.actualprice) "Order Value" FROM MYSPORTS.ITEM i WHERE i.ordid <= 605 GROUP BY i.ordid;

/* 5.Extend the last query to include the number of items per 
order and the average quantity of items within each order.*/
SELECT i.ordid, sum(i.qty * i.actualprice) "Order Value (COST)", COUNT(i.qty) "No of items", AVG(i.qty) "Average Qty" FROM MYSPORTS.ITEM i WHERE i.ordid <= 605 GROUP BY i.ordid;

/* 6.Display the total quantity of each product ordered as shown below:*/
SELECT p.prodid, p.descrip, SUM(i.qty) FROM MYSPORTS.PRODUCT p INNER JOIN MYSPORTS.ITEM i ON p.prodid = i.prodid GROUP BY p.prodid, p.descrip;


/*7. Display the same details by only for those orders placed since February 2005. (order date is recorded in the ord table)*/
SELECT p.prodid, p.descrip, SUM(i.qty) FROM MYSPORTS.PRODUCT p INNER JOIN MYSPORTS.ITEM i ON p.prodid = i.prodid INNER JOIN MYSPORTS.ORD o ON o.ordid = i.ordid WHERE o.orderdate > '01-FEB-05' GROUP BY p.prodid, p.descrip;

/*8. Display the average and total number of ordered items and value of those orders since the beginning of February 2005 for each customer.*/
SELECT COUNT(o.ordid), c.name, o.orderdate, sum(i.qty * i.actualprice) "Order Value" FROM MYSPORTS.ORD o INNER JOIN MYSPORTS.CUSTOMER c ON c.custid = o.custid INNER JOIN MYSPORTS.ITEM i ON i.ordid = o.ordid WHERE o.orderdate > '01-FEB-05' GROUP BY c.name, o.orderdate;

/*9.Display the same details as above but only for those 
customers who have placed five or more orders since beginning of February 2005.*/
SELECT COUNT(o.ordid) "No of Orders", c.name, o.orderdate, sum(i.qty * i.actualprice) "Order Value" FROM MYSPORTS.ORD o INNER JOIN MYSPORTS.CUSTOMER c ON c.custid = o.custid INNER JOIN MYSPORTS.ITEM i ON i.ordid = o.ordid WHERE o.orderdate >= '01-FEB-05' GROUP BY c.name, o.orderdate HAVING COUNT(o.ordid) >= 5;

/*10 Display the same details plus credit limit for those customers who have placed five or less orders since beginning of February 2005. */
SELECT COUNT(o.ordid) "No of Orders", c.name, c.creditlimit, o.orderdate, sum(i.qty * i.actualprice) "Order Value" FROM MYSPORTS.ORD o INNER JOIN MYSPORTS.CUSTOMER c ON c.custid = o.custid INNER JOIN MYSPORTS.ITEM i ON i.ordid = o.ordid WHERE o.orderdate >= '01-FEB-05' GROUP BY c.name, o.orderdate, c.creditlimit HAVING COUNT(o.ordid) <= 5;

/*11.Display the total and average value of orders accepted since February 2005 by each sales representative who has accepted at least 3 orders and has an order value (all orders since Feb 2005) of at least £1000.*/
SELECT sum(i.qty * i.actualprice) "Order Value (Cost)", e.ename, d.dname, COUNT(o.ordid) "No of Orders" FROM MYSPORTS.ITEM i INNER JOIN MYSPORTS.ORD o ON i.ordid = o.ordid INNER JOIN MYSPORTS.CUSTOMER c ON o.custid = c.custid INNER JOIN MYSPORTS.EMP e ON e.empno = c.repid INNER JOIN MYSPORTS.DEPT d ON d.deptno = e.deptno WHERE o.orderdate > '01-FEB-05' GROUP BY e.ename, d.dname HAVING COUNT(o.ordid) > 3 AND sum(i.qty * i.actualprice) >= 1000;

/*12.Display details of number and total value of orders of each product  accepted (ever) by each sales representative who has accepted more than two orders. The output should be displayed in order by  sales representative name and product id and include the hiredate of the employee.*/
SELECT e.ename, e.hiredate, p.descrip,  COUNT(o.ordid) "No of Orders", sum(i.qty * i.actualprice) "Order Value (Cost)"  
FROM MYSPORTS.ITEM i
INNER JOIN MYSPORTS.PRODUCT p ON i.prodid = p.prodid
INNER JOIN MYSPORTS.ORD o ON i.ordid = o.ordid 
INNER JOIN MYSPORTS.CUSTOMER c ON o.custid = c.custid 
INNER JOIN MYSPORTS.EMP e ON e.empno = c.repid 
INNER JOIN MYSPORTS.DEPT d ON d.deptno = e.deptno
GROUP BY e.ename, e.hiredate, p.descrip
HAVING COUNT(o.ordid) > 2
ORDER BY e.ename;
