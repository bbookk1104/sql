SELECT * FROM MEMBER_TBL;
SELECT * FROM NOTICE_TBL;
SELECT * FROM QNA_TBL;

SELECT * FROM PRODUCT_TBL;
SELECT * FROM CATEGORY_TBL;

SELECT * FROM CART_TBL;
SELECT * FROM ORDER_TBL;

insert into cart_tbl values(1, 50012, 'user01', 1);
insert into cart_tbl values(2, 50013, 'user01', 2);
insert into cart_tbl values(3, 50014, 'user01', 3);
insert into cart_tbl values(4, 50015, 'user01', 2);
insert into cart_tbl values(5, 50016, 'user01', 1);

select cart_no, product_img, product_name, product_price, order_qty
from cart_tbl join product_tbl using(product_no)
where member_id= 'user01';

update cart_tbl set order_qty=3 where cart_no=1;

delete order_tbl where order_no>9042 and order_no<9080;
delete order_tbl where order_no=9044;
delete order_tbl where order_no=9045;
delete order_tbl where order_no=9046;

commit;