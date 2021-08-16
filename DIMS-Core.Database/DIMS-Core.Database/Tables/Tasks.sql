CREATE TABLE [dbo].[Tasks]
(
    [TaskId]       INT         NOT NULL IDENTITY(1, 1),
    [Name]         NCHAR(200)  NOT NULL,
    [Description]  NCHAR(4000) NULL,
    [StartDate]    DATETIME2   NOT NULL,
    [DeadlineDate] DATETIME2   NOT NULL,

    CONSTRAINT PK_Tasks_TaskId PRIMARY KEY (TaskId)
)