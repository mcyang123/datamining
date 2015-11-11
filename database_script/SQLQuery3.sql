DROP PROCEDURE INS_weather
GO
CREATE PROCEDURE INS_weather
@Data_time varchar(10),
@weather varchar(10),
@Temperature varchar(10),
@Wind varchar(10)
AS
INSERT INTO gd_weather(Data_time,weather,Temperature,Wind)
VALUES(@Data_time,@weather,@Temperature,@Wind)
GO

SELECT count(*)
FROM gd_train
WHERE Deal_time between 2014102200 and 2014102300