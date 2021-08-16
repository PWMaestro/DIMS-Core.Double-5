CREATE PROCEDURE [dbo].[SetUserTaskAsFail]
    @UserId INT,
    @TaskId INT
AS
    UPDATE UserTasks
    SET StateId = 3
    WHERE UserId = @UserId AND TaskId = @TaskId