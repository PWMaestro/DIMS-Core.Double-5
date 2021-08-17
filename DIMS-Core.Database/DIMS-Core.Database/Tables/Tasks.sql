CREATE TABLE [dbo].[Tasks]
(
    [TaskId]       INT            NOT NULL IDENTITY(1, 1),
    [Name]         NVARCHAR(200)  NOT NULL,
    [Description]  NVARCHAR(4000) NULL,
    [StartDate]    DATE           NOT NULL,
    [DeadlineDate] DATE           NOT NULL,

    CONSTRAINT PK_Tasks_TaskId PRIMARY KEY (TaskId)
)