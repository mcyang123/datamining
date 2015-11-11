DROP PROCEDURE INS_train
GO
CREATE PROCEDURE INS_train
@Use_city nvarchar(2),
@Line_name nvarchar(3),
@Terminal_id nvarchar(32),
@Card_id nvarchar(32),
@Create_city nvarchar(2),
@Deal_time nvarchar(10),
@Card_type nvarchar(3)
AS
INSERT INTO gd_train(Use_city,Line_name,Terminal_id,Card_id,Create_city,Deal_time,Card_type)
VALUES(@Use_city,@Line_name,@Terminal_id,@Card_id,@Create_city,@Deal_time,@Card_type)
GO

EXEC INS_train '广州','281','46be366b59b7c7504ee1707918f2a225','a333e777ca431098206663e192f4ce24','广州','2014082120','普通卡'

USE gd_train_data
GO
SELECT *
FROM gd_train

TRUNCATE TABLE gd_train
GO