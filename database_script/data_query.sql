----获取数据-----
USE gd_train_data
GO

SELECT Deal_time,Terminal_id ,count(*) as item_sum
FROM gd_train 
WHERE Line_name = '281'
GROUP BY Terminal_id
ORDER BY Terminal_id ASC
GO