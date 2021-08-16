CREATE TABLE [dbo].[UserTasks]
(
    [UserTaskId] INT NOT NULL IDENTITY(1, 1),
    [TaskId]     INT NOT NULL,
    [UserId]     INT NOT NULL,
    [StateId]    INT NOT NULL,

    CONSTRAINT PK_UserTasks_UserTaskId   PRIMARY KEY (UserTaskId),
    CONSTRAINT FK_UserTasks_Tasks_TaskId FOREIGN KEY (TaskId) REFERENCES Tasks (TaskId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_UserTasks_UserProfiles_UserId FOREIGN KEY (UserId) REFERENCES UserProfiles (UserId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_UserTasks_TaskStates_StateId FOREIGN KEY (StateId) REFERENCES TaskStates (TaskStateId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
