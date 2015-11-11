USE gd_train_data
GO

IF EXISTS (
SELECT name
FROM sys.objects
WHERE name = 'count_terminal')
DROP PROCEDURE count_terminal
GO

CREATE PROCEDURE count_terminal
@terminal_id nvarchar(32),
@Line_name nvarchar(3)
AS
SELECT count(Terminal_id)
FROM gd_train
WHERE Terminal_id = @terminal_id and Line_name = @Line_name
GO

IF EXISTS (
SELECT name
FROM sys.objects
WHERE name = 'count_time')
DROP PROCEDURE count_time
GO

CREATE PROCEDURE count_time
@Deal_time nvarchar(10),
@Line_name nvarchar(3)
AS
SELECT count(Deal_time)
FROM gd_train
WHERE Deal_time = @Deal_time and Line_name = @Line_name
GO

EXEC count_terminal '0067946c92df6da5c5bf45d1386dc887','281'
GO

EXEC count_time '2014080100','281'
GO
