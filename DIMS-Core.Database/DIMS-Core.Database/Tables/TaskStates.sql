CREATE TABLE [dbo].[TaskStates]
(
    [TaskStateId] INT           NOT NULL IDENTITY(1, 1),
    [StateName]   NVARCHAR(200) NOT NULL,

    CONSTRAINT PK_TaskStates_TaskStateId PRIMARY KEY (TaskStateId)
)
