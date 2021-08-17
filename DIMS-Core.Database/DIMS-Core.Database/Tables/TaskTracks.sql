CREATE TABLE [dbo].[TaskTracks]
(
    [TaskTrackId] INT       NOT NULL IDENTITY(1, 1),
    [UserTaskId]  INT       NOT NULL,
    [TrackDate]   DATE      NOT NULL,
    [TrackNote]   DATE      NOT NULL,
    
    CONSTRAINT PK_TaskTracks_TaskTrackId PRIMARY KEY (TaskTrackId),
    CONSTRAINT FK_TaskTracks_UserTasks_UserTaskId FOREIGN KEY (UserTaskId) REFERENCES UserTasks (UserTaskId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
