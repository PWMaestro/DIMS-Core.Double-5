CREATE PROCEDURE [dbo].[DeleteTask]
    @TaskId INT
AS
    DELETE FROM Tasks WHERE TaskId = @TaskId