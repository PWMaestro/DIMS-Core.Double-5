CREATE VIEW [dbo].[vUsersProgress]
AS
SELECT UserTasks.UserId,
       UserTasks.TaskId,
       TaskTracks.TaskTrackId,
       (UserProfiles.FirstName + ' ' + UserProfiles.LastName) AS UserName,
       Tasks.Name AS TaskName,
       TaskTracks.TrackNote,
       TaskTracks.TrackDate
FROM [UserTasks]
     INNER JOIN [TaskTracks]   ON UserTasks.UserTaskId = TaskTracks.UserTaskId
     INNER JOIN [UserProfiles] ON     UserTasks.UserId = UserProfiles.UserId
     INNER JOIN [Tasks]        ON     UserTasks.TaskId = Tasks.TaskId