CREATE VIEW [dbo].[vUserTasks]
AS
SELECT UserTasks.UserId,
       UserTasks.TaskId,
       Tasks.Name AS TaskName,
       Tasks.Description,
       Tasks.StartDate,
       Tasks.DeadlineDate,
       TaskStates.StateName
FROM [UserTasks]
     INNER JOIN [Tasks]      ON  UserTasks.TaskId = Tasks.TaskId
     INNER JOIN [TaskStates] ON UserTasks.StateId = TaskStates.TaskStateId 