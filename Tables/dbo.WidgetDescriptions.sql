CREATE TABLE [dbo].[WidgetDescriptions]
(
[WidgetID] [int] NOT NULL IDENTITY(1, 1),
[ShortDescription] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WidgetName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Picture] [image] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WidgetDescriptions] ADD CONSTRAINT [PK_WidgetDescriptions] PRIMARY KEY CLUSTERED  ([WidgetID]) ON [PRIMARY]
GO
