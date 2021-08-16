CREATE TABLE [dbo].[TaskTracks]
(
    [TaskTrackId] INT       NOT NULL IDENTITY(1, 1),
    [UserTaskId]  INT       NOT NULL,
    [TrackDate]   DATETIME2 NOT NULL,
    [TrackNote]   DATETIME2 NOT NULL,
    
    CONSTRAINT PK_TaskTracks_TaskTrackId PRIMARY KEY (TaskTrackId),
    CONSTRAINT FK_TaskTracks_UserTasks_UserTaskId FOREIGN KEY (UserTaskId) REFERENCES UserTasks (UserTaskId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
