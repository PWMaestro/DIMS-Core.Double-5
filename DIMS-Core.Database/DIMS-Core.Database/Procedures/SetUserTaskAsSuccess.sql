CREATE PROCEDURE [dbo].[SetUserTaskAsSuccess]
    @UserId INT,
    @TaskId INT
AS
    UPDATE UserTasks
    SET StateId = 2
    WHERE UserId = @UserId AND TaskId = @TaskId