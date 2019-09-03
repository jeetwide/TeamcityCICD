CREATE TABLE [dbo].[Widgets]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SKU] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Widgets] ADD CONSTRAINT [PK_Widgets] PRIMARY KEY NONCLUSTERED  ([RecordID]) ON [PRIMARY]
GO
DENY DELETE ON  [dbo].[Widgets] TO [public]
GO
DENY INSERT ON  [dbo].[Widgets] TO [public]
GO
DENY REFERENCES ON  [dbo].[Widgets] TO [public]
GO
GRANT SELECT ON  [dbo].[Widgets] TO [public]
GO
DENY UPDATE ON  [dbo].[Widgets] TO [public]
GO
