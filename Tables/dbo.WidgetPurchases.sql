CREATE TABLE [dbo].[WidgetPurchases]
(
[PurchaseID] [int] NOT NULL IDENTITY(1, 1),
[WidgetPriceID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__WidgetPur__Quant__3A81B327] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NOT NULL CONSTRAINT [DF__WidgetPurc__Date__3B75D760] DEFAULT (getdate())
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_WidgetPurchases] ON [dbo].[WidgetPurchases] ([PurchaseID]) ON [PRIMARY]
GO
