CREATE PROCEDURE [dbo].[DeleteUser]
    @UserId INT
AS
    DELETE FROM UserProfiles WHERE UserId = @UserId