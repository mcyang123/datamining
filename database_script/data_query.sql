----��ȡ����-----
USE gd_train_data
GO

SELECT Deal_time,count(*) as item_sum
FROM gd_train_1015 
WHERE Line_name = '��·15'
GROUP BY Deal_time
ORDER BY Deal_time ASC
GO