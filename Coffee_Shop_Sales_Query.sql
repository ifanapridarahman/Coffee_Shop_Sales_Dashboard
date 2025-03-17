-- Membuat Database
CREATE DATABASE coffee_shop_sales
-- Memanggil Database
SELECT * FROM coffee_shop_sales
-- Data Cleaning
DESCRIBE coffee_shop_sales

SET SQL_SAFE_UPDATES = 0;

-- Mengubah type data Transaction_date dari text ke date
UPDATE coffee_shop_sales 
SET transaction_date = STR_TO_DATE(transaction_date, '%d/%m/%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

-- Mengubah type data Transaction_time dari text ke date
UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

DESCRIBE coffee_shop_sales

-- KPI's Requirement
-- 1. Analisis Total Penjualan
-- 1.1 Menghitung total penjualan untuk setiap bulan
SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM
    coffee_shop_sales
WHERE
    MONTH(transaction_date) = 5 -- May Month

-- 1.2 Menentukan peningkatan atau penurunan penjualan dari bulan ke bulan
-- Selected Month/ CM-May=5
-- PM - April = 4
SELECT
	MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)
    OVER(ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1)
    OVER(ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) -- for month of April and May
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date);
    
-- 2. Analisis Total Pesanan
-- 2.1 Menghitung total jumlah pesanan untuk setiap bulan
SELECT 
	COUNT(transaction_id) AS Total_Order
FROM 
	coffee_shop_sales
WHERE 
	MONTH(transaction_date)=5 -- CM May

-- 2.2 Menentukan peningkatan atau penurunan jumlah pesanan dari bulan ke bulan
SELECT
	MONTH(transaction_date) AS Month,
    ROUND(COUNT(transaction_id)) AS Total_Orders,
    (COUNT(transaction_id) - LAG(COUNT(transaction_id),1) 
    OVER(ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id),1)
    OVER(ORDER BY MONTH(transaction_date)) * 100 AS MoM_increase_percentage
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) -- for April and May
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date);

-- 3. Analisis Total Kuantitas Terjual
-- 3.1 Menghitung total kuantitas produk yang terjual untuk setiap bulan
SELECT 
	ROUND(SUM(transaction_qty)) AS Total_Quantity
FROM 
	coffee_shop_sales
WHERE 
	MONTH(transaction_date)=5

-- 3.2 Menentukan peningkatan atau penurunan total kuantitas yang terjual dari bulan ke bulan
SELECT 
    MONTH(transaction_date) AS Month,
    ROUND(SUM(transaction_qty)) AS Total_Quantity_Sold,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5)   -- April & May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);

-- 4.1 Tabel Kalender – Penjualan, Kuantitas dan Total Pesanan Harian
SELECT
	SUM(unit_price * transaction_qty) AS Total_Sales,
    SUM(transaction_qty) AS Total_Kuantitas_Sold,
    COUNT(transaction_id) AS Total_Pesanan_Harian
FROM
	coffee_shop_sales
WHERE
	transaction_date = '2023-05-18'; -- 18 Mei 2023

-- ROUNDED Values
SELECT 
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1),'K') AS Total_Sales,
    CONCAT(ROUND(COUNT(transaction_id) / 1000, 1),'K') AS Total_Pesanan,
    CONCAT(ROUND(SUM(transaction_qty) / 1000, 1),'K') AS Total_Kuantitas_Sold
FROM 
    coffee_shop_sales
WHERE 
    transaction_date = '2023-05-18'; -- For 18 May 2023

-- 4.2	Rata-rata Total Penjualan harian di Setiap Bulan
SELECT AVG(Total_Sales) AS Average_Sales
FROM (
	SELECT
		SUM(unit_price * transaction_qty) AS Total_Sales
	FROM
		coffee_shop_sales
	WHERE
		MONTH(transaction_date) = 5 -- Bulan Mei
	GROUP BY
		transaction_date
) AS internal_query;

-- 4.3 Penjualan harian untuk bulan yang dipilih
SELECT
	DAY(transaction_date) AS day_of_month,
    ROUND(SUM(unit_price * transaction_qty),1) AS total_sales
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5 -- Bulan Mei
GROUP BY
	DAY(transaction_date)
ORDER BY
	DAY(transaction_date);
    
-- 4.3.1 MEMBANDINGKAN PENJUALAN HARIAN DENGAN RATA-RATA PENJUALAN 
-- JIKA LEBIH BESAR MAKA "DI ATAS RATA-RATA" DAN JIKA LEBIH KECIL MAKA "DI BAWAH RATA-RATA"
SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;

-- 4.4 Penjualan Berdasarkan Weekday/Weekend
SELECT
	CASE
		WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekends'
        ELSE 'Weekdays'
	END AS day_type,
    ROUND(SUM(unit_price * transaction_qty),2) AS total_sales
    FROM
		coffee_shop_sales
	WHERE
		MONTH(transaction_date)=5 -- Bulan Mei
	GROUP BY
		CASE
			WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekends'
            ELSE 'Weekdays'
		END;

-- 4.5 Penjualan Berdasarkan Store Location
SELECT
	store_location,
    SUM(unit_price * transaction_qty) AS Total_Sales
FROM coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5 -- Bulan Mei
GROUP BY store_location
ORDER BY SUM(unit_price * transaction_qty) DESC

-- 4.6 Penjualan Berdasarkan Kategori Produk
SELECT
	product_category,
    ROUND(SUM(unit_price*transaction_qty),1) AS Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY product_category
ORDER BY SUM(unit_price * transaction_qty) DESC

-- 4.7 Penjualan Berdasarkan Produk (Top 10)
SELECT 
	product_type,
    ROUND(SUM(unit_price*transaction_qty),1) AS Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY product_type
ORDER BY SUM(unit_price*transaction_qty) DESC
LIMIT 10

-- 4.8 Penjualan Berdasarkan Hari|Jam
SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    SUM(transaction_qty) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM 
    coffee_shop_sales
WHERE 
    DAYOFWEEK(transaction_date) = 3 -- Filter Selasa
    AND HOUR(transaction_time) = 8 -- Filter jam nomor 8
    AND MONTH(transaction_date) = 5; -- Filter Bulan Mei
    
-- 4.8.1 Data Penjualan dari Senin sampai Minggu dari Bulan yang dipilih (Mei)
SELECT
	CASE
		WHEN DAYOFWEEK(transaction_date)=2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date)=3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date)=4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date)=5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date)=6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date)=7 THEN 'Saturday'
		ELSE 'Sunday'
	END AS Day_of_Week,
    ROUND(SUM(unit_price*transaction_qty)) AS Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date)=5 -- Bulan Mei
GROUP BY
	CASE
		WHEN DAYOFWEEK(transaction_date)=2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date)=3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date)=4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date)=5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date)=6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date)=7 THEN 'Saturday'
		ELSE 'Sunday'
	END;
	
-- 4.8.2 Data Penjualan untuk Semua Jam dari Bulan yang dipilih (Mei)
SELECT
	HOUR(transaction_time) AS Hour_of_Day,
    ROUND(SUM(unit_price*transaction_qty)) AS Total_Sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY
	HOUR(transaction_time)
ORDER BY
	HOUR(transaction_time);