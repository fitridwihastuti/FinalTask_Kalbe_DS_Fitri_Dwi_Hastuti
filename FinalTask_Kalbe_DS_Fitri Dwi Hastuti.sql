# Berapa rata-rata umur customer jika dilihat dari marital statusnya ?

select `Marital Status` , round(avg(age),0) rata_rata_umur
from kalbe_customer
where `Marital Status` = 'Married' or `Marital Status` = 'Single'
group by `Marital Status` 

# Berapa rata-rata umur customer jika dilihat dari gender nya ?

select 
case
	when Gender = 1 then 'Pria'
	else 'Wanita'
end as jenis_kelamin
, round(avg(age),0) rata_rata_umur
from kalbe_customer
group by jenis_kelamin 

# Tentukan nama store dengan total quantity terbanyak!

select ks.StoreName, sum(kt.Qty) total_quantity
from kalbe_transaction kt
join kalbe_store ks
on kt.StoreID = ks.StoreID
group by ks.StoreName
order by total_quantity desc

# Tentukan nama produk terlaris dengan total amount terbanyak!

select kp.`Product Name` , sum(kt.TotalAmount) total_amount
from kalbe_transaction kt
join kalbe_product kp
on kt.ProductID  = kp.ProductID 
group by kp.`Product Name`
order by total_amount desc
