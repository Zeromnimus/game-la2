/****** Object:  Table [dbo].[user_warehouse]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_warehouse]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_warehouse](
	[item_id] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [tinyint] NOT NULL,
	[ident] [tinyint] NOT NULL,
	[wished] [tinyint] NULL,
	[warehouse] [int] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_user_warehouse_charid]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_warehouse]') AND name = N'idx_user_warehouse_charid')
CREATE NONCLUSTERED INDEX [idx_user_warehouse_charid] ON [dbo].[user_warehouse] 
(
	[char_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_user_warehouse_itemid]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_warehouse]') AND name = N'idx_user_warehouse_itemid')
CREATE UNIQUE NONCLUSTERED INDEX [idx_user_warehouse_itemid] ON [dbo].[user_warehouse] 
(
	[item_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_user_warehouse_itemtype]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_warehouse]') AND name = N'idx_user_warehouse_itemtype')
CREATE NONCLUSTERED INDEX [idx_user_warehouse_itemtype] ON [dbo].[user_warehouse] 
(
	[item_type] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pledge]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Pledge]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Pledge](
	[pledge_id] [int] IDENTITY(1,1) NOT NULL,
	[ruler_id] [int] NOT NULL,
	[name] [nvarchar](24) NOT NULL,
	[alliance_id] [int] NOT NULL CONSTRAINT [DF_Pledge_alliance_id]  DEFAULT ((0)),
	[challenge_time] [int] NOT NULL CONSTRAINT [DF_Pledge_challenge_time]  DEFAULT ((0)),
	[root_name_value] [int] NOT NULL CONSTRAINT [DF_Pledge_name_value]  DEFAULT ((0)),
	[now_war_id] [int] NOT NULL CONSTRAINT [DF_Pledge_now_war_id]  DEFAULT ((0)),
	[oust_time] [int] NOT NULL CONSTRAINT [DF_Pledge_oust_time]  DEFAULT ((0)),
	[skill_level] [smallint] NOT NULL CONSTRAINT [DF_Pledge_skill_level]  DEFAULT ((0)),
	[castle_id] [int] NOT NULL CONSTRAINT [DF_Pledge_castle_id]  DEFAULT ((0)),
	[agit_id] [int] NOT NULL CONSTRAINT [DF_Pledge_agit_id]  DEFAULT ((0)),
	[rank] [int] NOT NULL CONSTRAINT [DF_Pledge_rank]  DEFAULT ((0)),
	[name_value] [int] NOT NULL CONSTRAINT [DF_Pledge_name_value_1]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [DF_Pledge_status]  DEFAULT ((0)),
	[private_flag] [int] NOT NULL CONSTRAINT [DF_Pledge_private_flag]  DEFAULT ((0)),
	[crest_id] [int] NOT NULL CONSTRAINT [DF_Pledge_crest_id]  DEFAULT ((0)),
	[is_guilty] [int] NOT NULL CONSTRAINT [DF_Pledge_is_guilty]  DEFAULT ((0)),
	[dismiss_reserved_time] [int] NOT NULL CONSTRAINT [DF_Pledge_dismiss_reserved_time]  DEFAULT ((0)),
	[alliance_withdraw_time] [int] NOT NULL CONSTRAINT [DF__pledge__alliance__29820FAE]  DEFAULT ((0)),
	[alliance_dismiss_time] [int] NOT NULL CONSTRAINT [DF__pledge__alliance__2A7633E7]  DEFAULT ((0)),
	[alliance_ousted_time] [int] NOT NULL CONSTRAINT [DF__pledge__alliance__288DEB75]  DEFAULT ((0)),
	[siege_kill] [int] NOT NULL CONSTRAINT [DF__Pledge__siege_ki__3203126D]  DEFAULT ((0)),
	[siege_death] [int] NOT NULL CONSTRAINT [DF__Pledge__siege_de__32F736A6]  DEFAULT ((0)),
	[emblem_id] [int] NOT NULL CONSTRAINT [DF__Pledge__emblem_i__33EB5ADF]  DEFAULT ((0)),
	[flag_time] [datetime] NULL,
	[score] [int] NOT NULL DEFAULT ((0)),
	[hasAcademy] [tinyint] NOT NULL DEFAULT ((0)),
	[hasGuard1] [tinyint] NOT NULL DEFAULT ((0)),
	[hasGuard2] [tinyint] NOT NULL DEFAULT ((0)),
	[hasKnight1] [tinyint] NOT NULL DEFAULT ((0)),
	[hasKnight2] [tinyint] NOT NULL DEFAULT ((0)),
	[hasKnight3] [tinyint] NOT NULL DEFAULT ((0)),
	[hasKnight4] [tinyint] NOT NULL DEFAULT ((0)),
	[AcademyName] [nvarchar](24) NULL,
	[Guard1Name] [nvarchar](24) NULL,
	[Guard2Name] [nvarchar](24) NULL,
	[Knight1Name] [nvarchar](24) NULL,
	[Knight2Name] [nvarchar](24) NULL,
	[Knight3Name] [nvarchar](24) NULL,
	[Knight4Name] [nvarchar](24) NULL,
	[AcademyRuler_id] [int] NOT NULL DEFAULT ((0)),
	[Guard1Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[Guard2Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[Knight1Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[Knight2Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[Knight3Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[Knight4Ruler_id] [int] NOT NULL DEFAULT ((0)),
	[AcademyPowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[MainClanPowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[GuardPowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[KinghtPowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[Group1PowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[Group2PowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[Group3PowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[Group4PowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[Group5PowerFlag] [binary](32) NOT NULL DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
 CONSTRAINT [PK_Pledge] PRIMARY KEY CLUSTERED 
(
	[pledge_id] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_Pledge] UNIQUE NONCLUSTERED 
(
	[name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[war_declare]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[war_declare]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[war_declare](
	[challenger] [int] NOT NULL,
	[challengee] [int] NOT NULL,
	[declare_time] [int] NOT NULL,
 CONSTRAINT [PK_war_declare] PRIMARY KEY CLUSTERED 
(
	[challenger] ASC,
	[challengee] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Pledge_Crest]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Pledge_Crest]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Pledge_Crest](
	[crest_id] [int] IDENTITY(1,1) NOT NULL,
	[bitmap_size] [smallint] NOT NULL CONSTRAINT [DF_Pledge_Crest_bitmap_size]  DEFAULT ((0)),
	[bitmap] [varbinary](3072) NULL,
 CONSTRAINT [PK_Pledge_Crest] PRIMARY KEY CLUSTERED 
(
	[crest_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QuestData]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QuestData]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[QuestData](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[data] [nvarchar](50) NOT NULL,
	[logdate] [smalldatetime] NOT NULL CONSTRAINT [DF_QuestData_logdate]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SkillData]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SkillData]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SkillData](
	[id] [int] NOT NULL,
	[lev] [smallint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[logdate] [smalldatetime] NOT NULL CONSTRAINT [DF_SkillData_logdate]  DEFAULT (getdate()),
	[skill_desc] [nvarchar](255) NULL,
	[bIsMagic] [tinyint] NULL,
	[activate_type] [nvarchar](5) NULL,
 CONSTRAINT [PK_SkillData] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[lev] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_name]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SkillData]') AND name = N'IX_name')
CREATE NONCLUSTERED INDEX [IX_name] ON [dbo].[SkillData] 
(
	[name] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_CheckPreviousAllianceWarHistory]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CheckPreviousAllianceWarHistory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_CheckPreviousAllianceWarHistory
	
INPUT	
	@challenger_alliance_id		int
	@challengee_alliance_id		int

OUTPUT

made by
	bert
date
	2003-11-04
********************************************/

create PROCEDURE [dbo].[lin_CheckPreviousAllianceWarHistory]
(
	@challenger		int,
	@challengee		int
)
AS
SET NOCOUNT ON

SELECT 
	id, challenger, challengee, status, begin_time 
FROM 
	alliance_war (nolock)  
WHERE 
	(challenger = @challenger AND challengee = @challengee) 
	OR (challengee = @challengee AND challenger = @challenger) 
ORDER BY 
	begin_time DESC


' 
END
GO
/****** Object:  Table [dbo].[TEST]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TEST]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TEST](
	[??] [int] NOT NULL,
	[char_id] [int] NULL,
	[char_name] [nvarchar](50) NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[lev] [tinyint] NULL,
	[class] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CheckPreviousWarHistory]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CheckPreviousWarHistory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CheckPreviousWarHistory    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_CheckPreviousWarHistory
	
INPUT	
	@residence_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_CheckPreviousWarHistory]
(
	@challenger1		int,
	@challengee1		int,
	@challengee2		int,
	@challenger2		int
)
AS
SET NOCOUNT ON

SELECT 
	id, challenger, challengee, status, begin_time 
FROM 
	pledge_war (nolock)  
WHERE 
	(challenger = @challenger1 AND challengee = @challengee1) 
	OR (challengee = @challengee2 AND challenger = @challenger2) 
ORDER BY 
	begin_time DESC





' 
END
GO
/****** Object:  Table [dbo].[account_ch2]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[account_ch2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[account_ch2](
	[account] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[agit]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[agit]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[agit](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pledge_id] [int] NULL CONSTRAINT [DF__agit__pledge_id__17236851]  DEFAULT ((0)),
	[auction_price] [int] NULL CONSTRAINT [DF__agit__auction_pr__18178C8A]  DEFAULT ((0)),
	[auction_date] [int] NULL CONSTRAINT [DF__agit__auction_da__190BB0C3]  DEFAULT ((0)),
	[hp_stove] [tinyint] NULL CONSTRAINT [DF__agit__hp_stove__1F6E958F]  DEFAULT ((0)),
	[mp_flame] [tinyint] NULL CONSTRAINT [DF__agit__mp_flame__2062B9C8]  DEFAULT ((0)),
	[hatcher] [tinyint] NULL CONSTRAINT [DF__agit__hatcher__2156DE01]  DEFAULT ((0)),
	[hp_stove_expire] [int] NULL CONSTRAINT [DF__agit__hp_stove_e__224B023A]  DEFAULT ((0)),
	[mp_flame_expire] [int] NULL CONSTRAINT [DF__agit__mp_flame_e__233F2673]  DEFAULT ((0)),
	[status] [tinyint] NULL CONSTRAINT [DF__agit__status__270FB757]  DEFAULT ((2)),
	[next_war_time] [int] NULL CONSTRAINT [DF__agit__next_war_t__2803DB90]  DEFAULT ((0)),
	[auction_id] [int] NULL,
	[last_price] [int] NULL,
	[last_cancel] [int] NULL,
	[teleport_level] [int] NULL CONSTRAINT [DF__agit__teleport_l__442BE449]  DEFAULT ((0)),
	[teleport_expire] [int] NULL CONSTRAINT [DF__agit__teleport_e__45200882]  DEFAULT ((0)),
	[next_cost] [int] NULL,
	[cost_fail] [int] NULL,
	[tax_rate] [int] NOT NULL CONSTRAINT [DF_agit_tax_rate]  DEFAULT ((0)),
	[shop_income] [int] NOT NULL CONSTRAINT [DF_agit_shop_income]  DEFAULT ((0)),
	[tax_rate_to_change] [smallint] NOT NULL CONSTRAINT [DF__agit__tax_rate_t__426DB909]  DEFAULT ((-1)),
	[tax_child_rate] [smallint] NOT NULL CONSTRAINT [DF__agit__tax_child___4361DD42]  DEFAULT ((0)),
	[tax_child_rate_to_change] [smallint] NOT NULL CONSTRAINT [DF__agit__tax_child___4456017B]  DEFAULT ((-1)),
	[shop_income_temp] [int] NOT NULL CONSTRAINT [DF__agit__shop_incom__454A25B4]  DEFAULT ((0)),
	[team_battle_status] [int] NULL,
 CONSTRAINT [PK_agit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[agit_adena]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[agit_adena]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[agit_adena](
	[agit_id] [int] NULL,
	[pledge_id] [int] NULL,
	[auction_id] [int] NULL,
	[reason] [int] NULL,
	[adena] [int] NULL,
	[log_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_agit_adena]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[agit_adena]') AND name = N'IX_agit_adena')
CREATE NONCLUSTERED INDEX [IX_agit_adena] ON [dbo].[agit_adena] 
(
	[pledge_id] ASC,
	[auction_id] ASC,
	[reason] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agit_auction]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[agit_auction]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[agit_auction](
	[agit_id] [int] NULL,
	[auction_id] [int] IDENTITY(1,1) NOT NULL,
	[auction_desc] [nvarchar](200) NULL,
	[min_price] [int] NULL,
	[accepted_bid] [int] NULL,
	[auction_time] [int] NULL,
	[auction_tax] [int] NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_agit_auction_1]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[agit_auction]') AND name = N'IX_agit_auction_1')
CREATE NONCLUSTERED INDEX [IX_agit_auction_1] ON [dbo].[agit_auction] 
(
	[agit_id] ASC,
	[auction_time] DESC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_agit_auction_2]    Script Date: 02/08/2011 16:50:22 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[agit_auction]') AND name = N'IX_agit_auction_2')
CREATE NONCLUSTERED INDEX [IX_agit_auction_2] ON [dbo].[agit_auction] 
(
	[auction_id] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agit_deco]    Script Date: 02/08/2011 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[agit_deco]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[agit_deco](
	[agit_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[id] [int] NOT NULL,
	[name] [varchar](256) NULL,
	[level] [int] NULL,
	[expire] [int] NULL,
 CONSTRAINT [PK_agit_deco] PRIMARY KEY CLUSTERED 
(
	[agit_id] ASC,
	[type] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[agit_bid]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[agit_bid]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[agit_bid](
	[auction_id] [int] NULL,
	[attend_id] [int] IDENTITY(1,1) NOT NULL,
	[attend_price] [int] NULL,
	[attend_pledge_id] [int] NULL,
	[attend_date] [datetime] NULL CONSTRAINT [DF_agit_bid_attend_date]  DEFAULT (getdate()),
	[attend_time] [int] NULL,
 CONSTRAINT [IX_agit_bid] UNIQUE NONCLUSTERED 
(
	[auction_id] ASC,
	[attend_pledge_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_agit_auction]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[agit_bid]') AND name = N'IX_agit_auction')
CREATE NONCLUSTERED INDEX [IX_agit_auction] ON [dbo].[agit_bid] 
(
	[auction_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_agit_price]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[agit_bid]') AND name = N'IX_agit_price')
CREATE NONCLUSTERED INDEX [IX_agit_price] ON [dbo].[agit_bid] 
(
	[attend_price] DESC,
	[attend_date] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookmark]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[bookmark]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[bookmark](
	[char_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[world] [int] NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[z] [int] NULL,
	[bookmarkid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [ix_bookmark]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[bookmark]') AND name = N'ix_bookmark')
CREATE NONCLUSTERED INDEX [ix_bookmark] ON [dbo].[bookmark] 
(
	[char_id] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[builder_account]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[builder_account]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[builder_account](
	[account_name] [nvarchar](50) NOT NULL,
	[default_builder] [int] NOT NULL CONSTRAINT [DF_account_builder_default_builder]  DEFAULT ((0)),
	[account_id] [int] NOT NULL CONSTRAINT [DF_builder_account_account_id]  DEFAULT ((0)),
 CONSTRAINT [PK_account_builder] PRIMARY KEY CLUSTERED 
(
	[account_name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[castle]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[castle]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[castle](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pledge_id] [int] NOT NULL CONSTRAINT [DF__castle__pledge_i__1352D76D]  DEFAULT ((0)),
	[next_war_time] [int] NOT NULL CONSTRAINT [DF__castle__next_war__1446FBA6]  DEFAULT ((0)),
	[tax_rate] [smallint] NOT NULL CONSTRAINT [DF__castle__tax_rate__153B1FDF]  DEFAULT ((0)),
	[type] [tinyint] NOT NULL CONSTRAINT [DF_castle_type]  DEFAULT ((1)),
	[status] [tinyint] NOT NULL CONSTRAINT [DF_castle_status]  DEFAULT ((0)),
	[crop_income] [int] NOT NULL CONSTRAINT [DF_castle_crop_income]  DEFAULT ((0)),
	[shop_income] [int] NOT NULL CONSTRAINT [DF_castle_shop_income]  DEFAULT ((0)),
	[siege_elapsed_time] [int] NOT NULL CONSTRAINT [DF__castle__siege_el__3FA65AF7]  DEFAULT ((0)),
	[tax_child_rate] [int] NOT NULL CONSTRAINT [DF_castle_tax_child_rate]  DEFAULT ((0)),
	[shop_income_temp] [int] NOT NULL CONSTRAINT [DF__castle__shop_inc__463E49ED]  DEFAULT ((0)),
	[tax_rate_to_change] [smallint] NOT NULL CONSTRAINT [DF__castle__tax_rate__47326E26]  DEFAULT ((-1)),
	[tax_child_rate_to_change] [smallint] NOT NULL CONSTRAINT [DF__castle__tax_chil__4826925F]  DEFAULT ((-1)),
	[hp_stove] [tinyint] NULL,
	[mp_flame] [tinyint] NULL,
	[hatcher] [tinyint] NULL,
	[hp_stove_expire] [int] NULL,
	[mp_flame_expire] [int] NULL,
	[teleport_level] [int] NULL,
	[teleport_expire] [int] NULL,
 CONSTRAINT [PK_castle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[castle_crop]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[castle_crop]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[castle_crop](
	[castle_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[dropRate] [int] NOT NULL,
	[price] [int] NOT NULL,
	[level] [int] NOT NULL,
 CONSTRAINT [PK_castle_crop] PRIMARY KEY CLUSTERED 
(
	[castle_id] ASC,
	[item_type] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[castle_tax]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[castle_tax]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[castle_tax](
	[income_update] [datetime] NOT NULL,
	[tax_change] [datetime] NOT NULL,
	[manor_reset] [datetime] NOT NULL CONSTRAINT [DF__castle_ta__manor__5299FF31]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSurrenderWarId]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSurrenderWarId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetSurrenderWarId

INPUT
	@char_id	INT
OUTPUT
return
made by
	bert
date
	2003-10-07
********************************************/
CREATE PROCEDURE [dbo].[lin_GetSurrenderWarId]
(
@char_id	INT
)
AS
SET NOCOUNT ON


SELECT char_id, surrender_war_id FROM user_surrender us, pledge_war pw WHERE us.char_id = @char_id AND us.surrender_war_id = pw.id AND pw.status = 0


' 
END
GO
/****** Object:  Table [dbo].[castle_war]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[castle_war]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[castle_war](
	[castle_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[type] [tinyint] NOT NULL,
	[propose_time] [int] NULL CONSTRAINT [DF__castle_wa__propo__1A35AA7D]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ch2_temp]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ch2_temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ch2_temp](
	[uid] [int] NOT NULL,
	[account] [varchar](14) NOT NULL,
	[last_login] [datetime] NULL,
	[last_world] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ch3_lotto_char]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ch3_lotto_char]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ch3_lotto_char](
	[char_id] [int] NOT NULL,
	[item_count] [int] NULL,
	[round_number] [int] NULL,
	[item_id] [int] NULL,
	[number_flag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[char_pet]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[char_pet]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[char_pet](
	[char_id] [int] NOT NULL,
	[pet_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[class_list]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[class_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[class_list](
	[class] [smallint] NULL,
	[name] [nvarchar](50) NULL,
	[race] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[control_tower]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[control_tower]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[control_tower](
	[name] [varchar](256) NOT NULL,
	[residence_id] [int] NOT NULL,
	[control_level] [int] NULL CONSTRAINT [DF__control_t__contr__33F57C80]  DEFAULT ((0)),
	[hp] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[door]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[door]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[door](
	[name] [nvarchar](50) NOT NULL,
	[hp] [int] NOT NULL,
	[max_hp] [int] NULL,
 CONSTRAINT [PK_door] PRIMARY KEY CLUSTERED 
(
	[name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dt_adena_rank_temp]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dt_adena_rank_temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dt_adena_rank_temp](
	[char_id] [int] NOT NULL,
	[amount] [numeric](18, 0) NOT NULL,
	[rank] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_item_1]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_item_1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_item_1](
	[etc_num5] [int] NULL,
	[str_actor] [varchar](50) NULL,
	[actor] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_pet1_9_28]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_pet1_9_28]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_pet1_9_28](
	[uiid] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [tinyint] NOT NULL,
	[ident] [tinyint] NOT NULL,
	[wished] [tinyint] NOT NULL,
	[warehouse] [int] NOT NULL,
	[act_time] [datetime] NULL,
	[log_id] [smallint] NULL,
	[actor] [int] NULL,
	[actor_account] [int] NULL,
	[target] [int] NULL,
	[target_account] [int] NULL,
	[location_x] [int] NULL,
	[location_y] [int] NULL,
	[location_z] [int] NULL,
	[etc_str1] [varchar](200) NULL,
	[etc_str2] [varchar](50) NULL,
	[etc_str3] [varchar](50) NULL,
	[etc_num1] [float] NULL,
	[etc_num2] [float] NULL,
	[etc_num3] [int] NULL,
	[etc_num4] [int] NULL,
	[etc_num5] [int] NULL,
	[etc_num6] [int] NULL,
	[etc_num7] [int] NULL,
	[etc_num8] [int] NULL,
	[etc_num9] [int] NULL,
	[etc_num10] [int] NULL,
	[STR_actor] [varchar](48) NULL,
	[STR_actor_account] [varchar](32) NULL,
	[STR_target] [varchar](48) NULL,
	[STR_target_account] [varchar](32) NULL,
	[item_id] [int] NULL,
	[iid] [int] NULL,
	[at] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_pet1_9_30]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_pet1_9_30]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_pet1_9_30](
	[uiid] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [tinyint] NOT NULL,
	[ident] [tinyint] NOT NULL,
	[wished] [tinyint] NOT NULL,
	[warehouse] [int] NOT NULL,
	[act_time] [datetime] NULL,
	[log_id] [smallint] NULL,
	[actor] [int] NULL,
	[actor_account] [int] NULL,
	[target] [int] NULL,
	[target_account] [int] NULL,
	[location_x] [int] NULL,
	[location_y] [int] NULL,
	[location_z] [int] NULL,
	[etc_str1] [varchar](200) NULL,
	[etc_str2] [varchar](50) NULL,
	[etc_str3] [varchar](50) NULL,
	[etc_num1] [float] NULL,
	[etc_num2] [float] NULL,
	[etc_num3] [int] NULL,
	[etc_num4] [int] NULL,
	[etc_num5] [int] NULL,
	[etc_num6] [int] NULL,
	[etc_num7] [int] NULL,
	[etc_num8] [int] NULL,
	[etc_num9] [int] NULL,
	[etc_num10] [int] NULL,
	[STR_actor] [varchar](48) NULL,
	[STR_actor_account] [varchar](32) NULL,
	[STR_target] [varchar](48) NULL,
	[STR_target_account] [varchar](32) NULL,
	[item_id] [int] NULL,
	[iid] [int] NULL,
	[at] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_pet2_9_28]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_pet2_9_28]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_pet2_9_28](
	[uiid] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [tinyint] NOT NULL,
	[ident] [tinyint] NOT NULL,
	[wished] [tinyint] NOT NULL,
	[warehouse] [int] NOT NULL,
	[act_time] [datetime] NULL,
	[log_id] [smallint] NULL,
	[actor] [int] NULL,
	[actor_account] [int] NULL,
	[target] [int] NULL,
	[target_account] [int] NULL,
	[location_x] [int] NULL,
	[location_y] [int] NULL,
	[location_z] [int] NULL,
	[etc_str1] [varchar](200) NULL,
	[etc_str2] [varchar](50) NULL,
	[etc_str3] [varchar](50) NULL,
	[etc_num1] [float] NULL,
	[etc_num2] [float] NULL,
	[etc_num3] [int] NULL,
	[etc_num4] [int] NULL,
	[etc_num5] [int] NULL,
	[etc_num6] [int] NULL,
	[etc_num7] [int] NULL,
	[etc_num8] [int] NULL,
	[etc_num9] [int] NULL,
	[etc_num10] [int] NULL,
	[STR_actor] [varchar](48) NULL,
	[STR_actor_account] [varchar](32) NULL,
	[STR_target] [varchar](48) NULL,
	[STR_target_account] [varchar](32) NULL,
	[item_id] [int] NULL,
	[iid] [int] NULL,
	[at] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_pet2_9_30]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_pet2_9_30]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_pet2_9_30](
	[uiid] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [tinyint] NOT NULL,
	[ident] [tinyint] NOT NULL,
	[wished] [tinyint] NOT NULL,
	[warehouse] [int] NOT NULL,
	[act_time] [datetime] NULL,
	[log_id] [smallint] NULL,
	[actor] [int] NULL,
	[actor_account] [int] NULL,
	[target] [int] NULL,
	[target_account] [int] NULL,
	[location_x] [int] NULL,
	[location_y] [int] NULL,
	[location_z] [int] NULL,
	[etc_str1] [varchar](200) NULL,
	[etc_str2] [varchar](50) NULL,
	[etc_str3] [varchar](50) NULL,
	[etc_num1] [float] NULL,
	[etc_num2] [float] NULL,
	[etc_num3] [int] NULL,
	[etc_num4] [int] NULL,
	[etc_num5] [int] NULL,
	[etc_num6] [int] NULL,
	[etc_num7] [int] NULL,
	[etc_num8] [int] NULL,
	[etc_num9] [int] NULL,
	[etc_num10] [int] NULL,
	[STR_actor] [varchar](48) NULL,
	[STR_actor_account] [varchar](32) NULL,
	[STR_target] [varchar](48) NULL,
	[STR_target_account] [varchar](32) NULL,
	[item_id] [int] NULL,
	[iid] [int] NULL,
	[at] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[err_skill_1 ]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[err_skill_1 ]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[err_skill_1 ](
	[class_name] [nvarchar](255) NULL,
	[class] [int] NULL,
	[lev] [int] NULL,
	[skill_id] [int] NULL,
	[skill_name] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_err_table2]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[err_skill_1 ]') AND name = N'IX_err_table2')
CREATE NONCLUSTERED INDEX [IX_err_table2] ON [dbo].[err_skill_1 ] 
(
	[class] ASC,
	[lev] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_items]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[event_items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[event_items](
	[char_id] [int] NULL,
	[class_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[log_date] [datetime] NULL CONSTRAINT [DF_event_items_log_date]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[event_point]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[event_point]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[event_point](
	[point_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NULL,
	[group_point] [float] NULL CONSTRAINT [DF_event_point_group_point]  DEFAULT ((0.0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_event_point]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[event_point]') AND name = N'IX_event_point')
CREATE CLUSTERED INDEX [IX_event_point] ON [dbo].[event_point] 
(
	[group_id] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_amount0_backup]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_amount0_backup]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_amount0_backup](
	[item_id] [int] NULL,
	[char_id] [int] NULL,
	[item_type] [int] NULL,
	[amount] [int] NULL,
	[enchant] [int] NULL,
	[eroded] [int] NULL,
	[bless] [int] NULL,
	[ident] [int] NULL,
	[wished] [int] NULL,
	[warehouse] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[item_classid_normal]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_classid_normal]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_classid_normal](
	[id] [int] NOT NULL,
 CONSTRAINT [PK_item_classid_normal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[item_list]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_list](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[item_market_price]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_market_price]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_market_price](
	[item_type] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[avg_price] [float] NOT NULL,
	[frequency] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[item_temp]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_temp](
	[char_id] [int] NOT NULL CONSTRAINT [DF__item_temp__char___296DCC6C]  DEFAULT ((0)),
	[warehouse] [int] NOT NULL CONSTRAINT [DF__item_temp__wareh__2A61F0A5]  DEFAULT ((0)),
	[amount] [int] NOT NULL CONSTRAINT [DF__item_temp__amoun__2B5614DE]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[login_announce]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[login_announce]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[login_announce](
	[announce_id] [int] NOT NULL,
	[announce_msg] [nvarchar](256) NULL,
	[interval_10] [int] NOT NULL CONSTRAINT [DF_login_announce_interval_10]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lotto_game]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lotto_game]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[lotto_game](
	[round_number] [int] NOT NULL,
	[state] [int] NOT NULL,
	[left_time] [int] NOT NULL,
	[chosen_number_flag] [int] NOT NULL,
	[rule_number] [int] NOT NULL,
	[winner1_count] [int] NOT NULL,
	[winner2_count] [int] NOT NULL,
	[winner3_count] [int] NOT NULL,
	[winner4_count] [int] NOT NULL,
	[total_count] [int] NOT NULL,
	[carried_adena] [int] NOT NULL,
 CONSTRAINT [PK_lotto_game] PRIMARY KEY CLUSTERED 
(
	[round_number] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lotto_game_backup_20050302]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lotto_game_backup_20050302]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[lotto_game_backup_20050302](
	[round_number] [int] NOT NULL,
	[state] [int] NOT NULL,
	[left_time] [int] NOT NULL,
	[chosen_number_flag] [int] NOT NULL,
	[rule_number] [int] NOT NULL,
	[winner1_count] [int] NOT NULL,
	[winner2_count] [int] NOT NULL,
	[winner3_count] [int] NOT NULL,
	[winner4_count] [int] NOT NULL,
	[total_count] [int] NOT NULL,
	[carried_adena] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lotto_items]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lotto_items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[lotto_items](
	[round_number] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[number_flag] [int] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_lotto_items]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[lotto_items]') AND name = N'IX_lotto_items')
CREATE CLUSTERED INDEX [IX_lotto_items] ON [dbo].[lotto_items] 
(
	[round_number] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manor_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[manor_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[manor_data](
	[manor_id] [int] NOT NULL,
	[data_index] [int] NOT NULL,
	[seed_id] [int] NOT NULL,
	[seed_price] [int] NOT NULL,
	[seed_sell_count] [int] NOT NULL,
	[seed_remain_count] [int] NOT NULL,
	[crop_id] [int] NOT NULL,
	[crop_buy_count] [int] NOT NULL,
	[crop_price] [int] NOT NULL,
	[crop_type] [int] NOT NULL,
	[crop_remain_count] [int] NOT NULL,
	[crop_deposit] [int] NOT NULL,
 CONSTRAINT [PK_manor_data] PRIMARY KEY CLUSTERED 
(
	[manor_id] ASC,
	[data_index] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[manor_data_n]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[manor_data_n]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[manor_data_n](
	[manor_id] [int] NOT NULL,
	[data_index] [int] NOT NULL,
	[seed_id_n] [int] NOT NULL,
	[seed_price_n] [int] NOT NULL,
	[seed_sell_count_n] [int] NOT NULL,
	[crop_id_n] [int] NOT NULL,
	[crop_buy_count_n] [int] NOT NULL,
	[crop_price_n] [int] NOT NULL,
	[crop_type_n] [int] NOT NULL,
 CONSTRAINT [PK_manor_data_n] PRIMARY KEY CLUSTERED 
(
	[manor_id] ASC,
	[data_index] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[manor_fix]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[manor_fix]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[manor_fix](
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[warehouse] [int] NOT NULL,
	[error_amount] [int] NULL,
	[to_dec] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[manor_info]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[manor_info]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[manor_info](
	[manor_id] [int] NOT NULL,
	[residence_id] [int] NOT NULL,
	[adena_vault] [int] NOT NULL,
	[crop_buy_vault] [int] NOT NULL,
	[last_changed] [datetime] NOT NULL,
	[change_state] [tinyint] NOT NULL CONSTRAINT [DF__manor_inf__chang__2C4A3917]  DEFAULT ((0)),
 CONSTRAINT [PK_manor_info] PRIMARY KEY CLUSTERED 
(
	[manor_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllAllianceWarData]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllAllianceWarData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_LoadAllAllianceWarData
	
INPUT	
	@status	int
OUTPUT
	id, 
	begin_time, 
	challenger, 
	challengee 
return
made by
	bert
date
	2003-11-07
********************************************/
create PROCEDURE [dbo].[lin_LoadAllAllianceWarData]
(
	@status	int
)
AS
SET NOCOUNT ON

SELECT 
	id, begin_time, challenger, challengee 
FROM 
	alliance_war (nolock)  
WHERE 
	status = @status


' 
END
GO
/****** Object:  Table [dbo].[map]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[map]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[map](
	[map2] [int] NULL,
	[x2] [int] NULL,
	[y2] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mercenary]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[mercenary]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[mercenary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[residence_id] [int] NOT NULL,
	[npc_id] [int] NOT NULL,
	[x] [int] NOT NULL,
	[y] [int] NOT NULL,
	[z] [int] NOT NULL,
	[angle] [int] NOT NULL,
	[hp] [int] NOT NULL,
	[mp] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dynamic_rates]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dynamic_rates]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[dynamic_rates](
	[acc_name] [nvarchar](50) NOT NULL,
	[adena_drop] [float] NOT NULL DEFAULT ((1)),
	[items_drop] [float] NOT NULL DEFAULT ((1)),
	[spoil] [float] NOT NULL DEFAULT ((1)),
	[_exp] [float] NOT NULL DEFAULT ((1)),
	[_sp] [float] NOT NULL DEFAULT ((1))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[monrace]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[monrace]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[monrace](
	[race_id] [int] IDENTITY(1,1) NOT NULL,
	[make_date] [datetime] NULL CONSTRAINT [DF_monrace_make_date]  DEFAULT (getdate()),
	[lane1] [smallint] NULL,
	[lane2] [smallint] NULL,
	[lane3] [smallint] NULL,
	[lane4] [smallint] NULL,
	[lane5] [smallint] NULL,
	[lane6] [smallint] NULL,
	[lane7] [smallint] NULL,
	[lane8] [smallint] NULL,
	[run1] [float] NULL,
	[run2] [float] NULL,
	[run3] [float] NULL,
	[run4] [float] NULL,
	[run5] [float] NULL,
	[run6] [float] NULL,
	[run7] [float] NULL,
	[run8] [float] NULL,
	[win1] [smallint] NULL CONSTRAINT [DF_monrace_win1]  DEFAULT ((0)),
	[win2] [smallint] NULL CONSTRAINT [DF_monrace_win2]  DEFAULT ((0)),
	[winrate1] [float] NULL CONSTRAINT [DF_monrace_winrate1]  DEFAULT ((0.0)),
	[winrate2] [float] NULL CONSTRAINT [DF_monrace_winrate2]  DEFAULT ((0.0)),
	[race_end] [smallint] NULL CONSTRAINT [DF_monrace_race_end]  DEFAULT ((0)),
	[tax_rate] [int] NULL CONSTRAINT [DF_monrace_tax_rate]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_monrace]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[monrace]') AND name = N'IX_monrace')
CREATE CLUSTERED INDEX [IX_monrace] ON [dbo].[monrace] 
(
	[race_id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllWarData]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllWarData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAllWarData    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadAllWarData
	
INPUT	
	@status	int
OUTPUT
	id, 
	begin_time, 
	challenger, 
	challengee 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_LoadAllWarData]
(
	@status	int
)
AS
SET NOCOUNT ON

SELECT 
	id, begin_time, challenger, challengee 
FROM 
	pledge_war (nolock)  
WHERE 
	status = @status







' 
END
GO
/****** Object:  Table [dbo].[monrace_mon]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[monrace_mon]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[monrace_mon](
	[runner_id] [int] NULL,
	[initial_win] [smallint] NULL CONSTRAINT [DF_monrace_mon_initial_win]  DEFAULT ((0)),
	[run_count] [int] NULL CONSTRAINT [DF_monrace_mon_run_count]  DEFAULT ((0)),
	[win_count] [int] NULL CONSTRAINT [DF_monrace_mon_win_count]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[monrace_ticket]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[monrace_ticket]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[monrace_ticket](
	[ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[monraceid] [int] NULL,
	[bet_type] [smallint] NULL CONSTRAINT [DF_monrace_ticket_bet_type]  DEFAULT ((0)),
	[bet_1] [smallint] NULL CONSTRAINT [DF_monrace_ticket_bet_1]  DEFAULT ((0)),
	[bet_2] [smallint] NULL CONSTRAINT [DF_monrace_ticket_bet_2]  DEFAULT ((0)),
	[bet_3] [smallint] NULL,
	[bet_money] [int] NULL,
	[item_id] [int] NULL,
	[tax_money] [int] NULL CONSTRAINT [DF_monrace_ticket_tax_money]  DEFAULT ((0)),
	[deleted] [int] NULL CONSTRAINT [DF_monrace_ticket_deleted]  DEFAULT ((0)),
	[remotefee] [int] NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_monrace_ticket_1]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[monrace_ticket]') AND name = N'IX_monrace_ticket_1')
CREATE CLUSTERED INDEX [IX_monrace_ticket_1] ON [dbo].[monrace_ticket] 
(
	[monraceid] ASC,
	[bet_type] ASC,
	[bet_1] ASC,
	[bet_2] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_monrace_ticket]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[monrace_ticket]') AND name = N'IX_monrace_ticket')
CREATE NONCLUSTERED INDEX [IX_monrace_ticket] ON [dbo].[monrace_ticket] 
(
	[item_id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllianceWar]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllianceWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_LoadAllianceWar
	
INPUT
	@war_id		int
OUTPUT
return
made by
	bert
date
	2003-11-07
********************************************/
create PROCEDURE [dbo].[lin_LoadAllianceWar]
(
	@war_id		int
)
AS
SET NOCOUNT ON

SELECT challenger, challengee, begin_time, status FROM alliance_war (nolock)  WHERE id = @war_id


' 
END
GO
/****** Object:  Table [dbo].[nobless_achievements]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[nobless_achievements]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[nobless_achievements](
	[char_id] [int] NULL,
	[win_type] [int] NULL,
	[target] [int] NULL,
	[win_time] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteBBSBoard]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteBBSBoard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeleteBBSBoard    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_DeleteBBSBoard
	Delete BBS board
INPUT
	@board_name	nvarchar(20)
OUTPUT

return
made by
	young
date
	2002-10-16
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteBBSBoard]
(
	@board_name	nvarchar(20)
)
AS

set nocount on

declare @ncount int
declare @table_name nvarchar(20)
declare @exec nvarchar(500)

set @table_name = ''bbs_'' + @board_name

set @exec = ''drop table '' + @table_name
exec (@exec)

delete from bbs_board where board_name =  @table_name



' 
END
GO
/****** Object:  Table [dbo].[npc_boss]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[npc_boss]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[npc_boss](
	[npc_db_name] [nvarchar](50) NOT NULL,
	[alive] [int] NOT NULL,
	[hp] [int] NULL,
	[mp] [int] NULL,
	[pos_x] [int] NULL,
	[pos_y] [int] NULL,
	[pos_z] [int] NULL,
	[time_low] [int] NULL,
	[time_high] [int] NULL,
	[i0] [int] NOT NULL CONSTRAINT [DF_npc_boss_i0]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_npc_boss_unique_name]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[npc_boss]') AND name = N'idx_npc_boss_unique_name')
CREATE UNIQUE NONCLUSTERED INDEX [idx_npc_boss_unique_name] ON [dbo].[npc_boss] 
(
	[npc_db_name] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[npcname]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[npcname]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[npcname](
	[npc_id] [int] NULL,
	[npc_name] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pledge_skill]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pledge_skill]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[pledge_skill](
	[pledge_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[skill_lev] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[object_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[object_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[object_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NOT NULL CONSTRAINT [DF_object_data_pledge_id]  DEFAULT ((0)),
	[residence_id] [int] NOT NULL CONSTRAINT [DF_object_data_castle_id]  DEFAULT ((0)),
	[max_hp] [int] NOT NULL CONSTRAINT [DF_object_data_max_hp]  DEFAULT ((0)),
	[hp] [int] NOT NULL CONSTRAINT [DF_object_data_hp]  DEFAULT ((0)),
	[x_pos] [int] NOT NULL CONSTRAINT [DF_object_data_x_pos]  DEFAULT ((0)),
	[y_pos] [int] NOT NULL CONSTRAINT [DF_object_data_y_pos]  DEFAULT ((0)),
	[z_pos] [int] NOT NULL CONSTRAINT [DF_object_data_z_pos]  DEFAULT ((0)),
	[type] [int] NOT NULL,
 CONSTRAINT [PK_object_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hellbound_point]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[hellbound_point]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[hellbound_point](
	[point] [int] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[olympiad]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[olympiad]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[olympiad](
	[season] [int] IDENTITY(1,1) NOT NULL,
	[step] [int] NULL,
	[season_start_time] [int] NULL,
	[start_sec] [int] NULL,
	[bonus1_sec] [int] NULL,
	[bonus2_sec] [int] NULL,
	[bonus3_sec] [int] NULL,
	[bonus4_sec] [int] NULL,
	[nominate_sec] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[olympiad_match]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[olympiad_match]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[olympiad_match](
	[season] [int] NULL,
	[class] [int] NULL,
	[match_time] [int] NULL,
	[char_id] [int] NULL,
	[rival_id] [int] NULL,
	[point] [int] NULL,
	[is_winner] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[offlinestore_users]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[offlinestore_users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[offlinestore_users](
	[char_id] [int] NOT NULL,
	[start_time] [int] NOT NULL,
	[remain_time] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[olympiad_result]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[olympiad_result]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[olympiad_result](
	[season] [int] NOT NULL,
	[class] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[point] [int] NOT NULL,
	[match_count] [int] NOT NULL,
 CONSTRAINT [PK_olympiad_result] PRIMARY KEY CLUSTERED 
(
	[season] ASC,
	[class] ASC,
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pet_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pet_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[pet_data](
	[pet_id] [int] NOT NULL,
	[npc_class_id] [int] NOT NULL,
	[expoint] [int] NOT NULL,
	[nick_name] [nvarchar](50) NULL,
	[hp] [float] NOT NULL CONSTRAINT [DF_pet_data_hp]  DEFAULT ((1)),
	[mp] [float] NOT NULL CONSTRAINT [DF_pet_data_mp]  DEFAULT ((0)),
	[sp] [int] NOT NULL CONSTRAINT [DF_pet_data_sp]  DEFAULT ((0)),
	[meal] [int] NOT NULL CONSTRAINT [DF_pet_data_meal]  DEFAULT ((1)),
	[slot1] [int] NOT NULL CONSTRAINT [DF_pet_data_slot1]  DEFAULT ((0)),
	[slot2] [int] NOT NULL CONSTRAINT [DF_pet_data_slot2]  DEFAULT ((0)),
 CONSTRAINT [PK_pet_data] PRIMARY KEY CLUSTERED 
(
	[pet_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pledge_announce]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pledge_announce]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[pledge_announce](
	[pledge_id] [int] NOT NULL,
	[show_flag] [smallint] NOT NULL,
	[content] [nvarchar](3000) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pledge_contribution]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pledge_contribution]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[pledge_contribution](
	[residence_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[contribution] [int] NOT NULL CONSTRAINT [DF_pledge_contribution_contribution]  DEFAULT ((0)),
 CONSTRAINT [PK_pledge_contribution] PRIMARY KEY CLUSTERED 
(
	[residence_id] ASC,
	[pledge_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[point]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[point]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[point](
	[map] [int] NULL,
	[align] [int] NULL,
	[loc] [int] NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[z] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[quest]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[quest]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[quest](
	[char_id] [int] NOT NULL,
	[q1] [int] NOT NULL CONSTRAINT [DF_Quest_q1]  DEFAULT ((0)),
	[s1] [int] NULL CONSTRAINT [DF_Quest_s1]  DEFAULT ((0)),
	[q2] [int] NOT NULL CONSTRAINT [DF_Quest_q2]  DEFAULT ((0)),
	[s2] [int] NOT NULL CONSTRAINT [DF_Quest_s2]  DEFAULT ((0)),
	[q3] [int] NOT NULL CONSTRAINT [DF_Quest_q3]  DEFAULT ((0)),
	[s3] [int] NOT NULL CONSTRAINT [DF_Quest_s3]  DEFAULT ((0)),
	[q4] [int] NOT NULL CONSTRAINT [DF_Quest_q4]  DEFAULT ((0)),
	[s4] [int] NOT NULL CONSTRAINT [DF_Quest_s4]  DEFAULT ((0)),
	[q5] [int] NOT NULL CONSTRAINT [DF_Quest_q5]  DEFAULT ((0)),
	[s5] [int] NOT NULL CONSTRAINT [DF_Quest_s5]  DEFAULT ((0)),
	[q6] [int] NOT NULL CONSTRAINT [DF_Quest_q6]  DEFAULT ((0)),
	[s6] [int] NOT NULL CONSTRAINT [DF_Quest_s6]  DEFAULT ((0)),
	[q7] [int] NOT NULL CONSTRAINT [DF_Quest_q7]  DEFAULT ((0)),
	[s7] [int] NOT NULL CONSTRAINT [DF_Quest_s7]  DEFAULT ((0)),
	[q8] [int] NOT NULL CONSTRAINT [DF_Quest_q8]  DEFAULT ((0)),
	[s8] [int] NOT NULL CONSTRAINT [DF_Quest_s8]  DEFAULT ((0)),
	[q9] [int] NOT NULL CONSTRAINT [DF_Quest_q9]  DEFAULT ((0)),
	[s9] [int] NOT NULL CONSTRAINT [DF_Quest_s9]  DEFAULT ((0)),
	[q10] [int] NOT NULL CONSTRAINT [DF_Quest_q10]  DEFAULT ((0)),
	[s10] [int] NOT NULL CONSTRAINT [DF_Quest_s10]  DEFAULT ((0)),
	[q11] [int] NOT NULL CONSTRAINT [DF_Quest_q11]  DEFAULT ((0)),
	[s11] [int] NOT NULL CONSTRAINT [DF_Quest_s11]  DEFAULT ((0)),
	[q12] [int] NOT NULL CONSTRAINT [DF_Quest_q12]  DEFAULT ((0)),
	[s12] [int] NOT NULL CONSTRAINT [DF_Quest_s12]  DEFAULT ((0)),
	[q13] [int] NOT NULL CONSTRAINT [DF_Quest_q13]  DEFAULT ((0)),
	[s13] [int] NOT NULL CONSTRAINT [DF_Quest_s13]  DEFAULT ((0)),
	[q14] [int] NOT NULL CONSTRAINT [DF_Quest_q14]  DEFAULT ((0)),
	[s14] [int] NOT NULL CONSTRAINT [DF_Quest_s14]  DEFAULT ((0)),
	[q15] [int] NOT NULL CONSTRAINT [DF_Quest_q15]  DEFAULT ((0)),
	[s15] [int] NOT NULL CONSTRAINT [DF_Quest_s15]  DEFAULT ((0)),
	[q16] [int] NOT NULL CONSTRAINT [DF_Quest_q16]  DEFAULT ((0)),
	[s16] [int] NOT NULL CONSTRAINT [DF_Quest_s16]  DEFAULT ((0)),
	[j1] [int] NOT NULL CONSTRAINT [DF_Quest_j1]  DEFAULT ((0)),
	[j2] [int] NOT NULL CONSTRAINT [DF_Quest_j2]  DEFAULT ((0)),
	[j3] [int] NOT NULL CONSTRAINT [DF_Quest_j3]  DEFAULT ((0)),
	[j4] [int] NOT NULL CONSTRAINT [DF_Quest_j4]  DEFAULT ((0)),
	[j5] [int] NOT NULL CONSTRAINT [DF_Quest_j5]  DEFAULT ((0)),
	[j6] [int] NOT NULL CONSTRAINT [DF_Quest_j6]  DEFAULT ((0)),
	[j7] [int] NOT NULL CONSTRAINT [DF_Quest_j7]  DEFAULT ((0)),
	[j8] [int] NOT NULL CONSTRAINT [DF_Quest_j8]  DEFAULT ((0)),
	[j9] [int] NOT NULL CONSTRAINT [DF_Quest_j9]  DEFAULT ((0)),
	[j10] [int] NOT NULL CONSTRAINT [DF_Quest_j10]  DEFAULT ((0)),
	[j11] [int] NOT NULL CONSTRAINT [DF_Quest_j11]  DEFAULT ((0)),
	[j12] [int] NOT NULL CONSTRAINT [DF_Quest_j12]  DEFAULT ((0)),
	[j13] [int] NOT NULL CONSTRAINT [DF_Quest_j13]  DEFAULT ((0)),
	[j14] [int] NOT NULL CONSTRAINT [DF_Quest_j14]  DEFAULT ((0)),
	[j15] [int] NOT NULL CONSTRAINT [DF_Quest_j15]  DEFAULT ((0)),
	[j16] [int] NOT NULL CONSTRAINT [DF_Quest_j16]  DEFAULT ((0)),
	[s2_1] [int] NULL CONSTRAINT [DF_QUEST_S2_1]  DEFAULT ((0)),
	[s2_2] [int] NULL CONSTRAINT [DF_QUEST_S2_2]  DEFAULT ((0)),
	[s2_3] [int] NULL CONSTRAINT [DF_QUEST_S2_3]  DEFAULT ((0)),
	[s2_4] [int] NULL CONSTRAINT [DF_QUEST_S2_4]  DEFAULT ((0)),
	[s2_5] [int] NULL CONSTRAINT [DF_QUEST_S2_5]  DEFAULT ((0)),
	[s2_6] [int] NULL CONSTRAINT [DF_QUEST_S2_6]  DEFAULT ((0)),
	[s2_7] [int] NULL CONSTRAINT [DF_QUEST_S2_7]  DEFAULT ((0)),
	[s2_8] [int] NULL CONSTRAINT [DF_QUEST_S2_8]  DEFAULT ((0)),
	[s2_9] [int] NULL CONSTRAINT [DF_QUEST_S2_9]  DEFAULT ((0)),
	[s2_10] [int] NULL CONSTRAINT [DF_QUEST_S2_10]  DEFAULT ((0)),
	[s2_11] [int] NULL CONSTRAINT [DF_QUEST_S2_11]  DEFAULT ((0)),
	[s2_12] [int] NULL CONSTRAINT [DF_QUEST_S2_12]  DEFAULT ((0)),
	[s2_13] [int] NULL CONSTRAINT [DF_QUEST_S2_13]  DEFAULT ((0)),
	[s2_14] [int] NULL CONSTRAINT [DF_QUEST_S2_14]  DEFAULT ((0)),
	[s2_15] [int] NULL CONSTRAINT [DF_QUEST_S2_15]  DEFAULT ((0)),
	[s2_16] [int] NULL CONSTRAINT [DF_QUEST_S2_16]  DEFAULT ((0)),
	[q17] [int] NOT NULL CONSTRAINT [DF_Quest_q17]  DEFAULT ((0)),
	[s17] [int] NOT NULL CONSTRAINT [DF_Quest_s17]  DEFAULT ((0)),
	[q18] [int] NOT NULL CONSTRAINT [DF_Quest_q18]  DEFAULT ((0)),
	[s18] [int] NOT NULL CONSTRAINT [DF_Quest_s18]  DEFAULT ((0)),
	[q19] [int] NOT NULL CONSTRAINT [DF_Quest_q19]  DEFAULT ((0)),
	[s19] [int] NOT NULL CONSTRAINT [DF_Quest_s19]  DEFAULT ((0)),
	[q20] [int] NOT NULL CONSTRAINT [DF_Quest_q20]  DEFAULT ((0)),
	[s20] [int] NOT NULL CONSTRAINT [DF_Quest_s20]  DEFAULT ((0)),
	[q21] [int] NOT NULL CONSTRAINT [DF_Quest_q21]  DEFAULT ((0)),
	[s21] [int] NOT NULL CONSTRAINT [DF_Quest_s21]  DEFAULT ((0)),
	[q22] [int] NOT NULL CONSTRAINT [DF_Quest_q22]  DEFAULT ((0)),
	[s22] [int] NOT NULL CONSTRAINT [DF_Quest_s22]  DEFAULT ((0)),
	[q23] [int] NOT NULL CONSTRAINT [DF_Quest_q23]  DEFAULT ((0)),
	[s23] [int] NOT NULL CONSTRAINT [DF_Quest_s23]  DEFAULT ((0)),
	[q24] [int] NOT NULL CONSTRAINT [DF_Quest_q24]  DEFAULT ((0)),
	[s24] [int] NOT NULL CONSTRAINT [DF_Quest_s24]  DEFAULT ((0)),
	[q25] [int] NOT NULL CONSTRAINT [DF_Quest_q25]  DEFAULT ((0)),
	[s25] [int] NOT NULL CONSTRAINT [DF_Quest_s25]  DEFAULT ((0)),
	[q26] [int] NOT NULL CONSTRAINT [DF_Quest_q26]  DEFAULT ((0)),
	[s26] [int] NOT NULL CONSTRAINT [DF_Quest_s26]  DEFAULT ((0)),
	[j17] [int] NOT NULL CONSTRAINT [DF_Quest_j17]  DEFAULT ((0)),
	[j18] [int] NOT NULL CONSTRAINT [DF_Quest_j18]  DEFAULT ((0)),
	[j19] [int] NOT NULL CONSTRAINT [DF_Quest_j19]  DEFAULT ((0)),
	[j20] [int] NOT NULL CONSTRAINT [DF_Quest_j20]  DEFAULT ((0)),
	[j21] [int] NOT NULL CONSTRAINT [DF_Quest_j21]  DEFAULT ((0)),
	[j22] [int] NOT NULL CONSTRAINT [DF_Quest_j22]  DEFAULT ((0)),
	[j23] [int] NOT NULL CONSTRAINT [DF_Quest_j23]  DEFAULT ((0)),
	[j24] [int] NOT NULL CONSTRAINT [DF_Quest_j24]  DEFAULT ((0)),
	[j25] [int] NOT NULL CONSTRAINT [DF_Quest_j25]  DEFAULT ((0)),
	[j26] [int] NOT NULL CONSTRAINT [DF_Quest_j26]  DEFAULT ((0)),
	[s2_17] [int] NULL CONSTRAINT [DF_QUEST_S2_17]  DEFAULT ((0)),
	[s2_18] [int] NULL CONSTRAINT [DF_QUEST_S2_18]  DEFAULT ((0)),
	[s2_19] [int] NULL CONSTRAINT [DF_QUEST_S2_19]  DEFAULT ((0)),
	[s2_20] [int] NULL CONSTRAINT [DF_QUEST_S2_20]  DEFAULT ((0)),
	[s2_21] [int] NULL CONSTRAINT [DF_QUEST_S2_21]  DEFAULT ((0)),
	[s2_22] [int] NULL CONSTRAINT [DF_QUEST_S2_22]  DEFAULT ((0)),
	[s2_23] [int] NULL CONSTRAINT [DF_QUEST_S2_23]  DEFAULT ((0)),
	[s2_24] [int] NULL CONSTRAINT [DF_QUEST_S2_24]  DEFAULT ((0)),
	[s2_25] [int] NULL CONSTRAINT [DF_QUEST_S2_25]  DEFAULT ((0)),
	[s2_26] [int] NULL CONSTRAINT [DF_QUEST_S2_26]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_Quest]    Script Date: 02/08/2011 16:50:23 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[quest]') AND name = N'IX_Quest')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Quest] ON [dbo].[quest] 
(
	[char_id] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[req_char]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[req_char]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[req_char](
	[server_id] [int] NULL,
	[char_name] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[req_charmove]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[req_charmove]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[req_charmove](
	[old_char_name] [nvarchar](50) NOT NULL,
	[old_char_id] [int] NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NULL,
	[old_world_id] [int] NULL,
	[req_date] [datetime] NULL,
	[req_id] [int] NOT NULL,
	[new_world_id] [int] NULL,
	[new_char_name] [nvarchar](50) NULL,
	[new_char_id] [int] NULL,
	[is_pc_bang] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[req_charmove_old]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[req_charmove_old]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[req_charmove_old](
	[old_char_name] [nvarchar](50) NULL,
	[old_char_id] [int] NULL,
	[account_name] [nvarchar](50) NULL,
	[account_id] [int] NULL,
	[old_world_id] [int] NULL,
	[req_date] [datetime] NULL CONSTRAINT [DF_req_charmove_reg_date]  DEFAULT (getdate()),
	[req_id] [int] IDENTITY(1,1) NOT NULL,
	[new_world_id] [int] NULL,
	[new_char_name] [nvarchar](50) NULL,
	[new_char_id] [int] NULL,
 CONSTRAINT [IX_req_charmove] UNIQUE NONCLUSTERED 
(
	[new_char_name] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_req_charmove_1] UNIQUE NONCLUSTERED 
(
	[old_char_id] ASC,
	[old_world_id] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_req_charmove_2] UNIQUE NONCLUSTERED 
(
	[account_id] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_req_charmove_3] UNIQUE NONCLUSTERED 
(
	[new_char_name] ASC,
	[new_world_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[req_pledge]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[req_pledge]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[req_pledge](
	[server_id] [int] NULL,
	[pledge_id] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[residence_guard]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[residence_guard]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[residence_guard](
	[residence_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[npc_id] [int] NOT NULL,
	[guard_type] [int] NOT NULL,
	[can_move] [int] NOT NULL,
	[x] [int] NOT NULL,
	[y] [int] NOT NULL,
	[z] [int] NOT NULL,
	[angle] [int] NOT NULL,
 CONSTRAINT [pk_residence_guard] PRIMARY KEY CLUSTERED 
(
	[x] ASC,
	[y] ASC,
	[z] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[shortcut_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[shortcut_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[shortcut_data](
	[char_id] [int] NOT NULL,
	[slotnum] [int] NOT NULL,
	[shortcut_type] [int] NOT NULL,
	[shortcut_id] [int] NOT NULL,
	[shortcut_macro] [nvarchar](256) NOT NULL,
	[subjob_id] [int] NOT NULL CONSTRAINT [DF__shortcut___subjo__3AA27A0F]  DEFAULT ((0)),
 CONSTRAINT [PK_shortcut_data] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[slotnum] ASC,
	[subjob_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[siege_agit_pledge]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[siege_agit_pledge]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[siege_agit_pledge](
	[agit_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[propose_time] [int] NOT NULL,
	[status] [int] NULL CONSTRAINT [DF__siege_agi__statu__611D28B2]  DEFAULT ((0)),
 CONSTRAINT [sap_uniq] UNIQUE NONCLUSTERED 
(
	[agit_id] ASC,
	[pledge_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ssq_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ssq_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ssq_data](
	[round_number] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
	[winner] [tinyint] NOT NULL,
	[event_start_time] [int] NOT NULL,
	[seal_effect_time] [int] NOT NULL,
	[event_end_time] [int] NOT NULL,
	[seal_effect_end_time] [int] NOT NULL,
	[seal1] [tinyint] NOT NULL,
	[seal2] [tinyint] NOT NULL,
	[seal3] [tinyint] NOT NULL,
	[seal4] [tinyint] NOT NULL,
	[seal5] [tinyint] NOT NULL,
	[seal6] [tinyint] NOT NULL,
	[seal7] [tinyint] NOT NULL,
	[last_changed_time] [datetime] NOT NULL,
	[castle_snapshot_time] [int] NULL,
	[can_drop_guard] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ssq_join_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ssq_join_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ssq_join_data](
	[round_number] [int] NOT NULL,
	[type] [tinyint] NOT NULL,
	[point] [int] NOT NULL,
	[main_event_point] [int] NULL,
	[collected_point] [int] NULL,
	[member_count] [int] NOT NULL,
	[seal1_selection_count] [int] NOT NULL,
	[seal2_selection_count] [int] NOT NULL,
	[seal3_selection_count] [int] NOT NULL,
	[seal4_selection_count] [int] NOT NULL,
	[seal5_selection_count] [int] NOT NULL,
	[seal6_selection_count] [int] NOT NULL,
	[seal7_selection_count] [int] NOT NULL,
	[last_changed_time] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ssq_top_point_user]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ssq_top_point_user]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ssq_top_point_user](
	[ssq_round] [int] NOT NULL,
	[record_id] [int] NOT NULL,
	[rank_time] [int] NOT NULL,
	[ssq_point] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[char_name] [nvarchar](50) NOT NULL,
	[ssq_part] [tinyint] NOT NULL,
	[ssq_position] [tinyint] NOT NULL,
	[seal_selection_no] [tinyint] NOT NULL,
	[last_changed_time] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ssq_user_data]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ssq_user_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ssq_user_data](
	[char_id] [int] NOT NULL,
	[round_number] [int] NOT NULL,
	[ssq_part] [tinyint] NOT NULL,
	[ssq_position] [tinyint] NOT NULL,
	[seal_selection_no] [tinyint] NOT NULL,
	[ssq_join_time] [int] NOT NULL,
	[ssq_point] [int] NOT NULL,
	[twilight_a_item_num] [int] NOT NULL,
	[twilight_b_item_num] [int] NOT NULL,
	[twilight_c_item_num] [int] NOT NULL,
	[dawn_a_item_num] [int] NOT NULL,
	[dawn_b_item_num] [int] NOT NULL,
	[dawn_c_item_num] [int] NOT NULL,
	[ticket_buy_count] [tinyint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_acc_class]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_acc_class]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_acc_class](
	[class] [tinyint] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetUserDataEx]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetUserDataEx]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetUserDataEx    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetUserDataEx
	
INPUT	
	@char_id	int,
	@dismiss_penalty_reserved	int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SetUserDataEx]
(
	@char_id	int,
	@dismiss_penalty_reserved	int
)
AS
SET NOCOUNT ON

INSERT INTO user_data_ex (char_id, dismiss_penalty_reserved) VALUES (@char_id, @dismiss_penalty_reserved)





' 
END
GO
/****** Object:  Table [dbo].[stat_acc_lev]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_acc_lev]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_acc_lev](
	[lev] [tinyint] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_acc_mlev]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_acc_mlev]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_acc_mlev](
	[account_name] [nvarchar](50) NOT NULL,
	[char_name] [nvarchar](50) NOT NULL,
	[lev] [tinyint] NOT NULL,
	[race] [tinyint] NOT NULL,
	[class] [tinyint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_acc_race]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_acc_race]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_acc_race](
	[race] [tinyint] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_item_cnt]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_item_cnt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_item_cnt](
	[id] [int] NOT NULL,
	[count] [int] NOT NULL,
	[sum] [float] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_item_ent]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_item_ent]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_item_ent](
	[item_type] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[count] [int] NOT NULL,
	[sum] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[stat_item_ment]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_item_ment]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_item_ment](
	[item_type] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[char_name] [nvarchar](50) NOT NULL,
	[max_ent] [int] NOT NULL,
	[builder] [tinyint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_StopAllianceWar]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_StopAllianceWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE
[dbo].[lin_StopAllianceWar] (@proposer_alliance_id INT, @proposee_alliance_id INT, @war_id INT,  @war_end_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

UPDATE Alliance_War
SET status = 1,	-- WAR_END_STOP
winner = 0,
end_time = @war_end_time
WHERE
id = @war_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @war_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret




' 
END
GO
/****** Object:  Table [dbo].[stat_item_mincnt]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[stat_item_mincnt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[stat_item_mincnt](
	[item_type] [int] NOT NULL,
	[item_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_StopPledgeWar]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_StopPledgeWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_StopPledgeWar    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_StopPledgeWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_StopPledgeWar] (@proposer_pledge_id INT, @proposee_pledge_id INT, @war_id INT,  @war_end_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

UPDATE Pledge_War
SET status = 1,	-- WAR_END_STOP
winner = 0,
end_time = @war_end_time
WHERE
id = @war_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @war_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END
SELECT @ret


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_Err]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_Err]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_Err] AS

set nocount on

update ui
set ui.char_id = et.actor
from user_item as ui inner join err_table as et
on ui.item_id = et.etc_num5
where ui.char_id > 1000 and etc_num5 is not null


' 
END
GO
/****** Object:  Table [dbo].[team_battle_agit_member]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[team_battle_agit_member]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[team_battle_agit_member](
	[agit_id] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[propose_time] [int] NOT NULL,
 CONSTRAINT [tbam_uniq] UNIQUE NONCLUSTERED 
(
	[agit_id] ASC,
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SurrenderAllianceWar]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SurrenderAllianceWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_SurrenderAllianceWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_SurrenderAllianceWar] (@proposer_alliance_id INT, @proposee_alliance_id INT, @war_id INT, @war_end_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

UPDATE alliance_war
SET status = 2,	-- WAR_END_SURRENDER
winner = @proposee_alliance_id,
winner_name = (SELECT name FROM alliance WHERE id = @proposee_alliance_id),
end_time = @war_end_time
WHERE
id = @war_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @war_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret


' 
END
GO
/****** Object:  Table [dbo].[team_battle_agit_pledge]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[team_battle_agit_pledge]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[team_battle_agit_pledge](
	[agit_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[propose_time] [int] NOT NULL,
	[color] [int] NOT NULL,
	[npc_type] [int] NOT NULL,
 CONSTRAINT [tbap_uniq] UNIQUE NONCLUSTERED 
(
	[agit_id] ASC,
	[pledge_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ErrItem]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ErrItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_ErrItem] AS

update ui
set ui.char_id = et.actor
from user_item as ui inner join err_item_5 as et
on ui.char_id = et.etc_num5
where warehouse = 0


' 
END
GO
/****** Object:  Table [dbo].[temp_account]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_account]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_account](
	[real_account] [nvarchar](50) NOT NULL,
	[user_id] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SurrenderPledgeWar]    Script Date: 02/08/2011 16:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SurrenderPledgeWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SurrenderPledgeWar    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_SurrenderPledgeWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_SurrenderPledgeWar] (@proposer_pledge_id INT, @proposee_pledge_id INT, @war_id INT, @war_end_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

UPDATE Pledge_War
SET status = 2,	-- WAR_END_SURRENDER
winner = @proposee_pledge_id,
winner_name = (SELECT name FROM Pledge WHERE pledge_id = @proposee_pledge_id),
end_time = @war_end_time
WHERE
id = @war_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @war_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END
SELECT @ret


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeWar]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadPledgeWar    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadPledgeWar
	
INPUT
	@war_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_LoadPledgeWar]
(
	@war_id		int
)
AS
SET NOCOUNT ON

SELECT challenger, challengee, begin_time, status FROM pledge_war (nolock)  WHERE id = @war_id





' 
END
GO
/****** Object:  Table [dbo].[temp_inv]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_inv]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_inv](
	[item_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[temp_pet_inv]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_pet_inv]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_pet_inv](
	[pet_item_id] [int] NOT NULL,
	[pet_item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[pet_collar_id] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_EventChangeGender]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_EventChangeGender]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_EventChangeGender]
(
	@world_id	int
)
AS

SET NOCOUNT ON

declare	@sql		varchar(4000)

set @sql = ''update user_data''
		+ '' set''
		+ '' 	gender = gender ^ 1,''
		+ '' 	face_index = 0,''
		+ '' 	hair_shape_index = 0,''
		+ '' 	hair_color_index = 0''
		+ '' where char_name in (''
		+ ''	select character from openrowset (''''sqloledb'''', ''''10.30.3.41'''';''''gamma'''';''''lineage2pwd'''',''
		+ ''	''''select character from L2EventDB.dbo.ChangeGenderResult where ServerNumber = '' + cast(@world_id as varchar) + ''''''))''
exec (@sql)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_FinishPledgeWar]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_FinishPledgeWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_FinishPledgeWar    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_FinishPledgeWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_FinishPledgeWar] (@by_timeout INT, @winner_pledge_id INT, @loser_pledge_id INT, @war_id INT, @war_end_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

IF @by_timeout = 0
BEGIN	-- ????? ?? ??, ? ??? ?? ??
	UPDATE Pledge_War
	SET status = 3,	-- WAR_END_NORMAL
	winner = @winner_pledge_id,
	winner_name = (SELECT name FROM Pledge WHERE pledge_id = @winner_pledge_id),
	end_time = @war_end_time
	WHERE
	id = @war_id
	AND
	status = 0
	
	-- now_war_id = 0 ??	now_war_id? ?? stored procedure? ???? ???.
	IF @@ERROR = 0 AND @@ROWCOUNT = 1
	BEGIN
		SELECT @ret = @war_id
	END
	ELSE
	BEGIN
		SELECT @ret = 0
	END	
END
ELSE
BEGIN	-- 24?? ????? ?? ??, ??? ??? ?? ??
	UPDATE Pledge_War
	SET status = 4,	-- WAR_END_TIMEOUT
	end_time = @war_end_time
	WHERE
	id = @war_id
	AND
	status = 0

	-- now_war_id = 0 ??	now_war_id? ?? stored procedure? ???? ???.
	IF @@ERROR = 0 AND @@ROWCOUNT = 1
	BEGIN
		SELECT @ret = @war_id
	END
	ELSE
	BEGIN
		SELECT @ret = 0
	END
END

IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END
SELECT @ret


' 
END
GO
/****** Object:  Table [dbo].[temp_recipe]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_recipe]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_recipe](
	[char_id] [int] NULL,
	[item_type] [int] NULL,
	[warehouse] [int] NULL,
	[recipecount] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_FlushItemName]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_FlushItemName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_FlushItemName    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_FlushItemName
	Delete item name data
INPUT
OUTPUT
return
made by
	carrot
date
	2002-10-8
********************************************/
CREATE PROCEDURE [dbo].[lin_FlushItemName]
AS
SET NOCOUNT ON

TRUNCATE TABLE ItemData



' 
END
GO
/****** Object:  Table [dbo].[temp_skill]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_skill]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_skill](
	[char_id] [int] NULL,
	[skill] [int] NULL,
	[lev] [int] NULL,
	[temptime] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_FlushQuestName]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_FlushQuestName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_FlushQuestName    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_FlushQuestName
	delete Quest name data
INPUT
OUTPUT
return
made by
	carrot
date
	2002-10-8
********************************************/
CREATE PROCEDURE [dbo].[lin_FlushQuestName]
AS
SET NOCOUNT ON

TRUNCATE TABLE QuestData



' 
END
GO
/****** Object:  Table [dbo].[temp_skill2]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_skill2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_skill2](
	[char_id] [int] NULL,
	[skill_id] [int] NULL,
	[skill_lev] [int] NULL,
	[temptime] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_FlushSkillName]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_FlushSkillName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_FlushSkillName    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_FlushSkillName
	delete Skill name data
INPUT
OUTPUT
return
made by
	carrot
date
	2002-10-8
********************************************/
CREATE PROCEDURE [dbo].[lin_FlushSkillName]
AS
SET NOCOUNT ON

TRUNCATE TABLE skillData



' 
END
GO
/****** Object:  Table [dbo].[temp_update]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_update]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[temp_update](
	[char_id] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[time_attack_record]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[time_attack_record]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[time_attack_record](
	[ssq_round] [int] NOT NULL,
	[room_no] [tinyint] NOT NULL,
	[record_type] [tinyint] NOT NULL,
	[ssq_part] [tinyint] NOT NULL,
	[point] [int] NOT NULL,
	[record_time] [int] NOT NULL,
	[elapsed_time] [int] NOT NULL,
	[member_count] [int] NOT NULL,
	[member_names] [nvarchar](256) NOT NULL,
	[member_dbid_list] [nvarchar](128) NULL,
	[member_reward_flags] [int] NULL,
	[fee] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[time_attack_record_test]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[time_attack_record_test]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[time_attack_record_test](
	[Col001] [varchar](255) NULL,
	[Col002] [varchar](255) NULL,
	[Col003] [varchar](255) NULL,
	[Col004] [varchar](255) NULL,
	[Col005] [varchar](255) NULL,
	[Col006] [varchar](255) NULL,
	[Col007] [varchar](255) NULL,
	[Col008] [varchar](255) NULL,
	[Col009] [varchar](255) NULL,
	[Col010] [varchar](255) NULL,
	[Col011] [varchar](255) NULL,
	[Col012] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[time_data]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[time_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[time_data](
	[account_id] [int] NOT NULL,
	[last_logout] [datetime] NOT NULL,
	[used_sec] [int] NOT NULL,
 CONSTRAINT [PK_char_data2] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tmp_alliance]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_alliance]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_alliance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[master_pledge_id] [int] NOT NULL,
	[oust_time] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tmp_die_user]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_die_user]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_die_user](
	[char_name] [varchar](64) NULL,
	[account_name] [varchar](64) NULL,
	[before_die_exp] [int] NULL,
	[die_minus_exp] [int] NULL,
	[after_resurrect_exp] [int] NULL,
	[resurrect_add_exp] [int] NULL,
	[hasSubjob] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tmp_lotto_price_given]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_lotto_price_given]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_lotto_price_given](
	[char_id] [int] NULL,
	[char_name] [varchar](50) NULL,
	[rank] [int] NULL,
	[price] [int] NULL,
	[new_price] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tmp_pledge]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_pledge]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_pledge](
	[pledge_id] [int] IDENTITY(1,1) NOT NULL,
	[ruler_id] [int] NOT NULL,
	[name] [nvarchar](24) NOT NULL,
	[alliance_id] [int] NOT NULL,
	[root_name_value] [int] NOT NULL,
	[name_value] [int] NOT NULL,
	[oust_time] [int] NOT NULL,
	[skill_level] [smallint] NOT NULL,
	[castle_id] [int] NOT NULL,
	[agit_id] [int] NOT NULL,
	[rank] [int] NOT NULL,
	[status] [int] NOT NULL,
	[is_guilty] [int] NOT NULL,
	[dismiss_reserved_time] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[DB_BACKUP]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DB_BACKUP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROC [dbo].[DB_BACKUP]
	@DBNAME  varCHAR(16),    
	@path  varchar(32) = ''F:\MSSQL\BACKUP\'',    
	@gen  int = 7
   AS
	begin    
		SET QUOTED_IDENTIFIER OFF  
  
		declare @dev_name varchar(64)    
		declare @dev_name_del varchar(64)    
		declare @physical_name  varchar(64)    
		declare @description varchar(64)    
    
		if ( select count(*) from master.dbo.sysdatabases where name = @dbname ) = 0     
		begin     
			select ''Database "'' + @DBNAME + ''" does not exist.''    
			return    
		end    
    
		select @description = @DBNAME  + '' , '' + CONVERT(CHAR(20),GETDATE())    


		if datepart(hour,getdate()) =  8
		  begin
			set @GEN = 7
			select @dev_name = @@SERVERNAME + ''.'' + @DBNAME + ''.'' + convert(char(10),getdate() , 120 )    
			select @dev_name_del = @@SERVERNAME + ''.'' + @DBNAME + ''.'' + convert(char(10),getdate() - 7 , 120 )    
			select @physical_name = rtrim(upper(@PATH)) + rtrim(upper(@dev_name)) + ''.PM''    
			select @description = ''Daily 2nd Backup , '' + @DBNAME  + ''   '' + CONVERT(CHAR(20),GETDATE())    			
		  end 

		else if datepart(hour,getdate()) < 12 
		  begin
			select @dev_name = @@SERVERNAME + ''.'' + @DBNAME + '' '' + convert(char(10),getdate() , 120 )    
			select @dev_name_del = @@SERVERNAME + ''.'' + @DBNAME + '' '' + convert(char(10),getdate() - @gen , 120 )    
			select @physical_name = rtrim(upper(@PATH)) + rtrim(upper(@dev_name)) + ''.BAK''    
			select @description = ''Daily Backup , '' + @DBNAME  + ''   '' + CONVERT(CHAR(20),GETDATE())    
		  end 

     		else
		  begin
			select @dev_name = @@SERVERNAME + ''.'' + @DBNAME + ''.'' + convert(char(10),getdate() , 120 )    
			select @dev_name_del = @@SERVERNAME + ''.'' + @DBNAME + ''.'' + convert(char(10),getdate() - 1 , 120 )    
			select @physical_name = rtrim(upper(@PATH)) + rtrim(upper(@dev_name)) + ''.PMBAK''    
			select @description = ''Daily 2nd Backup , '' + @DBNAME  + ''   '' + CONVERT(CHAR(20),GETDATE())    			
		  end 

		if ( select count(*) from master.dbo.sysdevices where name = rtrim(@dev_name_del) ) > 0     
			EXEC sp_dropdevice @dev_name_del,''delfile''    
    
		if ( select count(*) from master.dbo.sysdevices where name = rtrim(@dev_name) ) = 0     
			EXEC sp_addumpdevice ''disk'' , @dev_name , @physical_name    
    
		BACKUP DATABASE @DBNAME TO @dev_name WITH INIT , NAME = @description , NOSKIP , NOFORMAT    
  
	end



' 
END
GO
/****** Object:  Table [dbo].[tmp_recover_user]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_recover_user]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_recover_user](
	[char_name] [nvarchar](60) NULL,
	[addedExp] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MakeBBSBoard]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MakeBBSBoard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_MakeBBSBoard    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_MakeBBSBoard
	Make BBS board
INPUT
	@board_name	nvarchar(20),
	@board_desc	nvarchar(50)
OUTPUT

return
made by
	young
date
	2002-10-16
********************************************/
CREATE PROCEDURE [dbo].[lin_MakeBBSBoard]
(
	@board_name	nvarchar(20),
	@board_desc	nvarchar(50)
)
AS

set nocount on

declare @ncount int
declare @table_name nvarchar(20)
declare @exec nvarchar(500)

set @table_name = ''bbs_'' + @board_name

select @ncount = count(*) from sysobjects (nolock) where name = @table_name
select @ncount
if @ncount = 0
begin

	set @exec = ''CREATE TABLE dbo.'' + @table_name + ''('' + char(13)
	set @exec = @exec + '' id int IDENTITY (1,1) NOT NULL, '' + char(13)
	set @exec = @exec + '' title nvarchar(100) NULL, '' + char(13)
	set @exec = @exec + '' contents nvarchar(3000) NULL, '' + char(13)
	set @exec = @exec + '' writer nvarchar(50) NULL, '' + char(13)
	set @exec = @exec + '' cdate datetime NOT NULL, '' + char(13)
	set @exec = @exec + '' nread int NOT NULL)  '' + char(13)
	exec (@exec)
	set @exec = ''ALTER TABLE dbo.'' + @table_name + '' WITH NOCHECK ADD'' + char(13)
	set @exec = @exec + ''CONSTRAINT PK_'' + @table_name + '' PRIMARY KEY CLUSTERED'' + char(13)
	set @exec = @exec + ''( '' + char(13)
	set @exec = @exec + ''id '' + char(13)
	set @exec = @exec + '')'' + char(13)
	exec (@exec)
	set @exec = ''ALTER TABLE dbo.'' + @table_name + '' WITH NOCHECK ADD'' + char(13)
	set @exec = @exec + ''CONSTRAINT DF_'' + @table_name + ''_cdate DEFAULT getdate() FOR cdate, '' + char(13)
	set @exec = @exec + ''CONSTRAINT DF_'' + @table_name + ''_nread DEFAULT 0 FOR nread '' + char(13)
	exec (@exec)

	insert into bbs_board(board_name, board_desc) values(@table_name, @board_desc)
end



' 
END
GO
/****** Object:  Table [dbo].[tmp_seed_dp]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_seed_dp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_seed_dp](
	[seed_id] [int] NULL,
	[dp] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MakeDailyWorldSnap]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MakeDailyWorldSnap]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'







/********************************************
lin_MakeDailyWorldSnap
Daily World DB Snap

#argument	@db_server	varchar(30)	name of database server
#argument	@user_id	varchar(30)	user id
#argument	@user_pass	varchar(30)	user password
#argument	@worldId	int		world id 
#return
#result_set
#remark
#example	lin_RPMakeDailyWorldSnap ''db_server'', ''gamma'', '''', 8
#history	create	zzangse		2005-03-03
#see lin_RPJoinSSQMember
#see lin_RPSSQSealSelection
#see lin_RPSnapSSQData
#see lin_RPSnapSSQJoinData
#see lin_RPSnapTimeAttackRecord
********************************************/

CREATE             PROCEDURE [dbo].[lin_MakeDailyWorldSnap]
	@db_server	varchar(30) ,
	@user_id	varchar(30),
	@user_pass	varchar(30),
	@worldId	int 
AS
SET NOCOUNT ON


declare @table_to varchar(60)
declare @sql varchar(512)

-----------------------------
-- exec DailyWorldSnaptSP --
-----------------------------

-- lin_RPJoinSSQMember
set @table_to =  ''RP_TBLJOINSSQMEMBER_'' + cast(@worldId as varchar)
exec lin_RPJoinSSQMember @db_server, @user_id, @user_pass, @table_to
waitfor delay ''0:0:6''


-- lin_RPSSQSealSelection
set @table_to =  ''RP_TBLSSQSEALSELECTION_'' + cast(@worldId as varchar)
exec lin_RPSSQSealSelection @db_server, @user_id, @user_pass, @table_to
waitfor delay ''0:0:6''

-- lin_RPSnapSSQData
set @table_to = ''RP_SNAPSSQDATA_'' + cast ( @worldId  as varchar )
exec lin_RPSnapSSQData @db_server, @user_id, @user_pass, @table_to
waitfor delay ''0:0:6''

-- lin_RPSnapSSQJoinData
set @table_to = ''RP_SNAPSSQJOINDATA_'' + cast ( @worldId as varchar )
exec lin_RPSnapSSQJoinData @db_server, @user_id, @user_pass, @table_to
waitfor delay ''0:0:6''

-- lin_RPSnapTimeAttackRecord
set @table_to = ''RP_SNAPTIMEATTACKRECORD_'' + cast (@worldId as varchar)
exec lin_RPSnapTimeAttackRecord @db_server, @user_id, @user_pass, @table_to
waitfor delay ''0:0:6''


' 
END
GO
/****** Object:  Table [dbo].[tmp_user_data]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_user_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_user_data](
	[char_name] [nvarchar](50) NOT NULL,
	[char_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[builder] [tinyint] NOT NULL,
	[gender] [tinyint] NOT NULL,
	[race] [tinyint] NOT NULL,
	[class] [tinyint] NOT NULL,
	[world] [smallint] NOT NULL,
	[SP] [int] NOT NULL,
	[EXP] [int] NOT NULL,
	[Lev] [tinyint] NOT NULL,
	[align] [int] NOT NULL,
	[PK] [int] NOT NULL,
	[PKpardon] [int] NOT NULL,
	[Duel] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[nickname] [nvarchar](50) NULL,
	[max_hp] [int] NOT NULL,
	[max_mp] [int] NOT NULL,
	[use_time] [int] NOT NULL,
	[drop_exp] [int] NOT NULL,
	[cp] [float] NOT NULL,
	[max_cp] [float] NOT NULL,
	[subjob_id] [int] NULL,
	[subjob0_class] [int] NOT NULL,
	[subjob1_class] [int] NOT NULL,
	[subjob2_class] [int] NOT NULL,
	[subjob3_class] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MakeSnapTable]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MakeSnapTable]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/******************************************************************************
#Name:	lin_MakeSnapTable
#Desc:	make tmp table for world snap shot of user_data, user_item, pledge, user_nobless

#Argument:
	Input:
	Output:	
#Return:
#Result Set:

#Remark:
#Example:	exec lin_MakeSnapTable
#See:

#History:
	Create	flagoftiger	2004-06-15
	Modify	btwinuni	2005-05-16	add: pledge
	MOdify	btwinuni	2005-09-29	add: user_nobless
******************************************************************************/
CREATE PROCEDURE [dbo].[lin_MakeSnapTable]

AS
SET NOCOUNT ON

declare @sql varchar(4000)

-- check table whether tmp_user_item is exists or not
set @sql = ''if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[tmp_user_item]'''') and objectproperty(id, N''''IsUserTable'''') = 1)''
	+ '' begin''
	+ '' drop table dbo.tmp_user_item''
	+ '' end''
exec (@sql)

-- user_item copy
set @sql = ''select item_id, char_id, item_type, amount, enchant, warehouse ''
	+ ''into tmp_user_item from user_item (nolock) where char_id > 0'' 
exec (@sql)



-- check table whether tmp_user_data is exists or not
set @sql = ''if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[tmp_user_data]'''') and objectproperty(id, N''''IsUserTable'''') = 1)''
	+ '' begin''
	+ '' drop table dbo.tmp_user_data''
	+ '' end''
exec (@sql)

-- user_data copy
set @sql = ''select char_name, char_id, account_name, account_id, pledge_id, builder, ''
	+ '' gender, race, class, world, SP, EXP, Lev, align, PK, PKpardon, Duel, create_date, ''
	+ '' login, logout, nickname, max_hp, max_mp, use_time, drop_exp, ''
	+ '' cp, max_cp, subjob_id, subjob0_class, subjob1_class, subjob2_class, subjob3_class ''		-- add by btwinuni 2005-09-29
	+ '' into tmp_user_data from user_data (nolock)'' 
exec (@sql)



-- check table whether tmp_pledge is exists or not
set @sql = ''if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[tmp_pledge]'''') and objectproperty(id, N''''IsUserTable'''') = 1)''
	+ '' begin''
	+ '' drop table dbo.tmp_pledge''
	+ '' end''
exec (@sql)

-- pledge copy
set @sql = ''select pledge_id, ruler_id, name, alliance_id, root_name_value, name_value, oust_time, skill_level,''
	+ '' castle_id, agit_id, rank, status, is_guilty, dismiss_reserved_time''
	+ '' into tmp_pledge from pledge (nolock)'' 
exec (@sql)



-- check table whether tmp_user_nobless is exists or not
set @sql = ''if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[tmp_user_nobless]'''') and objectproperty(id, N''''IsUserTable'''') = 1)''
	+ '' begin''
	+ '' drop table dbo.tmp_user_nobless''
	+ '' end''
exec (@sql)

-- user_nobless copy
set @sql = ''select char_id, nobless_type, hero_type, win_count, previous_point, olympiad_point, match_count, words''
	+ '' into tmp_user_nobless from user_nobless (nolock)'' 
exec (@sql)




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBBSBoard]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBBSBoard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetBBSBoard    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetBBSBoard
	Get BBS board Info
INPUT
	@board_id	int,
	@board_pagesize int
OUTPUT

return
made by
	young
date
	2002-10-21
********************************************/
CREATE PROCEDURE [dbo].[lin_GetBBSBoard]
(
	@board_id	int,
	@board_pagesize int
)
AS

set nocount on

declare @ncount int
declare @table_name nvarchar(20)
declare @exec nvarchar(200)

select @table_name = board_name from bbs_board (nolock) where board_id = @board_id

set @exec = ''select '''''' + @table_name + '''''' , (count(id) / '' + str(@board_pagesize) + '')+1 from '' + @table_name + '' (nolock)''
exec (@exec)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Lin_GetSummary]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Lin_GetSummary]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.Lin_GetSummary    Script Date: 2003-09-20 ?? 11:51:56 ******/
CREATE PROCEDURE [dbo].[Lin_GetSummary] 
AS

SET NOCOUNT ON

Select count(id) as Total from BBS_All



' 
END
GO
/****** Object:  Table [dbo].[tmp_user_item]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_user_item]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_user_item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[warehouse] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBbsTGSList]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBbsTGSList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetBbsTGSList    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_GetBbsTGSList] 
(
	@nPage	INT,
	@nLinesPerPage	INT
)
AS

SET NOCOUNT ON

declare @nTot int

If @nPage IS NULL or @nPage < 1 
BEGIN
	SET @nPage = 1
END

If @nLinesPerPage IS NULL or @nLinesPerPage < 1 
BEGIN
	SET @nLinesPerPage = 1
END

select @nTot = count(id) - 1 from bbs_tgs (nolock)

select 
	orderedTitle.id, orderedTitle.title, left(orderedTitle.writer, 8), left(orderedTitle.contents, 80), 
SUBSTRING(CONVERT(VARCHAR, orderedtitle.cdate, 20), 6, 11 ),  
(@nTot / @nLinesPerPage) + 1
from 
	(Select 
		count(bbs2.id) as cnt, bbs1.id, bbs1.title, bbs1.cdate, bbs1.writer, bbs1.contents
	from 
		Bbs_tgs as bbs1
		inner join
		Bbs_tgs as bbs2
		on bbs1.id <= bbs2.id
	group by 
		bbs1.id, bbs1.title, bbs1.cdate, bbs1.writer, bbs1.contents
	) as orderedTitle
where 
	orderedTitle.cnt > (@nPage - 1) * @nLinesPerPage and orderedTitle.cnt <= @nPage * @nLinesPerPage
ORDER BY 
	orderedTitle.cnt ASC




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DBCC]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SP_DBCC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[SP_DBCC]

AS  

DECLARE @JOBKIND VARCHAR(20)
DECLARE @ST_TIME DATETIME  
DECLARE @EN_TIME DATETIME  
DECLARE @ST_SIZE  INT  
DECLARE @END_SIZE  INT  

SELECT @ST_SIZE=0, @END_SIZE=0  


--==========================================
SELECT @JOBKIND = ''CLEANUP''
BEGIN
	SELECT @ST_TIME=getdate()  
	--1.  ?? ?? ITEM ??
	EXEC lin_DeleteNotOwnedItem  
	--2. GHOST ??? ??
	EXEC lin_CleanUpGhostData
	SELECT @EN_TIME=getdate()
	
	INSERT lin2audit..dbcc_history  
		SELECT hostname,loginame,@JOBKIND,@ST_TIME,@EN_TIME,datediff(minute,@ST_TIME,@EN_TIME),@ST_SIZE,@END_SIZE  
		FROM master.dbo.sysprocesses 
		WHERE spid = @@spid
END
--==========================================

--==========================================   
SELECT @JOBKIND = ''CHECKDB''  
BEGIN  
	SELECT @ST_TIME=getdate()  
	DBCC CHECKDB(''lin2world'')
	SELECT @EN_TIME=getdate()  

	INSERT lin2audit..dbcc_history  
		SELECT hostname,loginame,@JOBKIND,@ST_TIME,@EN_TIME,datediff(minute,@ST_TIME,@EN_TIME),@ST_SIZE,@END_SIZE  
		FROM master.dbo.sysprocesses 
		WHERE spid = @@spid
END
--==========================================

--==========================================  
SELECT @JOBKIND = ''reindex''  
BEGIN  
	SELECT @ST_SIZE=sum(dpages)*8/1024 from sysindexes where id = object_id(''user_item'')  
	SELECT @ST_TIME=getdate()  
	DBCC DBREINDEX(''user_item'','''',90)  
	SELECT @EN_TIME=getdate()  
	SELECT @END_SIZE=sum(dpages)*8/1024 from sysindexes where id = object_id(''user_item'')  

	INSERT lin2audit..dbcc_history  
		SELECT hostname,loginame,@JOBKIND,@ST_TIME,@EN_TIME,datediff(minute,@ST_TIME,@EN_TIME),@ST_SIZE,@END_SIZE  
		FROM master.dbo.sysprocesses 
		WHERE spid = @@spid
END  
--==========================================


' 
END
GO
/****** Object:  Table [dbo].[tmp_user_nobless]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tmp_user_nobless]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tmp_user_nobless](
	[char_id] [int] NOT NULL,
	[nobless_type] [tinyint] NULL,
	[hero_type] [tinyint] NULL,
	[win_count] [int] NULL,
	[previous_point] [int] NULL,
	[olympiad_point] [int] NULL,
	[match_count] [int] NULL,
	[words] [varchar](128) NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBbsallList]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBbsallList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetBbsallList    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_GetBbsallList] 
(
	@nPage	INT,
	@nLinesPerPage	INT
)
AS

SET NOCOUNT ON

If @nPage IS NULL or @nPage < 1 
BEGIN
	SET @nPage = 1
END

If @nLinesPerPage IS NULL or @nLinesPerPage < 1 
BEGIN
	SET @nLinesPerPage = 1
END

select 
	orderedTitle.id, orderedTitle.title, cast(datepart(month, orderedtitle.cdate) as varchar) +''/'' +  cast(datepart(day, orderedtitle.cdate) as varchar) + '' '' + cast(datepart(hour, orderedtitle.cdate) as varchar) + '':'' + cast(datepart(minute, orderedtitle.cdate) as varchar)
from 
	(Select 
		count(bbs2.id) as cnt, bbs1.id, bbs1.title, bbs1.cdate
	from 
		Bbs_all as bbs1
		inner join
		Bbs_all as bbs2
		on bbs1.id <= bbs2.id
	group by 
		bbs1.id, bbs1.title, bbs1.cdate
	) as orderedTitle
where 
	orderedTitle.cnt > (@nPage - 1) * @nLinesPerPage and orderedTitle.cnt <= @nPage * @nLinesPerPage
ORDER BY 
	orderedTitle.cnt ASC



' 
END
GO
/****** Object:  Table [dbo].[user_ActiveSkill]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_ActiveSkill]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_ActiveSkill](
	[char_id] [int] NOT NULL,
	[s1] [int] NULL,
	[l1] [int] NULL,
	[d1] [int] NULL,
	[s2] [int] NULL,
	[l2] [int] NULL,
	[d2] [int] NULL,
	[s3] [int] NULL,
	[l3] [int] NULL,
	[d3] [int] NULL,
	[s4] [int] NULL,
	[l4] [int] NULL,
	[d4] [int] NULL,
	[s5] [int] NULL,
	[l5] [int] NULL,
	[d5] [int] NULL,
	[s6] [int] NULL,
	[l6] [int] NULL,
	[d6] [int] NULL,
	[s7] [int] NULL,
	[l7] [int] NULL,
	[d7] [int] NULL,
	[s8] [int] NULL,
	[l8] [int] NULL,
	[d8] [int] NULL,
	[s9] [int] NULL,
	[l9] [int] NULL,
	[d9] [int] NULL,
	[s10] [int] NULL,
	[l10] [int] NULL,
	[d10] [int] NULL,
	[s11] [int] NULL,
	[l11] [int] NULL,
	[d11] [int] NULL,
	[s12] [int] NULL,
	[l12] [int] NULL,
	[d12] [int] NULL,
	[s13] [int] NULL,
	[l13] [int] NULL,
	[d13] [int] NULL,
	[s14] [int] NULL,
	[l14] [int] NULL,
	[d14] [int] NULL,
	[s15] [int] NULL,
	[l15] [int] NULL,
	[d15] [int] NULL,
	[s16] [int] NULL,
	[l16] [int] NULL,
	[d16] [int] NULL,
	[s17] [int] NULL,
	[l17] [int] NULL,
	[d17] [int] NULL,
	[s18] [int] NULL,
	[l18] [int] NULL,
	[d18] [int] NULL,
	[s19] [int] NULL,
	[l19] [int] NULL,
	[d19] [int] NULL,
	[s20] [int] NULL,
	[l20] [int] NULL,
	[d20] [int] NULL,
	[c1] [tinyint] NULL,
	[c2] [tinyint] NULL,
	[c3] [tinyint] NULL,
	[c4] [tinyint] NULL,
	[c5] [tinyint] NULL,
	[c6] [tinyint] NULL,
	[c7] [tinyint] NULL,
	[c8] [tinyint] NULL,
	[c9] [tinyint] NULL,
	[c10] [tinyint] NULL,
	[c11] [tinyint] NULL,
	[c12] [tinyint] NULL,
	[c13] [tinyint] NULL,
	[c14] [tinyint] NULL,
	[c15] [tinyint] NULL,
	[c16] [tinyint] NULL,
	[c17] [tinyint] NULL,
	[c18] [tinyint] NULL,
	[c19] [tinyint] NULL,
	[c20] [tinyint] NULL,
	[s21] [int] NULL,
	[l21] [int] NULL,
	[d21] [int] NULL,
	[s22] [int] NULL,
	[l22] [int] NULL,
	[d22] [int] NULL,
	[s23] [int] NULL,
	[l23] [int] NULL,
	[d23] [int] NULL,
	[s24] [int] NULL,
	[l24] [int] NULL,
	[d24] [int] NULL,
	[s25] [int] NULL,
	[l25] [int] NULL,
	[d25] [int] NULL,
	[s26] [int] NULL,
	[l26] [int] NULL,
	[d26] [int] NULL,
	[s27] [int] NULL,
	[l27] [int] NULL,
	[d27] [int] NULL,
	[s28] [int] NULL,
	[l28] [int] NULL,
	[d28] [int] NULL,
	[s29] [int] NULL,
	[l29] [int] NULL,
	[d29] [int] NULL,
	[s30] [int] NULL,
	[l30] [int] NULL,
	[d30] [int] NULL,
	[s31] [int] NULL,
	[l31] [int] NULL,
	[d31] [int] NULL,
	[s32] [int] NULL,
	[l32] [int] NULL,
	[d32] [int] NULL,
	[s33] [int] NULL,
	[l33] [int] NULL,
	[d33] [int] NULL,
	[s34] [int] NULL,
	[l34] [int] NULL,
	[d34] [int] NULL,
	[s35] [int] NULL,
	[l35] [int] NULL,
	[d35] [int] NULL,
	[s36] [int] NULL,
	[l36] [int] NULL,
	[d36] [int] NULL,
	[s37] [int] NULL,
	[l37] [int] NULL,
	[d37] [int] NULL,
	[s38] [int] NULL,
	[l38] [int] NULL,
	[d38] [int] NULL,
	[s39] [int] NULL,
	[l39] [int] NULL,
	[d39] [int] NULL,
	[s40] [int] NULL,
	[l40] [int] NULL,
	[d40] [int] NULL,
	[c21] [int] NULL,
	[c22] [int] NULL,
	[c23] [int] NULL,
	[c24] [int] NULL,
	[c25] [int] NULL,
	[c26] [int] NULL,
	[c27] [int] NULL,
	[c28] [int] NULL,
	[c29] [int] NULL,
	[c30] [int] NULL,
	[c31] [int] NULL,
	[c32] [int] NULL,
	[c33] [int] NULL,
	[c34] [int] NULL,
	[c35] [int] NULL,
	[c36] [int] NULL,
	[c37] [int] NULL,
	[c38] [int] NULL,
	[c39] [int] NULL,
	[c40] [int] NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_user_ActiveSkill]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_ActiveSkill]') AND name = N'idx_user_ActiveSkill')
CREATE NONCLUSTERED INDEX [idx_user_ActiveSkill] ON [dbo].[user_ActiveSkill] 
(
	[char_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_user_ActiveSkill]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_ActiveSkill]') AND name = N'IX_user_ActiveSkill')
CREATE UNIQUE NONCLUSTERED INDEX [IX_user_ActiveSkill] ON [dbo].[user_ActiveSkill] 
(
	[char_id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TranLogBackup]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TranLogBackup]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROC [dbo].[TranLogBackup]
	@DBNAME varchar(20)
AS

--==================================================================================
--?? ?? ??
	DECLARE 
		@query varchar(1000),
		@cur_hour tinyint,
		@del_hour tinyint,
		@cur_device varchar(50),
		@del_device varchar(50),
		@description varchar(48),
		@physical_name  varchar(64)  
		

--==================================================================================
--?? ?? ??
	SET @cur_hour = datepart(hour,getdate())
	SET @del_hour = datepart( hour,dateadd(hour,-24,getdate())) 

--==================================================================================
--???? 
	IF @cur_hour = 6 --full backup ?? ??
		RETURN


	SET @cur_device = @@servername + ''_'' + @DBNAME + ''_tlog_'' + CONVERT(char(8),getdate(),112) + ''_'' 
	SET @del_device = @@servername + ''_'' + @DBNAME + ''_tlog_'' + CONVERT(char(8),dateadd(hour,-24,getdate()),112) + ''_'' 
	SET @description = ''Log Hourly Backup , '' + @DBNAME  + ''  '' + CONVERT(CHAR(16),GETDATE(),20)  

	
	IF @cur_hour < 10
		SET @cur_device = @cur_device + ''0'' + convert(char(1),@cur_hour) 
	ELSE
		SET @cur_device = @cur_device + convert(char(2),@cur_hour)


	IF @del_hour < 10
		SET @del_device = @del_device + ''0'' + convert(char(1),@del_hour) 
	ELSE
		SET @del_device = @del_device + convert(char(2),@del_hour)

	SET @physical_name = ''D:\MSSQL\BACKUP\'' + @cur_device + ''.tbak''

	PRINT ''cur_device : '' + @cur_device
	PRINT ''del_device : '' + @del_device
	PRINT ''physical_name : '' + @physical_name
	

--==================================================================================
--12 ?? ??? device? ????.
	IF ( select count(*) from master.dbo.sysdevices where name = rtrim(@del_device) ) = 1
		EXEC sp_dropdevice @del_device,''delfile''    


--==================================================================================
--dump device? ????.
	IF ( select count(*) from master.dbo.sysdevices where name = rtrim(@cur_device) ) = 0   
		EXEC sp_addumpdevice ''disk'' , @cur_device , @physical_name  


--==================================================================================
--transaction log ? ?????.
	SET @query = ''BACKUP LOG '' + @DBNAME + '' TO '' + @cur_device
	PRINT @query
	EXECUTE(@query)



' 
END
GO
/****** Object:  Table [dbo].[user_ban]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_ban]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_ban](
	[char_id] [int] NOT NULL,
	[status] [int] NULL CONSTRAINT [DF_user_ban_status]  DEFAULT ((0)),
	[ban_date] [datetime] NULL CONSTRAINT [DF_user_ban_ban_date]  DEFAULT (getdate()),
	[ban_hour] [smallint] NULL CONSTRAINT [DF_user_ban_ban_hour]  DEFAULT ((0)),
	[ban_end] [int] NULL CONSTRAINT [DF_user_ban_ban_end]  DEFAULT ((0)),
 CONSTRAINT [PK_user_ban] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_blocklist]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_blocklist]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_blocklist](
	[char_id] [int] NOT NULL,
	[block_char_id] [int] NOT NULL,
	[block_char_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_blocklist] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[block_char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_comment]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_comment]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_comment](
	[char_name] [nvarchar](50) NULL,
	[char_id] [int] NULL,
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](200) NULL,
	[comment_date] [datetime] NULL CONSTRAINT [DF_user_comment_comment_date]  DEFAULT (getdate()),
	[writer] [nvarchar](50) NULL,
	[deleted] [tinyint] NULL CONSTRAINT [DF_user_comment_deleted]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_comment]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_comment]') AND name = N'IX_user_comment')
CREATE CLUSTERED INDEX [IX_user_comment] ON [dbo].[user_comment] 
(
	[char_id] ASC,
	[deleted] ASC,
	[comment_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_user_comment_1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_comment]') AND name = N'IX_user_comment_1')
CREATE NONCLUSTERED INDEX [IX_user_comment_1] ON [dbo].[user_comment] 
(
	[comment_id] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_data]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_data](
	[char_name] [nvarchar](50) NOT NULL,
	[char_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL CONSTRAINT [DF_user_data_pledge_id]  DEFAULT ((0)),
	[builder] [tinyint] NOT NULL CONSTRAINT [DF_user_data_builder]  DEFAULT ((0)),
	[gender] [tinyint] NOT NULL,
	[race] [tinyint] NOT NULL,
	[class] [tinyint] NOT NULL,
	[world] [smallint] NOT NULL,
	[xloc] [int] NOT NULL,
	[yloc] [int] NOT NULL,
	[zloc] [int] NOT NULL,
	[IsInVehicle] [smallint] NOT NULL CONSTRAINT [DF_user_data_IsInVehicle]  DEFAULT ((0)),
	[HP] [float] NOT NULL,
	[MP] [float] NOT NULL,
	[SP] [int] NOT NULL CONSTRAINT [DF_user_data_SP]  DEFAULT ((0)),
	[Exp] [bigint] NOT NULL,
	[Lev] [tinyint] NOT NULL,
	[align] [int] NOT NULL,
	[PK] [int] NOT NULL CONSTRAINT [DF_user_data_PK]  DEFAULT ((0)),
	[PKpardon] [int] NOT NULL CONSTRAINT [DF_user_data_PKpardon]  DEFAULT ((0)),
	[Duel] [int] NOT NULL CONSTRAINT [DF_user_data_Dual]  DEFAULT ((0)),
	[ST_underware] [int] NOT NULL CONSTRAINT [DF_user_data_ST_underware]  DEFAULT ((0)),
	[ST_right_ear] [int] NOT NULL CONSTRAINT [DF_user_data_ST_right_ear]  DEFAULT ((0)),
	[ST_left_ear] [int] NOT NULL CONSTRAINT [DF_user_data_ST_left_ear]  DEFAULT ((0)),
	[ST_neck] [int] NOT NULL CONSTRAINT [DF_user_data_ST_neck]  DEFAULT ((0)),
	[ST_right_finger] [int] NOT NULL CONSTRAINT [DF_user_data_ST_right_finger]  DEFAULT ((0)),
	[ST_left_finger] [int] NOT NULL CONSTRAINT [DF_user_data_ST_left_finger]  DEFAULT ((0)),
	[ST_head] [int] NOT NULL CONSTRAINT [DF_user_data_ST_head]  DEFAULT ((0)),
	[ST_right_hand] [int] NOT NULL CONSTRAINT [DF_user_data_ST_right_hand]  DEFAULT ((0)),
	[ST_left_hand] [int] NOT NULL CONSTRAINT [DF_user_data_ST_left_hand]  DEFAULT ((0)),
	[ST_gloves] [int] NOT NULL CONSTRAINT [DF_user_data_ST_gloves]  DEFAULT ((0)),
	[ST_chest] [int] NOT NULL CONSTRAINT [DF_user_data_ST_chest]  DEFAULT ((0)),
	[ST_legs] [int] NOT NULL CONSTRAINT [DF_user_data_ST_legs]  DEFAULT ((0)),
	[ST_feet] [int] NOT NULL CONSTRAINT [DF_user_data_ST_feet]  DEFAULT ((0)),
	[ST_back] [int] NOT NULL CONSTRAINT [DF_user_data_ST_back]  DEFAULT ((0)),
	[ST_both_hand] [int] NOT NULL CONSTRAINT [DF_user_data_ST_both_hand]  DEFAULT ((0)),
	[create_date] [datetime] NOT NULL CONSTRAINT [DF_user_data_create_date]  DEFAULT (getdate()),
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[quest_flag] [binary](32) NOT NULL CONSTRAINT [DF_user_data_quest_flag]  DEFAULT (0x00),
	[nickname] [nvarchar](50) NULL,
	[power_flag] [binary](32) NOT NULL CONSTRAINT [DF_user_data_power_flag]  DEFAULT (0x0000000000000000000000000000000000000000000000000000000000000000),
	[pledge_dismiss_time] [int] NOT NULL CONSTRAINT [DF_user_data_pledge_manage_time]  DEFAULT ((0)),
	[pledge_leave_time] [int] NOT NULL CONSTRAINT [DF_user_data_pledge_leave_time]  DEFAULT ((0)),
	[pledge_leave_status] [tinyint] NOT NULL CONSTRAINT [DF_user_data_pledge_leave_status]  DEFAULT ((0)),
	[max_hp] [int] NOT NULL CONSTRAINT [DF_user_data_max_hp]  DEFAULT ((0)),
	[max_mp] [int] NOT NULL CONSTRAINT [DF_user_data_max_mp]  DEFAULT ((0)),
	[quest_memo] [char](32) NULL,
	[face_index] [int] NOT NULL CONSTRAINT [DF_user_data_face_index]  DEFAULT ((0)),
	[hair_shape_index] [int] NOT NULL CONSTRAINT [DF_user_data_hair_shape_index]  DEFAULT ((0)),
	[hair_color_index] [int] NOT NULL CONSTRAINT [DF_user_data_hair_color_index]  DEFAULT ((0)),
	[use_time] [int] NOT NULL CONSTRAINT [DF_user_data_use_time]  DEFAULT ((0)),
	[temp_delete_date] [smalldatetime] NULL,
	[pledge_ousted_time] [int] NOT NULL CONSTRAINT [DF_user_data_pledge_ousted_time]  DEFAULT ((0)),
	[pledge_withdraw_time] [int] NOT NULL CONSTRAINT [DF_user_data_plwdge_withdraw_time]  DEFAULT ((0)),
	[surrender_war_id] [int] NOT NULL CONSTRAINT [DF_user_data_surrender_war_id]  DEFAULT ((0)),
	[drop_exp] [int] NOT NULL CONSTRAINT [DF_user_data_drop_exp]  DEFAULT ((0)),
	[old_x] [int] NULL,
	[old_y] [int] NULL,
	[old_z] [int] NULL,
	[subjob_id] [int] NULL,
	[ssq_dawn_round] [int] NULL,
	[cp] [float] NOT NULL CONSTRAINT [DF__user_data__cp__3B969E48]  DEFAULT ((0)),
	[max_cp] [float] NOT NULL CONSTRAINT [DF__user_data__max_c__3C8AC281]  DEFAULT ((0)),
	[ST_hair] [int] NOT NULL CONSTRAINT [DF__user_data__ST_ha__3D7EE6BA]  DEFAULT ((0)),
	[subjob0_class] [int] NOT NULL CONSTRAINT [DF__user_data__subjo__38B00FFC]  DEFAULT ((-1)),
	[subjob1_class] [int] NOT NULL CONSTRAINT [DF__user_data__subjo__39A43435]  DEFAULT ((-1)),
	[subjob2_class] [int] NOT NULL CONSTRAINT [DF__user_data__subjo__3A98586E]  DEFAULT ((-1)),
	[subjob3_class] [int] NOT NULL CONSTRAINT [DF__user_data__subjo__3B8C7CA7]  DEFAULT ((-1)),
	[wedding] [int] NULL,
	[division] [int] NOT NULL DEFAULT ((0)),
	[pledge_group] [int] NOT NULL DEFAULT ((0)),
	[AcademyLev] [int] NOT NULL DEFAULT ((0)),
	[KarmaOrig] [int] NOT NULL DEFAULT ((0)),
	[PKdiff] [int] NOT NULL DEFAULT ((0)),
	[ST_face] [int] NOT NULL DEFAULT ((0)),
	[CursedTimeEquip] [int] NOT NULL DEFAULT ((0)),
	[TitleColor] [int] NULL,
	[WeddingTelTime] [int] NOT NULL DEFAULT ((0)),
	[SponsorId] [int] NOT NULL DEFAULT ((0)),
	[ST_left_bracelet] [int] NOT NULL DEFAULT ((0)),
	[ST_right_bracelet] [int] NOT NULL DEFAULT ((0)),
	[ST_hairall] [int] NOT NULL DEFAULT ((0)),
	[ST_agathon] [int] NOT NULL DEFAULT ((0)),
	[souls] [int] NOT NULL DEFAULT ((0)),
	[transformation_id] [int] NOT NULL DEFAULT ((0)),
	[talisman1] [int] NOT NULL DEFAULT ((0)),
	[talisman2] [int] NOT NULL DEFAULT ((0)),
	[talisman3] [int] NOT NULL DEFAULT ((0)),
	[talisman4] [int] NOT NULL DEFAULT ((0)),
	[talisman5] [int] NOT NULL DEFAULT ((0)),
	[talisman6] [int] NOT NULL DEFAULT ((0)),
	[c1] [int] NULL DEFAULT ((0)),
	[c2] [int] NULL DEFAULT ((0)),
	[c3] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_user_data] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_user_data_1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_data]') AND name = N'idx_user_data_1')
CREATE NONCLUSTERED INDEX [idx_user_data_1] ON [dbo].[user_data] 
(
	[account_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_user_data_account_name]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_data]') AND name = N'idx_user_data_account_name')
CREATE NONCLUSTERED INDEX [idx_user_data_account_name] ON [dbo].[user_data] 
(
	[account_name] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_user_data_pledge]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_data]') AND name = N'idx_user_data_pledge')
CREATE NONCLUSTERED INDEX [idx_user_data_pledge] ON [dbo].[user_data] 
(
	[pledge_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_user_data1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_data]') AND name = N'idx_user_data1')
CREATE UNIQUE NONCLUSTERED INDEX [idx_user_data1] ON [dbo].[user_data] 
(
	[char_name] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_data_moved]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_data_moved]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_data_moved](
	[char_name] [nvarchar](50) NOT NULL,
	[char_id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[builder] [tinyint] NOT NULL,
	[gender] [tinyint] NOT NULL,
	[race] [tinyint] NOT NULL,
	[class] [tinyint] NOT NULL,
	[world] [smallint] NOT NULL,
	[xloc] [int] NOT NULL,
	[yloc] [int] NOT NULL,
	[zloc] [int] NOT NULL,
	[IsInVehicle] [smallint] NOT NULL,
	[HP] [float] NOT NULL,
	[MP] [float] NOT NULL,
	[SP] [int] NOT NULL,
	[Exp] [int] NOT NULL,
	[Lev] [tinyint] NOT NULL,
	[align] [int] NOT NULL,
	[PK] [int] NOT NULL,
	[PKpardon] [int] NOT NULL,
	[Duel] [int] NOT NULL,
	[ST_underware] [int] NOT NULL,
	[ST_right_ear] [int] NOT NULL,
	[ST_left_ear] [int] NOT NULL,
	[ST_neck] [int] NOT NULL,
	[ST_right_finger] [int] NOT NULL,
	[ST_left_finger] [int] NOT NULL,
	[ST_head] [int] NOT NULL,
	[ST_right_hand] [int] NOT NULL,
	[ST_left_hand] [int] NOT NULL,
	[ST_gloves] [int] NOT NULL,
	[ST_chest] [int] NOT NULL,
	[ST_legs] [int] NOT NULL,
	[ST_feet] [int] NOT NULL,
	[ST_back] [int] NOT NULL,
	[ST_both_hand] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[quest_flag] [binary](32) NOT NULL,
	[nickname] [nvarchar](50) NULL,
	[power_flag] [binary](32) NOT NULL,
	[pledge_dismiss_time] [int] NOT NULL,
	[pledge_leave_time] [int] NOT NULL,
	[pledge_leave_status] [tinyint] NOT NULL,
	[max_hp] [int] NOT NULL,
	[max_mp] [int] NOT NULL,
	[quest_memo] [char](32) NULL,
	[face_index] [int] NOT NULL,
	[hair_shape_index] [int] NOT NULL,
	[hair_color_index] [int] NOT NULL,
	[use_time] [int] NOT NULL,
	[temp_delete_date] [smalldatetime] NULL,
	[pledge_ousted_time] [int] NOT NULL,
	[pledge_withdraw_time] [int] NOT NULL,
	[surrender_war_id] [int] NOT NULL,
	[drop_exp] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_data_temp]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_data_temp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_data_temp](
	[char_name] [nvarchar](50) NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NOT NULL,
	[pledge_id] [int] NOT NULL,
	[builder] [tinyint] NOT NULL,
	[gender] [tinyint] NOT NULL,
	[race] [tinyint] NOT NULL,
	[class] [tinyint] NOT NULL,
	[world] [smallint] NOT NULL,
	[xloc] [int] NOT NULL,
	[yloc] [int] NOT NULL,
	[zloc] [int] NOT NULL,
	[IsInVehicle] [smallint] NOT NULL,
	[HP] [float] NOT NULL,
	[MP] [float] NOT NULL,
	[SP] [int] NOT NULL,
	[Exp] [int] NOT NULL,
	[Lev] [tinyint] NOT NULL,
	[align] [int] NOT NULL,
	[PK] [int] NOT NULL,
	[PKpardon] [int] NOT NULL,
	[Duel] [int] NOT NULL,
	[ST_underware] [int] NOT NULL,
	[ST_right_ear] [int] NOT NULL,
	[ST_left_ear] [int] NOT NULL,
	[ST_neck] [int] NOT NULL,
	[ST_right_finger] [int] NOT NULL,
	[ST_left_finger] [int] NOT NULL,
	[ST_head] [int] NOT NULL,
	[ST_right_hand] [int] NOT NULL,
	[ST_left_hand] [int] NOT NULL,
	[ST_gloves] [int] NOT NULL,
	[ST_chest] [int] NOT NULL,
	[ST_legs] [int] NOT NULL,
	[ST_feet] [int] NOT NULL,
	[ST_back] [int] NOT NULL,
	[ST_both_hand] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[quest_flag] [binary](32) NOT NULL,
	[nickname] [nvarchar](50) NULL,
	[power_flag] [binary](32) NOT NULL,
	[pledge_dismiss_time] [int] NOT NULL,
	[pledge_leave_time] [int] NOT NULL,
	[pledge_leave_status] [tinyint] NOT NULL,
	[max_hp] [int] NOT NULL,
	[max_mp] [int] NOT NULL,
	[quest_memo] [char](32) NULL,
	[face_index] [int] NOT NULL,
	[hair_shape_index] [int] NOT NULL,
	[hair_color_index] [int] NOT NULL,
	[use_time] [int] NOT NULL,
	[temp_delete_date] [smalldatetime] NULL,
	[pledge_ousted_time] [int] NOT NULL,
	[pledge_withdraw_time] [int] NOT NULL,
	[surrender_war_id] [int] NOT NULL,
	[drop_exp] [int] NOT NULL,
	[old_x] [int] NULL,
	[old_y] [int] NULL,
	[old_z] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_deleted]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_deleted]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_deleted](
	[char_id] [int] NOT NULL,
	[delete_date] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModSubJobClass]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModSubJobClass]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_ModSubJobClass
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@class		int
OUTPUT
return
made by
	kks
date
	2005-01-18
	2005-09-07	modified by btwinuni
********************************************/
CREATE PROCEDURE [dbo].[lin_ModSubJobClass]
(
	@char_id	int,
	@subjob_id	int,
	@class		int
)
AS
SET NOCOUNT ON

--update user_subjob set class=@class where char_id = @char_id and subjob_id = @subjob_id
declare @sql varchar(1000)
set @sql = ''update user_data ''
	+ '' set subjob'' + cast(@subjob_id as varchar) + ''_class = '' + cast(@class as varchar)
	+ '' where char_id = '' + cast(@char_id as varchar)
exec (@sql)





' 
END
GO
/****** Object:  Table [dbo].[user_friend]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_friend]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_friend](
	[char_id] [int] NOT NULL,
	[friend_char_id] [int] NOT NULL,
	[friend_char_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_friend] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[friend_char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_henna]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_henna]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_henna](
	[char_id] [int] NOT NULL,
	[henna_1] [int] NOT NULL CONSTRAINT [DF_user_henna_henna_1]  DEFAULT ((0)),
	[henna_2] [int] NOT NULL CONSTRAINT [DF_user_henna_henna_2]  DEFAULT ((0)),
	[henna_3] [int] NOT NULL CONSTRAINT [DF_user_henna_henna_3]  DEFAULT ((0)),
	[subjob_id] [int] NULL,
 CONSTRAINT [PK_user_henna] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetDefaultBuilder]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetDefaultBuilder]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetDefaultBuilder    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetDefaultBuilder
	Get default builder level of account
INPUT
	@account_name	nvarchar(50)
OUTPUT
return
made by
	young
date
	2002-11-26
********************************************/
CREATE PROCEDURE [dbo].[lin_GetDefaultBuilder]
(
@account_name	nvarchar(50)
)
AS
SET NOCOUNT ON

select default_builder from account_builder (nolock) where account_name = @account_name



' 
END
GO
/****** Object:  Table [dbo].[user_history]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_history]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_history](
	[char_name] [nvarchar](50) NOT NULL,
	[char_id] [int] NOT NULL,
	[log_date] [datetime] NOT NULL CONSTRAINT [DF_user_history_log_date]  DEFAULT (getdate()),
	[log_action] [tinyint] NOT NULL,
	[account_name] [nvarchar](50) NULL,
	[create_date] [datetime] NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_history]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_history]') AND name = N'IX_user_history')
CREATE NONCLUSTERED INDEX [IX_user_history] ON [dbo].[user_history] 
(
	[char_name] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_item]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_item]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_item](
	[item_id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[char_id] [int] NOT NULL,
	[item_type] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[eroded] [int] NOT NULL,
	[bless] [int] NOT NULL,
	[ident] [int] NOT NULL,
	[wished] [tinyint] NOT NULL CONSTRAINT [DF_user_item_wished]  DEFAULT ((0)),
	[warehouse] [int] NOT NULL,
	[attack_attr_type] [tinyint] NOT NULL DEFAULT ((254)),
	[attack_attr_value] [int] NOT NULL DEFAULT ((0)),
	[def_attr_fire] [int] NOT NULL DEFAULT ((0)),
	[def_attr_water] [int] NOT NULL DEFAULT ((0)),
	[def_attr_wind] [int] NOT NULL DEFAULT ((0)),
	[def_attr_earth] [int] NOT NULL DEFAULT ((0)),
	[def_attr_holy] [int] NOT NULL DEFAULT ((0)),
	[def_attr_unholy] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [pk_user_item] PRIMARY KEY NONCLUSTERED 
(
	[item_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_user_item_charid]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_item]') AND name = N'idx_user_item_charid')
CREATE CLUSTERED INDEX [idx_user_item_charid] ON [dbo].[user_item] 
(
	[char_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_item_type]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_item]') AND name = N'idx_item_type')
CREATE NONCLUSTERED INDEX [idx_item_type] ON [dbo].[user_item] 
(
	[item_type] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_useritem_ware]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_item]') AND name = N'idx_useritem_ware')
CREATE NONCLUSTERED INDEX [idx_useritem_ware] ON [dbo].[user_item] 
(
	[warehouse] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_warehouse]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_item]') AND name = N'idx_warehouse')
CREATE NONCLUSTERED INDEX [idx_warehouse] ON [dbo].[user_item] 
(
	[warehouse] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_journal]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_journal]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_journal](
	[char_id] [int] NOT NULL,
	[type] [smallint] NOT NULL,
	[int_data_1] [int] NULL,
	[int_data_2] [int] NULL,
	[log_data] [smalldatetime] NOT NULL CONSTRAINT [DF_user_journal_log_data]  DEFAULT (getdate()),
	[play_time] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_log]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_log](
	[char_id] [int] NULL,
	[log_id] [tinyint] NULL,
	[log_date] [datetime] NULL CONSTRAINT [DF_user_log_log_date]  DEFAULT (getdate()),
	[log_from] [int] NULL,
	[log_to] [int] NULL,
	[use_time] [int] NULL,
	[subjob_id] [int] NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_log]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_log]') AND name = N'IX_user_log')
CREATE CLUSTERED INDEX [IX_user_log] ON [dbo].[user_log] 
(
	[char_id] ASC,
	[log_id] ASC,
	[log_to] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharCopyChar]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharCopyChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[lin_MoveCharCopyChar]
(
	@world_id	varchar(5)
)
AS


declare @sql varchar(1024)
declare @conn_str varchar(256)

set @conn_str = ''10.10.12.'' + @world_id + '''''';''''gamma'''';''''lineage2pwd''


set @sql = '' insert into req_charmove ( old_char_name, old_char_id, account_name, account_id,  old_world_id, new_world_id, new_char_name ) select R1.char_name, char_id, account_name, account_id, '' + @world_id + '' , 100, R1.char_name + ''''-'' + @world_id + ''''''   from ( select * from ''
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '''' select char_id, char_name, account_id, account_name from lin2world.dbo.user_data (nolock)  '''' ) )  as R1 ''
	+ '' left join ( select * from req_char (nolock) where server_id = '' + @world_id + '' ) as R2 ''
	+ '' on R1.char_name = R2.char_name ''
	+ '' where server_id is not null ''
exec ( @sql )



' 
END
GO
/****** Object:  Table [dbo].[user_macro]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_macro]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_macro](
	[macro_id] [int] IDENTITY(1,1) NOT NULL,
	[char_id] [int] NULL,
	[macro_name] [nvarchar](64) NULL,
	[macro_tooltip] [nvarchar](64) NULL,
	[macro_iconname] [nvarchar](64) NULL,
	[macro_icontype] [int] NULL,
 CONSTRAINT [IX_user_macro] UNIQUE CLUSTERED 
(
	[char_id] ASC,
	[macro_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharCopyPledge]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharCopyPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_MoveCharCopyPledge]
(
	@world_id	varchar(5)
)
AS


declare @sql varchar(1024)
declare @conn_str varchar(256)

set @conn_str = ''10.10.12.'' + @world_id + '''''';''''gamma'''';''''lineage2pwd''

set @sql = '' insert into req_charmove ( old_char_name, old_char_id, account_name, account_id,  old_world_id, new_world_id, new_char_name ) select R1.char_name, char_id, account_name, account_id, '' + @world_id + '' , 100, R1.char_name + ''''-'' + @world_id + ''''''   from ( select * from ''
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '''' select pledge_id, char_id, char_name, account_id, account_name from lin2world.dbo.user_data (nolock) where account_id > 0  '''' ) )  as R1 ''
	+ '' left join ( select * from req_pledge (nolock) where server_id = '' + @world_id + '' ) as R2 ''
	+ '' on R1.pledge_id = R2.pledge_id ''
	+ '' where server_id is not null ''

exec ( @sql )



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetInitBoard]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetInitBoard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetInitBoard    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetInitBoard
	
INPUT
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_GetInitBoard]
--(
--	@account_name	nvarchar(50)
--)
AS
SET NOCOUNT ON

select 
	board_id, board_name, board_desc, board_order 
from 
	bbs_board (nolock) 
where 
	viewable = 1 
order by 
	board_order desc





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharPlg]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharPlg]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_MoveCharPlg]
(
	@world_id	varchar(5)
)
AS


declare @sql varchar(1024)
declare @conn_str varchar(256)

set @conn_str = ''10.10.12.'' + @world_id + '''''';''''gamma'''';''''lineage2pwd''

set @sql = '' insert into pledge ( old_world_id, old_pledge_id,  old_ruler_id, ruler_id, name, alliance_id, challenge_time, root_name_value, now_war_id, oust_time, skill_level, castle_id, agit_id, rank, name_value, status, private_flag, crest_id, is_guilty, dismiss_reserved_time, alliance_ousted_time, alliance_withdraw_time, alliance_dismiss_time )  ''
	+ '' select '' + @world_id + ''  , R1.pledge_id, ruler_id, 0, name + ''''-'' + @world_id + '''''' , 0, 0, 0, 0 ,0 ,0 , 0, 0, 0, name_value, 0, 0, 0, 0, 0, 0, 0, 0  from ( select * from ''
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '''' select * from lin2world.dbo.pledge (nolock)  '''' ) )  as R1 ''
	+ '' left join ( select * from req_pledge (nolock) where server_id = '' + @world_id + '' ) as R2 ''
	+ '' on R1.pledge_id = R2.pledge_id ''
	+ '' where server_id is not null ''

exec ( @sql )



' 
END
GO
/****** Object:  Table [dbo].[user_macroinfo]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_macroinfo]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_macroinfo](
	[macro_id] [int] NOT NULL,
	[macro_order] [int] NULL,
	[macro_int1] [int] NULL,
	[macro_int2] [int] NULL,
	[macro_int3] [int] NULL,
	[macro_str] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_macroinfo]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_macroinfo]') AND name = N'IX_user_macroinfo')
CREATE CLUSTERED INDEX [IX_user_macroinfo] ON [dbo].[user_macroinfo] 
(
	[macro_id] ASC,
	[macro_order] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_mail]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_mail]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_mail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NOT NULL CONSTRAINT [DF_user_mail_mail_type]  DEFAULT (getdate()),
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](3500) NOT NULL,
 CONSTRAINT [PK_user_mail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_mail_1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_mail]') AND name = N'IX_user_mail_1')
CREATE NONCLUSTERED INDEX [IX_user_mail_1] ON [dbo].[user_mail] 
(
	[id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharSvr]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharSvr]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- drop procedure lin_MoveCharSvr

/********************************************
lin_MoveCharSvr
	move char
INPUT
	@world_id	int
OUTPUT

return
made by
	young
date
	2003-7-30
	2003-10-06
	2004-1-6
********************************************/
CREATE PROCEDURE [dbo].[lin_MoveCharSvr]
(
	@old_world_id		int,
	@new_world_id		int,
	@conn_str		varchar(100)
)
AS

SET NOCOUNT ON

declare @sql varchar(4000)

--	& '' OPENROWSET ( ''SQLOLEDB'', ''l2world01'';''dbid'';''password'', '' 


-- make user_data 

set @sql = '' insert into user_data ( '' 
	+ '' char_name, pledge_id, account_name, account_id, builder, gender, race, class, world, xloc, yloc, zloc,  '' 
	+ '' IsInVehicle, HP, MP, SP, Exp, Lev, align, PK, PKpardon, Duel, ST_underware, ST_right_ear, ST_left_ear, '' 
	+ '' ST_neck, ST_right_finger, ST_left_finger, ST_head, ST_right_hand, ST_left_hand, ST_gloves, ST_chest,  '' 
	+ '' ST_feet, ST_back, ST_both_hand, ST_legs, create_date, login, logout, quest_flag, power_flag, max_hp, max_mp, '' 
	+ '' quest_memo, face_index, hair_color_index,  hair_shape_index, use_time, drop_exp,  '' 
	+ '' surrender_war_id, pledge_withdraw_time, pledge_ousted_time, pledge_leave_status, pledge_leave_time, '' 
	+ '' pledge_dismiss_time , old_pledge_id, old_char_id '' 
	+ '' ) '' 
	+ '' select R2.new_char_name, 0, account_name, R1.account_id, builder, gender, race, class, world, xloc, yloc, zloc,  '' 
	+ '' IsInVehicle, HP, MP, SP, Exp, Lev, align, PK, PKpardon, Duel, 0, 0, 0, '' 
	+ '' 0, 0, 0, 0, 0, 0, 0, 0,  '' 
	+ '' 0, 0, 0, 0,  create_date, login, logout, quest_flag, power_flag, max_hp, max_mp, '' 
	+ '' quest_memo, face_index, hair_color_index, hair_shape_index, use_time, drop_exp,  '' 
	+ '' 0, 0, 0, 0, 0, '' 
	+ ''  0 , pledge_id, char_id '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select pledge_id, char_id, account_name, account_id, builder, gender, race, class, world, xloc, yloc, zloc,  '' 
	+ '' IsInVehicle, HP, MP, SP, Exp, Lev, align, PK, PKpardon, Duel, ST_underware, ST_right_ear, ST_left_ear, '' 
	+ '' ST_neck, ST_right_finger, ST_left_finger, ST_head, ST_right_hand, ST_left_hand, ST_gloves, ST_chest,  '' 
	+ '' ST_feet, ST_back, ST_both_hand, ST_legs,  create_date, login, logout, quest_flag, power_flag, max_hp, max_mp, '' 
	+ '' quest_memo, face_index, hair_color_index, hair_shape_index, use_time, drop_exp,  '' 
	+ '' surrender_war_id, pledge_withdraw_time, pledge_ousted_time, pledge_leave_status, pledge_leave_time, '' 
	+ '' pledge_dismiss_time '' 
	+ '' from '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_data (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' + CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_name, account_id, old_char_id from req_charmove (nolock) where old_world_id = '' + CAST ( @old_world_id as varchar) + '' and new_world_id = '' + cast ( @new_world_id  as varchar ) + '' )  '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 

select @sql

exec (@sql)

-- update char_id
set @sql = '' update r ''
	+ '' set r.new_char_id = u.char_id ''
	+ '' from req_charmove as r  inner join user_data as u ''
	+ '' on r.new_char_name = u.char_name ''
	+ '' where r.old_world_id = '' +  CAST ( @old_world_id as VARCHAR)  + '' and r.new_world_id = '' + CAST ( @new_world_id as varchar)   + ''  and u.account_id > 0  ''

exec (@sql)

-- update pledge in user_data table
set @sql = '' update r ''
	+ '' set r.pledge_id = u.pledge_id ''
	+ '' from user_data as r  inner join pledge as u ''
	+ '' on r.old_pledge_id = u.old_pledge_id ''
	+ '' where r.char_name like ''''%-'' +  CAST ( @old_world_id as VARCHAR)  + ''''''  and u.pledge_id is not null  ''
select @sql

exec (@sql)


-- update pledge owner in pledge table
set @sql = '' update r ''
	+ '' set r.ruler_id = u.char_id''
	+ '' from pledge as r  inner join user_data as u ''
	+ '' on r.old_ruler_id = u.old_char_id ''
	+ '' where r.old_world_id = '' +  CAST ( @old_world_id as VARCHAR)  + ''  and u.char_id is not null  ''

exec (@sql)


-- copy user_item
set @sql = '' insert into user_item (char_id, item_type, amount, enchant, eroded, bless,  ident, wished, warehouse, old_world_id, old_item_id ) ''
	+ '' select R2.new_char_id, R1.item_type, R1.amount, R1.enchant, R1.eroded, R1.bless, R1. ident, R1.wished, R1.warehouse, '' + CAST ( @old_world_id as varchar ) + '' , R1.item_id ''
	+ '' from ''
	+ '' ( ''
	+ '' select * from ''
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', ''
	+ '' '''' select * from lin2world.dbo.user_item (nolock) '''' ) ''
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + ''  ) ''
	+ '' ) as R1 ''
	+ '' left join ( select new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) ''
	+ '' as R2 ''
	+ '' on R1.char_id = R2.old_char_id ''
	+ '' where new_char_id is not null ''

exec (@sql)


-- copy user_skill
set @sql = '' insert into user_skill ( char_id, skill_id, skill_lev, to_end_time) ''
	+ '' select R2.new_char_id, R1.skill_id, R1.skill_lev, R1.to_end_time '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_skill (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 
exec (@sql)


-- copy quest
set @sql = '' insert into quest ( char_id, q1, s1, q2, s2, q3, s3, q4, s4, q5, s5, q6, s6, q7, s7, q8, s8, q9, s9, q10, s10, q11, s11, q12, s12, q13, s13, q14, s14, q15, s15, q16, s16) '' 
	+ '' select R2.new_char_id, q1, s1, q2, s2, q3, s3, q4, s4, q5, s5, q6, s6, q7, s7, q8, s8, q9, s9, q10, s10, q11, s11, q12, s12, q13, s13, q14, s14, q15, s15, q16, s16 '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.quest (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 

exec (@sql)


-- copy user_history
set @sql = '' insert into user_history( char_name, char_id, log_date, log_action, account_name, create_date) '' 
	+ '' select R2.new_char_name, R2.new_char_id, R1.log_date, R1.log_action, R1.account_name, R1.create_date '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_history (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_name, new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 

exec (@sql)


-- copy user_log
set @sql = '' insert into user_log  ( char_id, log_id, log_date, log_from, log_to, use_time ) ''
	+ '' select R2.new_char_id, log_id, log_date, log_from, log_to, use_time  '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_log  (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar)  + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR) + ''  and new_world_id = '' + CAST ( @new_world_id as varchar)  + ''  ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 
exec (@sql)


-- shortcut_data
set @sql = '' insert into shortcut_data ( char_id, slotnum, shortcut_type, shortcut_id, shortcut_macro ) '' 
	+ '' select R2.new_char_id, slotnum, shortcut_type, shortcut_id, shortcut_macro '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.shortcut_data (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR)  + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar)  + '' ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 
exec (@sql)


-- user_comment
set @sql = '' insert into user_comment ( char_name, char_id, comment, comment_date, writer, deleted ) '' 
	+ '' select R2.new_char_name, R2.new_char_id, comment, comment_date, writer, deleted  '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_comment  (nolock) '''' ) '' 
	+ '' where char_id in ( select old_char_id from req_charmove (nolock) where old_world_id = '' +   CAST ( @old_world_id as VARCHAR)  + '' and new_world_id = '' + CAST ( @new_world_id as varchar) + '' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ( select new_char_name, new_char_id , old_char_id from req_charmove (nolock) where old_world_id = '' +  CAST ( @old_world_id as VARCHAR) + '' and new_world_id = '' + CAST ( @new_world_id as varchar)  + '' ) '' 
	+ '' as R2 '' 
	+ '' on R1.char_id = R2.old_char_id '' 
	+ '' where new_char_id is not null '' 
exec (@sql)


-- pet_data
set @sql = '' insert into pet_data ( pet_id, npc_class_id, expoint, nick_name, hp, mp, sp, meal  ) '' 
	+ '' select item_id, npc_class_id, expoint, null, hp, mp, sp, meal   '' 
	+ '' from '' 
	+ '' ( select * from user_item (nolock) where item_type = 2375 and old_world_id = '' + CAST ( @old_world_id as varchar ) + '' ) as R1 ''
	+ '' left join ''
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select pet_id, npc_class_id, expoint, hp, mp, sp, meal  from lin2world.dbo.pet_data (nolock) '''' ) '' 
	+ '' ) as R2 '' 
	+ '' on R1.old_item_id = R2.pet_id ''
	+ '' where R2.npc_class_id is not null '' 
exec (@sql)



-- user_item owned by pet
set @sql = '' insert into user_item( char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse  ) '' 
	+ '' select R2.item_id, R1.item_type, R1.amount, R1.enchant, R1.eroded, R1.bless, R1.ident, R1.wished, R1.warehouse  '' 
	+ '' from '' 
	+ '' ( '' 
	+ '' select * from  '' 
	+ '' OPENROWSET ( ''''SQLOLEDB'''', '''''' + @conn_str + '''''', '' 
	+ '' '''' select * from lin2world.dbo.user_item (nolock) where warehouse = 5 '''' ) '' 
	+ '' ) as R1 '' 
	+ '' left join ''
	+ '' ( select * from user_item (nolock) where old_world_id = '' + CAST ( @old_world_id as varchar ) + '' ) as R2 ''
	+ '' on R1.char_id = R2.old_item_id ''
	+ '' where R2.item_id is not null ''

exec (@sql)


' 
END
GO
/****** Object:  Table [dbo].[user_mail_receiver]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_mail_receiver]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_mail_receiver](
	[mail_id] [int] NOT NULL,
	[mailbox_type] [tinyint] NOT NULL CONSTRAINT [DF_user_mail_receiver_mailbox_type_1]  DEFAULT ((0)),
	[receiver_id] [int] NOT NULL,
	[receiver_name] [nvarchar](50) NOT NULL,
	[read_date] [datetime] NULL,
	[read_status] [tinyint] NOT NULL CONSTRAINT [DF_user_mail_receiver_read_status]  DEFAULT ((0)),
	[deleted] [tinyint] NOT NULL CONSTRAINT [DF_user_mail_receiver_deleted]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_mail_receiver_1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_mail_receiver]') AND name = N'IX_user_mail_receiver_1')
CREATE NONCLUSTERED INDEX [IX_user_mail_receiver_1] ON [dbo].[user_mail_receiver] 
(
	[mail_id] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_user_mail_receiver_2]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_mail_receiver]') AND name = N'IX_user_mail_receiver_2')
CREATE NONCLUSTERED INDEX [IX_user_mail_receiver_2] ON [dbo].[user_mail_receiver] 
(
	[receiver_id] ASC,
	[read_status] ASC,
	[deleted] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_AllianceWarChallengeRejected]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AllianceWarChallengeRejected]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_AllianceWarChallengeRejected
	
INPUT	
	@challenger int, 
	@challenger_name nvarchar(50),
	@challengee int, 
	@challengee_name nvarchar(50),
	@begin_time int, 
	@status int
OUTPUT
return
made by
	bert
date
	2003-11-04
********************************************/
create PROCEDURE [dbo].[lin_AllianceWarChallengeRejected]
(
	@challenger int, 
	@challenger_name nvarchar(50),
	@challengee int, 
	@challengee_name nvarchar(50),
	@begin_time int, 
	@status int
)
AS
SET NOCOUNT ON

INSERT INTO alliance_war (challenger, challenger_name,  challengee, challengee_name, begin_time, status) 
VALUES (@challenger, @challenger_name,  @challengee, @challengee_name, @begin_time, @status)


' 
END
GO
/****** Object:  Table [dbo].[user_mail_sender]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_mail_sender]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_mail_sender](
	[mail_id] [int] NOT NULL,
	[related_id] [int] NOT NULL,
	[mail_type] [tinyint] NOT NULL,
	[mailbox_type] [tinyint] NOT NULL CONSTRAINT [DF_user_mail_sender_mailbox_type]  DEFAULT ((1)),
	[sender_id] [int] NOT NULL,
	[sender_name] [nvarchar](50) NOT NULL,
	[send_date] [datetime] NOT NULL CONSTRAINT [DF_user_mail_sender_send_date]  DEFAULT (getdate()),
	[receiver_name_list] [nvarchar](250) NOT NULL,
	[deleted] [tinyint] NOT NULL CONSTRAINT [DF_user_mail_sender_deleted]  DEFAULT ((0))
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_mail_sender]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_mail_sender]') AND name = N'IX_user_mail_sender')
CREATE CLUSTERED INDEX [IX_user_mail_sender] ON [dbo].[user_mail_sender] 
(
	[sender_id] ASC,
	[mailbox_type] ASC,
	[deleted] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_user_mail_sender_1]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_mail_sender]') AND name = N'IX_user_mail_sender_1')
CREATE NONCLUSTERED INDEX [IX_user_mail_sender_1] ON [dbo].[user_mail_sender] 
(
	[mail_id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_writeBbsTGS]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_writeBbsTGS]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_writeBbsTGS    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_writeBbsTGS]
(
	@title NVARCHAR(50), 
	@contents NVARCHAR(4000), 
	@writer NVARCHAR(50)
)
AS


insert into bbs_tgs (title, contents, writer) values (@title, @contents, @writer)



' 
END
GO
/****** Object:  Table [dbo].[user_name_color]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_name_color]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_name_color](
	[char_id] [int] NOT NULL,
	[color_rgb] [int] NOT NULL,
 CONSTRAINT [PK_user_name_color] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_writeBbsall]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_writeBbsall]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_writeBbsall    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_writeBbsall]
(
	@title NVARCHAR(50), 
	@contents NVARCHAR(4000), 
	@writer NVARCHAR(50)
)
AS
insert into bbs_all (title, contents, writer) values (@title, @contents, @writer)







' 
END
GO
/****** Object:  Table [dbo].[user_name_reserved]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_name_reserved]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_name_reserved](
	[char_name] [nvarchar](50) NOT NULL,
	[account_id] [int] NOT NULL CONSTRAINT [DF_user_name_reserved_account_id]  DEFAULT ((0)),
	[used] [tinyint] NOT NULL CONSTRAINT [DF_user_name_reserved_used]  DEFAULT ((0)),
 CONSTRAINT [PK_user_name_reserved] PRIMARY KEY CLUSTERED 
(
	[char_name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_newbie]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_newbie]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_newbie](
	[account_id] [int] NOT NULL,
	[char_id] [int] NOT NULL CONSTRAINT [DF_user_newbie_char_id]  DEFAULT ((0)),
	[newbie_stat] [smallint] NOT NULL,
 CONSTRAINT [PK_user_newbie] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_test]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[sp_test]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.sp_test    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE procedure [dbo].[sp_test]
(
	@strIn	NCHAR(30)
)
as 

set @strIn = RTRIM(@strIn)

IF @strIn LIKE N'' %'' 
BEGIN
	print ''Space ['' + @strIn + '']''
	RAISERROR (''Character name has space : name = [%s]'', 16, 1, '''')
	return -1
END

print ''No space ['' + @strIn + '']''



' 
END
GO
/****** Object:  Table [dbo].[user_nobless]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_nobless]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_nobless](
	[char_id] [int] NOT NULL,
	[nobless_type] [tinyint] NULL CONSTRAINT [DF__user_nobl__noble__3E68E952]  DEFAULT ((0)),
	[hero_type] [tinyint] NULL CONSTRAINT [DF__user_nobl__hero___3F5D0D8B]  DEFAULT ((0)),
	[win_count] [int] NULL CONSTRAINT [DF__user_nobl__win_c__405131C4]  DEFAULT ((0)),
	[previous_point] [int] NULL CONSTRAINT [DF__user_nobl__previ__414555FD]  DEFAULT ((0)),
	[olympiad_point] [int] NULL CONSTRAINT [DF__user_nobl__olymp__42397A36]  DEFAULT ((0)),
	[match_count] [int] NULL CONSTRAINT [DF__user_nobl__match__432D9E6F]  DEFAULT ((0)),
	[words] [varchar](128) NULL,
	[olympiad_win_count] [int] NULL CONSTRAINT [DF__user_nobl__olymp__4421C2A8]  DEFAULT ((0)),
	[olympiad_lose_count] [int] NULL CONSTRAINT [DF__user_nobl__olymp__4515E6E1]  DEFAULT ((0)),
	[history_open] [tinyint] NULL CONSTRAINT [DF__user_nobl__histo__460A0B1A]  DEFAULT ((0)),
 CONSTRAINT [PK__user_nobless__23E9FD40] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[table_info]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[table_info]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[table_info]    
as    
    
    
declare @id int       
declare @type character(2)       
declare @pages int       
declare @dbname sysname    
declare @dbsize dec(15,0)    
declare @bytesperpage dec(15,0)    
declare @pagesperMB  dec(15,0)    
    
create table #spt_space    
(    
 objid  int null,    
 rows  int null,    
 reserved dec(15) null,    
 data  dec(15) null,    
 indexp  dec(15) null,    
 unused  dec(15) null    
)    
    
set nocount on    
    
-- Create a cursor to loop through the user tables    
declare c_tables cursor for    
select id    
from sysobjects    
where xtype = ''U''    
    
open c_tables    
    
fetch next from c_tables    
into @id    
    
while @@fetch_status = 0    
begin    
    
 /* Code from sp_spaceused */    
 insert into #spt_space (objid, reserved)    
  select objid = @id, sum(reserved)    
   from sysindexes    
    where indid in (0, 1, 255)    
     and id = @id    
    
 select @pages = sum(dpages)    
   from sysindexes    
    where indid < 2    
     and id = @id    
 select @pages = @pages + isnull(sum(used), 0)    
  from sysindexes    
   where indid = 255    
    and id = @id    
 update #spt_space    
  set data = @pages    
 where objid = @id    
    
    
 /* index: sum(used) where indid in (0, 1, 255) - data */    
 update #spt_space    
  set indexp = (select sum(used)    
    from sysindexes    
    where indid in (0, 1, 255)    
    and id = @id)    
       - data    
  where objid = @id    
    
 /* unused: sum(reserved) - sum(used) where indid in (0, 1, 255) */    
 update #spt_space    
  set unused = reserved    
    - (select sum(used)    
     from sysindexes    
      where indid in (0, 1, 255)    
      and id = @id)    
  where objid = @id    
    
 update #spt_space    
  set rows = i.rows    
   from sysindexes i    
    where i.indid < 2    
    and i.id = @id    
    and objid = @id    
    
 fetch next from c_tables    
 into @id    
end    
    
select  TableName = (select left(name,60) from sysobjects where id = objid),    
 Rows = convert(char(11), rows),    
 ReservedKB = ltrim(str(reserved * d.low / 1024.,15,0)),    
 DataKB = ltrim(str(data * d.low / 1024.,15,0)),    
 IndexSizeKB = ltrim(str(indexp * d.low / 1024.,15,0)),    
 UnusedKB = ltrim(str(unused * d.low / 1024.,15,0))    
      
from  #spt_space, master.dbo.spt_values d    
where  d.number = 1    
and  d.type = ''E''    
order by tablename     
drop table #spt_space    
close c_tables    
deallocate c_tables    
    
    
    
    
    
    
    
    
    
  



' 
END
GO
/****** Object:  Table [dbo].[user_prohibit]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_prohibit]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_prohibit](
	[char_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_prohibit] PRIMARY KEY CLUSTERED 
(
	[char_name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_prohibit_word]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_prohibit_word]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_prohibit_word](
	[words] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_prohibit_word] PRIMARY KEY CLUSTERED 
(
	[words] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ReadBbsTGS]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ReadBbsTGS]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ReadBbsTGS    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_ReadBbsTGS] 
(
	@nId	INT
)
AS

SET NOCOUNT ON

select id, title, contents, writer, cast( cdate as smalldatetime)
from bbs_tgs (nolock)
where id = @nId

update bbs_tgs set nRead = nRead + 1 where id = @nId



' 
END
GO
/****** Object:  Table [dbo].[user_punish]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_punish]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_punish](
	[char_id] [int] NOT NULL,
	[punish_id] [int] NOT NULL,
	[punish_on] [tinyint] NOT NULL CONSTRAINT [DF_user_punish_punish_on]  DEFAULT ((0)),
	[remain_game] [int] NULL,
	[remain_real] [int] NULL,
	[punish_seconds] [int] NULL,
	[punish_date] [datetime] NULL CONSTRAINT [DF_user_punish_punish_date]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO

/****** Object:  Index [IX_user_punish]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_punish]') AND name = N'IX_user_punish')
CREATE NONCLUSTERED INDEX [IX_user_punish] ON [dbo].[user_punish] 
(
	[char_id] ASC,
	[punish_id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_ReadBbsall]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ReadBbsall]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ReadBbsall    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_ReadBbsall] 
(
	@nId	INT
)
AS

SET NOCOUNT ON

select 
	cnt, orderedTitle.title, orderedTitle.contents, orderedTitle.writer, cast( orderedTitle.cdate as smalldatetime)
from 
	(Select 
		count(bbs2.id) as cnt, bbs1.id, bbs1.title, bbs1.contents, bbs1.writer, bbs1.cdate
	from 
		Bbs_all as bbs1
		inner join
		Bbs_all as bbs2
		on bbs1.id <= bbs2.id
	group by 
		bbs1.id, bbs1.title, bbs1.contents, bbs1.writer, bbs1.cdate
	) as orderedTitle
where
	orderedTitle.id = @nId

IF @@rowcount = 1  
	UPDATE Bbs_all SET nRead = nRead + 1 WHERE id = @nId
Else
	RAISERROR (''Unavailable id.'', 16, 1)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChallengeRejected]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChallengeRejected]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ChallengeRejected    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_ChallengeRejected
	
INPUT	
	@challenger int, 
	@challenger_name nvarchar(50),
	@challengee int, 
	@challengee_name nvarchar(50),
	@begin_time int, 
	@status int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_ChallengeRejected]
(
	@challenger int, 
	@challenger_name nvarchar(50),
	@challengee int, 
	@challengee_name nvarchar(50),
	@begin_time int, 
	@status int
)
AS
SET NOCOUNT ON

INSERT INTO pledge_war (challenger, challenger_name,  challengee, challengee_name, begin_time, status) 
VALUES (@challenger, @challenger_name,  @challengee, @challengee_name, @begin_time, @status)





' 
END
GO
/****** Object:  Table [dbo].[user_recipe]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_recipe]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_recipe](
	[char_id] [int] NOT NULL,
	[recipe_id] [int] NOT NULL,
 CONSTRAINT [PK_user_recipe] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[recipe_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_skill]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_skill]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_skill](
	[char_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[skill_lev] [int] NULL CONSTRAINT [DF_user_skill_skill_lev]  DEFAULT ((0)),
	[to_end_time] [int] NOT NULL CONSTRAINT [DF_user_skill_last_use]  DEFAULT ((0)),
	[subjob_id] [int] NOT NULL CONSTRAINT [DF__user_skil__subjo__39AE55D6]  DEFAULT ((0)),
 CONSTRAINT [PK_user_skill] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[skill_id] ASC,
	[subjob_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_skill_lev]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_skill]') AND name = N'idx_skill_lev')
CREATE NONCLUSTERED INDEX [idx_skill_lev] ON [dbo].[user_skill] 
(
	[skill_lev] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [idx_skill_toend]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[user_skill]') AND name = N'idx_skill_toend')
CREATE NONCLUSTERED INDEX [idx_skill_toend] ON [dbo].[user_skill] 
(
	[to_end_time] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alliance]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Alliance]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Alliance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[master_pledge_id] [int] NOT NULL CONSTRAINT [DF__alliance__master__2B6A5820]  DEFAULT ((0)),
	[oust_time] [int] NOT NULL CONSTRAINT [DF__alliance__oust_t__2C5E7C59]  DEFAULT ((0)),
	[crest_id] [int] NOT NULL CONSTRAINT [DF__alliance__crest___443605EA]  DEFAULT ((0)),
 CONSTRAINT [PK_Alliance] PRIMARY KEY CLUSTERED 
(
	[name] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMailList]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMailList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMailList
	get mail list
INPUT
	@char_id		int,
	@mailbox_type			int,
	@page			int,
	@rows_per_page	int,
	@search_target		int,
	@keyword		nvarchar(20)
OUTPUT
return
made by
	kks
date
	2004-12-10
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMailList]
(
	@char_id		int,
	@mailbox_type			int,
	@page			int,
	@rows_per_page	int,
	@search_target		int,
	@keyword		nvarchar(20)
)
AS
SET NOCOUNT ON

DECLARE @sql NVARCHAR(4000)
DECLARE @top int
DECLARE @total_count int
SET @total_count = 0

IF @page < 1
	SET @page = 1

SET @top = @page * @rows_per_page

IF @top < 1 
	RETURN

-- set search condition
DECLARE @search_condition NVARCHAR(1000)
SET @search_condition = N''''

-- incomming mailbox
if (@mailbox_type = 0)
begin
	IF (@keyword != N'''') 
	BEGIN
		IF (@search_target = 0)
			SET @search_condition = ''and r.mail_id IN (SELECT mail_id FROM user_mail_sender(nolock) WHERE sender_name = N'''''' + @keyword + '''''') ''
		IF (@search_target = 1)
			SET @search_condition = ''and m.title LIKE N''''%'' + @keyword + ''%'''' ''
	END

	SET @sql = 
	''DECLARE @total_count int '' +
	''SET @total_count = 0 '' +
	''SELECT @total_count = COUNT(*) '' + 
	''FROM user_mail m(nolock), user_mail_receiver r(nolock) '' +
	''WHERE m.id = r.mail_id '' +
	''	and r.receiver_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and r.deleted = 0 '' +
	''	and r.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +

	''SELECT TOP '' + CAST(@top as NVARCHAR) +  
	''	m.id, s.sender_id, s.sender_name, m.title, datediff( ss, ''''1970/1/1 0:0:0'''' , s.send_date ) s_date, '' +
	''	r.read_status, @total_count '' +
	''FROM user_mail m(nolock), user_mail_sender s(nolock), user_mail_receiver r(nolock) '' +
	''WHERE m.id = r.mail_id '' +
	''	and s.mail_id = r.mail_id '' +
	''	and r.receiver_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and r.deleted = 0 '' +
	''	and r.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	''ORDER BY s_date DESC''

	EXEC(@sql)
end

-- sent mailbox
if (@mailbox_type = 1)
begin
	IF (@keyword != N'''') 
	BEGIN
		IF (@search_target = 0)
			SET @search_condition = ''and s.mail_id IN (SELECT mail_id FROM user_mail_receiver(nolock) WHERE receiver_name = N'''''' + @keyword + '''''') ''
		IF (@search_target = 1)
			SET @search_condition = ''and m.title LIKE N''''%'' + @keyword + ''%'''' ''
	END

	SET @sql = 
	''DECLARE @total_count int '' +
	''SET @total_count = 0 '' +
	''SELECT @total_count = COUNT(*) '' + 
	''FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''WHERE m.id = s.mail_id '' +
	''	and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and s.deleted = 0 '' +
	''	and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +

	''SELECT TOP '' + CAST(@top as NVARCHAR) +  
	''	m.id, s.sender_id, s.receiver_name_list, m.title, datediff( ss, ''''1970/1/1 0:0:0'''' , s.send_date ) s_date, '' +
	''	s.mail_type, @total_count '' +
	''FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''WHERE m.id = s.mail_id '' +
	''	and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and s.deleted = 0 '' +
	''	and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	''ORDER BY s_date DESC''

	EXEC(@sql)
end

-- archive mailbox
if (@mailbox_type = 2)
begin
	-- 
	DECLARE @search_condition2 NVARCHAR(128)
	SET @search_condition2 = N''''

	IF (@keyword != N'''') 
	BEGIN
		IF (@search_target = 0)
		BEGIN
			SET @search_condition = ''and r.mail_id IN (SELECT mail_id FROM user_mail_sender(nolock) WHERE sender_name = N'''''' + @keyword + '''''') ''
			SET @search_condition2 = ''and s.mail_id IN (SELECT mail_id FROM user_mail_receiver(nolock) WHERE receiver_name = N'''''' + @keyword + '''''') ''
		END

		IF (@search_target = 1)
		BEGIN
			SET @search_condition = ''and m.title LIKE N''''%'' + @keyword + ''%'''' ''
			SET @search_condition2 = ''and m.title LIKE N''''%'' + @keyword + ''%'''' ''
		END
	END

	SET @sql = 
	''DECLARE @total_count int '' +
	''SET @total_count = 0 '' +
	''SELECT @total_count = '' + 
	''	(SELECT COUNT(*) cnt1'' +
	''	FROM user_mail m(nolock), user_mail_receiver r(nolock) '' +
	''	WHERE m.id = r.mail_id '' +
	''		and r.receiver_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''		and r.deleted = 0 '' +
	''		and r.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	''	) + '' +
	''	(SELECT COUNT(*) cnt2'' +
	''	FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''	WHERE m.id = s.mail_id '' +
	''		and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''		and s.deleted = 0 '' +
	''		and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition2 +
	''	) '' +
	'' '' +
	''SELECT TOP '' + CAST(@top as NVARCHAR) + '' *, @total_count '' +
	''FROM ( '' +
	''	SELECT '' +
	''		m.id, s.sender_id, s.sender_name, m.title, datediff( ss, ''''1970/1/1 0:0:0'''' , s.send_date ) s_date, '' +
	''		r.read_status type_flag '' +
	''	FROM user_mail m(nolock), user_mail_sender s(nolock), user_mail_receiver r(nolock) '' +
	''	WHERE m.id = r.mail_id '' +
	''		and s.mail_id = r.mail_id '' +
	''		and r.receiver_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''		and r.deleted = 0 '' +
	''		and r.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	''	union all '' +
	''	SELECT '' +
	''		m.id, s.sender_id, s.receiver_name_list, m.title, datediff( ss, ''''1970/1/1 0:0:0'''' , s.send_date ) s_date, '' +
	''		s.mail_type type_flag '' +
	''	FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''	WHERE m.id = s.mail_id '' +
	''		and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''		and s.deleted = 0 '' +
	''		and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition2 +
	'') as R1 '' +
	''	ORDER BY s_date DESC''
		
	EXEC(@sql)

end

-- temp mailbox
if (@mailbox_type = 3)
begin
	IF (@keyword != N'''') 
	BEGIN
		IF (@search_target = 0)
			SET @search_condition = ''and s.receiver_name_list LIKE  N''''%'' + @keyword + ''%'''' ''
		IF (@search_target = 1)
			SET @search_condition = ''and m.title LIKE N''''%'' + @keyword + ''%'''' ''
	END

	SET @sql = 
	''DECLARE @total_count int '' +
	''SET @total_count = 0 '' +
	''SELECT @total_count = COUNT(*) '' + 
	''FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''WHERE m.id = s.mail_id '' +
	''	and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and s.deleted = 0 '' +
	''	and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	
	''SELECT TOP '' + CAST(@top as NVARCHAR) +  
	''	m.id, s.sender_id, s.receiver_name_list, m.title, datediff( ss, ''''1970/1/1 0:0:0'''' , s.send_date ) s_date, '' +
	''	s.mail_type, @total_count '' +
	''FROM user_mail m(nolock), user_mail_sender s(nolock) '' +
	''WHERE m.id = s.mail_id '' +
	''	and s.sender_id = '' + CAST(@char_id as NVARCHAR) + '' '' +
	''	and s.deleted = 0 '' +
	''	and s.mailbox_type = '' + CAST(@mailbox_type as NVARCHAR) + '' '' +
	@search_condition +
	''ORDER BY s_date DESC''

	EXEC(@sql)

end




' 
END
GO
/****** Object:  Table [dbo].[user_skill_old]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_skill_old]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_skill_old](
	[char_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[skill_lev] [tinyint] NOT NULL,
	[to_end_time] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemData]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ItemData]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ItemData](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[desc] [nvarchar](50) NOT NULL,
	[logdate] [smalldatetime] NOT NULL CONSTRAINT [DF_ItemData_date]  DEFAULT (getdate()),
	[consumetype] [nvarchar](50) NULL,
	[IsQuest] [tinyint] NOT NULL CONSTRAINT [DF_ItemData_IsQuest]  DEFAULT ((0)),
 CONSTRAINT [PK_ItemData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_itemdata_name]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ItemData]') AND name = N'idx_itemdata_name')
CREATE NONCLUSTERED INDEX [idx_itemdata_name] ON [dbo].[ItemData] 
(
	[name] ASC
) ON [PRIMARY]
GO

/****** Object:  Index [IX_ItemData]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ItemData]') AND name = N'IX_ItemData')
CREATE NONCLUSTERED INDEX [IX_ItemData] ON [dbo].[ItemData] 
(
	[id] ASC,
	[consumetype] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_sociality]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_sociality]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_sociality](
	[char_id] [int] NOT NULL,
	[sociality] [int] NOT NULL,
	[used_sulffrage] [int] NOT NULL,
	[last_changed] [datetime] NOT NULL,
 CONSTRAINT [PK_user_sociality] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OHEC_SUBJOB]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OHEC_SUBJOB]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OHEC_SUBJOB](
	[server] [int] NULL,
	[All_75] [int] NULL,
	[Sub0] [int] NULL,
	[Sub1] [int] NULL,
	[Sub2] [int] NULL,
	[Sub3] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_subjob]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_subjob]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_subjob](
	[char_id] [int] NULL,
	[hp] [float] NULL,
	[mp] [float] NULL,
	[sp] [int] NULL,
	[exp] [bigint] NULL,
	[level] [tinyint] NULL,
	[henna_1] [int] NULL,
	[henna_2] [int] NULL,
	[henna_3] [int] NULL,
	[subjob_id] [int] NULL,
	[create_date] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OHEC_SUBJOB_TEMP]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OHEC_SUBJOB_TEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OHEC_SUBJOB_TEMP](
	[server] [int] NULL,
	[All_75] [int] NULL,
	[Sub0] [int] NULL,
	[Sub1] [int] NULL,
	[Sub2] [int] NULL,
	[Sub3] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_surrender]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_surrender]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_surrender](
	[char_id] [int] NOT NULL,
	[surrender_war_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PetitionMsg]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PetitionMsg]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PetitionMsg](
	[Char_Id] [int] NOT NULL,
	[msg] [nvarchar](1024) NULL
) ON [PRIMARY]
END
GO

/****** Object:  Index [idx_petmsg_charid]    Script Date: 02/08/2011 16:50:24 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[PetitionMsg]') AND name = N'idx_petmsg_charid')
CREATE NONCLUSTERED INDEX [idx_petmsg_charid] ON [dbo].[PetitionMsg] 
(
	[Char_Id] ASC
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lin_TrasferWarehouseNewPartial]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_TrasferWarehouseNewPartial]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_TrasferWarehouseNewPartial    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_TrasferWarehouseNewPartial
	move inventory to warehouse || move warehouse to inventory total partial item 
INPUT
	@char_id		INT,
	@item_id			INT,
	@ToWarehouseID	INT,
	@bIsToInven		TINYINT
	@nCount			INT
OUTPUT
	bIsSuccess		1/0
return
made by
	carrot
date
	2002-10-17
********************************************/
CREATE PROCEDURE [dbo].[lin_TrasferWarehouseNewPartial]
(
	@char_id		INT,
	@item_id			INT,
	@ToWarehouseID	INT,
	@bIsToInven		TINYINT,
	@nCount			INT
)
AS
SET NOCOUNT ON

IF (@bIsToInven > 0) 
BEGIN
	IF (SELECT amount FROm user_warehouse WHERE item_id = @item_id) > @nCount
	BEGIN
		INSERT INTO user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
			SELECT char_id, item_type, @nCount, enchant, eroded, bless, ident, wished, warehouse FROM user_warehouse WHERE item_id = @item_id
		IF @@ROWCOUNT = 0
		BEGIN
			SELECT 0
		END
		ELSE 
		BEGIN
			SELECT item_id FROM user_item WHERE item_id = @@IDENTITY
			UPDATE user_warehouse SET amount = amount - @nCount WHERE item_id = @item_id
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
ELSE
BEGIN
	IF (SELECT amount FROm user_item WHERE item_id = @item_id) > @nCount
	BEGIN
		INSERT INTO user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
			SELECT char_id, item_type, @nCount, enchant, eroded, bless, ident, wished, warehouse FROM user_item WHERE item_id = @item_id
		INSERT INTO user_warehouse (item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
			SELECT item_id, char_id, item_type, @nCount, enchant, eroded, bless, ident, wished, warehouse FROM user_item WHERE item_id = @@IDENTITY
		IF @@ROWCOUNT = 0
		BEGIN
			SELECT 0
		END
		ELSE 
		BEGIN
			SELECT item_id FROM user_warehouse WHERE item_id = @@IDENTITY
			DELETE user_item WHERE item_id = @@IDENTITY
			UPDATE user_item SET amount = amount - @nCount WHERE item_id = @item_id
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_TrasferWarehouseNewAll]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_TrasferWarehouseNewAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_TrasferWarehouseNewAll    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_TrasferWarehouseNewPartial
	movet inventory to warehouse || move warehouse to inventory total item
INPUT
	@char_id		INT,
	@item_id			INT,
	@ToWarehouseID	INT,
	@bIsToInven		TINYINT
OUTPUT
	
return
made by
	carrot
date
	2002-10-17
********************************************/
CREATE PROCEDURE [dbo].[lin_TrasferWarehouseNewAll]
(
	@char_id		INT,
	@item_id			INT,
	@ToWarehouseID	INT,
	@bIsToInven		TINYINT
)
AS
SET NOCOUNT ON

IF (@bIsToInven > 0) 
BEGIN
	SET IDENTITY_INSERT user_item ON

	IF (SELECT COUNT(*) FROm user_warehouse WHERE item_id = @item_id) = 1
	BEGIN
		INSERT INTO user_item (item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
			SELECT item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_warehouse WHERE item_id = @item_id
		IF @@ROWCOUNT = 0
		BEGIN
			SELECT 0
		END
		ELSE 
		BEGIN
			DELETE user_warehouse WHERE item_id = @item_id
			SELECT 1
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END

	SET IDENTITY_INSERT user_item OFF
END
ELSE
BEGIN
	IF (SELECT COUNT(*) FROm user_item WHERE item_id = @item_id) = 1
	BEGIN
		INSERT INTO user_warehouse (item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
			SELECT item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item WHERE item_id = @item_id
		IF @@ROWCOUNT = 0
		BEGIN
			SELECT 0
		END
		ELSE 
		BEGIN
			DELETE user_item WHERE item_id = @item_id
			SELECT 1
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeInfo]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.lin_SetPledgeInfo    Script Date: 2003-09-20 11:52:00 ******/

/********************************************
lin_SetPledgeInfo
	
INPUT	
	@fieldName	nvarchar(50),
	@field_data	INT,
	@pledge_id	INT
OUTPUT

return
made by
	carrot
date
	2002-06-16
modified by 
	kks (2005-07-22)
********************************************/
CREATE PROCEDURE [dbo].[lin_SetPledgeInfo]
(
@fieldName	nvarchar(50),
@field_data	INT,
@pledge_id	INT
)
AS
SET NOCOUNT ON

IF @fieldName = N''alliance_id'' begin update pledge set alliance_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''challenge_time'' begin update pledge set challenge_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''root_name_value'' begin update pledge set root_name_value = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''now_war_id'' begin update pledge set now_war_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''oust_time'' begin update pledge set oust_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''skill_level'' begin update pledge set skill_level = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''castle_id'' begin update pledge set castle_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''agit_id'' begin update pledge set agit_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''rank'' begin update pledge set rank = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''name_value'' begin update pledge set name_value = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''status'' begin update pledge set status = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''private_flag'' begin update pledge set private_flag = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''crest_id'' begin update pledge set crest_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''is_guilty'' begin update pledge set is_guilty = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''dismiss_reserved_time'' begin update pledge set dismiss_reserved_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''alliance_ousted_time'' begin update pledge set alliance_ousted_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''alliance_withdraw_time'' begin update pledge set alliance_withdraw_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''alliance_dismiss_time'' begin update pledge set alliance_dismiss_time = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''ruler_id'' begin update pledge set ruler_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''emblem_id'' begin update pledge set emblem_id = @field_data where pledge_id =  @pledge_id end
ELSE IF @fieldName = N''pledge_score'' begin update pledge set score = @field_data where pledge_id = @pledge_id end
ELSE 
BEGIN 
	RAISERROR (''lin_SetPledgeInfo : invalid field [%s]'', 16, 1, @fieldName)
	RETURN -1	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeInfoDiv]    Script Date: 02/08/2011 16:50:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeInfoDiv]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_SetPledgeInfoDiv]
(
	@fieldName	nvarchar(50),
	@hasDivision	int,
	@DivisionRuler_id int,
	@DivisionName	nvarchar(50),
	@pledge_id 	int
)

AS
SET NOCOUNT ON

IF @fieldName = N''academy'' begin update pledge set hasAcademy = @hasDivision, AcademyRuler_id = @DivisionRuler_id, AcademyName=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''guarda'' begin update pledge set hasGuard1 = @hasDivision, Guard1Ruler_id = @DivisionRuler_id, Guard1Name=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''guardb'' begin update pledge set hasGuard2 = @hasDivision, Guard2Ruler_id = @DivisionRuler_id, Guard2Name=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''knighta'' begin update pledge set hasKnight1 = @hasDivision, Knight1Ruler_id = @DivisionRuler_id, Knight1Name=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''knightb'' begin update pledge set hasKnight2 = @hasDivision, Knight2Ruler_id = @DivisionRuler_id, Knight2Name=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''knightc'' begin update pledge set hasKnight3 = @hasDivision, Knight3Ruler_id = @DivisionRuler_id, Knight3Name=@DivisionName where pledge_id = @pledge_id end
ELSE IF @fieldName = N''knightd'' begin update pledge set hasKnight4 = @hasDivision, Knight4Ruler_id = @DivisionRuler_id, Knight4Name=@DivisionName where pledge_id = @pledge_id end
ELSE 
BEGIN 
	RAISERROR (''lin_SetPledgeInfoDiv : invalid field [%s]'', 16, 1, @fieldName)
	RETURN -1
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAgitList]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAgitList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

/******************************************************************************
#Name:	lin_GetAgitList
#Desc:	get agit list

#Argument:
	Input:
	Output:
#Return:
#Result Set:

#Remark:
#Example:
#See:
#History:
	Create	btwinuni	2005-09-20
	Modify	btwinuni	2005-11-16	auction_time
******************************************************************************/
CREATE PROCEDURE [dbo].[lin_GetAgitList]
AS

SET NOCOUNT ON

select a.id, a.name, a.pledge_id, isnull(p.name,''''), isnull(p.ruler_id,0), isnull(ud.char_name,''''), 
	isnull((select max(auction_time) from agit_auction(nolock) where agit_id = a.id), 0), 
	a.next_war_time
from agit as a(nolock)
	left join pledge as p(nolock) on a.pledge_id = p.pledge_id
	left join user_data as ud(nolock) on p.ruler_id = ud.char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[dp_GetItemListByPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dp_GetItemListByPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.dp_GetItemListByPledge    Script Date: 2003-09-20 ?? 11:51:57 ******/

CREATE PROCEDURE [dbo].[dp_GetItemListByPledge] @user_id varchar(30)
AS
SELECT b.item_id, c.name, a.char_name, b.warehouse, b.amount, b.enchant, b.eroded, b.bless, b.wished
FROM user_data a INNER JOIN user_item b ON a.char_id = b.char_id, itemdata c
WHERE a.char_id in (SELECT char_id FROM user_data a INNER JOIN pledge b ON a.pledge_id = b.pledge_id WHERE b.name = @user_id)
AND b.item_type = c.id
ORDER BY a.char_name, b.warehouse, b.item_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetCastleList]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetCastleList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetCastleList
	get castle list
INPUT

OUTPUT

return
made by
	kks
date
	2004-01-13
********************************************/
CREATE PROCEDURE [dbo].[lin_GetCastleList]

AS

SET NOCOUNT ON

SELECT 
	C.id, isnull(C.pledge_id, 0) pledge_id , isnull(P.name, '''') pledge_name, isnull(P.ruler_id, 0) ruler_id, 
	isnull(U.char_name, '''') ruler_name, isnull(P.alliance_id, 0) alliance_id, isnull(A.name, '''') alliance_name, 
	C.tax_rate,
	CASE WHEN C.tax_rate_to_change = -1	THEN 0 ELSE C.tax_rate_to_change	END next_tax_rate, 
	next_war_time
FROM ( 
	SELECT * 
	FROM 
		castle	(nolock)) as C 
	LEFT JOIN (	
		SELECT pledge_id, name,	ruler_id, alliance_id 
		FROM pledge	(nolock)) as P 
		ON C.pledge_id = P.pledge_id 
	LEFT JOIN (	
		SELECT char_id,	char_name 
		FROM user_data (nolock)) as	U 
		ON P.ruler_id =	U.char_id 
	LEFT JOIN (	
		SELECT id, name	
		FROM alliance (nolock))	as A 
		ON P.alliance_id = A.id	
ORDER BY 
	C.id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAllMemberPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAllMemberPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetAllMemberPledge    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_GetAllMemberPledge
-- by bert
CREATE PROCEDURE
[dbo].[lin_GetAllMemberPledge] (@alliance_id INT)
AS

SET NOCOUNT ON

SELECT pledge_id FROM pledge WHERE alliance_id = @alliance_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeFlagTime]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeFlagTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
/*EXEC lin_SetPledgeFlagTime ''%d-%d-%d %d:00:00'',%d */

CREATE PROCEDURE [dbo].[lin_SetPledgeFlagTime]
(
	@field_data datetime,
	@pledge_id	int
)
AS
SET NOCOUNT ON
update pledge set flag_time = @field_data where pledge_id =  @pledge_id
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_StartPledgeWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_StartPledgeWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_StartPledgeWar    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_StartPledgeWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_StartPledgeWar] (@challenger_pledge_id INT, @challengee_pledge_id INT, @war_begin_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

DECLARE @challenger_name VARCHAR(50)
DECLARE @challengee_name VARCHAR(50)

SELECT @challenger_name = name FROM Pledge WHERE pledge_id = @challenger_pledge_id
SELECT @challengee_name = name FROM Pledge WHERE pledge_id = @challengee_pledge_id

INSERT INTO Pledge_War
(challenger, challengee, begin_time, challenger_name, challengee_name)
VALUES
(@challenger_pledge_id, @challengee_pledge_id, @war_begin_time, @challenger_name, @challengee_name)

SELECT @@IDENTITY


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DismissAlliance]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DismissAlliance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DismissAlliance    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_DismissAlliance
-- by bert
-- return Result(0 if failed)

CREATE PROCEDURE
[dbo].[lin_DismissAlliance] (@alliance_id INT, @master_pledge_id INT, @dismiss_time INT)
AS

SET NOCOUNT ON

DECLARE @result INT

BEGIN TRAN

DELETE FROM alliance
WHERE id = @alliance_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
	GOTO EXIT_TRAN
END

UPDATE pledge
SET alliance_dismiss_time = @dismiss_time
WHERE pledge_id = @master_pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
END

EXIT_TRAN:

IF @result <> 0
BEGIN
	COMMIT TRAN
	UPDATE pledge SET alliance_id = 0 WHERE alliance_id = @alliance_id
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @result



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeByName]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeByName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_LoadPledgeByName]
(
 @PledgeName  NVARCHAR(50)  
) 
AS
SET NOCOUNT ON

SELECT
	p.pledge_id, p.name, p.ruler_id, ud.char_name,   
	p.alliance_id, p.challenge_time, p.now_war_id, p.name_value, p.oust_time, p.skill_level,   
	p.private_flag, p.status, p.rank, p.castle_id, p.agit_id, p.root_name_value,   
	p.crest_id, p.is_guilty, p.dismiss_reserved_time, p.alliance_ousted_time, p.alliance_withdraw_time, p.alliance_dismiss_time,
	p.emblem_id,ISNULL(YEAR(p.flag_time),0),ISNULL(MONTH(p.flag_time),0),ISNULL(DAY(p.flag_time),0),ISNULL(DATEPART(HOUR,p.flag_time),0),p.score,
	p.hasAcademy,p.hasGuard1,p.hasGuard2,p.hasKnight1,p.hasKnight2,p.hasKnight3,p.hasKnight4,
	ISNULL(p.AcademyName,''''),ISNULL(p.Guard1Name,''''),ISNULL(p.Guard2Name,''''),ISNULL(p.Knight1Name,''''),ISNULL(p.Knight2Name,''''),ISNULL(p.Knight3Name,''''),ISNULL(p.Knight4Name,''''),
	p.AcademyRuler_id,p.Guard1Ruler_id,p.Guard2Ruler_id,p.Knight1Ruler_id,p.Knight2Ruler_id,p.Knight3Ruler_id,p.Knight4Ruler_id,
	p.AcademyPowerFlag,p.MainClanPowerFlag,p.GuardPowerFlag,p.KinghtPowerFlag,
	p.Group1PowerFlag,p.Group2PowerFlag,p.Group3PowerFlag,p.Group4PowerFlag,p.Group5PowerFlag
FROM
	pledge p (NOLOCK), user_data ud (NOLOCK)
WHERE
	p.name = @PledgeName AND p.ruler_id = ud.char_id AND p.pledge_id = ud.pledge_id AND p.pledge_id <> -1
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeById]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeById]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_LoadPledgeById]
(
	@PledgeId		int
)
AS
SET NOCOUNT ON



SELECT 
	p.pledge_id, p.name, p.ruler_id, ud.char_name, 
	p.alliance_id, p.challenge_time, p.now_war_id, p.name_value, p.oust_time, p.skill_level, 
	p.private_flag, p.status, p.rank, p.castle_id, p.agit_id, p.root_name_value, 
	p.crest_id, p.is_guilty, p.dismiss_reserved_time, p.alliance_ousted_time, p.alliance_withdraw_time, p.alliance_dismiss_time,
	p.emblem_id,ISNULL(YEAR(p.flag_time),0),ISNULL(MONTH(p.flag_time),0),ISNULL(DAY(p.flag_time),0),ISNULL(DATEPART(HOUR,p.flag_time),0),p.score,
	p.hasAcademy,p.hasGuard1,p.hasGuard2,p.hasKnight1,p.hasKnight2,p.hasKnight3,p.hasKnight4,
	ISNULL(p.AcademyName,''''),ISNULL(p.Guard1Name,''''),ISNULL(p.Guard2Name,''''),ISNULL(p.Knight1Name,''''),ISNULL(p.Knight2Name,''''),ISNULL(p.Knight3Name,''''),ISNULL(p.Knight4Name,''''),
	p.AcademyRuler_id,p.Guard1Ruler_id,p.Guard2Ruler_id,p.Knight1Ruler_id,p.Knight2Ruler_id,p.Knight3Ruler_id,p.Knight4Ruler_id,
	p.AcademyPowerFlag,p.MainClanPowerFlag,p.GuardPowerFlag,p.KinghtPowerFlag,
	p.Group1PowerFlag,p.Group2PowerFlag,p.Group3PowerFlag,p.Group4PowerFlag,p.Group5PowerFlag
	
FROM 
	(select * from pledge (nolock)where pledge_id = @PledgeId) as  p  
	JOIN 
	(select * from user_data (nolock)where pledge_id = @PledgeId) as  ud
	ON p.ruler_id = ud.char_id
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeletePledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeletePledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeletePledge    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_DeletePledge
-- by bert
-- return none

CREATE PROCEDURE
[dbo].[lin_DeletePledge] (@pledge_id INT)
AS

SET NOCOUNT ON

DELETE
FROM Pledge
WHERE pledge_id = @pledge_id

UPDATE user_data
SET pledge_id = 0
WHERE pledge_id = @pledge_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadDismissReservedPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadDismissReservedPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadDismissReservedPledge    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadDismissReservedPledge
	
INPUT	
	@status	int
OUTPUT
	pledge_id, 
	dismiss_reserved_time 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_LoadDismissReservedPledge]
(
	@status	int
)
AS
SET NOCOUNT ON

SELECT pledge_id, dismiss_reserved_time FROM pledge  (nolock) WHERE status = @status





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteCharClearPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteCharClearPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeleteCharClearPledge    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DeleteCharClearPledge
	Delete character sp
INPUT
	@char_id	INT
OUTPUT
	item_id
return
made by
	bert, young
date
	2003-09-17
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteCharClearPledge]
(
	@char_id INT
)
AS

SET NOCOUNT ON

DECLARE @pledge_id INT

SELECT @pledge_id = pledge_id FROM user_data WHERE char_id = @char_id 

IF @pledge_id <> 0
BEGIN
	DECLARE @ruler_id INT
	DECLARE @now_war_id INT

	SELECT @ruler_id = ruler_id, @now_war_id = now_war_id FROM pledge WHERE pledge_id = @pledge_id
	IF @ruler_id = @char_id  -- ???? ?? ?? ??
	BEGIN
		IF @now_war_id <> 0 -- ?? ?? ??? ?? ?? ??
		BEGIN
			DECLARE @challenger INT
			DECLARE @challengee INT

			SELECT @challenger = challenger, @challengee = challengee FROM pledge_war WHERE id = @now_war_id
			UPDATE pledge SET now_war_id = 0 WHERE pledge_id IN (@challenger, @challengee)
			DELETE FROM pledge_war WHERE id = @now_war_id
		END
		
		UPDATE user_data SET pledge_id = 0 WHERE pledge_id = @pledge_id
	END
	UPDATE user_data SET pledge_id = 0 WHERE char_id = @char_id 
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAllPledge    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadAllPledge
	
INPUT
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_LoadAllPledge]
--(
--	@account_name	nvarchar(50)
--)
AS
SET NOCOUNT ON

SELECT 
	p.pledge_id, p.name, p.ruler_id, ud.char_name, 
	p.alliance_id, p.challenge_time, p.now_war_id, p.name_value, p.oust_time, p.skill_level, 
	p.private_flag, p.status, p.rank, p.castle_id, p.agit_id, p.root_name_value, 
	p.crest_id, p.is_guilty, p.dismiss_reserved_time 
FROM 
	pledge p (nolock),
	(select * from user_data (nolock) where pledge_id > 0 ) ud 
WHERE
	p.ruler_id = ud.char_id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllCastle]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllCastle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAllCastle    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadAllCastle
	
INPUT
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_LoadAllCastle]
--(
--	@tax_rate		int,
--	@castle_id		int
--)
AS
SET NOCOUNT ON

SELECT castle_d.id, castle_d.pledge_id, castle_d.next_war_time, castle_d.tax_rate, (select char_name from user_data where char_id = p.ruler_id)
FROM 
	(select * from castle (nolock) where type= 1) as castle_d
	inner join
	(select * from pledge (nolock) where pledge_id in (select pledge_id from castle)) as p
	on 
	castle_d.pledge_id = p.pledge_id
ORDER BY castle_d.id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAgitAuction]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAgitAuction]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_SetAgitAuction
	create agit bid
INPUT
	@auction_id	int

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_SetAgitAuction]
(
@agit_id		INT,
@auction_id		INT,
@next_cost		INT

)
AS
SET NOCOUNT ON

declare @max_price  int
declare @attend_id int
declare @pledge_id int
declare @tax int

set @attend_id = 0
set @max_price = 0
set @pledge_id = 0
set @tax = 0

select top 1 @max_price = attend_price, @attend_id = attend_id, @pledge_id = attend_pledge_id from agit_bid (nolock) 
	where auction_id = @auction_id 
	order by attend_price desc, attend_id asc

if ( @max_price > 0 )
begin
	-- ??
	update agit_auction set accepted_bid = @attend_id where auction_id = @auction_id
	update agit set auction_id = null , last_price = @max_price, next_cost = @next_cost  , cost_fail = NULL  where id = @agit_id
	update pledge set agit_id = @agit_id where pledge_id = @pledge_id
	select @tax = isnull( auction_tax , 0) from agit_auction (nolock) where auction_id = @auction_id
end  else begin
	-- ??
	update agit_auction set accepted_bid = 0 where auction_id = @auction_id
	update agit set auction_id = null , next_cost = 0  , cost_fail = NULL where id = @agit_id
end

select @attend_id, @max_price, @pledge_id, @tax


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SendMail]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SendMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_SendMail
	send mail 
INPUT
	@char_id		int,
	@mail_type		int,
	@related_id		int,
	@receiverName		nvarchar(50),
	@title			nvarchar(200),
	@content		nvarchar(4000)
OUTPUT
return
made by
	kks
date
	2004-12-15
modified by
	kks
date
	2005-04-26
********************************************/
CREATE PROCEDURE [dbo].[lin_SendMail]
(
	@char_id		int,
	@mail_type		int,
	@related_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
)
AS
SET NOCOUNT ON

DECLARE @mail_id int
SET @mail_id = 0

INSERT INTO user_mail
(title, content) VALUES (@title, @content)

SET @mail_id = @@IDENTITY

DECLARE @sender_name nvarchar(50)
DECLARE @char_name NVARCHAR(50)

SELECT @sender_name = char_name FROM user_data(nolock) WHERE char_id = @char_id

INSERT INTO user_mail_sender
(mail_id, related_id, mail_type, sender_id, sender_name, receiver_name_list)
VALUES
(@mail_id, @related_id, @mail_type, @char_id, @sender_name, @receiver_name_list)

if @mail_type = 1
BEGIN
	DECLARE name_cursor CURSOR FOR
	(SELECT char_name FROM user_data(nolock) WHERE pledge_id = (SELECT pledge_id FROM pledge(nolock) WHERE name = @receiver_name_list))
	OPEN name_cursor
	FETCH NEXT FROM name_cursor into @char_name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC lin_SendMailToReceiver @mail_id, @char_name
		FETCH NEXT FROM name_cursor into @char_name
	END

	CLOSE name_cursor
	DEALLOCATE name_cursor
END
ELSE
BEGIN
--	DECLARE @receiver_name_list_replaced nvarchar(300)
--	SELECT @receiver_name_list_replaced = REPLACE(@receiver_name_list,'';'', '' ; '')
	
--	DECLARE @receiver_name1 nvarchar (50), @receiver_name2 nvarchar (50), @receiver_name3 nvarchar (50), @receiver_name4 nvarchar (50), @receiver_name5 nvarchar (50)
--	EXEC master..xp_sscanf @receiver_name_list_replaced, ''%s ; %s ; %s ; %s ; %s '',
--	   @receiver_name1 OUTPUT, @receiver_name2 OUTPUT, @receiver_name3 OUTPUT, @receiver_name4 OUTPUT, @receiver_name5 OUTPUT
	
--	EXEC lin_SendMailToReceiver @mail_id, @receiver_name1
--	EXEC lin_SendMailToReceiver @mail_id, @receiver_name2
--	EXEC lin_SendMailToReceiver @mail_id, @receiver_name3
--	EXEC lin_SendMailToReceiver @mail_id, @receiver_name4
--	EXEC lin_SendMailToReceiver @mail_id, @receiver_name5
	
	DECLARE @pos int

	set @pos = charindex('';'', @receiver_name_list)
	while (@pos > 0)
	begin
		SET @char_name = substring(@receiver_name_list, 0, @pos)
		EXEC lin_SendMailToReceiver @mail_id, @char_name

		set @receiver_name_list = substring(@receiver_name_list, @pos+1, len(@receiver_name_list)-@pos+1)
		set @pos = charindex('';'', @receiver_name_list)
	end
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_JoinAlliance]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_JoinAlliance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_JoinAlliance    Script Date: 2003-09-20 ?? 11:51:59 ******/
-- lin_JoinAlliance
-- by bert
-- return Result(0 if failed)

CREATE PROCEDURE
[dbo].[lin_JoinAlliance] (@alliance_id INT, @member_pledge_id INT)
AS

SET NOCOUNT ON

DECLARE @result INT

UPDATE pledge
SET alliance_id = @alliance_id
WHERE pledge_id = @member_pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
END

SELECT @result



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreatePledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreatePledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_CreatePledge
-- by bert
-- return pledge_id, ruler_name
CREATE PROCEDURE
[dbo].[lin_CreatePledge] (@name NVARCHAR(50), @ruler_id INT)
AS

SET NOCOUNT ON

DECLARE @pledge_id INT


BEGIN TRAN

IF @name LIKE N'' ''   
BEGIN  
 RAISERROR (''pledge name has space : name = [%s]'', 16, 1, @name)  
 GOTO EXIT_TRAN
END  
  
-- check user_prohibit   
IF EXISTS(SELECT char_name FROM user_prohibit (nolock) WHERE char_name = @name)  
BEGIN
 RAISERROR (''pledge name is prohibited: name = [%s]'', 16, 1, @name)  
 GOTO EXIT_TRAN
END
  
DECLARE @user_prohibit_word NVARCHAR(20)  
SELECT TOP 1 @user_prohibit_word = words FROM user_prohibit_word (nolock) WHERE PATINDEX(''%'' + words + ''%'', @name) > 0   
IF @user_prohibit_word IS NOT NULL
BEGIN
 RAISERROR (''pledge name has prohibited word: name = [%s], word[%s]'', 16, 1, @name, @user_prohibit_word)  
 GOTO EXIT_TRAN
END

INSERT INTO Pledge (name, ruler_id) VALUES (@name, @ruler_id)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @pledge_id = @@IDENTITY
	UPDATE user_data
	SET pledge_id = @pledge_id
	WHERE char_id = @ruler_id
END
ELSE
BEGIN
	SELECT @pledge_id = 0
	GOTO EXIT_TRAN
END

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
BEGIN
	SELECT @pledge_id = 0
END

EXIT_TRAN:
IF @pledge_id <> 0
BEGIN
	COMMIT TRAN
	SELECT @pledge_id AS pledge_id, (SELECT char_name FROM user_data WHERE char_id = @ruler_id) AS pledge_ruler_name
END
ELSE
BEGIN
	ROLLBACK TRAN
	SELECT 0 AS pledge_id, N'''' AS pledge_ruler_name
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InitPledgeEmblem]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InitPledgeEmblem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_InitPledgeEmblem
	
INPUT	
	@pledge_id	int
OUTPUT

return
made by
	kks
date
	2005-07-22
********************************************/
create PROCEDURE [dbo].[lin_InitPledgeEmblem]
(
	@pledge_id	int
)
AS
SET NOCOUNT ON

UPDATE Pledge SET emblem_id = 0 WHERE pledge_id = @pledge_id	-- update tuple from pledge table



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InitPledgeCrest]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InitPledgeCrest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InitPledgeCrest    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_InitPledgeCrest
	
INPUT	
	@pledge_id	int
OUTPUT

return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_InitPledgeCrest]
(
	@pledge_id	int
)
AS
SET NOCOUNT ON

UPDATE Pledge SET crest_id = 0 WHERE pledge_id = @pledge_id	-- update tuple from pledge table






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetWarDeclare]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetWarDeclare]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetWarDeclare]
AS
SELECT challenger, challengee FROM war_declare WHERE challenger IN (SELECT pledge_id FROM pledge) AND challengee IN (SELECT pledge_id FROM pledge)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveKillDeath]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveKillDeath]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveKillDeath]
(
@pledge_id INT,
@kill_no INT,
@death_no INT
)
AS
SET NOCOUNT ON

UPDATE pledge
SET siege_kill = @kill_no, siege_death = @death_no
WHERE pledge_id = @pledge_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateAlliance]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateAlliance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE
[dbo].[lin_CreateAlliance] (@name NVARCHAR(50), @master_pledge_id INT)
AS

SET NOCOUNT ON

DECLARE @alliance_id INT

BEGIN TRAN

IF @name LIKE N'' ''   
BEGIN  
 RAISERROR (''alliance name has space : name = [%s]'', 16, 1, @name)  
 GOTO EXIT_TRAN
END  
  
-- check user_prohibit   
IF EXISTS(SELECT char_name FROM user_prohibit (nolock) WHERE char_name = @name)  
BEGIN
 RAISERROR (''alliance name is prohibited: name = [%s]'', 16, 1, @name)  
 GOTO EXIT_TRAN
END
  
DECLARE @user_prohibit_word NVARCHAR(20)  
SELECT TOP 1 @user_prohibit_word = words FROM user_prohibit_word (nolock) WHERE PATINDEX(''%'' + words + ''%'', @name) > 0   
IF @user_prohibit_word IS NOT NULL
BEGIN
 RAISERROR (''alliance name has prohibited word: name = [%s], word[%s]'', 16, 1, @name, @user_prohibit_word)  
 GOTO EXIT_TRAN
END

INSERT INTO alliance (name, master_pledge_id) VALUES (@name, @master_pledge_id)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @alliance_id = @@IDENTITY
	UPDATE pledge
	SET alliance_id = @alliance_id
	WHERE pledge_id = @master_pledge_id
END
ELSE
BEGIN
	SELECT @alliance_id = 0
	GOTO EXIT_TRAN
END

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
BEGIN
	SELECT @alliance_id = 0
END

EXIT_TRAN:
IF @alliance_id <> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @alliance_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSiegeRelatedAlliancePledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSiegeRelatedAlliancePledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetSiegeRelatedAlliancePledge    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetSiegeRelatedAlliancePledge
	
INPUT	
	@alliance_id	int

OUTPUT
	castle_id,
	pledge_id, 
	type 
return
made by
	bert
********************************************/
CREATE PROCEDURE [dbo].[lin_GetSiegeRelatedAlliancePledge]
(
	@alliance_id	int
)
AS
SET NOCOUNT ON

SELECT castle_id, pledge_id, type 
FROM castle_war
WHERE pledge_id IN (SELECT pledge_id FROM pledge WHERE alliance_id = @alliance_id)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetPledgeKillDeathCount]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetPledgeKillDeathCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetPledgeKillDeathCount]
(
@castle_id INT
)
AS
SET NOCOUNT ON

SELECT pledge_id, siege_kill, siege_death FROM pledge 
WHERE pledge_id IN 
(SELECT pledge_id FROM castle_war WHERE castle_id = @castle_id AND (type = 1 OR type = 2))




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CleanUpGhostData]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CleanUpGhostData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_CleanUpGhostData  
     
INPUT    
OUTPUT    
    
return    
made by    
 bert   
date    
 2004-04-27    
 2005-11-21	by btwinuni	delete pledge_war, alliance_war
 2005-12-20	by btwinuni	add clean up war_declare
********************************************/    
CREATE PROCEDURE [dbo].[lin_CleanUpGhostData]  
AS  
SET NOCOUNT ON  
  
-- ?? ??  
UPDATE user_data  
SET pledge_id = 0, nickname = ''''  
WHERE account_id IN (-1, -3)  
  
-- ?? ?? ??  
DELETE FROM user_friend  
WHERE  
char_id IN (SELECT char_id FROM user_data WHERE account_id IN (-1, -3))  
OR  
friend_char_id IN (SELECT char_id FROM user_data WHERE account_id IN (-1, -3))  

-- ?? ???? ??  
DELETE FROM user_blocklist
WHERE  
char_id IN (SELECT char_id FROM user_data WHERE account_id IN (-1, -3))  
OR  
block_char_id IN (SELECT char_id FROM user_data WHERE account_id IN (-1, -3))  
  
-- ?? ?? ?? (???? ?? ?)  
DELETE FROM pledge WHERE ruler_id IN (SELECT char_id FROM user_data WHERE account_id IN (-1, -3))  
  
-- ???? ????  
UPDATE user_data  
SET pledge_id = 0  
WHERE pledge_id <> 0 AND pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
UPDATE user_data  
SET nickname = ''''  
WHERE pledge_id = 0  
  
-- ?? ??? ??? ??  
UPDATE agit  
SET pledge_id = 0  
WHERE pledge_id <> 0 AND pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
-- ?? ? ??? ??  
UPDATE castle  
SET pledge_id = 0  
WHERE pledge_id <> 0 AND pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
-- 2005-12-20	by btwinuni
-- ?? ?? ?? ??  
DELETE FROM war_declare
WHERE  
(challengee <> 0 AND challengee NOT IN (SELECT pledge_id FROM pledge))  
OR  
(challenger <> 0 AND challenger NOT IN (SELECT pledge_id FROM pledge))  
  
DELETE FROM siege_agit_pledge  
WHERE  
pledge_id <> 0 AND pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
DELETE FROM team_battle_agit_pledge  
WHERE  
pledge_id <> 0 AND pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
-- ?? ?? ??(???? ?? ??)  
DELETE FROM alliance WHERE master_pledge_id NOT IN (SELECT pledge_id FROM pledge)  
  
-- ?? ???? ??  
UPDATE pledge  
SET alliance_id = 0  
WHERE alliance_id <> 0 AND alliance_id NOT IN (SELECT id FROM alliance)  
  
-- 2005-11-21	by btwinuni
-- ?? ??? ??  
--DELETE FROM alliance_war  
--WHERE  
--status = 0  
--AND  
--(  
--(challengee <> 0 AND challengee NOT IN (SELECT id FROM alliance))  
--OR  
--(challenger <> 0 AND challenger NOT IN (SELECT id FROM alliance))  
--)





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_OustMemberPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_OustMemberPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_OustMemberPledge    Script Date: 2003-09-20 ?? 11:51:59 ******/
-- lin_OustMemberPledge
-- by bert
-- return Result(0 if failed)

CREATE PROCEDURE
[dbo].[lin_OustMemberPledge] (@alliance_id INT, @member_pledge_id INT, @oust_time INT)
AS

SET NOCOUNT ON

DECLARE @result INT

BEGIN TRAN

UPDATE alliance
SET oust_time = @oust_time
WHERE id = @alliance_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
	GOTO EXIT_TRAN
END

UPDATE pledge
SET alliance_id = 0, alliance_ousted_time = @oust_time
WHERE pledge_id = @member_pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
END

EXIT_TRAN:
IF @result <> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @result



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ApproveBattle]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ApproveBattle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ApproveBattle    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_ApproveBattle
	
INPUT	
	@castle_id	int,
	@type	int
OUTPUT
	pledge_id, 
	name 
	type
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_ApproveBattle]
(
	@castle_id	int,
	@type	int
)
AS
SET NOCOUNT ON

SELECT 
	p.pledge_id, 
	p.name, 
	type 
FROM 
	pledge p (nolock), 
	castle_war cw (nolock) 
WHERE 
	p.pledge_id = cw.pledge_id 
	AND cw.castle_id = @castle_id
	AND cw.type <> @type





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharacter]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharacter]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_MoveCharacter]
(
	@player_id INT
)
AS
SET NOCOUNT ON

DECLARE @pledge_id INT
declare @alliance_id	int

SELECT @pledge_id = pledge_id  FROM user_data WHERE char_id = @player_id

IF @pledge_id <> 0
BEGIN
	DECLARE @ruler_id INT
	SELECT @ruler_id = ruler_id FROM pledge WHERE pledge_id = @pledge_id

--	IF @ruler_id = @player_id -- ???? ?? ?? ??
--	BEGIN
--		DELETE FROM pledge WHERE pledge_id = @pledge_id
--	END
	UPDATE user_data SET pledge_id = 0 , nickname = null WHERE char_id = @player_id
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetHeroById]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetHeroById]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetHeroById]
(
@char_id INT
)
AS

SELECT 
udnp.char_name AS char_name, 
udnp.main_class AS main_class, 
udnp.hero_type AS hero_type, 
udnp.pledge_id AS pledge_id,
ISNULL(udnp.pledge_name, N'''') AS pledge_name,
ISNULL(udnp.pledge_crest_id, 0) AS pledge_crest_id,
ISNULL(udnp.alliance_id, 0) AS alliance_id, 
ISNULL(a.name, N'''') AS alliance_name,
ISNULL(a.crest_id, 0) AS alliance_crest_id, 
udnp.win_count AS win_count,
ISNULL(udnp.words, N'''') AS words, 
udnp.history_open AS history_open 

FROM
	(SELECT
	udn.char_name AS char_name, 
	udn.main_class AS main_class, 
	udn.hero_type AS hero_type, 
	udn.pledge_id AS pledge_id,
	p.name AS pledge_name,
	p.crest_id AS pledge_crest_id,
	p.alliance_id AS alliance_id, 
	udn.win_count AS win_count,
	udn.words AS words, 
	udn.history_open AS history_open
 
	FROM
		(SELECT
		ud.char_name AS char_name, 
		ud.subjob0_class AS main_class, 
		un.hero_type AS hero_type, 
		ud.pledge_id AS pledge_id,
		un.win_count AS win_count,
		un.words AS words, 
		un.history_open AS history_open
 
		FROM user_data AS ud
			INNER JOIN user_nobless AS un
			ON ud.char_id = @char_id AND ud.char_id = un.char_id
		) AS udn
			LEFT OUTER JOIN pledge AS p 
			ON udn.pledge_id = p.pledge_id
	) AS udnp
		LEFT OUTER JOIN alliance AS a 
		ON udnp.alliance_id = a.id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModifySendTempMail]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModifySendTempMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ModifySendTempMail
	modify and send temp mail 
INPUT
	@char_id		int,
	@mail_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
OUTPUT
return
made by
	kks
date
	2004-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_ModifySendTempMail]
(
	@char_id		int,
	@mail_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
)
AS
SET NOCOUNT ON

UPDATE user_mail
SET title = @title,
	content = @content,
	created_date = GETDATE()
WHERE id = @mail_id

UPDATE user_mail_sender
SET receiver_name_list = @receiver_name_list,
	send_date = GETDATE(),
	mailbox_type = 1
WHERE 
	mail_id = @mail_id AND 
	sender_id = @char_id

DECLARE @mail_type INT
SELECT @mail_type = mail_type FROM user_mail_sender(nolock) WHERE mail_id = @mail_id

if @mail_type = 1
BEGIN
	DECLARE @char_name NVARCHAR(50)
	DECLARE name_cursor CURSOR FOR
	(SELECT char_name FROM user_data(nolock) WHERE pledge_id = (SELECT pledge_id FROM pledge(nolock) WHERE name = @receiver_name_list))
	OPEN name_cursor
	FETCH NEXT FROM name_cursor into @char_name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC lin_SendMailToReceiver @mail_id, @char_name
	END

	CLOSE name_cursor
	DEALLOCATE name_cursor
END
ELSE
BEGIN
	DECLARE @receiver_name_list_replaced nvarchar(300)
	SELECT @receiver_name_list_replaced = REPLACE(@receiver_name_list,'';'', '' ; '')
	
	DECLARE @receiver_name1 nvarchar (50), @receiver_name2 nvarchar (50), @receiver_name3 nvarchar (50), @receiver_name4 nvarchar (50), @receiver_name5 nvarchar (50)
	EXEC master..xp_sscanf @receiver_name_list_replaced, ''%s ; %s ; %s ; %s ; %s'',
	   @receiver_name1 OUTPUT, @receiver_name2 OUTPUT, @receiver_name3 OUTPUT, @receiver_name4 OUTPUT, @receiver_name5 OUTPUT
	
	EXEC lin_SendMailToReceiver @mail_id, @receiver_name1
	EXEC lin_SendMailToReceiver @mail_id, @receiver_name2
	EXEC lin_SendMailToReceiver @mail_id, @receiver_name3
	EXEC lin_SendMailToReceiver @mail_id, @receiver_name4
	EXEC lin_SendMailToReceiver @mail_id, @receiver_name5
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_WithdrawAlliance]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_WithdrawAlliance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_WithdrawAlliance    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_WithdrawAlliance
-- by bert
-- return Result(0 if failed)

CREATE PROCEDURE
[dbo].[lin_WithdrawAlliance] (@alliance_id INT, @member_pledge_id INT, @alliance_withdraw_time INT)
AS

SET NOCOUNT ON

DECLARE @result INT

UPDATE pledge
SET alliance_id = 0, alliance_withdraw_time = @alliance_withdraw_time
WHERE pledge_id = @member_pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @result = 1
END
ELSE
BEGIN
	SELECT @result = 0
END

SELECT @result



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModifyPledgeName]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModifyPledgeName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ModifyPledgeName    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_ModifyPledgeName
	
INPUT
	@crest_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_ModifyPledgeName]
(
	@pledge_name		NVARCHAR(50),
	@pledge_id		int
)
AS
SET NOCOUNT ON

update pledge set name = @pledge_name where pledge_id = @pledge_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetDbRelatedCounts]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetDbRelatedCounts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetDbRelatedCounts]
AS  
SET NOCOUNT ON  
  
SELECT  
(SELECT COUNT(id) FROM alliance) AS alliance_count,  
(SELECT COUNT(*) FROM war_declare WHERE challenger IN (SELECT pledge_id FROM pledge) AND challengee IN (SELECT pledge_id FROM pledge)) AS pledge_war_count,  
(SELECT COUNT(pledge_id) FROM pledge WHERE status = 3) AS dismiss_reserved_count,
(SELECT COUNT(*) FROM user_nobless WHERE char_id IN (SELECT char_id FROM user_data)) AS nobless_count



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ViewSiegeList]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ViewSiegeList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ViewSiegeList    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_ViewSiegeList
	
INPUT	
	@castle_id	int,
	@type	int
OUTPUT
	pledge_id, 
	name 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_ViewSiegeList]
(
	@castle_id	int,
	@type	int
)
AS
SET NOCOUNT ON

SELECT 
	p.pledge_id, p.name 
FROM 
	pledge p (nolock) , 
	castle_war cw (nolock)  
WHERE 
	p.pledge_id = cw.pledge_id 
	AND cw.castle_id = @castle_id
	AND cw.type = @type






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetContributionWinnerPledge]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetContributionWinnerPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[lin_GetContributionWinnerPledge]
(
	@agit_id		int,
	@register_only	int
)
AS
SET NOCOUNT ON

IF @register_only = 0	-- not siege agit
BEGIN
SELECT 
	p.pledge_id 
FROM 
	pledge p (nolock) , 
	pledge_contribution pc (nolock)  
WHERE 
	p.pledge_id = pc.pledge_id 
	AND (p.agit_id = @agit_id OR p.agit_id = 0) 
	AND p.skill_level >= 4 
	AND pc.residence_id = @agit_id
ORDER BY 
	pc.contribution DESC
END
ELSE			-- siege agit
BEGIN
SELECT 
	p.pledge_id 
FROM 
	pledge p (nolock) , 
	pledge_contribution pc (nolock)  
WHERE 
	p.pledge_id = pc.pledge_id 
	AND (p.agit_id = @agit_id OR p.agit_id = 0) 
	AND p.skill_level >= 4 
	AND pc.residence_id = @agit_id
	AND p.pledge_id IN (SELECT pledge_id FROM siege_agit_pledge WHERE agit_id = @agit_id)
ORDER BY 
	pc.contribution DESC
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CancelWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CancelWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_CancelWar]
(
@challenger INT,
@challengee INT
)
AS
SET NOCOUNT ON

DELETE FROM war_declare
WHERE challenger = @challenger AND challengee = @challengee



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeclareWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeclareWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeclareWar]
(
@challenger INT,
@challengee INT,
@declare_time INT
)
AS
SET NOCOUNT ON

INSERT INTO war_declare (challenger, challengee, declare_time) VALUES (@challenger, @challengee, @declare_time)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelPledgeCrest]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelPledgeCrest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DelPledgeCrest    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DelPledgeCrest
	
INPUT
	@crest_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_DelPledgeCrest]
(
	@crest_id		int
)
AS
SET NOCOUNT ON

delete from pledge_crest where crest_id = @crest_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeCrest]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeCrest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'





/****** Object:  Stored Procedure dbo.lin_SetPledgeCrest    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_SetPledgeCrest
-- by bert
-- return crest id
-- modified by kks (2005-08-18)

CREATE PROCEDURE [dbo].[lin_SetPledgeCrest]
(
	@bitmap_size	INT,
	@bitmap	VARBINARY(3072)
)
AS

SET NOCOUNT ON

INSERT INTO Pledge_Crest
(bitmap_size, bitmap) VALUES (@bitmap_size, @bitmap)

SELECT @@IDENTITY



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeCrest]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeCrest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadPledgeCrest    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadPledgeCrest
	
INPUT
	@crest_id	int
OUTPUT
	bitmap_size, 
	bitmap 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_LoadPledgeCrest]
(
	@crest_id	int
)
AS
SET NOCOUNT ON

SELECT 
	bitmap_size, bitmap 
FROM 
	pledge_crest  (nolock) 
WHERE 
	crest_id = @crest_id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertQuestName]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertQuestName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InsertQuestName    Script Date: 2003-09-20 ?? 11:51:59 ******/

/********************************************
lin_InsertQuestName
	insert Quest name data
INPUT
	@id	INT,
	@name 	nvarchar(50),
	@data 	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-10-8
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertQuestName]
(
@id	INT,
@name 	nvarchar(50),
@data 	nvarchar(50)
)
AS
SET NOCOUNT ON


INSERT INTO QuestData
	(id, name, data) 
	values 
	(@id, @name, @data)




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertSkillName]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertSkillName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InsertSkillName    Script Date: 2003-09-20 ?? 11:51:59 ******/

/********************************************
lin_InsertSkillName
	insert Skill name data
INPUT
	@id	INT,
	@lev 	INT,
	@name 	nvarchar(50)
	@skill_desc 	nvarchar(50),
	@magic_skill	INT,
	@activateType	nvarchar(5)
OUTPUT
return
made by
	carrot
date
	2002-10-8
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertSkillName]
(
@id	INT,
@lev 	INT,
@name 	nvarchar(50),
@skill_desc 	nvarchar(50),
@magic_skill	INT,
@activateType	nvarchar(5)
)
AS
SET NOCOUNT ON


INSERT INTO skillData
	(id, lev, name, skill_desc, bIsMagic, activate_type) 
	values 
	(@id, @lev, @name, @skill_desc, @magic_skill, @activateType)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RegisterAccount]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RegisterAccount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/******************************************************************************
#Name:	lin_RegisterAccount
#Desc:	add account to account_ch2 table

#Argument:
	Input:	@account_name	VARCHAR(50)
	Output:
#Return:
#Result Set:

#Remark:
#Example:
#See:
#History:
	Create	btwinuni	2005-09-12
******************************************************************************/
CREATE PROCEDURE [dbo].[lin_RegisterAccount]
(
	@account_name	nvarchar(50)
)
AS

SET NOCOUNT ON

-- if there is not account_ch2 table, end procedure
if not exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[account_ch2]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
begin
	return
end

-- account duplication check
if not exists (select * from account_ch2 where account = @account_name)
begin
	insert into account_ch2 values (@account_name)
end






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CancelAgitAuction]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CancelAgitAuction]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_CancelAgitAuction
	cancel agit auction
INPUT
	@agit_id	int,


OUTPUT
return
made by
	young
date
	2003-12-11
********************************************/
CREATE PROCEDURE [dbo].[lin_CancelAgitAuction]
(
@agit_id		INT,
@last_cancel		INT
)
AS
SET NOCOUNT ON

declare @auction_id int
set @auction_id = 0

select @auction_id = isnull(auction_id , 0) from agit (nolock) where id = @agit_id

update agit set auction_id = 0 , last_cancel = @last_cancel where id = @agit_id

select @auction_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_WriteCastleTax]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_WriteCastleTax]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************      
lin_WriteCastleTax      
       
INPUT      
OUTPUT      
return      
made by      
 carrot      
date      
 2002-06-10      
change carrot 2003-12-22    
 add tax_type, residence type to differentiate agit from castle    
change carrot 2004-02-29  
 add TaxRateToChange  
********************************************/      
CREATE PROCEDURE [dbo].[lin_WriteCastleTax]      
(      
 @nIsCastle int,    
 @tax_type int,      
 @tax_rate  int,      
 @to_change  int,      
 @residence_id  int      
)      
AS      
SET NOCOUNT ON      
    
IF(@nIsCastle = 1)    
BEGIN    
 IF (@tax_type = 2)    
  UPDATE castle SET tax_child_rate = @tax_rate, tax_child_rate_to_change = @to_change  WHERE id = @residence_id      
 ELSE IF (@tax_type = 1)    
  UPDATE castle SET tax_rate = @tax_rate, tax_rate_to_change = @to_change  WHERE id = @residence_id      
 ELSE    
  RAISERROR (''tax type is invalid. castle cannot save type[%d] id and castle id[%d].'', 16, 1, @tax_type, @residence_id )    
END    
ELSE IF(@nIsCastle = 0)    
BEGIN    
 IF (@tax_type = 2)    
BEGIN  
  UPDATE agit SET tax_child_rate = @tax_rate, tax_child_rate_to_change = @to_change  WHERE id = @residence_id      
END  
 ELSE IF (@tax_type = 1)    
  UPDATE agit SET tax_rate = @tax_rate, tax_rate_to_change = @to_change WHERE id = @residence_id      
 ELSE    
  RAISERROR (''tax type is invalid. agit cannot save type[%d] id and agit id[%d].'', 16, 1, @tax_type, @residence_id )    
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAgit]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAgit]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_LoadAgit    
     
INPUT     
 @agit_id  int    
OUTPUT    
 pledge_id,     
 hp_stove,     
 hp_stove_expire,     
 mp_flame,     
 mp_flame_expire,     
 hatcher,     
 status,     
 next_war_time     
return    
made by    
 carrot    
date    
 2002-06-16    
********************************************/    
CREATE PROCEDURE [dbo].[lin_LoadAgit]    
(    
 @agit_id  int    
)    
AS    
    
SET NOCOUNT ON    
    
select pledge_id, hp_stove, hp_stove_expire, mp_flame, mp_flame_expire, hatcher, status, next_war_time ,  
  isnull(R1.auction_id, 0) , isnull( auction_time, 0)   , isnull ( last_price , 0) , isnull(last_cancel, 0) , isnull (min_price, 0), isnull(teleport_level, 0),   
 isnull(teleport_expire, 0),  isnull ( auction_desc, '''') , isnull( next_cost, 0) , isnull ( cost_fail, 0 )  , isnull ( tax_rate, 0 ),   
 isnull (tax_rate_to_change, 0), isnull (tax_child_rate, 0), isnull (tax_child_rate_to_change, 0), isnull(shop_income, 0), isnull(shop_income_temp, 0)  
from (    
 select id, pledge_id, hp_stove, hp_stove_expire, mp_flame, mp_flame_expire, hatcher, status, next_war_time , auction_id, last_price, last_cancel,   
 teleport_level, teleport_expire, next_cost, cost_fail  , tax_rate, tax_rate_to_change, tax_child_rate, tax_child_rate_to_change, shop_income_temp, shop_income  
 from agit (nolock)     
 where id = @agit_id      
 ) as R1    
 left join    
 (     
 select agit_id, auction_id, auction_time , min_price, auction_desc    
 from agit_auction (nolock)     
 where agit_id = @agit_id     
 ) as R2    
 on R1.id = R2.agit_id and R1.auction_id = R2.auction_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAgitOwner2]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAgitOwner2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetAgitOwner2    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetAgitOwner2
	
INPUT	
	@pledge_id	int,
	@agit_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SetAgitOwner2]
(
	@pledge_id	int,
	@agit_id		int
)
AS
SET NOCOUNT ON

UPDATE agit SET pledge_id = @pledge_id WHERE id = @agit_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAgitNextCost]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAgitNextCost]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_SetAgitNextCost
	
INPUT
	

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_SetAgitNextCost]
(
@agit_id		INT,
@next_cost		INT,
@cost_fail		int=0

)
AS
SET NOCOUNT ON

update agit set next_cost = @next_cost  , cost_fail = @cost_fail where id = @agit_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteAgitBid]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteAgitBid]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_DeleteAgitBid
	delete agit bid
INPUT
	@agit_id	int
	@pledge_id	int

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteAgitBid]
(
@agit_id		INT,
@pledge_id		INT
)
AS
SET NOCOUNT ON

declare @auction_id	int
declare @price int

set @auction_id = 0
set @price = 0

select @auction_id = isnull( auction_id , 0) from agit (nolock) where id = @agit_id

if @auction_id > 0
begin
	select @price = attend_price from agit_bid where  auction_id = @auction_id and attend_pledge_id = @pledge_id
	delete from agit_bid where auction_id = @auction_id and attend_pledge_id = @pledge_id
end 

select @agit_id, @pledge_id, @auction_id, @price


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateAgitAuction]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateAgitAuction]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_CreateAgitAuction
	create agit auction
INPUT
	@agit_id	int,
	@auction_desc	nvarchar(200),
	@min_price	int

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateAgitAuction]
(
@agit_id		INT,
@auction_desc		nvarchar(200),
@min_price		INT,
@auction_time		INT,
@auction_tax		INT
)
AS
SET NOCOUNT ON

declare @auction_id int

insert into agit_auction ( agit_id, auction_desc, min_price, auction_time , auction_tax)
values ( @agit_id, @auction_desc, @min_price, @auction_time  , @auction_tax )

select @auction_id = @@IDENTITY

update agit set auction_id = @auction_id where id = @agit_id

select @auction_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateAgitIfNotExist]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateAgitIfNotExist]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CreateAgitIfNotExist    Script Date: 2003-09-20 ?? 11:51:58 ******/
CREATE PROCEDURE [dbo].[lin_CreateAgitIfNotExist]
(
	@agit_id	INT,
	@agit_name VARCHAR(50)
)
AS

SET NOCOUNT ON

INSERT INTO agit
(id, name)
VALUES (@agit_id, @agit_name)





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCastleIncome]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCastleIncome]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************      
lin_SaveCastleIncome      
       
INPUT       
 @crop_income int,      
 @shop_income int,      
 @castle_id int      
OUTPUT      
return      
made by      
 carrot      
date      
 2002-06-16      
change 2003-12-22 carrot    
 add about agit income    
change 2004-03-02 carrot    
 add taxincomeTemp   
 ********************************************/      
create PROCEDURE [dbo].[lin_SaveCastleIncome]      
(      
 @crop_income int,      
 @shop_income int,      
 @castle_id int  ,    
 @crop_income_temp int,      
 @is_castle int    
)      
AS      
SET NOCOUNT ON      
      
if (@is_castle = 1) -- castle    
 UPDATE castle SET crop_income = @crop_income, shop_income = @shop_income, shop_income_temp = @crop_income_temp WHERE id = @castle_id      
else -- agit    
 UPDATE agit SET shop_income = @shop_income, shop_income_temp = @crop_income_temp WHERE id = @castle_id      
    
    
  



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadTeamBattleAgitStatus]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadTeamBattleAgitStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadTeamBattleAgitStatus]
(
	@agit_id INT
)
AS
SET NOCOUNT ON
SELECT ISNULL(team_battle_status, 0) FROM agit WHERE id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetTeamBattleStatus]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetTeamBattleStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_SetTeamBattleStatus]
(
@agit_id INT,
@new_team_battle_status INT
)
AS
SET NOCOUNT ON
UPDATE agit SET team_battle_status = @new_team_battle_status WHERE id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAgitAdena]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAgitAdena]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetAgitAdena
	get agit_adena log
INPUT
	

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_GetAgitAdena]
(
@agit_id		INT,
@auction_id		INT,
@reason		INT
)
AS
SET NOCOUNT ON

if @reason = 1 
begin
	select top 1 isnull( adena , 0 ) , isnull( pledge_id , 0) from agit_adena (nolock) where agit_id = @agit_id and auction_id = @auction_id and reason = @reason
end else begin
	select isnull( adena , 0 ) , isnull( pledge_id , 0) from agit_adena (nolock) where agit_id = @agit_id and auction_id = @auction_id and reason = @reason
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertAgitAdena]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertAgitAdena]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_InsertAgitAdena
	create agit_adena
INPUT
	

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertAgitAdena]
(
@agit_id		INT,
@pledge_id		INT,
@auction_id		INT,
@reason		INT,
@adena		INT
)
AS
SET NOCOUNT ON

insert into agit_adena ( agit_id, pledge_id, auction_id, reason, adena)
values ( @agit_id, @pledge_id, @auction_id, @reason, @adena)


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAgitBidOne]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAgitBidOne]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetAgitBidOne
	get  agit bid
INPUT
	@auction_id	int,
	@pledge_id	int

OUTPUT
return
made by
	young
date
	2003-12-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetAgitBidOne]
(
@auction_id		INT,
@pledge_id		INT
)
AS
SET NOCOUNT ON

declare @last_bid int
declare @bid_id int

set @last_bid = 0
set @bid_id = 0

select @last_bid  = Isnull( attend_price, 0) , @bid_id = isnull( attend_id , 0) from agit_bid (nolock) where auction_id = @auction_id and attend_pledge_id = @pledge_id

select @auction_id, @bid_id, @last_bid


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAgitBid]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAgitBid]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetAgitBid
	
INPUT
	@auction_id	int
OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_GetAgitBid]
(
	@auction_id	int
)
AS
SET NOCOUNT ON


select attend_id, attend_price, attend_pledge_id, attend_time  from agit_bid (nolock) where auction_id = @auction_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateAgitBid]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateAgitBid]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_CreateAgitBid
	create agit bid
INPUT
	@auction_id	int,
	@price		int,
	@pledge_id	int

OUTPUT
return
made by
	young
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateAgitBid]
(
@agit_id		INT,
@auction_id		INT,
@price			INT,
@pledge_id		INT,
@attend_time		INT
)
AS
SET NOCOUNT ON

declare @last_bid int
declare @bid_id int
declare @diff_adena int

set @last_bid = 0
set @bid_id = 0
set @diff_adena = 0

select @last_bid  = attend_price , @bid_id = attend_id from agit_bid (nolock) where auction_id = @auction_id and attend_pledge_id = @pledge_id

if ( @@ROWCOUNT > 0 ) 
begin

	update agit_bid set attend_price = @price  , attend_date = getdate() where auction_id = @auction_id and attend_pledge_id = @pledge_id
	set @diff_adena = @last_bid - @price 

end else begin

	insert into agit_bid ( auction_id, attend_price, attend_pledge_id , attend_time )
	values (  @auction_id, @price, @pledge_id , @attend_time )

	set @bid_id = @@IDENTITY
	set @diff_adena = @price
end

select @auction_id, @bid_id, @diff_adena


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAgitDeco]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAgitDeco]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_LoadAgitDeco
-- by bert
-- return (1, 0)
CREATE PROCEDURE [dbo].[lin_LoadAgitDeco]
(
	@agit_id INT
)
AS
SET NOCOUNT ON

SELECT type, id, level, expire FROM agit_deco WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAgitDeco]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAgitDeco]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_SetAgitDeco
-- by bert
-- return (1, 0)
CREATE PROCEDURE [dbo].[lin_SetAgitDeco]
(
	@agit_id INT,
	@type INT,
	@id INT,
	@name VARCHAR(256),
	@level INT,
	@expire INT
)
AS
SET NOCOUNT ON

DELETE FROM agit_deco
WHERE agit_id = @agit_id AND type = @type

INSERT INTO agit_deco
(agit_id, type, id, name, level, expire)
VALUES
(@agit_id, @type, @id, @name, @level, @expire)

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ResetAgitDeco]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ResetAgitDeco]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_ResetAgitDeco
-- by bert
-- return (1, 0)
CREATE PROCEDURE [dbo].[lin_ResetAgitDeco]
(
	@agit_id INT,
	@type INT
)
AS
SET NOCOUNT ON

DELETE FROM agit_deco
WHERE agit_id = @agit_id AND type = @type

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RenewAgitDeco]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RenewAgitDeco]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_RenewAgitDeco
-- by bert
-- return (1, 0)
CREATE PROCEDURE [dbo].[lin_RenewAgitDeco]
(
	@agit_id INT,
	@type INT,
	@expire INT
)
AS
SET NOCOUNT ON

UPDATE agit_deco
SET expire = @expire
WHERE agit_id = @agit_id AND type = @type

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddBookMark]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddBookMark]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_AddBookMark    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_AddBookMark
	add bookmark item
INPUT
	@char_id	int,
	@bookmark_name	nvarchar(50),
	@world		int,
	@x		int,
	@y		int,
	@z		int
OUTPUT

return
made by
	young
date
	2002-11-13
********************************************/
CREATE PROCEDURE [dbo].[lin_AddBookMark]
(
	@char_id	int,
	@bookmark_name	nvarchar(50),
	@world		int,
	@x		int,
	@y		int,
	@z		int
)
AS
SET NOCOUNT ON

if exists(select name from bookmark where char_id = @char_id and name = @bookmark_name)
begin
	update bookmark set world=@world, x=@x, y=@y, z=@z where char_id = @char_id and name = @bookmark_name
end 
else 
begin
	insert into bookmark(char_id, name, world, x, y, z) 
	values( @char_id, @bookmark_name, @world, @x,@y,@z)
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetListBookMark]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetListBookMark]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetListBookMark    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetListBookMark
	get ths list of  bookmark item
INPUT
	@char_id	int
OUTPUT

return
made by
	young
date
	2002-11-13
********************************************/
CREATE PROCEDURE [dbo].[lin_GetListBookMark]
(
	@char_id	int
)
AS
SET NOCOUNT ON

select name from bookmark (nolock) where char_id = @char_id order by name



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelBookMark]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelBookMark]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DelBookMark    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DelBookMark
	add bookmark item
INPUT
	@char_id	int,
	@bookmark_name	nvarchar(50)
OUTPUT

return
made by
	young
date
	2002-11-13
********************************************/
CREATE PROCEDURE [dbo].[lin_DelBookMark]
(
	@char_id	int,
	@bookmark_name	nvarchar(50)
)
AS
SET NOCOUNT ON

delete from bookmark where char_id = @char_id and name = @bookmark_name



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ManBookMark]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ManBookMark]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ManBookMark
	manage bookmark ( add, get-list, get , del )
INPUT
	@char_id	int,
	@bookmark_name	nvarchar(50)
OUTPUT

return
made by
	young
date
	2002-11-13
********************************************/
CREATE PROCEDURE [dbo].[lin_ManBookMark]
(
	@option	int,
	@char_id	int,
	@bookmark_id	int=0,
	@bookmark_name	nvarchar(50)='''',
	@x_loc		int= 0,
	@y_loc		int=0,
	@z_loc		int=0
)
AS
SET NOCOUNT ON

declare @bookmarkcount int
set @bookmarkcount  = 0

if ( @option = 1 )
begin
	-- add bookmark
	select @bookmarkcount  = count(*) from bookmark (nolock) where char_id = @char_id
	if ( @bookmarkcount >= 200 )
		return

	insert into bookmark ( char_id, name, world, x, y, z )
	values ( @char_id, @bookmark_name, 0, @x_loc, @y_loc, @z_loc )
end 

if ( @option = 2 )
begin
	-- get bookmark list
	select bookmarkid, name, x, y, z from bookmark (nolock) where char_id = @char_id order by name asc
end

if ( @option = 3 )
begin
	-- get on ebookmark
	select name, x, y, z from bookmark (nolock) where bookmarkid = @bookmark_id
end

if ( @option = 4 )
begin
	-- del one bookmark
	delete from bookmark where bookmarkid = @bookmark_id
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBookMark]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBookMark]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetBookMark    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetBookMark
	get  bookmark item
INPUT
	@char_id	int,
	@bookmark_name	nvarchar(50)
OUTPUT

return
made by
	young
date
	2002-11-13
********************************************/
CREATE PROCEDURE [dbo].[lin_GetBookMark]
(
	@char_id	int,
	@bookmark_name	nvarchar(50)
)
AS
SET NOCOUNT ON

select world, x, y, z from bookmark (nolock) where char_id = @char_id and name = @bookmark_name





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBuilderAccount]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBuilderAccount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetBuilderAccount    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetBuilderAccount
	
INPUT
	@account_name	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_GetBuilderAccount]
(
	@account_name	nvarchar(50)
)
AS
SET NOCOUNT ON

select top 1 default_builder from builder_account  (nolock)  where account_name = @account_name





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetBuilderAccount ]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetBuilderAccount ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/****** Object:  Stored Procedure dbo.lin_SetBuilderAccount     Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetBuilderAccount
	set builder account
INPUT
	@account_name	nvarchar(50),
	@default_level		int

OUTPUT
return
made by
	young
date
	2002-11-28
change
********************************************/
CREATE PROCEDURE [dbo].[lin_SetBuilderAccount ]
(
	@account_name	nvarchar(50),
	@default_level		int
)
AS

SET NOCOUNT ON

if ( @default_level = 0)
begin
	delete from builder_account where account_name = @account_name
end else begin
	if exists(select * from builder_account where account_name = @account_name)
	begin
		update builder_account set default_builder = @default_level where account_name = @account_name
	end else begin
		declare @account_id int
		set @account_id = 0
		select top 1 @account_id = account_id from user_data where account_name = @account_name and account_id > 0
		insert into builder_account(account_name, default_builder, account_id) values(@account_name, @default_level, @account_id)
	end
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadBuilderAccountByAccountName]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadBuilderAccountByAccountName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadBuilderAccountByAccountName    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadBuilderAccountByAccountName
	
INPUT
	@account_name	NVARCHAR(50)
OUTPUT
return
made by
	carrot
date
	2002-06-09
change 	2003-07-03	carrot
	restrict only builer account
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadBuilderAccountByAccountName]
(
@account_name	NVARCHAR(50)
)
AS
SET NOCOUNT ON

SELECT top 1 account_id FROM builder_account (nolock) WHERE account_name= @account_name and account_id > 0





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetCastleOwner2]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetCastleOwner2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetCastleOwner2    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetCastleOwner2
	
INPUT	
	@pledge_id	int,
	@agit_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SetCastleOwner2]
(
	@pledge_id	int,
	@castle_id		int
)
AS
SET NOCOUNT ON

UPDATE castle SET pledge_id = @pledge_id WHERE id = @castle_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllAgit]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllAgit]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAllAgit    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadAllAgit
	
INPUT
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_LoadAllAgit]
AS
SET NOCOUNT ON

SELECT id, pledge_id FROM castle  (nolock) WHERE type = 2 ORDER BY id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCastleSiegeElapsedTime]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCastleSiegeElapsedTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCastleSiegeElapsedTime    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCastleSiegeElapsedTime
	
INPUT	
	@siege_elapsed_time	int,
	@castle_id	int
OUTPUT

return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SaveCastleSiegeElapsedTime]
(
	@siege_elapsed_time	int,
	@castle_id	int
)
AS
SET NOCOUNT ON

UPDATE castle SET siege_elapsed_time = @siege_elapsed_time WHERE id = @castle_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCastleStatus]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCastleStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCastleStatus    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCastleStatus
	
INPUT	
	@status		int,
	@castle_id	int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SaveCastleStatus]
(
	@status		int,
	@castle_id	int
)
AS
SET NOCOUNT ON

UPDATE castle SET status = @status WHERE id = @castle_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetRelatedCastleSiege]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetRelatedCastleSiege]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetRelatedCastleSiege    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetRelatedCastleSiege
	
INPUT	
	@castle_id	int,
	@pledge_id	int
OUTPUT
	id, 
	next_war_time, 
	type 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_GetRelatedCastleSiege]
(
	@castle_id	int,
	@pledge_id	int
)
AS
SET NOCOUNT ON

SELECT 
	c.id, 
	c.next_war_time, 
	cw.type 
FROM 
	castle c (nolock) , 
	castle_war cw (nolock)  
WHERE 
	c.id = cw.castle_id 
	AND c.next_war_time <> 0 
	AND c.id = @castle_id
	AND cw.pledge_id = @pledge_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateCastle]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateCastle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CreateCastle    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_CreateCastle
	
INPUT	
	@id	int,
	@name	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_CreateCastle]
(
	@id	int,
	@name	nvarchar(50)
)
AS
SET NOCOUNT ON

INSERT INTO castle (id, name) VALUES (@id, @name)





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadCastle]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadCastle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

/********************************************
lin_LoadCastle

INPUT
 @id int,
 @type int
OUTPUT
 pledge_id,
 next_war_time,
 tax_rate,
 status,
 name,
 crop_income,
 shop_income,
 siege_elapsed_time
 shop_Income_Temp,
 Tax_rate_to_change,
 tax_child_rate_to_change
return
made by
 carrot
date
 2002-06-16
change 2004-02-29 carrot
mod 2010-09-23 Vampire
 add CastleIncomeTemp and TaxRateTochange, tax_child_rate_to_change
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadCastle]
(
 @id int,
 @type int
)
AS
SET NOCOUNT ON

SELECT
 pledge_id, next_war_time, tax_rate, tax_child_rate, status, name, crop_income, shop_income, siege_elapsed_time, shop_Income_Temp, Tax_rate_to_change,  
 tax_child_rate_to_change, isnull(hp_stove,0), isnull(mp_flame,0), isnull(hatcher,0), isnull(hp_stove_expire,0), isnull(mp_flame_expire,0), isnull(teleport_level,0), isnull(teleport_expire,0)
FROM
 castle (nolock)
WHERE
 id = @id AND type = @type

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAllCastleSiege]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAllCastleSiege]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetAllCastleSiege    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetAllCastleSiege
	
INPUT	
	@pledge_id	int
OUTPUT
	id, 
	next_war_time, 
	type 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_GetAllCastleSiege]
(
	@pledge_id	int
)
AS
SET NOCOUNT ON

SELECT 
	c.id, 
	c.next_war_time, 
	cw.type 
FROM 
	castle c (nolock) , 
	castle_war cw (nolock)  
WHERE 
	c.id = cw.castle_id 
	AND c.next_war_time <> 0 
	AND cw.pledge_id = @pledge_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateCastle]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateCastle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UpdateCastle    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE
[dbo].[lin_UpdateCastle] (@id INT, @pledge_id INT, @next_war_time INT, @tax_rate SMALLINT)
AS
UPDATE castle
SET pledge_id = @pledge_id, next_war_time = @next_war_time, tax_rate = @tax_rate
WHERE id = @id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetSiegeTime]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetSiegeTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetSiegeTime    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetSiegeTime
	
INPUT	
	@next_war_time	int,
	@castle_id	int,
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SetSiegeTime]
(
	@next_war_time	int,
	@castle_id	int
)
AS
SET NOCOUNT ON

UPDATE 
	castle 
SET 
	next_war_time = @next_war_time 
WHERE 
	id = @castle_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_setAgitOwner]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_setAgitOwner]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_setAgitOwner    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_setAgitOwner
	set Agit Owner
INPUT
	nAgit_id, 
	nPledge_id

OUTPUT
return
made by
	carrot
date
	2002-06-12
change
********************************************/
CREATE PROCEDURE [dbo].[lin_setAgitOwner]
(
	@Agit_id		INT,
	@Pledge_id	INT
)
AS

SET NOCOUNT ON

IF NOT exists(SELECT id FROM castle WHERE id = @Agit_id )
	INSERT INTO castle (id, name, pledge_id, type) VALUES (@Agit_id, ''test'', @Pledge_id,  2)
ELSE
	UPDATE castle  SET pledge_id = @Pledge_id WHERE id = @Agit_id AND type = 2 

IF @@ROWCOUNT > 0
	SELECT 1
ELSE
	SELECT 0



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_setCastleOwner]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_setCastleOwner]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_setCastleOwner    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_setCastleOwner
	set castle Owner
INPUT
	nCastle_id, 
	nPledge_id

OUTPUT
return
made by
	carrot
date
	2002-06-12
change
********************************************/
CREATE PROCEDURE [dbo].[lin_setCastleOwner]
(
	@Castle_id	INT,
	@Pledge_id	INT
)
AS

SET NOCOUNT ON

DECLARE @Castle_idOld INT
DECLARE @nPledgeIdOld INT

SET @Castle_idOld = 0
SET @nPledgeIdOld = 0

SELECT @Castle_idOld = id, @nPledgeIdOld = pledge_id FROM castle WHERE id = @Castle_id 

IF @Castle_idOld = 0 
	INSERT INTO castle (id, name, pledge_id, type) VALUES (@Castle_id , ''test'', @Pledge_id,  1)
ELSE
	UPDATE castle  SET pledge_id = @Pledge_id WHERE id = @Castle_id  AND type = 1

IF @@ROWCOUNT > 0
	SELECT 1
ELSE
	SELECT 0



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteCastleIncome]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteCastleIncome]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeleteCastleIncome    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DeleteCastleIncome
	
INPUT	
	@castle_id	int,
	@item_type	int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_DeleteCastleIncome]
(
	@castle_id	int,
	@item_type	int
)
AS
SET NOCOUNT ON

delete castle_crop where castle_id = @castle_id and item_type = @item_type





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCropData]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCropData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCropData    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCropData
	create  or update castle crop data
INPUT
	@castle_id	INT,
	@item_type 	INT,
	@droprate 	INT,
	@price 	INT
OUTPUT
return
made by
	carrot
date
	2003-05-06
change 2003-06-11
	add level
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveCropData]
(
	@castle_id	INT,
	@item_type 	INT,
	@droprate 	INT,
	@price 		INT,
	@level 		INT
)
AS
SET NOCOUNT ON

if exists(select item_type from castle_crop where castle_id = @castle_id and item_type = @item_type)
begin
	update castle_crop set droprate =@droprate, price = @price , level = @level where castle_id = @castle_id and item_type = @item_type
end
else
begin
	insert into  castle_crop (castle_id, item_type, droprate, price, level) values (@castle_id,@item_type,@droprate ,@price,@level )
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadCastleCrop]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadCastleCrop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadCastleCrop    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadCastleCrop
	
INPUT	
	@castle_id	int,
OUTPUT
	item_type, 
	droprate, 
	price, 
	level 
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_LoadCastleCrop]
(
	@castle_id	int
)
AS
SET NOCOUNT ON

SELECT 
	item_type, droprate, price, level 
from 
	castle_crop (nolock)  
WHERE 
	castle_id = @castle_id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetLastTaxUpdate]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetLastTaxUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'





/********************************************    
lin_SetLastTaxUpdate  
     
INPUT     
@income  datetime,
@tax datetime
OUTPUT    
made by    
 carrot    
date    
 2004-02-29  
********************************************/    
CREATE PROCEDURE [dbo].[lin_SetLastTaxUpdate]  
(  
@income  datetime,
@tax datetime,
@manor datetime
)  
AS    
    
SET NOCOUNT ON    

IF EXISTS(SELECT * FROM castle_tax)  
BEGIN  
 UPDATE castle_tax SET   income_update =  @income, tax_change =   @tax, manor_reset =   @manor 
END  
ELSE  
BEGIN  
 INSERT INTO castle_tax VALUES  
 (  @income, @tax, @manor)  
  
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadLastTaxUpdate]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadLastTaxUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************    
lin_LoadLastTaxUpdate  
     
INPUT     
OUTPUT    
made by    
 carrot    
date    
 2004-02-29  
********************************************/    
create PROCEDURE [dbo].[lin_LoadLastTaxUpdate]  
AS    
    
SET NOCOUNT ON    
  
SELECT TOP 1  
 YEAR(income_update), MONTH(income_update), DAY(income_update),   
 DATEPART ( hh , income_update ), DATEPART ( mi , income_update ), DATEPART ( ss , income_update ),  
 YEAR(tax_change), MONTH(tax_change), DAY(tax_change),   
 DATEPART ( hh , tax_change ), DATEPART ( mi , tax_change), DATEPART ( ss , tax_change),  
 YEAR(manor_reset), MONTH(manor_reset), DAY(manor_reset),   
 DATEPART ( hh , manor_reset ), DATEPART ( mi , manor_reset), DATEPART ( ss , manor_reset)  
FROM   
 castle_tax



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteMasterRelatedCastleWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteMasterRelatedCastleWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE  [dbo].[lin_DeleteMasterRelatedCastleWar] 
(
	@pledge_id INT
)  
AS  
  
SET NOCOUNT ON  

IF EXISTS(SELECT * FROM castle_war WHERE pledge_id = @pledge_id) 
BEGIN
	DELETE  
	FROM castle_war  
	WHERE pledge_id = @pledge_id  
END
ELSE
BEGIN
	RAISERROR (''pledge id is not exist in castle_war.[%d]'', 16, 1, @pledge_id)
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateCastleWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateCastleWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UpdateCastleWar    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_UpdateCastleWar
-- by bert ( -_-)/

CREATE PROCEDURE
[dbo].[lin_UpdateCastleWar] (@castle_id INT, @pledge_id INT, @status INT)
AS
SET NOCOUNT ON

UPDATE castle_war
SET type = @status
WHERE castle_id = @castle_id AND pledge_id = @pledge_id

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteCastleWar]    Script Date: 02/08/2011 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteCastleWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/****** Object:  Stored Procedure dbo.lin_DeleteCastleWar    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_DeleteCastleWar
-- by kks

CREATE PROCEDURE
[dbo].[lin_DeleteCastleWar] (@pledge_id INT,  @castle_id INT)
AS
SET NOCOUNT ON

Delete from castle_war where pledge_id = @pledge_id and castle_id = @castle_id

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadCastleWarRelatedPledge]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadCastleWarRelatedPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadCastleWarRelatedPledge    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadCastleWarRelatedPledge
	
INPUT	
	@castle_id	int
OUTPUT
return
made by
	bert
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadCastleWarRelatedPledge]
(
	@castle_id	int
)
AS
SET NOCOUNT ON

SELECT 
	pledge_id, type, propose_time 
FROM 
	castle_war (nolock)  
WHERE 
	castle_id = @castle_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadControlTowerByName]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadControlTowerByName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadControlTowerByName]
(
@name VARCHAR(256)
)
AS
SELECT residence_id, control_level, hp, status
FROM control_tower
WHERE name = @name



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertIntoControlTower]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertIntoControlTower]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_InsertIntoControlTower]
(
@name VARCHAR(256),
@residence_id INT,
@control_level INT,
@hp INT,
@status INT
)
AS
INSERT INTO control_tower
(name, residence_id, control_level, hp, status)
VALUES
(@name, @residence_id, @control_level, @hp, @status)




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateControlTower]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateControlTower]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_UpdateControlTower]
(
@control_level INT,
@hp INT,
@status INT,
@name VARCHAR(256)
)
AS
UPDATE control_tower
SET
control_level = @control_level,
hp = @hp,
status = @status
WHERE name = @name
IF @@ROWCOUNT <> 1
BEGIN
RAISERROR (''Failed to Update Control Tower name = %s.'', 16, 1, @name)
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadControlTowerByResidenceId]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadControlTowerByResidenceId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadControlTowerByResidenceId]
(
@residence_id INT
)
AS
SELECT name, control_level, hp, status
FROM control_tower
WHERE residence_id = @residence_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadDoor]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadDoor]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadDoor]  
(  
 @name NVARCHAR(50)  
)  
AS  
SET NOCOUNT ON  
SELECT hp, ISNULL(max_hp, hp) FROM door  (nolock) WHERE name = @name  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveDoorStatus]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveDoorStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveDoorStatus]  
(  
 @hp INT,  
 @max_hp INT,  
 @name NVARCHAR(50)  
)  
AS  
SET NOCOUNT ON  
UPDATE door SET hp = @hp, max_hp = @max_hp WHERE name = @name  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateDoorDataIfNotExist]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateDoorDataIfNotExist]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_CreateDoorDataIfNotExist]  
(  
 @name  NVARCHAR(50),  
 @default_hp INT  
)  
AS  
SET NOCOUNT ON  
INSERT INTO door (name, hp, max_hp) VALUES (@name, @default_hp, @default_hp)  
  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[dp_adena_rank]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dp_adena_rank]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.dp_adena_rank    Script Date: 2003-09-20 ?? 11:51:56 ******/
CREATE PROCEDURE [dbo].[dp_adena_rank]
(
@limit int
)
  AS

declare @crdate datetime

select @crdate = crdate   from dbo.sysobjects where id = object_id(N''[dbo].[dt_adena_rank_temp]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1

if @crdate is not null
	if  datediff(hh,@crdate, getdate()) > 1
		drop table [dbo].[dt_adena_rank_temp]
	else
		goto SelectData


CREATE TABLE [dbo].[dt_adena_rank_temp] (
		[char_id] [int] NOT NULL ,
		[amount] [numeric](18, 0) NOT NULL ,
		[rank] [int] IDENTITY (1, 1) NOT NULL 
	) ON [PRIMARY]

insert dbo.dt_adena_rank_temp (char_id, amount)
select  top 1000  char_id, sum(cast(amount as numeric )) as amount from user_item with (readpast) where item_type = 57 group by char_id
order by 2 desc


SelectData:

select  b.char_name, b.account_name, a.amount, a.rank from [dbo].[dt_adena_rank_temp] as a, user_data as b
where a.rank <= @limit and a.char_id = b.char_id 
order by rank



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAllGroupPoint]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAllGroupPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetAllGroupPoint

INPUT
OUTPUT

return
made by
	kks
date
	2004-07-15
********************************************/
CREATE PROCEDURE [dbo].[lin_GetAllGroupPoint]
AS
SET NOCOUNT ON

select group_id, sum( group_point) from event_point (nolock) group by group_id
order by sum(group_point) desc


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ClearGroupPoint ]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ClearGroupPoint ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ClearGroupPoint
	
INPUT	
OUTPUT
return
made by
	young
date
	2004-07-15
********************************************/
create PROCEDURE [dbo].[lin_ClearGroupPoint ]

AS
SET NOCOUNT ON


delete from event_point



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateGroupPoint]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateGroupPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_CreateGroupPoint

INPUT
OUTPUT

return
made by
	young
date
	2004-07-15
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateGroupPoint]
(
	@group_id	int,
	@group_point	float
)
AS
SET NOCOUNT ON

insert into event_point ( group_id, group_point) values ( @group_id, @group_point)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetGroupPoint]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetGroupPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetGroupPoint

INPUT
OUTPUT

return
made by
	young
date
	2004-07-15
********************************************/
CREATE PROCEDURE [dbo].[lin_GetGroupPoint]
(
	@group_id	int
)
AS
SET NOCOUNT ON

select sum( group_point) from event_point (nolock) where group_id = @group_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateMarketPrice]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateMarketPrice]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_UpdateMarketPrice
	update item market price
INPUT
	@item_type INT,
	@price INT
OUTPUT
return
made by
	kks
date
	2005-04-01
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdateMarketPrice] 
(
@item_type INT,
@enchant INT,
@price INT
)
AS

SET NOCOUNT ON

DECLARE @avg_price FLOAT
DECLARE @frequency INT
DECLARE @new_avg_price FLOAT

IF EXISTS(SELECT TOP 1 * FROM item_market_price(nolock) WHERE item_type = @item_type AND enchant = @enchant)
    BEGIN
	UPDATE item_market_price
	SET 
		avg_price = ((avg_price * frequency) + @price) / (frequency + 1),
		frequency = frequency + 1
	WHERE item_type = @item_type AND
		enchant = @enchant
   END
ELSE
   BEGIN
	INSERT INTO item_market_price 
		(item_type, enchant, avg_price, frequency)
	VALUES 
		(@item_type, @enchant, @price, 1)
   END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadMarketPriceList]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadMarketPriceList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_LoadMarketPriceList
	load item market price list
INPUT

OUTPUT
return
made by
	kks
date
	2005-04-01
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadMarketPriceList] 
AS

SET NOCOUNT ON

SELECT item_type, enchant, avg_price FROM item_market_price (nolock)
WHERE frequency >= 10



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetIntervalAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetIntervalAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_SetIntervalAnnounce
	set interval announce
INPUT
	
OUTPUT
	interval
	announce id
	msg
return
made by
	carrot
date
	2003-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_SetIntervalAnnounce]
(
	@nInterval 	INT,
	@nAnnounceId	INT,
	@wsMsg	NVARCHAR(100)
)
AS
SET NOCOUNT ON

if EXISTS(select top 1 * from login_announce where interval_10 = @nInterval and announce_id = @nAnnounceId)
  BEGIN
    UPDATE login_announce SET announce_msg = @wsMsg WHERE interval_10 = @nInterval and announce_id = @nAnnounceId
  END
ELSE
  BEGIN
    INSERT INTO login_announce (interval_10, announce_id, announce_msg) VALUES (@nInterval, @nAnnounceId, @wsMsg)
  END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetLoginAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetLoginAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'






/****** Object:  Stored Procedure dbo.lin_SetLoginAnnounce    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetLoginAnnounce
	set login announce
INPUT
	@announce_id int,
	@announce_msg nvarchar(64)	
OUTPUT
	
return
made by
	young
date
	2002-11-30
********************************************/
CREATE PROCEDURE [dbo].[lin_SetLoginAnnounce]
(
	@announce_id int , 
	@announce_msg nvarchar(64)
)

AS

SET NOCOUNT ON


if exists(select announce_id from login_announce (nolock) where announce_id = @announce_id  and interval_10 = 0 )
begin

	update login_announce set announce_msg = @announce_msg where announce_id = @announce_id and interval_10 = 0

end else begin

	insert into login_announce(announce_id, announce_msg , interval_10 ) values(@announce_id, @announce_msg, 0 ) 

end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelLoginAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelLoginAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/****** Object:  Stored Procedure dbo.lin_DelLoginAnnounce    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DelLoginAnnounce
	delete login announce
INPUT
	@announce_id int

OUTPUT
	
return
made by
	young
date
	2002-11-30
********************************************/
CREATE PROCEDURE [dbo].[lin_DelLoginAnnounce]
(
	@announce_id int 
)

AS

SET NOCOUNT ON

delete from login_announce where announce_id = @announce_id and interval_10 = 0



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelIntervalAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelIntervalAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_DelIntervalAnnounce
	delete interval announce
INPUT
	
OUTPUT
	interval
	announce id
return
made by
	carrot
date
	2003-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_DelIntervalAnnounce]
(
	@nInterval 	INT,
	@nAnnounceId	INT
)
AS
SET NOCOUNT ON

if EXISTS(select top 1 * from login_announce where interval_10 = @nInterval and announce_id = @nAnnounceId)
  BEGIN
    DELETE login_announce WHERE interval_10 = @nInterval and announce_id = @nAnnounceId
  END
ELSE
  BEGIN
    RAISERROR (''Cannot find announce[%d] id and interval number[%d].'', 16, 1, @nAnnounceId, @nInterval)
  END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetIntervalAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetIntervalAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetIntervalAnnounce
	get interval announce
INPUT
	
OUTPUT
	interval
	announce id
	msg
return
made by
	carrot
date
	2003-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_GetIntervalAnnounce]
AS
SET NOCOUNT ON

select interval_10, announce_id, announce_msg from login_announce (nolock) where interval_10 > 0 order by interval_10, announce_id asc







' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetLoginAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetLoginAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/****** Object:  Stored Procedure dbo.lin_GetLoginAnnounce    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_GetLoginAnnounce
	get login announce
INPUT
	
OUTPUT
	
return
made by
	young
date
	2002-11-30
change 	2003-12-18	carrot
	add interval_10 check
********************************************/
CREATE PROCEDURE [dbo].[lin_GetLoginAnnounce]

AS
SET NOCOUNT ON

select announce_id, announce_msg from login_announce (nolock) where interval_10 = 0 order by announce_id asc






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddLottoItem]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddLottoItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[lin_AddLottoItem]  
(  
 @round int ,
 @item_id int ,
 @number_flag int
)  
AS  
  
SET NOCOUNT ON  

insert lotto_items
values (@round, @item_id, @number_flag)

declare @tot_count int

select @tot_count = count(*) from lotto_items (nolock) where round_number = @round
update lotto_game set total_count = @tot_count where round_number = @round
select @tot_count



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateLottoGame]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateLottoGame]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_CreateLottoGame]
(
	@round_number int,
	@state int,
	@left_time int,
	@chosen_nuimber_flag int,
	@rule_number int,
	@total_count int,
	@winner1_count int,
	@winner2_count int,
	@winner3_count int,
	@winner4_count int,
	@carried_adena int
) 
AS       
SET NOCOUNT ON    

insert into lotto_game
values
(
	@round_number ,
	@state,
	@left_time,
	@chosen_nuimber_flag ,
	@rule_number ,
	@total_count ,
	@winner1_count ,
	@winner2_count ,
	@winner3_count ,
	@winner4_count ,
	@carried_adena )



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadLottoGame]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadLottoGame]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadLottoGame]
AS    
   
SET NOCOUNT ON    

select 	top 65535
	round_number,	
	state,
	left_time,
	chosen_number_flag,
	rule_number,

	total_count,
	winner1_count,
	winner2_count,
	winner3_count,
	winner4_count,
	carried_adena

from lotto_game	(nolock)
order by round_number



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateLottoGameState]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateLottoGameState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_UpdateLottoGameState]
(
	@round_number int,
	@state int,
	@left_time int
) 
AS       
SET NOCOUNT ON    

update lotto_game
set  	state = @state,
	left_time = @left_time
where round_number = @round_number



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateLottoGame]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateLottoGame]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_UpdateLottoGame]
(
	@round_number int,
	@state int,
	@left_time int,
	@chosen_nuimber_flag int,
	@rule_number int,
	@total_count int,
	@winner1_count int,
	@winner2_count int,
	@winner3_count int,
	@winner4_count int,
	@carried_adena int
) 
AS       
SET NOCOUNT ON    

update lotto_game
set  	state = @state,
	left_time = @left_time,
	chosen_number_flag = @chosen_nuimber_flag ,
	rule_number = @rule_number ,
	total_count = @total_count ,
	winner1_count = @winner1_count ,
	winner2_count = @winner2_count ,
	winner3_count = @winner3_count ,
	winner4_count = @winner4_count ,
	carried_adena = @carried_adena 
where round_number = @round_number



' 
END
GO
/****** Object:  StoredProcedure [dbo].[give_lotto_price]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[give_lotto_price]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

create procedure [dbo].[give_lotto_price]
	@log_server	varchar(16),
	@world_id	int
as

declare	@round_number int
select @round_number = max(round_number) - 2 from lotto_game(nolock)

/**
	1) lotto_game? ??? ?? ??? 1??? ??
	    - ??? ??? ?? ??? ?? ??
*/
update lotto_game
set carried_adena = 100000000 - (total_count * 2000) * 0.5
where round_number = @round_number

declare	@win1_price	int
declare	@win2_price	int
declare	@win3_price	int
select @win1_price = case winner1_count when 0 then 0 else (100000000 - (winner4_count * 2)) * 0.6 / winner1_count end,
	@win2_price = case winner2_count when 0 then 0 else (100000000 - (winner4_count * 2)) * 0.2 / winner2_count end,
	@win3_price = case winner3_count when 0 then 0 else (100000000 - (winner4_count * 2)) * 0.2 / winner3_count end
from lotto_game(nolock)
where round_number = @round_number


/**
	2) ?? ?????? ??? ??
*/
create table tmp_lotto_price_given (
	char_id	int,
	char_name	varchar(50),
	rank	int,
	price	int,
	new_price	int
)

declare	@sql	varchar(4000)
set @sql = ''insert into tmp_lotto_price_given''
	+ '' select *''
	+ '' from  openrowset(''''SQLOLEDB'''', '''''' + @log_server + '''''';''''gamma'''';''''lineage2pwd'''', ''''exec lin2log.dbo.get_lotto_given '' + cast(@world_id as varchar) + '', '' + cast(@round_number as varchar) + '''''')''
exec (@sql)

update tmp_lotto_price_given set char_id = T.char_id from user_data T(nolock) where tmp_lotto_price_given.char_name = T.char_name
print ''Candidates: '' + cast(@@rowcount as varchar)


/**
	3) ?????? ?? ??
*/
update tmp_lotto_price_given set new_price = @win1_price where rank = 1
update tmp_lotto_price_given set new_price = @win2_price where rank = 2
update tmp_lotto_price_given set new_price = @win3_price where rank = 3


/**
	4) ???? ??
*/
update user_item
set amount = amount + T.new_price - T.price
from tmp_lotto_price_given T(nolock)
where item_type = 57
	and warehouse = 0
	and user_item.char_id = T.char_id
	and T.new_price > T.price
print ''Updated: '' + cast(@@rowcount as varchar)

insert into user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
select T.char_id, 57, new_price - price, 0, 0, 0, 0, 0, 0
from tmp_lotto_price_given T(nolock)
where T.char_id not in (select char_id from user_item(nolock) where item_type = 57 and warehouse = 0)
	and T.new_price > T.price
print ''Inserted: '' + cast(@@rowcount as varchar)


/**
	5) ?? ??? ??
drop table tmp_lotto_price_given
*/


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadLottoItems]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadLottoItems]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadLottoItems]
(
	@round int
)
AS    
   
SET NOCOUNT ON    

select 	item_id,
	number_flag
from lotto_items
where round_number = @round



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateLottoItem]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateLottoItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_CreateLottoItem]
(
	@round_number int,
	@item_id int,
	@number_flag int	
) 
AS       
SET NOCOUNT ON    

insert into lotto_items
values
(
	@round_number ,
	@item_id,
	@number_flag
)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveManorSeed]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveManorSeed]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_SaveManorSeed
 save manor seed crop data
INPUT
	
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-06-21
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_SaveManorSeed]
(
@manor_id INT,
@data_index INT,
@seed_id INT,
@seed_price INT,
@seed_sell_count INT,
@seed_remain_count INT,
@crop_id INT,
@crop_buy_count INT,
@crop_remain_count INT,
@crop_price INT,
@crop_type INT,
@crop_deposit INT
)
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT * FROM manor_data WHERE manor_id = @manor_id AND data_index =@data_index)
BEGIN
	UPDATE	
		manor_data
	SET 
		seed_id = @seed_id, 
		seed_price = @seed_price, 
		seed_sell_count = @seed_sell_count, 
		seed_remain_count = @seed_remain_count, 
		crop_id = @crop_id, 
		crop_buy_count = @crop_buy_count, 
		crop_price = @crop_price, 
		crop_type = @crop_type, 
		crop_remain_count = @crop_remain_count, 
		crop_deposit = @crop_deposit
	WHERE
		manor_id = @manor_id AND data_index = @data_index
END
ELSE
BEGIN
	INSERT INTO 
	manor_data 
	(manor_id, data_index, seed_id, seed_price, seed_sell_count, seed_remain_count, crop_id, crop_buy_count, crop_price, crop_type, crop_remain_count, crop_deposit) 
	VALUES 
	(@manor_id, @data_index, @seed_id, @seed_price, @seed_sell_count, @seed_remain_count, @crop_id, @crop_buy_count, @crop_price, @crop_type, @crop_remain_count, @crop_deposit)
END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadManorSeed]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadManorSeed]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************        
lin_LoadManorSeed
 load manor seed
INPUT        
 @manor_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_LoadManorSeed]
(        
 @manor_id INT
)        
AS        
        
SET NOCOUNT ON        

SELECT 
	data_index, seed_id, seed_price, seed_sell_count, seed_remain_count, 
	crop_id, crop_price, crop_buy_count, crop_remain_count, crop_type, crop_deposit
FROM 
	manor_data
WHERE 
	manor_id = @manor_id
ORDER BY data_index




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadManorSeed_N]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadManorSeed_N]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************        
lin_LoadManorSeed_N
 load manor seed next
INPUT        
 @manor_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_LoadManorSeed_N]
(        
 @manor_id INT
)        
AS        
        
SET NOCOUNT ON        

SELECT 
	data_index, seed_id_n, seed_price_n, seed_sell_count_n,
	crop_id_n, crop_buy_count_n, crop_price_n, crop_type_n
FROM 
	manor_data_n
WHERE 
	manor_id = @manor_id
ORDER BY 
	data_index






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveManorSeed_N]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveManorSeed_N]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_SaveManorSeed_N
 save manor seed crop data next
INPUT
	
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_SaveManorSeed_N]
(
@manor_id INT,
@data_index INT,
@seed_id_n INT,
@seed_price_n INT,
@seed_sell_count_n INT,
@crop_id_n INT,
@crop_buy_count_n INT,
@crop_price_n INT,
@crop_type_n INT
)
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT * FROM manor_data_n WHERE manor_id = @manor_id AND data_index =@data_index)
BEGIN
	UPDATE	
		manor_data_n
	SET 
		seed_id_n = @seed_id_n, 
		seed_price_n = @seed_price_n, 
		seed_sell_count_n = @seed_sell_count_n, 
		crop_id_n = @crop_id_n, 
		crop_buy_count_n = @crop_buy_count_n, 
		crop_price_n = @crop_price_n, 
		crop_type_n = @crop_type_n
	WHERE
		manor_id = @manor_id AND data_index = @data_index
END
ELSE
BEGIN
	INSERT INTO 
	manor_data_n
	(manor_id, data_index, seed_id_n, seed_price_n, seed_sell_count_n, crop_id_n, crop_buy_count_n, crop_price_n, crop_type_n) 
	VALUES 
	(@manor_id, @data_index, @seed_id_n, @seed_price_n, @seed_sell_count_n, @crop_id_n, @crop_buy_count_n, @crop_price_n, @crop_type_n)
END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveManorInfo]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveManorInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************        
lin_SaveManorInfo

INPUT        
 @manor_id
 
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE  PROCEDURE [dbo].[lin_SaveManorInfo]
(        
 @manor_id INT,
 @residence_id INT,
 @AdenaSeedSell INT,
 @AdenaCropBuy INT,
 @change_state TINYINT,
 @last_changed DATETIME
)        
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT * FROM manor_info WHERE manor_id = @manor_id)
BEGIN
	UPDATE
		manor_info
	SET
		residence_id = @residence_id,
		adena_vault = @AdenaSeedSell,
		crop_buy_vault = @AdenaCropBuy,
		change_state = @change_state,
		last_changed = @last_changed
	WHERE
		manor_id = @manor_id
END
ELSE
BEGIN
	INSERT INTO manor_info (manor_id, residence_id, adena_vault, crop_buy_vault, change_state, last_changed) 
	VALUES (@manor_id, @residence_id,@AdenaSeedSell,@AdenaCropBuy, @change_state, @last_changed)
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadManorInfo]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadManorInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************        
lin_LoadManorInfo
 load manor seed next
INPUT        
 @manor_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE  PROCEDURE [dbo].[lin_LoadManorInfo]
(        
 @manor_id INT
)        
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT * FROM manor_info WHERE manor_id = @manor_id)
BEGIN
	SELECT 
		residence_id, adena_vault, crop_buy_vault, change_state, convert(nvarchar(19), last_changed, 121)
	FROM 
		manor_info
	WHERE 
		manor_id = @manor_id
END
ELSE
BEGIN
	SELECT 0, 0, 0, 0, ''0000-00-00 00:00:00''

END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteMercenary]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteMercenary]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeleteMercenary]
(
@residence_id INT
)
AS
IF EXISTS(SELECT * FROM mercenary WHERE residence_id = @residence_id)
	DELETE FROM mercenary WHERE residence_id = @residence_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadMercenary]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadMercenary]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadMercenary]
(
@residence_id INT
)
AS
SELECT id, npc_id, x, y, z, angle, hp, mp
FROM mercenary
WHERE residence_id = @residence_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateMercenary]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateMercenary]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_UpdateMercenary]
(
@id INT,
@x INT,
@y INT,
@z INT,
@angle INT,
@hp INT,
@mp INT
)
AS
UPDATE mercenary
SET
x = @x,
y = @y,
z = @z, 
angle = @angle,
hp = @hp,
mp = @mp
WHERE id = @id
IF @@ROWCOUNT <> 1
BEGIN
RAISERROR (''Failed to Update Mercenary id = %d.'', 16, 1, @id)
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertIntoMercenary]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertIntoMercenary]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_InsertIntoMercenary]  
(  
@residence_id INT,  
@npc_id INT,  
@x INT,  
@y INT,  
@z INT,  
@angle INT,  
@hp INT,  
@mp INT  
)  
AS  
SET NOCOUNT ON  
  
if exists(select * from mercenary where x= @x and y = @y and  z = @z)  
begin  
 delete mercenary where x= @x and y = @y and  z = @z  
end  
  
INSERT INTO mercenary  
(residence_id, npc_id, x, y, z, angle, hp, mp)  
VALUES  
(@residence_id, @npc_id, @x, @y, @z, @angle, @hp, @mp)  
SELECT @@IDENTITY




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetUserDataByCharId]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetUserDataByCharId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE    PROCEDURE [dbo].[lin_GetUserDataByCharId]
(
@char_id INT
)
AS
SET NOCOUNT ON
DECLARE @acc NVARCHAR(50)
set @acc=(select account_name from user_data where char_id=@char_id)

IF @char_id > 0

SELECT
 RTRIM(ud.char_name), ud.char_id, RTRIM(ud.account_name), ud.account_id, ud.pledge_id, ud.builder, ud.gender, ud.race, ud.class,       
 ud.world, ud.xloc, ud.yloc, ud.zloc, ud.IsInVehicle, ud.HP, ud.MP, ud.Max_HP, ud.Max_MP, ud.CP, ud.Max_CP, ud.SP, ud.Exp, ud.Lev, ud.align, ud.PK, ud.duel, ud.pkpardon,       
 ud.ST_underware, ud.ST_right_ear, ud.ST_left_ear, ud.ST_neck, ud.ST_right_finger, ud.ST_left_finger, ud.ST_head, ud.ST_right_hand, ud.ST_left_hand, ud.ST_gloves, ud.ST_chest, ud.ST_legs, ud.ST_feet, ud.ST_back, ud.ST_both_hand, ud.ST_hair,  
 ISNULL(YEAR(temp_delete_date),0), ISNULL(MONTH(temp_delete_date),0), ISNULL(DAY(temp_delete_date),0),  
 ISNULL(DATEPART(HOUR, temp_delete_date),0), ISNULL(DATEPART(mi, temp_delete_date),0), ISNULL(DATEPART(s, temp_delete_date),0),  
 ISNULL(uas.s1, 0), ISNULL(uas.l1, 0), ISNULL(uas.d1, 0), ISNULL(uas.c1, 0),
 ISNULL(uas.s2, 0), ISNULL(uas.l2, 0), ISNULL(uas.d2, 0), ISNULL(uas.c2, 0),
 ISNULL(uas.s3, 0), ISNULL(uas.l3, 0), ISNULL(uas.d3, 0), ISNULL(uas.c3, 0),
 ISNULL(uas.s4, 0), ISNULL(uas.l4, 0), ISNULL(uas.d4, 0), ISNULL(uas.c4, 0),
 ISNULL(uas.s5, 0), ISNULL(uas.l5, 0), ISNULL(uas.d5, 0), ISNULL(uas.c5, 0),
 ISNULL(uas.s6, 0), ISNULL(uas.l6, 0), ISNULL(uas.d6, 0), ISNULL(uas.c6, 0),
 ISNULL(uas.s7, 0), ISNULL(uas.l7, 0), ISNULL(uas.d7, 0), ISNULL(uas.c7, 0),
 ISNULL(uas.s8, 0), ISNULL(uas.l8, 0), ISNULL(uas.d8, 0), ISNULL(uas.c8, 0),
 ISNULL(uas.s9, 0), ISNULL(uas.l9, 0), ISNULL(uas.d9, 0), ISNULL(uas.c9, 0),
 ISNULL(uas.s10, 0), ISNULL(uas.l10, 0), ISNULL(uas.d10, 0), ISNULL(uas.c10, 0),
 ISNULL(uas.s11, 0), ISNULL(uas.l11, 0), ISNULL(uas.d11, 0), ISNULL(uas.c11, 0),
 ISNULL(uas.s12, 0), ISNULL(uas.l12, 0), ISNULL(uas.d12, 0), ISNULL(uas.c12, 0),
 ISNULL(uas.s13, 0), ISNULL(uas.l13, 0), ISNULL(uas.d13, 0), ISNULL(uas.c13, 0),
 ISNULL(uas.s14, 0), ISNULL(uas.l14, 0), ISNULL(uas.d14, 0), ISNULL(uas.c14, 0),
 ISNULL(uas.s15, 0), ISNULL(uas.l15, 0), ISNULL(uas.d15, 0), ISNULL(uas.c15, 0),
 ISNULL(uas.s16, 0), ISNULL(uas.l16, 0), ISNULL(uas.d16, 0), ISNULL(uas.c16, 0),
 ISNULL(uas.s17, 0), ISNULL(uas.l17, 0), ISNULL(uas.d17, 0), ISNULL(uas.c17, 0),
 ISNULL(uas.s18, 0), ISNULL(uas.l18, 0), ISNULL(uas.d18, 0), ISNULL(uas.c18, 0),
 ISNULL(uas.s19, 0), ISNULL(uas.l19, 0), ISNULL(uas.d19, 0), ISNULL(uas.c19, 0),
 ISNULL(uas.s20, 0), ISNULL(uas.l20, 0), ISNULL(uas.d20, 0), ISNULL(uas.c20, 0),
 ud.quest_flag, ud.face_index, ud.hair_shape_index, ud.hair_color_index,
 ud.nickname, ud.power_flag, ud.pledge_dismiss_time, ud.pledge_ousted_time, ud.pledge_withdraw_time, ud.surrender_war_id, ud.use_time, ud.drop_exp,
 ISNULL( ub.status, 0), ISNULL( ub.ban_end , 0), ISNULL(ud.subjob_id , 0),
 ud.subjob0_class, ud.subjob1_class, ud.subjob2_class, ud.subjob3_class, ISNULL(ssq_dawn_round, 0),
 ISNULL(uun.color_rgb, 0x00ffffff),ISNULL(ud.wedding,0),ud.division,ud.pledge_group,ud.AcademyLev,ud.KarmaOrig,ud.PKdiff,ud.ST_face,ud.CursedTimeEquip,ISNULL(ud.TitleColor,0x00ffffff),ud.WeddingTelTime,
ISNULL(dyn.adena_drop,1),ISNULL(dyn.items_drop,1),ISNULL(dyn.spoil,1),ISNULL(dyn._exp,1),ISNULL(dyn._sp,1),ISNULL(SponsorId,0),
 ISNULL(uas.s21, 0), ISNULL(uas.l21, 0), ISNULL(uas.d21, 0), ISNULL(uas.c21, 0),
 ISNULL(uas.s22, 0), ISNULL(uas.l22, 0), ISNULL(uas.d22, 0), ISNULL(uas.c22, 0),
 ISNULL(uas.s23, 0), ISNULL(uas.l23, 0), ISNULL(uas.d23, 0), ISNULL(uas.c23, 0),
 ISNULL(uas.s24, 0), ISNULL(uas.l24, 0), ISNULL(uas.d24, 0), ISNULL(uas.c24, 0),
ud.ST_left_bracelet,ud.ST_right_bracelet,ud.ST_hairall,ud.ST_agathon,ud.souls,ud.transformation_id,ud.talisman1,ud.talisman2,ud.talisman3,ud.talisman4,ud.talisman5,ud.talisman6,
ISNULL(uas.s25, 0), ISNULL(uas.l25, 0), ISNULL(uas.d25, 0), ISNULL(uas.c25, 0),
ISNULL(uas.s26, 0), ISNULL(uas.l26, 0), ISNULL(uas.d26, 0), ISNULL(uas.c26, 0),
ISNULL(uas.s27, 0), ISNULL(uas.l27, 0), ISNULL(uas.d27, 0), ISNULL(uas.c27, 0),
ISNULL(uas.s28, 0), ISNULL(uas.l28, 0), ISNULL(uas.d28, 0), ISNULL(uas.c28, 0),
ISNULL(uas.s29, 0), ISNULL(uas.l29, 0), ISNULL(uas.d29, 0), ISNULL(uas.c29, 0),
ISNULL(uas.s30, 0), ISNULL(uas.l30, 0), ISNULL(uas.d30, 0), ISNULL(uas.c30, 0),
ISNULL(uas.s31, 0), ISNULL(uas.l31, 0), ISNULL(uas.d31, 0), ISNULL(uas.c31, 0),
ISNULL(uas.s32, 0), ISNULL(uas.l32, 0), ISNULL(uas.d32, 0), ISNULL(uas.c32, 0),
ISNULL(uas.s33, 0), ISNULL(uas.l33, 0), ISNULL(uas.d33, 0), ISNULL(uas.c33, 0),
ISNULL(uas.s34, 0), ISNULL(uas.l34, 0), ISNULL(uas.d34, 0), ISNULL(uas.c34, 0),
ISNULL(uas.s35, 0), ISNULL(uas.l35, 0), ISNULL(uas.d35, 0), ISNULL(uas.c35, 0),
ISNULL(uas.s36, 0), ISNULL(uas.l36, 0), ISNULL(uas.d36, 0), ISNULL(uas.c36, 0),
ISNULL(uas.s37, 0), ISNULL(uas.l37, 0), ISNULL(uas.d37, 0), ISNULL(uas.c37, 0),
ISNULL(uas.s38, 0), ISNULL(uas.l38, 0), ISNULL(uas.d38, 0), ISNULL(uas.c38, 0),
ISNULL(uas.s39, 0), ISNULL(uas.l39, 0), ISNULL(uas.d39, 0), ISNULL(uas.c39, 0),
ISNULL(uas.s40, 0), ISNULL(uas.l40, 0), ISNULL(uas.d40, 0), ISNULL(uas.c40, 0),
ISNULL(ud.c1,0),ISNULL(ud.c2,0),ISNULL(ud.c3,0),
ISNULL(ous.start_time,0),ISNULL(ous.remain_time,0)
FROM
 (SELECT * FROM User_data (nolock) WHERE char_id = @char_id) AS ud
 LEFT OUTER JOIN
 (SELECT * FROM user_ActiveSkill (nolock) WHERE char_id = @char_id) as uas ON ud.char_id = uas.char_id
 left  OUTER JOIN
 (select * from user_ban (nolock) where char_id = @char_id) as ub on ud.char_id = ub.char_id
 left OUTER JOIN
 (select * from user_name_color (nolock) where char_id = @char_id) as uun on ud.char_id = uun.char_id
left OUTER JOIN
(select * from dynamic_rates (nolock) where acc_name=@acc) as dyn on @acc=dyn.acc_name
left OUTER JOIN
(select * from offlinestore_users (nolock) where char_id = @char_id) as ous ON ud.char_id = ous.char_id
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ReloadRatesByAccountId]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ReloadRatesByAccountId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE    PROCEDURE [dbo].[lin_ReloadRatesByAccountId]
(      
@acc_id INT      
)      
AS      
SET NOCOUNT ON 
DECLARE @acc NVARCHAR(50)
set @acc=(select top 1 account_name from user_data where account_id=@acc_id)

select top 1 COALESCE(dr.adena_drop,1),COALESCE(dr.items_drop,1),COALESCE(dr.spoil,1),COALESCE(dr._exp,1),COALESCE(dr._sp,1)
FROM user_data ud LEFT JOIN dynamic_rates dr ON (dr.acc_name=@acc) where acc_name=@acc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateMonRace]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateMonRace]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_UpdateMonRace
	update monster race
INPUT
	@race_id	int
	@winrate1	float,
	@winrate2	float
OUTPUT
return
made by
	young
date
	2004-5-18
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdateMonRace]
(
@race_id		INT,
@winrate1		FLOAT,
@winrate2		FLOAT
)
AS
SET NOCOUNT ON

update monrace set winrate1 = @winrate1, winrate2 = @winrate2 where race_id = @race_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateMonRaceInfo]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateMonRaceInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'





/********************************************
lin_UpdateMonRaceInfo
	update monster race info
INPUT
	@race_id	int
	@run1	float,
	@run2	float,
	@run3	float,
	@run4	float,
	@run5	float,
	@run6	float,
	@run7	float,
	@run8	float,
	@win1	int,
	@win2	int,

OUTPUT
return
made by
	young
date
	2004-5-18
********************************************/
CREATE  PROCEDURE [dbo].[lin_UpdateMonRaceInfo]
(
@race_id		INT,
@run1			FLOAT,
@run2			FLOAT,
@run3			FLOAT,
@run4			FLOAT,
@run5			FLOAT,
@run6			FLOAT,
@run7			FLOAT,
@run8			FLOAT,
@win1			int,
@win2			int

)
AS
SET NOCOUNT ON

update monrace set run1 = @run1, run2 = @run2, run3 = @run3, run4 = @run4, run5 = @run5, run6 = @run6, run7 = @run7, run8 = @run8, win1 = @win1, win2 = @win2 , race_end = 1 where race_id = @race_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateMonRace]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateMonRace]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'






/********************************************
lin_CreateMonRace
	create monster race
INPUT
	@mon1		smallint,
	@mon2		smallint,
	@mon3		smallint,
	@mon4		smallint,
	@mon5		smallint,
	@mon6		smallint,
	@mon7		smallint,
	@mon8		smallint

OUTPUT
return
made by
	young
date
	2004-5-18
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateMonRace]
(
@mon1			SMALLINT,
@mon2			SMALLINT,
@mon3			SMALLINT,
@mon4			SMALLINT,
@mon5			SMALLINT,
@mon6			SMALLINT,
@mon7			SMALLINT,
@mon8			SMALLINT,
@tax_rate		int
)
AS
SET NOCOUNT ON

declare @race_id int

insert into monrace ( lane1, lane2, lane3, lane4, lane5, lane6, lane7, lane8 , tax_rate)
values ( @mon1, @mon2, @mon3, @mon4, @mon5,@mon6, @mon7,  @mon8 , @tax_rate )

select @race_id  = @@IDENTITY

select @race_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMonRaceResult]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMonRaceResult]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************  
lin_GetMonRaceResult  
   
INPUT  
 @nPage  int,
 @nLinePerPage int
OUTPUT  
return  
made by  
 young  
date  
 2003-06-15  
change	
 2004-12-24 carrot
 change top 2000 to get by page number
 2005-02-22 kks
 fix column mismatch & page default
********************************************/  
CREATE    PROCEDURE [dbo].[lin_GetMonRaceResult]  
(  
 @nPage  int,
 @nLinePerPage int
)  
AS  
SET NOCOUNT ON  
  
--select top 2000 race_id, lane1, lane2, lane3, lane4, lane5, lane6, lane7, lane8, win1, win2, winrate1, winrate2, race_end from  
--monrace (nolock)  
--order by race_id desc  
 
IF (@nPage <= 0)
	SET @nPage = 1

DECLARE @nMaxRaceId int  
SET @nMaxRaceId = 0
  
select top 1 @nMaxRaceId = race_id from monrace order by race_id desc  

select race_id, lane1, lane2, lane3, lane4, lane5, lane6, lane7, lane8, win1, win2, winrate1, winrate2, race_end 
from monrace where race_id <= (@nMaxRaceId - (@nPage - 1) * @nLinePerPage) and race_id > (@nMaxRaceId - @nPage * @nLinePerPage)
order by race_id desc



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMonRaceTicket]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMonRaceTicket]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'









/********************************************
lin_GetMonRaceTicket
	
INPUT
	@item_id		int
OUTPUT
return
made by
	young
date
	2003-06-10
********************************************/
CREATE  PROCEDURE [dbo].[lin_GetMonRaceTicket]
(
	@item_id		int
)
AS
SET NOCOUNT ON

declare @ticket_id	int
declare @monraceid	int
declare @bet_type	int
declare @bet_1		int
declare @bet_2		int
declare @bet_3		int
declare @bet_money	int
declare @winrate1	float
declare @winrate2	float
declare @win1		int
declare @win2		int
declare @race_end	int
declare @tax_money	int
declare @remotefee	int

select @ticket_id = ticket_id, @monraceid = monraceid, @bet_type=bet_type, @bet_1 = bet_1, @bet_2 = bet_2 , @bet_3 = bet_3, @bet_money = bet_money  , @tax_money = tax_money , @remotefee = remotefee from monrace_ticket where item_id = @item_id and deleted = 0
select @winrate1=winrate1, @winrate2=winrate2, @win1 = win1, @win2=win2 , @race_end = race_end  from monrace where race_id = @monraceid

select @ticket_id, @monraceid, @bet_type, @bet_1, @bet_2, @bet_3, @bet_money, @winrate1, @winrate2, @win1, @win2, @race_end, @tax_money, @remotefee



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateMonRaceMon]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateMonRaceMon]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_CreateMonRaceMon
	create monster race
INPUT
	@runner_id	int
	@initial_win	int
OUTPUT
return
made by
	young
date
	2004-5-19
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateMonRaceMon]
(
@runner_id		INT,
@initial_win		INT,
@run_count		INT,
@win_count		INT
)
AS
SET NOCOUNT ON

if not exists ( select * from monrace_mon (nolock) where runner_id = @runner_id ) 
begin
	insert into monrace_mon( runner_id, initial_win , run_count, win_count ) values ( @runner_id, @initial_win , @run_count, @win_count)
end 

select initial_win, run_count, win_count  from monrace_mon ( nolock) where runner_id = @runner_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateMonRaceMon]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateMonRaceMon]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_UpdateMonRaceMon
	update monster race
INPUT
	@runner_id	int
	@win_rate	int
OUTPUT
return
made by
	young
date
	2004-5-19
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdateMonRaceMon]
(
@runner_id		INT,
@win_rate		INT,
@run_count		INT,
@win_count		INT
)
AS
SET NOCOUNT ON

if exists ( select * from monrace_mon (nolock) where runner_id = @runner_id ) 
begin
	update monrace_mon set initial_win = @win_rate , run_count = @run_count, win_count = @win_count where runner_id = @runner_id
end else begin
	insert into monrace_mon( runner_id, initial_win , run_count, win_count ) values ( @runner_id, @win_rate , @run_count, @win_count )
end 

select initial_win , run_count, win_count  from monrace_mon ( nolock) where runner_id = @runner_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateMonRaceTicket]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateMonRaceTicket]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'








/********************************************
lin_CreateMonRaceTicket
	ALTER  monster race ticket
INPUT
	@monraceid	int,
	@bet_type	smallint,
	@bet_1		smallint,
	@bet_2		smallint,
	@bet_3		smallint,
	@bet_money	int,
	@tax_money	int,
	@item_id	int,
	@remotefee	int=0

OUTPUT
return
made by
	young
date
	2004-5-18
********************************************/

CREATE PROCEDURE [dbo].[lin_CreateMonRaceTicket]
(
	@monraceid	int,
	@bet_type	smallint,
	@bet_1		smallint,
	@bet_2		smallint,
	@bet_3		smallint,
	@bet_money	int,
	@tax_money	int,
	@item_id	int,
	@remotefee	int=0
)
AS
SET NOCOUNT ON

declare @ticket_id int

insert into monrace_ticket ( monraceid, bet_type, bet_1, bet_2, bet_3, bet_money,  tax_money, item_id , remotefee )
values ( @monraceid, @bet_type, @bet_1, @bet_2, @bet_3,  @bet_money,  @tax_money, @item_id , @remotefee )

select @ticket_id  = @@IDENTITY

select @ticket_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelMonRaceTicket]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelMonRaceTicket]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'







/********************************************
lin_DelMonRaceTicket
	
INPUT
	@item_id		int
OUTPUT
return
made by
	young
date
	2003-06-10
********************************************/
CREATE  PROCEDURE [dbo].[lin_DelMonRaceTicket]
(
	@item_id		int
)
AS
SET NOCOUNT ON

update monrace_ticket set deleted = 1 where item_id = @item_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMonRaceTaxSum]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMonRaceTaxSum]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMonRaceTaxSum
	
INPUT
	@race_id		int
OUTPUT
return
made by
	young
date
	2004-08-05
********************************************/
CREATE  PROCEDURE [dbo].[lin_GetMonRaceTaxSum]
(
	@race_id		int
)
AS
SET NOCOUNT ON

select isnull( sum ( tax_money) , 0) from monrace_ticket (nolock) where monraceid = @race_id and deleted = 0



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMonRaceBet]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMonRaceBet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'






/********************************************
lin_GetMonRaceBet
	
INPUT
	@bet_type		int
	@race_id		int
OUTPUT
return
made by
	young
date
	2003-05-31
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMonRaceBet]
(
	@bet_type		int,
	@race_id		int
)
AS
SET NOCOUNT ON

if ( @bet_type = 1 )
begin

	select bet_1, sum( bet_money) from monrace_ticket (nolock) 
	where monraceid = @race_id
	and bet_type = 1 and deleted = 0
	group by bet_1

end else begin

	select bet_1, bet_2 , sum( bet_money ) from monrace_ticket (nolock) 
	where monraceid = @race_id
	and bet_type = 2 and deleted = 0
	group by bet_1, bet_2

end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_WriteNoblessAchievement]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_WriteNoblessAchievement]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_WriteNoblessAchievement]
(
@char_id INT,
@win_type INT,
@target INT,
@win_time INT
)
AS
SET NOCOUNT ON

INSERT INTO nobless_achievements
(char_id, win_type, target, win_time)
VALUES
(@char_id, @win_type, @target, @win_time)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetNoblessAchievements]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetNoblessAchievements]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetNoblessAchievements]
(
@char_id INT
)
AS
SELECT win_type, target, win_time FROM nobless_achievements WHERE char_id = @char_id ORDER BY win_time DESC



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveNpcBoss]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveNpcBoss]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveNpcBoss    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveNpcBoss 
	
INPUT
OUTPUT
return
made by
date
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveNpcBoss]
(
@npc_db_name	nvarchar(50),
@alive		INT,
@hp 		INT,
@mp 		INT,
@pos_x 		INT,
@pos_y 		INT,
@pos_z 		INT,
@time_low 	INT,
@time_high	INT
)
AS
SET NOCOUNT ON

if exists(select alive from npc_boss where npc_db_name = @npc_db_name)
begin
	update npc_boss 
	set
		alive=@alive, hp=@hp, mp=@mp, pos_x=@pos_x, pos_y=@pos_y, pos_z=@pos_z, time_low=@time_low, time_high=@time_high
	where npc_db_name = @npc_db_name
end
else
begin
	insert into npc_boss values 
	(@npc_db_name, @alive, @hp,@mp, @pos_x, @pos_y,@pos_z, @time_low, @time_high, 0)
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateNpcBossVariable]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateNpcBossVariable]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- kuooo
CREATE PROCEDURE [dbo].[lin_UpdateNpcBossVariable]
(
	@npc_name 	nvarchar(50),
	@i0		int
)
AS
SET NOCOUNT ON
UPDATE npc_boss	
SET 
i0 = @i0
where npc_db_name = @npc_name


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadNpcBoss]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadNpcBoss]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadNpcBoss    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadNpcBoss
	
INPUT	
	@NPC_name	nvarchar(50)
OUTPUT
	alive, 
	hp, 
	mp, 
	pos_x, 
	pos_y, 
	pos_z, 
	time_low, 
	time_high 
	i0
return
made by
	carrot
date
	2002-06-16
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadNpcBoss]
(
	@NPC_name	nvarchar(50)
)
AS
SET NOCOUNT ON

select 
	alive,  hp,  mp, pos_x, pos_y, pos_z, time_low, time_high , i0
from 
	npc_boss  (nolock)  
where 
	npc_db_name = @NPC_name


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetPledgeSkill]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetPledgeSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_GetPledgeSkill]
(
	@pledge_id	INT
)
AS
SET NOCOUNT ON

SELECT skill_id, skill_lev FROM pledge_skill WHERE pledge_id = @pledge_id

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeInfoSkills]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeInfoSkills]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_SetPledgeInfoSkills]
(
	@pledge_id 	INT,
	@skill1_id	INT, @skill1_lev	INT,
	@skill2_id	INT, @skill2_lev	INT,
	@skill3_id	INT, @skill3_lev	INT,
	@skill4_id	INT, @skill4_lev	INT,
	@skill5_id	INT, @skill5_lev	INT,
	@skill6_id	INT, @skill6_lev	INT,
	@skill7_id	INT, @skill7_lev	INT,
	@skill8_id	INT, @skill8_lev	INT,
	@skill9_id	INT, @skill9_lev	INT,
	@skill10_id	INT, @skill10_lev	INT,
	@skill11_id	INT, @skill11_lev	INT,
	@skill12_id	INT, @skill12_lev	INT,
	@skill13_id	INT, @skill13_lev	INT,
	@skill14_id	INT, @skill14_lev	INT,
	@skill15_id	INT, @skill15_lev	INT,
	@skill16_id	INT, @skill16_lev	INT,
	@skill17_id	INT, @skill17_lev	INT,
	@skill18_id	INT, @skill18_lev	INT,
	@skill19_id	INT, @skill19_lev	INT,
	@skill20_id	INT, @skill20_lev	INT,
	@skill21_id	INT, @skill21_lev	INT,
	@skill22_id	INT, @skill22_lev	INT,
	@skill23_id	INT, @skill23_lev	INT,
	@skill24_id	INT, @skill24_lev	INT,
	@skill25_id	INT, @skill25_lev	INT,
	@skill26_id	INT, @skill26_lev	INT,
	@skill27_id	INT, @skill27_lev	INT,
	@skill28_id	INT, @skill28_lev	INT,
	@skill29_id	INT, @skill29_lev	INT,
	@skill30_id	INT, @skill30_lev	INT
)

AS
SET NOCOUNT ON

IF (@skill1_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill1_id)  UPDATE pledge_skill SET skill_id = @skill1_id,skill_lev = @skill1_lev WHERE pledge_id = @pledge_id AND skill_id = @skill1_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill1_id,@skill1_lev)
END

IF (@skill2_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill2_id)  UPDATE pledge_skill SET skill_id = @skill2_id,skill_lev = @skill2_lev WHERE pledge_id = @pledge_id AND skill_id = @skill2_id	
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill2_id,@skill2_lev)	
END
IF (@skill3_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill3_id)  UPDATE pledge_skill SET skill_id = @skill3_id,skill_lev = @skill3_lev WHERE pledge_id = @pledge_id AND skill_id = @skill3_id	
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill3_id,@skill3_lev)	
END
IF (@skill4_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill4_id)  UPDATE pledge_skill SET skill_id = @skill4_id,skill_lev = @skill4_lev WHERE pledge_id = @pledge_id AND skill_id = @skill4_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill4_id,@skill4_lev)
END
IF (@skill5_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill5_id)  UPDATE pledge_skill SET skill_id = @skill5_id,skill_lev = @skill5_lev WHERE pledge_id = @pledge_id AND skill_id = @skill5_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill5_id,@skill5_lev)
END
IF (@skill6_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill6_id)  UPDATE pledge_skill SET skill_id = @skill6_id,skill_lev = @skill6_lev WHERE pledge_id = @pledge_id AND skill_id = @skill6_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill6_id,@skill6_lev)
END
IF (@skill7_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill7_id)  UPDATE pledge_skill SET skill_id = @skill7_id,skill_lev = @skill7_lev WHERE pledge_id = @pledge_id AND skill_id = @skill7_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill7_id,@skill7_lev)
END
IF (@skill8_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill8_id)  UPDATE pledge_skill SET skill_id = @skill8_id,skill_lev = @skill8_lev WHERE pledge_id = @pledge_id AND skill_id = @skill8_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill8_id,@skill8_lev)
END
IF (@skill9_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill9_id)  UPDATE pledge_skill SET skill_id = @skill9_id,skill_lev = @skill9_lev WHERE pledge_id = @pledge_id AND skill_id = @skill9_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill9_id,@skill9_lev)
END
IF (@skill10_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill10_id)  UPDATE pledge_skill SET skill_id = @skill10_id,skill_lev = @skill10_lev WHERE pledge_id = @pledge_id AND skill_id = @skill10_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill10_id,@skill10_lev)
END
IF (@skill11_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill11_id)  UPDATE pledge_skill SET skill_id = @skill11_id,skill_lev = @skill11_lev WHERE pledge_id = @pledge_id AND skill_id = @skill11_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill11_id,@skill11_lev)
END
IF (@skill12_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill12_id)  UPDATE pledge_skill SET skill_id = @skill12_id,skill_lev = @skill12_lev WHERE pledge_id = @pledge_id AND skill_id = @skill12_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill12_id,@skill12_lev)
END
IF (@skill13_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill13_id)  UPDATE pledge_skill SET skill_id = @skill13_id,skill_lev = @skill13_lev WHERE pledge_id = @pledge_id AND skill_id = @skill13_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill13_id,@skill13_lev)
END
IF (@skill14_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill14_id)  UPDATE pledge_skill SET skill_id = @skill14_id,skill_lev = @skill14_lev WHERE pledge_id = @pledge_id AND skill_id = @skill14_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill14_id,@skill14_lev)
END
IF (@skill15_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill15_id)  UPDATE pledge_skill SET skill_id = @skill15_id,skill_lev = @skill15_lev WHERE pledge_id = @pledge_id AND skill_id = @skill15_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill15_id,@skill15_lev)
END
IF (@skill16_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill16_id)  UPDATE pledge_skill SET skill_id = @skill16_id,skill_lev = @skill16_lev WHERE pledge_id = @pledge_id AND skill_id = @skill16_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill16_id,@skill16_lev)
END
IF (@skill17_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill17_id)  UPDATE pledge_skill SET skill_id = @skill17_id,skill_lev = @skill17_lev WHERE pledge_id = @pledge_id AND skill_id = @skill17_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill17_id,@skill17_lev)
END
IF (@skill18_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill18_id)  UPDATE pledge_skill SET skill_id = @skill18_id,skill_lev = @skill18_lev WHERE pledge_id = @pledge_id AND skill_id = @skill18_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill18_id,@skill18_lev)
END
IF (@skill19_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill19_id)  UPDATE pledge_skill SET skill_id = @skill19_id,skill_lev = @skill19_lev WHERE pledge_id = @pledge_id AND skill_id = @skill19_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill19_id,@skill19_lev)
END
IF (@skill20_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill20_id)  UPDATE pledge_skill SET skill_id = @skill20_id,skill_lev = @skill20_lev WHERE pledge_id = @pledge_id AND skill_id = @skill20_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill20_id,@skill20_lev)
END
IF (@skill21_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill21_id)  UPDATE pledge_skill SET skill_id = @skill21_id,skill_lev = @skill21_lev WHERE pledge_id = @pledge_id AND skill_id = @skill21_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill21_id,@skill21_lev)
END
IF (@skill22_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill22_id)  UPDATE pledge_skill SET skill_id = @skill22_id,skill_lev = @skill22_lev WHERE pledge_id = @pledge_id AND skill_id = @skill22_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill22_id,@skill22_lev)
END
IF (@skill23_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill23_id)  UPDATE pledge_skill SET skill_id = @skill23_id,skill_lev = @skill23_lev WHERE pledge_id = @pledge_id AND skill_id = @skill23_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill23_id,@skill23_lev)
END
IF (@skill24_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill24_id)  UPDATE pledge_skill SET skill_id = @skill24_id,skill_lev = @skill24_lev WHERE pledge_id = @pledge_id AND skill_id = @skill24_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill24_id,@skill24_lev)
END
IF (@skill25_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill25_id)  UPDATE pledge_skill SET skill_id = @skill25_id,skill_lev = @skill25_lev WHERE pledge_id = @pledge_id AND skill_id = @skill25_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill25_id,@skill25_lev)
END
IF (@skill26_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill26_id)  UPDATE pledge_skill SET skill_id = @skill26_id,skill_lev = @skill26_lev WHERE pledge_id = @pledge_id AND skill_id = @skill26_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill26_id,@skill26_lev)
END
IF (@skill27_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill27_id)  UPDATE pledge_skill SET skill_id = @skill27_id,skill_lev = @skill27_lev WHERE pledge_id = @pledge_id AND skill_id = @skill27_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill27_id,@skill27_lev)
END
IF (@skill28_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill28_id)  UPDATE pledge_skill SET skill_id = @skill28_id,skill_lev = @skill28_lev WHERE pledge_id = @pledge_id AND skill_id = @skill28_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill28_id,@skill28_lev)
END
IF (@skill29_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill29_id)  UPDATE pledge_skill SET skill_id = @skill29_id,skill_lev = @skill29_lev WHERE pledge_id = @pledge_id AND skill_id = @skill29_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill29_id,@skill29_lev)
END
IF (@skill30_id>0)
BEGIN
	IF EXISTS(SELECT * FROM pledge_skill WHERE pledge_id = @pledge_id AND skill_id = @skill30_id)  UPDATE pledge_skill SET skill_id = @skill30_id,skill_lev = @skill30_lev WHERE pledge_id = @pledge_id AND skill_id = @skill30_id
	ELSE INSERT INTO pledge_skill (pledge_id,skill_id,skill_lev)  VALUES (@pledge_id,@skill30_id,@skill30_lev)
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UninstallAllBattleCamp]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UninstallAllBattleCamp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UninstallAllBattleCamp    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_UninstallAllBattleCamp
-- by bert
-- return deleted battle camp ids

CREATE PROCEDURE [dbo].[lin_UninstallAllBattleCamp] (@castle_id INT, @type INT)
AS

SET NOCOUNT ON

SELECT id FROM object_data WHERE residence_id = @castle_id AND type = @type

DELETE FROM object_data WHERE residence_id = @castle_id AND type = @type



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UninstallBattleCamp]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UninstallBattleCamp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UninstallBattleCamp    Script Date: 2003-09-20 ?? 11:52:00 ******/
-- lin_UninstalllBattleCamp
-- by bert
-- return deleted battle camp id

CREATE PROCEDURE [dbo].[lin_UninstallBattleCamp] (@pledge_id INT, @type INT)
AS

SET NOCOUNT ON

SELECT id FROM object_data WHERE owner_id = @pledge_id AND type = @type

DELETE FROM object_data WHERE owner_id = @pledge_id AND type = @type




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveObjectHp]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveObjectHp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveObjectHp    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveObjectHp
	
INPUT	
	@hp	int,
	@id	int
OUTPUT

return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SaveObjectHp]
(
	@hp	int,
	@id	int
)
AS
SET NOCOUNT ON

UPDATE object_data SET hp = @hp WHERE id = @id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InstallBattleCamp]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InstallBattleCamp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InstallBattleCamp    Script Date: 2003-09-20 ?? 11:51:59 ******/
-- lin_InstallBattleCamp
-- by bert
-- return new battle camp id

CREATE PROCEDURE [dbo].[lin_InstallBattleCamp] (@pledge_id INT, @castle_id INT, @max_hp INT, @hp INT, @x INT, @y INT, @z INT, @type INT)
AS

SET NOCOUNT ON

INSERT INTO object_data
(owner_id, residence_id, max_hp, hp, x_pos, y_pos, z_pos, type)
VALUES 
(@pledge_id, @castle_id, @max_hp, @hp, @x, @y, @z, @type)

SELECT @@IDENTITY



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveSeasonStartTime]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveSeasonStartTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveSeasonStartTime]
(
@season AS INT,
@season_start_time AS INT
)
AS
SET NOCOUNT ON
UPDATE olympiad
SET season_start_time = @season_start_time
WHERE season = @season



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveOlympiadTerm]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveOlympiadTerm]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveOlympiadTerm]
(
@season INT,
@start_sec INT,
@bonus1_sec INT,
@bonus2_sec INT,
@bonus3_sec INT,
@bonus4_sec INT,
@nominate_sec INT
)
AS
SET NOCOUNT ON

UPDATE olympiad
SET start_sec = @start_sec, 
bonus1_sec = @bonus1_sec, bonus2_sec = @bonus2_sec, bonus3_sec = @bonus3_sec, bonus4_sec = @bonus4_sec, 
nominate_sec = @nominate_sec
WHERE season = @season

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InitAllOlympiadPoint]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InitAllOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_InitAllOlympiadPoint]
(
@season INT,
@step INT,
@init_point INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET olympiad_point = @init_point

UPDATE olympiad
SET step = @step
WHERE season = @season




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadOlympiad]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadOlympiad]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadOlympiad]
AS
SET NOCOUNT ON

DECLARE @cnt INT
SELECT @cnt = COUNT(*) FROM olympiad

IF @cnt = 0
BEGIN
	INSERT INTO olympiad (step) VALUES (0)
END
SELECT TOP 1 season, step, 
ISNULL(season_start_time, 0),
ISNULL(start_sec, 0), 
ISNULL(bonus1_sec, 0), 
ISNULL(bonus2_sec, 0), 
ISNULL(bonus3_sec, 0), 
ISNULL(bonus4_sec, 0), 
ISNULL(nominate_sec, 0) 
FROM olympiad ORDER BY season DESC



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_StartOlympiadSeason]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_StartOlympiadSeason]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_StartOlympiadSeason]
(
@season INT,
@step INT,
@season_start_time INT
)
AS
SET NOCOUNT ON

UPDATE olympiad
SET step = @step, season_start_time = @season_start_time
WHERE season = @season

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddAllOlympiadBonusPoint]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddAllOlympiadBonusPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_AddAllOlympiadBonusPoint]
(
@season INT,
@step INT,
@bonus_point INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET olympiad_point = olympiad_point + @bonus_point

UPDATE olympiad
SET step = @step
WHERE season = @season




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_NominateHeroes]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_NominateHeroes]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_NominateHeroes]
(
@now_season INT,
@new_step INT,
@new_season_start_time INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET hero_type = 0

CREATE TABLE #hero_candidate (char_id INT, main_class INT, match_count INT, olympiad_point INT)
INSERT INTO #hero_candidate 
	SELECT un.char_id, ud.subjob0_class, un.match_count, un.olympiad_point 
	FROM user_nobless un, user_data ud 
	WHERE un.char_id = ud.char_id AND un.match_count >= 5 AND un.olympiad_win_count >= 1

CREATE TABLE #highest_score (main_class INT, olympiad_point INT, match_count INT)

DECLARE @hero_candidate_class INT
DECLARE hero_candidate_cursor CURSOR FOR
SELECT DISTINCT main_class FROM #hero_candidate

OPEN hero_candidate_cursor

FETCH NEXT FROM hero_candidate_cursor INTO @hero_candidate_class

WHILE @@FETCH_STATUS = 0
BEGIN

INSERT INTO #highest_score
	SELECT TOP 1 main_class, olympiad_point, match_count 
	FROM #hero_candidate 
	WHERE main_class = @hero_candidate_class
	ORDER BY olympiad_point DESC, match_count DESC

	FETCH NEXT FROM hero_candidate_cursor INTO @hero_candidate_class
END

CLOSE hero_candidate_cursor
DEALLOCATE hero_candidate_cursor

CREATE TABLE #highest_score_nobless (char_id INT, main_class INT)
INSERT INTO #highest_score_nobless
	SELECT c.char_id, c.main_class FROM #hero_candidate c, #highest_score s
		WHERE c.main_class = s.main_class AND c.olympiad_point = s.olympiad_point AND c.match_count = s.match_count

CREATE TABLE #hero (char_id INT, main_class INT)
INSERT INTO #hero
	SELECT char_id, main_class  FROM #highest_score_nobless WHERE main_class IN (SELECT main_class FROM #highest_score_nobless GROUP BY main_class HAVING COUNT(main_class) = 1)

UPDATE user_nobless
SET hero_type = 1, win_count = win_count+1
WHERE char_id IN (SELECT char_id FROM #hero)

UPDATE user_nobless
SET previous_point = olympiad_point

UPDATE user_nobless
SET olympiad_point = 0, match_count = 0, olympiad_win_count = 0, olympiad_lose_count = 0

INSERT INTO olympiad_result
	SELECT @now_season, main_class, char_id, olympiad_point, match_count FROM #hero_candidate

INSERT INTO olympiad
	(step, season_start_time) VALUES (@new_step, @new_season_start_time)

SELECT @@IDENTITY




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveOlympiadRecord]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveOlympiadRecord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveOlympiadRecord]
(
@season INT,
@winner_id INT,
@winner_point INT,
@loser_id INT,
@loser_point INT,
@time INT
)
AS
SET NOCOUNT ON

IF @winner_id <> 0
BEGIN
	UPDATE user_nobless
	SET olympiad_point = olympiad_point + @winner_point, match_count = match_count+1, olympiad_win_count = olympiad_win_count+1
	WHERE char_id = @winner_id

	DECLARE @winner_class INT
	SELECT @winner_class = subjob0_class FROM user_data WHERE char_id = @winner_id

	INSERT olympiad_match
	(season, class, match_time, char_id, rival_id, point, is_winner)
	VALUES
	(@season, @winner_class, @time, @winner_id, @loser_id, @winner_point, 1)
END

IF @loser_id <> 0
BEGIN
	UPDATE user_nobless
	SET olympiad_point = olympiad_point + @loser_point, match_count = match_count+1, olympiad_lose_count = olympiad_lose_count+1
	WHERE char_id = @loser_id

	DECLARE @loser_class INT
	SELECT @loser_class = subjob0_class FROM user_data WHERE char_id = @loser_id

	INSERT olympiad_match
	(season, class, match_time, char_id, rival_id, point, is_winner)
	VALUES
	(@season, @loser_class, @time, @loser_id, @winner_id, @loser_point, 0)
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetOfflineStoreTime]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetOfflineStoreTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_SetOfflineStoreTime]
(
	@char_id INT,
	@StartTime INT,
	@RemainTime INT
)

AS
SET NOCOUNT ON

IF @RemainTime=0
BEGIN
	IF exists(SELECT start_time FROM offlinestore_users where char_id = @char_id) DELETE FROM offlinestore_users WHERE char_id = @char_id
END
ELSE
BEGIN
 	IF exists(SELECT start_time FROM offlinestore_users where char_id = @char_id) UPDATE offlinestore_users SET start_time = @StartTime, remain_time = @RemainTime WHERE char_id = @char_id
	ELSE INSERT INTO offlinestore_users (char_id, start_time, remain_time) VALUES (@char_id,@StartTime,@RemainTime)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetNoblessTop10]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetNoblessTop10]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetNoblessTop10]
(
@class INT,
@season INT
)
AS  
SET NOCOUNT ON  

SELECT TOP 10 WITH TIES u.char_id, u.char_name, o.point, o.match_count 
FROM user_data u, olympiad_result o 
WHERE o.class = @class AND u.char_id = o.char_id AND o.season = @season
ORDER BY point DESC



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CheckPetName]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CheckPetName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_CheckPetName]
(
@pet_name NVARCHAR(24)
)
AS

SET NOCOUNT ON

declare @result  int
set @result = 1

SET @pet_name = RTRIM(@pet_name)
IF @pet_name  LIKE N'' '' 
BEGIN
	RAISERROR (''pet name has space : name = [%s]'', 16, 1, @pet_name)
	set @result = -1
END

-- check user_prohibit 
if exists(select char_name from user_prohibit (nolock) where char_name = @pet_name)
begin
	RAISERROR (''Pet  name is prohibited: name = [%s]'', 16, 1, @pet_name)
	set @result = -2
end

-- prohibit word
declare @user_prohibit_word nvarchar(20)
select top 1 @user_prohibit_word = words from user_prohibit_word (nolock) where PATINDEX(''%'' + words + ''%'', @pet_name) > 0 
if @user_prohibit_word is not null
begin
	RAISERROR (''pet  name has prohibited word: name = [%s], word[%s]'', 16, 1, @pet_name, @user_prohibit_word)
	set @result = -3
end

-- check reserved name
--declare @reserved_name nvarchar(50)
--select top 1 @reserved_name = char_name from user_name_reserved (nolock) where used = 0 and char_name = @pet_name
--if not @reserved_name is null
--begin
--	RAISERROR (''pet name is reserved by other player: name = [%s]'', 16, 1, @pet_name)
--	set @result = -4
--end

-- check duplicated pet name
declare @dup_pet_name nvarchar(50)
select top 1 @dup_pet_name = nick_name from pet_data (nolock) where nick_name = @pet_name
if not @dup_pet_name is null
begin
	RAISERROR (''duplicated pet name[%s]'', 16, 1, @pet_name)
	set @result = -4
end

select @result


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SavePet]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SavePet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_SavePet

INPUT
OUTPUT
return
made by
	kuooo
date
	2003-08-19
change
********************************************/
CREATE PROCEDURE [dbo].[lin_SavePet]
(
	@pet_id 	INT,
	@expoint	INT,
	@hp		float,
	@mp		float,
	@sp		INT,
	@meal		INT,
	@nick_name	NVARCHAR(50),
	@slot1		int,
	@slot2		int
)
AS

SET NOCOUNT ON

UPDATE 
	pet_data
set 
	expoint = @expoint,
	hp = @hp,
	mp = @mp,
	sp = @sp,
	meal = @meal,
	nick_name = @nick_name,
	slot1 = @slot1,
	slot2 = @slot2
WHERE 
	pet_id = @pet_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreatePet]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreatePet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_CreatePet
	create item sp
INPUT
	@pet_id	INT,  // same as pet_collar_dbid
	@npc_class_id	INT
OUTPUT
return
made by
	kuooo
date
	2002-08-19
********************************************/
CREATE PROCEDURE [dbo].[lin_CreatePet]
(
@pet_dbid		INT,
@npc_class_id		INT,
@exp_in		INT,
@hp			float,
@mp			float,
@meal			int
)
AS
SET NOCOUNT ON

insert into pet_data
	(pet_id, npc_class_id,  expoint, hp, mp, meal)
	values (@pet_dbid, @npc_class_id, @exp_in, @hp, @mp, @meal)

/*SELECT @@IDENTITY*/


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPet]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_LoadPet
	
INPUT	
	@pet_id int
OUTPUT
return
made by
	kuooo
date
	2003-08-22
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadPet]
(
	@pet_id int
)
AS
SET NOCOUNT ON

SELECT npc_class_id  , expoint , hp, mp, sp, meal, nick_name , slot1, slot2 FROM pet_data (nolock) WHERE pet_id = @pet_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeletePet]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeletePet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeletePet    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_DeleteItem
	
INPUT
	@pet_id	INT
OUTPUT
return
made by
	kuooo
date
	2003-08-19
********************************************/
CREATE PROCEDURE [dbo].[lin_DeletePet]
(
	@pet_id	INT
)
AS
SET NOCOUNT ON
DELETE FROM pet_data WHERE pet_id = @pet_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPledgeAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPledgeAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SetPledgeAnnounce
	set pledge announce 
INPUT
	@pledge_id		int,
	@show_flag		smallint,
	@content		nvarchar(3000)
OUTPUT
return
made by
	kks
date
	2005-07-22
********************************************/
CREATE PROCEDURE [dbo].[lin_SetPledgeAnnounce]
(  
	@pledge_id		int,
	@show_flag		smallint,
	@content		nvarchar(3000)
)  
AS  
SET NOCOUNT ON  
  

UPDATE pledge_announce SET show_flag = @show_flag , content = @content
WHERE pledge_id = @pledge_id

IF (@@ROWCOUNT = 0)  
 BEGIN  
  INSERT INTO pledge_announce (pledge_id, show_flag, content)
	VALUES (@pledge_id, @show_flag, @content)
 END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeAnnounce]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeAnnounce]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_LoadPledgeAnnounce
	load pledge announce 
INPUT
	@pledge_id		int
OUTPUT
return
made by
	kks
date
	2005-07-22
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadPledgeAnnounce]
(  
	@pledge_id		int
)  
AS  
SET NOCOUNT ON  
  

select show_flag, content 
from pledge_announce (nolock)
WHERE pledge_id = @pledge_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SwitchPledgeAnnounceShowFlag]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SwitchPledgeAnnounceShowFlag]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SwitchPledgeAnnounceShowFlag
	set pledge announce show flag
INPUT
	@pledge_id		int,
	@show_flag		smallint
OUTPUT
return
made by
	kks
date
	2005-07-22
********************************************/
CREATE PROCEDURE [dbo].[lin_SwitchPledgeAnnounceShowFlag]
(  
	@pledge_id		int,
	@show_flag		smallint
)  
AS  
SET NOCOUNT ON  
  

UPDATE pledge_announce SET show_flag = @show_flag
WHERE pledge_id = @pledge_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeletePledgeContribution]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeletePledgeContribution]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeletePledgeContribution    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DeletePledgeContribution
	
INPUT	
	@residence_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_DeletePledgeContribution]
(
	@residence_id		int
)
AS
SET NOCOUNT ON

DELETE FROM pledge_contribution WHERE residence_id = @residence_id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SavePledgeContribution]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SavePledgeContribution]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_SavePledgeContribution]
(
@agit_id INT,
@pledge_id INT,
@contribution INT
)
AS
SET NOCOUNT ON

UPDATE pledge_contribution SET contribution = contribution + @contribution WHERE pledge_id = @pledge_id AND residence_id = @agit_id
IF @@ROWCOUNT = 0
INSERT INTO pledge_contribution (contribution, pledge_id, residence_id) VALUES (@contribution, @pledge_id , @agit_id)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetContributionRelatedPledge]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetContributionRelatedPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetContributionRelatedPledge    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetContributionRelatedPledge
	
INPUT	
	@residence_id		int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_GetContributionRelatedPledge]
(
	@residence_id		int
)
AS
SET NOCOUNT ON

SELECT pledge_id FROM pledge_contribution (nolock)  WHERE residence_id = @residence_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CopyChar]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CopyChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

/********************************************
lin_CopyChar
	copy character sp
INPUT
	@char_id		int
	@new_char_name	nvarchar(24)
	@account_id		int
	@account_name	nvarchar(24)
	@builder		int
OUTPUT

return
made by
	young
date
	2003-11-17
	2005-09-07	modified by btwinuni
	2005-10-28	modified by btwinuni	for CH4
********************************************/
CREATE PROCEDURE [dbo].[lin_CopyChar]
(
@char_id		int,
@new_char_name	nvarchar(24),
@account_id		int,
@account_name	nvarchar(24),
@builder		int
)
AS

SET NOCOUNT ON


declare @new_char_id	int

set @new_char_id = 0

SET @new_char_name = RTRIM(@new_char_name)


IF @new_char_name LIKE N'' '' 
BEGIN
	RAISERROR (''Character name has space : name = [%s]'', 16, 1, @new_char_name)
	RETURN -1
END

-- check user_prohibit 
if exists(select char_name from user_prohibit (nolock) where char_name = @new_char_name)
begin
	RAISERROR (''Character name is prohibited: name = [%s]'', 16, 1, @new_char_name)
	RETURN -1	
end

declare @user_prohibit_word nvarchar(20)
select top 1 @user_prohibit_word = words from user_prohibit_word (nolock) where PATINDEX(''%'' + words + ''%'', @new_char_name) > 0   
if @user_prohibit_word is not null
begin
	RAISERROR (''Character name has prohibited word: name = [%s], word[%s]'', 16, 1, @new_char_name, @user_prohibit_word)
	RETURN -1	
end

-- check reserved name
declare @reserved_name nvarchar(50)
declare @reserved_account_id int
select top 1 @reserved_name = char_name, @reserved_account_id = account_id from user_name_reserved (nolock) where used = 0 and char_name = @new_char_name
if not @reserved_name is null
begin
	if not @reserved_account_id = @account_id
	begin
		RAISERROR (''Character name is reserved by other player: name = [%s]'', 16, 1, @new_char_name)
		RETURN -1
	end
end

declare	@gender	int
declare	@race	int
declare	@class	int
declare	@world	int
declare	@xloc	int
declare	@yloc	int
declare	@zloc	int
declare	@HP	float
declare	@MP	float
declare	@SP	int
declare	@Exp	int
declare	@Lev	int
declare	@align	int
declare	@PK	int
declare	@PKpardon	int
declare	@Duel		int
declare	@quest_flag	binary
declare	@max_hp	int
declare	@max_mp	int
declare	@quest_memo	char(32)
declare	@face_index	int
declare	@hair_shape_index	int
declare	@hair_color_index	int
declare	@drop_exp	int
declare	@subjob_id	int
declare	@cp		float
declare	@max_cp	float
declare	@subjob0_class	int
declare	@subjob1_class	int
declare	@subjob2_class	int
declare	@subjob3_class	int

-- insert user_data
select  	@builder = builder,
	@gender = gender,
	@race = race, 
	@class = class,
	@world = world,
	@xloc = xloc,
	@yloc = yloc,
	@zloc = zloc,
	@HP = HP,
	@MP = MP,
	@SP = SP,
	@Exp = Exp,
	@Lev = Lev,
	@align = align,
	@PK = PK,
	@PKpardon = PKpardon,
	@Duel = Duel,
	@quest_flag = quest_flag,
	@max_hp = max_hp,
	@max_mp = max_mp,
	@quest_memo = quest_memo,
	@face_index = face_index,
	@hair_shape_index = hair_shape_index,
	@hair_color_index = hair_color_index,
	@drop_exp = drop_exp,
	@subjob_id = subjob_id,
	@cp = cp,
	@max_cp = max_cp,
	@subjob0_class = subjob0_class,
	@subjob1_class = subjob1_class,
	@subjob2_class = subjob2_class,
	@subjob3_class = subjob3_class
	from user_data (nolock) 
	where char_id = @char_id

if ( @@ROWCOUNT > 0 ) 
begin
	INSERT INTO user_data 
	( char_name, account_name, account_id, pledge_id, create_date,
	builder, gender, race, class, world, xloc, yloc, zloc, HP, MP, SP, Exp, Lev, align, PK, PKpardon, Duel,
	quest_flag, max_hp, max_mp, quest_memo, face_index, hair_shape_index, hair_color_index, drop_exp, subjob_id, cp, max_cp,
	subjob0_class, subjob1_class, subjob2_class, subjob3_class)
	VALUES
	(@new_char_name, @account_name, @account_id, 0, GETDATE(),
	@builder, @gender, @race, @class, @world, @xloc, @yloc, @zloc, @HP, @MP, @SP, @Exp, @Lev, @align, @PK, @PKpardon, @Duel,
	@quest_flag, @max_hp, @max_mp, @quest_memo, @face_index, @hair_shape_index, @hair_color_index, @drop_exp, @subjob_id, @cp, @max_cp,
	@subjob0_class, @subjob1_class, @subjob2_class, @subjob3_class)

	IF (@@error = 0)
	BEGIN
		SET @new_char_id = @@IDENTITY

		insert into user_item ( char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
		select @new_char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse
		from user_item (nolock) where char_id = @char_id and item_type not in (
			2375, 3500, 3501, 3502, 4422, 4423, 4424, 4425,	-- pet
			4442, 4443, 4444 )				-- lotto, monster race

		insert into user_skill ( char_id,  skill_id, skill_lev, to_end_time, subjob_id )
		select @new_char_id, skill_id, skill_lev, to_end_time, subjob_id
		from user_skill (nolock) where char_id = @char_id

		insert into quest ( char_id, q1, s1, q2, s2, q3, s3, q4, s4, q5, s5, q6, s6, q7, s7, q8, s8, q9, s9, q10, s10, q11, s11, q12, s12, q13, s13, q14, s14, q15, s15, q16, s16,
		j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, s2_9, s2_10, s2_11, s2_12, s2_13, s2_14, s2_15, s2_16 )
		select @new_char_id,  q1, s1, q2, s2, q3, s3, q4, s4, q5, s5, q6, s6, q7, s7, q8, s8, q9, s9, q10, s10, q11, s11, q12, s12, q13, s13, q14, s14, q15, s15, q16, s16,
		j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, s2_9, s2_10, s2_11, s2_12, s2_13, s2_14, s2_15, s2_16
		from quest (nolock) where char_id = @char_id

		insert into user_subjob ( char_id, hp, mp, sp, exp, level, henna_1, henna_2, henna_3, subjob_id, create_date )
		select @new_char_id, hp, mp, sp, exp, level, 0, 0, 0, subjob_id, GETDATE()
		from user_subjob (nolock) where char_id = @char_id

	END
end

SELECT @new_char_id

if @new_char_id > 0
begin
	-- make user_history
	exec lin_InsertUserHistory @new_char_name, @new_char_id, 1, @account_name, NULL
	if not @reserved_name is null
		update user_name_reserved set used = 1 where char_name = @reserved_name
end






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateCharWithSubjob]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateCharWithSubjob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

/******************************************************************************
#Name:	lin_CreateCharWithSubjob
#Desc:	create a character with subjob

#Argument:
	Input:	@char_name	NVARCHAR(24)
		@account_name	NVARCHAR(24)
		@account_id	INT
		@pledge_id	INT
		@builder		TINYINT
		@gender	TINYINT
		@race		TINYINT
		@class		TINYINT
		@world		SMALLINT
		@xloc		INT
		@yloc		INT
		@zloc		INT
		@HP		FLOAT
		@MP		FLOAT
		@SP		INT
		@Exp		INT
		@Lev		TINYINT
		@align		SMALLINT
		@PK		INT
		@Duel		INT
		@PKPardon	INT
		@FaceIndex	INT = 0
		@HairShapeIndex		INT = 0
		@HairColorIndex		INT = 0
		@SubjobID	INT = 0
		@MainClass	INT = 0
		@CP 		FLOAT = 0
	Output:	@char_id	INT
#Return:
#Result Set:

#Remark:
#Example:
#See:
	lin_CreateChar

#History:
	Create	btwinuni	2005-07-28
	Modify	btwinuni	2005-09-07	main_class -> subjob0_class
	Modify	btwinuni	2005-11-17
******************************************************************************/
CREATE PROCEDURE [dbo].[lin_CreateCharWithSubjob]  
(  
@char_name NVARCHAR(24),  
@account_name NVARCHAR(24),  
@account_id INT,  
@pledge_id INT,  
@builder  TINYINT,  
@gender TINYINT,  
@race  TINYINT,  
@class  TINYINT,  
@world  SMALLINT,  
@xloc  INT,  
@yloc  INT,  
@zloc  INT,  
@HP  FLOAT,  
@MP  FLOAT,  
@SP  INT,  
@Exp  INT,  
@Lev  TINYINT,  
@align  SMALLINT,  
@PK  INT,  
@Duel  INT,  
@PKPardon  INT,  
@FaceIndex   INT = 0,  
@HairShapeIndex  INT = 0,  
@HairColorIndex  INT = 0,
@SubjobID INT = -1,
@MainClass INT = -1,
@CP FLOAT = 0
)  
AS  
  
SET NOCOUNT ON  
  
SET @char_name = RTRIM(@char_name)  
DECLARE @char_id int  
SET @char_id = 0  

if @MainClass = -1
begin
	set @MainClass = null
end
  
IF @char_name LIKE N'' ''   
BEGIN  
 RAISERROR (''Character name has space : name = [%s]'', 16, 1, @char_name)  
 RETURN -1  
END  
  
-- check user_prohibit   
if exists(select char_name from user_prohibit (nolock) where char_name = @char_name)  
begin  
 RAISERROR (''Character name is prohibited: name = [%s]'', 16, 1, @char_name)  
 RETURN -1   
end  

-- check user_data
if exists(select char_name from user_data (nolock) where char_name = @char_name)  
begin  
 RAISERROR (''Character name is alreasy exist: name = [%s]'', 16, 1, @char_name)  
 RETURN -1   
end  

  
declare @user_prohibit_word nvarchar(20)  
select top 1 @user_prohibit_word = words from user_prohibit_word (nolock) where @char_name like ''%'' + words + ''%''
if @user_prohibit_word is not null  
begin  
 RAISERROR (''Character name has prohibited word: name = [%s], word[%s]'', 16, 1, @char_name, @user_prohibit_word)  
 RETURN -1   
end  
  
-- check reserved name  
declare @reserved_name nvarchar(50)  
declare @reserved_account_id int  
select top 1 @reserved_name = char_name, @reserved_account_id = account_id from user_name_reserved (nolock) where used = 0 and char_name = @char_name  
if not @reserved_name is null  
begin  
 if not @reserved_account_id = @account_id  
 begin  
  RAISERROR (''Character name is reserved by other player: name = [%s]'', 16, 1, @char_name)  
  RETURN -1  
 end  
end  
  
-- insert user_data  
INSERT INTO user_data   
( char_name, account_name, account_id, pledge_id, builder, gender, race, class,   
world, xloc, yloc, zloc, HP, MP, max_hp, max_mp, SP, Exp, Lev, align, PK, PKpardon, duel, create_date, face_index, hair_shape_index, hair_color_index,
subjob_id, subjob0_class, cp, max_cp
 )  
VALUES  
(@char_name, @account_name, @account_id, @pledge_id, @builder, @gender, @race, @class,   
@world, @xloc, @yloc, @zloc, @HP, @MP, @HP, @MP, @SP, @Exp, @Lev, @align, @PK, @Duel, @PKPardon, GETDATE(), @FaceIndex, @HairShapeIndex, @HairColorIndex,
@SubjobID, @MainClass, @CP, @CP)  
  
IF (@@error = 0)  
BEGIN  
 SET @char_id = @@IDENTITY  
 INSERT INTO quest (char_id) VALUES (@char_id)  
END  
  
SELECT @char_id  
  
if @char_id > 0  
begin  
 -- make user_history  
 exec lin_InsertUserHistory @char_name, @char_id, 1, @account_name, NULL  
 if not @reserved_name is null  
  update user_name_reserved set used = 1 where char_name = @reserved_name  
end











' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadQuest]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadQuest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************  
lin_LoadQuest  
   
INPUT  
 @char_id int  
OUTPUT  
return  
made by  
 carrot  
date  
 2002-06-09  
********************************************/  
CREATE PROCEDURE [dbo].[lin_LoadQuest]  
(  
@char_id int  
)  
AS  
SET NOCOUNT ON  
  
SELECT TOP 1  q1, s1,  s2_1, j1,    
  q2, s2,  s2_2, j2,   
  q3, s3,  s2_3, j3,   
  q4, s4,  s2_4, j4,   
  q5, s5,  s2_5, j5,   
  q6, s6,  s2_6, j6,   
  q7, s7, s2_7,  j7,   
  q8, s8, s2_8,  j8,  
  q9, s9,  s2_9, j9,   
  q10, s10, s2_10,  j10,   
  q11, s11,  s2_11,  j11,   
  q12, s12, s2_12,  j12,  
  q13, s13, s2_13,  j13,  
  q14, s14, s2_14,  j14,   
  q15, s15,  s2_15, j15,   
  q16, s16, s2_16, j16,
  q17, s17, s2_17, j17,
  q18, s18, s2_18, j18,
  q19, s19, s2_19, j19,
  q20, s20, s2_20, j20,
  q21, s21, s2_21, j21,
  q22, s22, s2_22, j22,
  q23, s23, s2_23, j23,
  q24, s24, s2_24, j24,
  q25, s25, s2_25, j25,
  q26, s26, s2_26, j26 
FROM quest (nolock)   
WHERE char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetQuest]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetQuest]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_SetQuest]
(
@q1 INT,
@s1 INT,
@s2_1 INT,
@j1 INT,

@q2 INT,
@s2 INT,
@s2_2 INT,
@j2 INT,

@q3 INT,
@s3 INT,
@s2_3 INT,
@j3 INT,

@q4 INT,
@s4 INT,
@s2_4 INT,
@j4 INT,

@q5 INT,
@s5 INT,
@s2_5 INT,
@j5 INT,

@q6 INT,
@s6 INT,
@s2_6 INT,
@j6 INT,

@q7 INT,
@s7 INT,
@s2_7 INT,
@j7 INT,

@q8 INT,
@s8 INT,
@s2_8 INT,
@j8 INT,

@q9 INT,
@s9 INT,
@s2_9 INT,
@j9 INT,

@q10 INT,
@s10 INT,
@s2_10 INT,
@j10 INT,

@q11 INT,
@s11 INT,
@s2_11 INT,
@j11 INT,

@q12 INT,
@s12 INT,
@s2_12 INT,
@j12 INT,

@q13 INT,
@s13 INT,
@s2_13 INT,
@j13 INT,

@q14 INT,
@s14 INT,
@s2_14 INT,
@j14 INT,

@q15 INT,
@s15 INT,
@s2_15 INT,
@j15 INT,

@q16 INT,
@s16 INT,
@s2_16 INT,
@j16 INT,

@q17 INT,
@s17 INT,
@s2_17 INT,
@j17 INT,

@q18 INT,
@s18 INT,
@s2_18 INT,
@j18 INT,

@q19 INT,
@s19 INT,
@s2_19 INT,
@j19 INT,

@q20 INT,
@s20 INT,
@s2_20 INT,
@j20 INT,

@q21 INT,
@s21 INT,
@s2_21 INT,
@j21 INT,

@q22 INT,
@s22 INT,
@s2_22 INT,
@j22 INT,

@q23 INT,
@s23 INT,
@s2_23 INT,
@j23 INT,

@q24 INT,
@s24 INT,
@s2_24 INT,
@j24 INT,

@q25 INT,
@s25 INT,
@s2_25 INT,
@j25 INT,

@q26 INT,
@s26 INT,
@s2_26 INT,
@j26 INT,

@char_id INT
)
AS
SET NOCOUNT ON

UPDATE quest
SET
q1=@q1, s1=@s1, s2_1=@s2_1, j1=@j1,
q2=@q2, s2=@s2, s2_2=@s2_2, j2=@j2,
q3=@q3, s3=@s3, s2_3=@s2_3, j3=@j3,
q4=@q4, s4=@s4, s2_4=@s2_4, j4=@j4,
q5=@q5, s5=@s5, s2_5=@s2_5, j5=@j5,
q6=@q6, s6=@s6, s2_6=@s2_6, j6=@j6,
q7=@q7, s7=@s7, s2_7=@s2_7, j7=@j7,
q8=@q8, s8=@s8, s2_8=@s2_8, j8=@j8,
q9=@q9, s9=@s9, s2_9=@s2_9, j9=@j9,
q10=@q10, s10=@s10, s2_10=@s2_10, j10=@j10,
q11=@q11, s11=@s11, s2_11=@s2_11, j11=@j11,
q12=@q12, s12=@s12, s2_12=@s2_12, j12=@j12,
q13=@q13, s13=@s13, s2_13=@s2_13, j13=@j13,
q14=@q14, s14=@s14, s2_14=@s2_14, j14=@j14,
q15=@q15, s15=@s15, s2_15=@s2_15, j15=@j15,
q16=@q16, s16=@s16, s2_16=@s2_16, j16=@j16,
q17=@q17, s17=@s17, s2_17=@s2_17, j17=@j17,
q18=@q18, s18=@s18, s2_18=@s2_18, j18=@j18,
q19=@q19, s19=@s19, s2_19=@s2_19, j19=@j19,
q20=@q20, s20=@s20, s2_20=@s2_20, j20=@j20,
q21=@q21, s21=@s21, s2_21=@s2_21, j21=@j21,
q22=@q22, s22=@s22, s2_22=@s2_22, j22=@j22,
q23=@q23, s23=@s23, s2_23=@s2_23, j23=@j23,
q24=@q24, s24=@s24, s2_24=@s2_24, j24=@j24,
q25=@q25, s25=@s25, s2_25=@s2_25, j25=@j25,
q26=@q26, s26=@s26, s2_26=@s2_26, j26=@j26

WHERE char_id = @char_id

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateJournal]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateJournal]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



--	kuooo
CREATE PROCEDURE
[dbo].[lin_UpdateJournal] ( @id INT,  
@j1 int, @j2 int, @j3 int, @j4 int, @j5 int, @j6 int, @j7 int, @j8 int,
@j9 int, @j10 int, @j11 int, @j12 int, @j13 int, @j14 int, @j15 int, @j16 int,
@j17 int, @j18 int, @j19 int, @j20 int, @j21 int, @j22 int, @j23 int, @j24 int, 
@j25 int, @j26 int)
AS
UPDATE Quest
set 
j1 = @j1,
j2 = @j2,
j3 = @j3,
j4 = @j4,
j5 = @j5,
j6 = @j6,
j7 = @j7,
j8 = @j8,
j9 = @j9,
j10 = @j10,
j11 = @j11,
j12 = @j12,
j13 = @j13,
j14 = @j14,
j15 = @j15,
j16 = @j16,
j17 = @j17,
j18 = @j18,
j19 = @j19,
j20 = @j20,
j21 = @j21,
j22 = @j22,
j23 = @j23,
j24 = @j24,
j25 = @j25,
j26 = @j26
where char_id = @id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_MoveCharClear]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_MoveCharClear]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_MoveCharClear
	clear moved character
INPUT

OUTPUT

return
made by
	young
date
	2003-7-30
********************************************/
CREATE PROCEDURE [dbo].[lin_MoveCharClear]
	@world_id	int
AS

SET NOCOUNT ON

-- set character as non-playable
-- update user_data set old_account_id = account_id 
-- where account_id > 0 and char_id in ( select old_char_id from lin2comm.dbo.req_charmove (nolock) where old_world_id = @world_id )

update user_data set account_id = -3
where char_id in ( select old_char_id from dbo.req_charmove (nolock) where old_world_id = @world_id )

-- update pledge info
declare @old_char_id int
declare @old_char_name nvarchar(50)

DECLARE move_cursor CURSOR FOR 
SELECT old_char_id, old_char_name
FROM dbo.req_charmove (nolock)
WHERE old_world_id = @world_id

OPEN move_cursor 

FETCH NEXT FROM move_cursor  
INTO @old_char_id, @old_char_name

WHILE @@FETCH_STATUS = 0
BEGIN
	select @old_char_id, @old_char_name
	exec lin_MoveCharacter @old_char_id

	-- Get the next 
	FETCH NEXT FROM move_cursor 
	INTO @old_char_id, @old_char_name

END

close move_cursor 
deallocate move_cursor



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadResidenceGuard]    Script Date: 02/08/2011 16:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadResidenceGuard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadResidenceGuard]
(
@residence_id INT
)
AS
SELECT item_id, npc_id, guard_type, can_move, x, y, z, angle
FROM residence_guard
WHERE residence_id = @residence_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteResidenceGuard]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteResidenceGuard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeleteResidenceGuard]
(
@x INT,
@y INT,
@z INT
)
AS
DELETE FROM residence_guard
WHERE x = @x AND y = @y AND z = @z



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertIntoResidenceGuard]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertIntoResidenceGuard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_InsertIntoResidenceGuard]
(
@residence_id INT,
@item_id INT,
@npc_id INT,
@guard_type INT,
@can_move INT,
@x INT,
@y INT,
@z INT,
@angle INT
)
AS
INSERT INTO residence_guard
(residence_id, item_id, npc_id, guard_type, can_move, x, y, z, angle)
VALUES
(@residence_id, @item_id, @npc_id, @guard_type, @can_move, @x, @y, @z, @angle)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteAllResidenceGuard]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteAllResidenceGuard]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_DeleteAllResidenceGuard]  
(  
@res INT  
)  
AS  
IF EXISTS(SELECT * FROM residence_guard WHERE residence_id = @res)
	DELETE FROM residence_guard WHERE residence_id = @res





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetShortCut]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetShortCut]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE  PROCEDURE  [dbo].[lin_GetShortCut]
(  
@char_id  INT,
@subjob_id INT
)  
AS  
SET NOCOUNT ON  
  
SELECT slotnum, shortcut_type, shortcut_id, shortcut_macro
FROM shortcut_data (nolock)
WHERE char_id = @char_id AND subjob_id = @subjob_id
ORDER BY slotnum  



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetShortCut]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetShortCut]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SetShortCut]
(  
 @char_id INT, 
 @subjob_id INT,
 @slotnum  INT,  
 @type   INT,  
 @id   INT,  
 @macro   NVARCHAR(256)  
)  
AS  
SET NOCOUNT ON  
  
IF (@char_id = 0)
BEGIN
SET @char_id = @subjob_id
SET @subjob_id = 0
END

IF (@type = 0)  
BEGIN  
 DELETE shortcut_data WHERE  char_id = @char_id AND subjob_id = @subjob_id AND slotnum = @slotnum  
END  
ELSE   
BEGIN  
 UPDATE shortcut_data SET shortcut_type=@type , shortcut_id= @id, shortcut_macro = @macro WHERE char_id = @char_id AND subjob_id = @subjob_id AND slotnum = @slotnum  
 IF (@@ROWCOUNT = 0)  
 BEGIN  
  INSERT INTO shortcut_data (char_id, slotnum, shortcut_type, shortcut_id, shortcut_macro, subjob_id) VALUES (@char_id, @slotnum, @type, @id, @macro, @subjob_id)  
 END  
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RenewSubjob]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RenewSubjob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_RenewSubjob]
(
	@char_id		INT,
	@subjob_id		TINYINT,
	@new_class		TINYINT,
	@old_subjob_id 		TINYINT,
	@hp				FLOAT,
	@mp				FLOAT,
	@sp				INT,
	@exp			BIGINT,
	@level			TINYINT,
	@henna_1		INT,
	@henna_2		INT,
	@henna_3		INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 0
-- transaction on
BEGIN TRAN

IF (@subjob_id != @old_subjob_id)	-- save now info
BEGIN
	UPDATE user_subjob
	SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
		henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
	WHERE char_id = @char_id AND subjob_id = @old_subjob_id

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
	BEGIN
		GOTO EXIT_TRAN
	END		
END


DELETE FROM shortcut_data WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_henna WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_skill WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

IF @subjob_id = 1
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id
ELSE IF @subjob_id = 2
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id
ELSE IF @subjob_id = 3
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

-- update new class
UPDATE user_subjob
SET hp = NULL, mp = NULL, sp = NULL, exp = NULL, level = NULL, henna_1 = NULL, henna_2 = NULL, henna_3 = NULL, create_date = GETDATE()
WHERE char_id = @char_id AND subjob_id = @subjob_id
IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteSubJob]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteSubJob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeleteSubJob]
(
	@char_id	INT,
	@subjob_id	INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 0

BEGIN TRAN

DELETE FROM shortcut_data WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_henna WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_skill WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

IF @subjob_id = 1
	UPDATE user_data SET subjob1_class = -1 WHERE char_id = @char_id
ELSE IF @subjob_id = 2
	UPDATE user_data SET subjob1_class = -1 WHERE char_id = @char_id
ELSE IF @subjob_id = 3
	UPDATE user_data SET subjob1_class = -1 WHERE char_id = @char_id

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

DELETE FROM user_subjob
WHERE char_id = @char_id AND subjob_id = @subjob_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1	-- update, insert check
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:

IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteSiegeAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteSiegeAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_DeleteSiegeAgitPledge]
(
@agit_id INT
)
AS
SET NOCOUNT ON
DELETE FROM siege_agit_pledge WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSiegeAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSiegeAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadSiegeAgitPledge]
(
	@agit_id INT
)
AS
SET NOCOUNT ON
SELECT pledge_id, propose_time, status FROM siege_agit_pledge WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UnregisterSiegeAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UnregisterSiegeAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_UnregisterSiegeAgitPledge]
(
	@agit_id INT,
	@pledge_id INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

DELETE FROM siege_agit_pledge
WHERE 
agit_id = @agit_id AND pledge_id = @pledge_id

IF @@ERROR = 0
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RegisterSiegeAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RegisterSiegeAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_RegisterSiegeAgitPledge]
(
	@agit_id INT,
	@pledge_id INT,
	@propose_time INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

INSERT INTO siege_agit_pledge
(agit_id, pledge_id, propose_time)
VALUES
(@agit_id, @pledge_id, @propose_time)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSSQMainEventRecord]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSSQMainEventRecord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMainEventRecord
	get ssq main event record
INPUT

OUTPUT

return
made by
	kks
date
	2005-02-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetSSQMainEventRecord]

AS

SET NOCOUNT ON

select ssq_round, room_no, record_type, point, record_time, elapsed_time, member_count, member_names, datediff(s, ''1970-01-01'', getutcdate())
from time_attack_record
where record_type > 0
and ssq_round = (select max(round_number) max_ssq_round from ssq_data)
order by record_type asc, room_no desc


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSSQStatus]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSSQStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetSSQStatus
	get ssq status
INPUT

OUTPUT

return
made by
	kks
date
	2005-02-23
changed by
	carrot
date
	2005-03-08
changed by 
	kks
date	
	2005-03-15
changed by 
	kks
date	2005-03-21
changed by 
	kks
date	2005-03-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetSSQStatus]

AS

SET NOCOUNT ON

declare @dawn_collected_point int
declare @dawn_main_event_point int
declare @twilight_collected_point int
declare @twilight_main_event_point int
declare @current_round_number int

select  @current_round_number = max(round_number) from ssq_data

select @dawn_collected_point = case when dawn_point + twilight_point = 0 then 0 else  ((convert(float, dawn_point) / (dawn_point + twilight_point)) * 500) end, 
@twilight_collected_point = case when dawn_point + twilight_point = 0 then 0 else ((convert(float, twilight_point) / (dawn_point + twilight_point)) * 500) end
from
(
select sum(dawn) dawn_point, sum(twilight) twilight_point
from
(select 
case when type = 1 then sum(collected_point) else 0 end twilight, 
case when type = 2 then sum(collected_point) else 0 end dawn
from ssq_join_data
where round_number = @current_round_number
group by type
) as a
) as b

select @dawn_main_event_point = sum(dawn), @twilight_main_event_point = sum(twilight)
from 
(
select 
case when ssq_part = 1 then sum(point) else 0 end twilight,
case when ssq_part = 2 then sum(point) else 0 end dawn
from
(
select 
case 
when sum_point > 0 then 1	-- if sum(point) is positive, twilight wins!!!
when sum_point < 0 then 2	-- if sum(point) is negative, dawn wins!!!
else 0 end ssq_part,		-- even, none wins
case when room_no = 1 then 60 
when room_no = 2 then 70
when room_no = 3 then 100
when room_no = 4 then 120
when room_no = 5 then 150
else 0 end point
from
(
select room_no, sum(point) sum_point -- twilight point + dawn point
from
(
select room_no,
case
when ssq_part = 1 then point 	-- twilight point
when ssq_part = 2 then -point	-- dawn point
else 0 end point
from time_attack_record
where record_type > 0
and ssq_round = @current_round_number
) as x
group by room_no
) as y
) as a
group by ssq_part
) as b

select top 1 round_number, @twilight_main_event_point + @twilight_collected_point twilight_point, @dawn_main_event_point + @dawn_collected_point dawn_point,  
seal1, seal2, seal3, seal4, seal5, seal6, seal7, datediff(s, ''1970-01-01'', getutcdate()), status
from ssq_data
where round_number = @current_round_number


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveSSQSystemInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveSSQSystemInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**  
  * @procedure lin_SaveSSQSystemInfo  
  * @brief SSQ ??? ?? DB? ????.  
  *  
  * @date 2004/11/26  
  * @author Seongeun Park  <sonai@ncsoft.net>  
  */  
CREATE PROCEDURE [dbo].[lin_SaveSSQSystemInfo]   
(  
@round_number INT,  
@status TINYINT,  
@winner TINYINT,  
@event_start_time INT,  
@event_end_time  INT,  
@seal_effect_time INT,  
@seal_effect_end_time INT,  
@seal1 TINYINT,  
@seal2 TINYINT,  
@seal3 TINYINT,  
@seal4 TINYINT,  
@seal5 TINYINT,  
@seal6 TINYINT,  
@seal7 TINYINT,  
@castle_snapshot_time INT,  
@can_drop_guard INT  
)  
AS  
  
SET NOCOUNT ON  
  
UPDATE ssq_data SET  status = @status,   
                                        winner = @winner,   
   event_start_time = @event_start_time,  
   event_end_time = @event_end_time,  
               seal_effect_time  =  @seal_effect_time,  
   seal_effect_end_time = @seal_effect_end_time,   
   seal1 = @seal1,  
   seal2 = @seal2,  
   seal3 = @seal3,  
   seal4 = @seal4,  
   seal5 = @seal5,  
   seal6 = @seal6,  
   seal7 = @seal7,  
   castle_snapshot_time = @castle_snapshot_time,  
               can_drop_guard = @can_drop_guard,  
   last_changed_time = GETDATE()  
                      WHERE round_number = @round_number




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateSSQRound]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateSSQRound]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/**  
  * @procedure lin_CreateSSQRound  
  * @brief SSQ ?? ??  
  *  
  * @date 2004/11/18  
  * @author sonai  <sonai@ncsoft.net>  
  */  
CREATE PROCEDURE [dbo].[lin_CreateSSQRound]   
(  
@round_number INT,  
@status INT,  
@winner INT,  
@event_start_time INT,  
@event_end_time INT,  
@seal_effect_time INT,  
@seal_effect_end_time INT,  
@seal1 INT,  
@seal2 INT,  
@seal3 INT,  
@seal4 INT,  
@seal5 INT,  
@seal6 INT,  
@seal7 INT,  
@castle_snapshot_time INT,  
@can_drop_guard INT  
)  
AS  
  
SET NOCOUNT ON  
/*DECLARE @ret AS INT*/  
  
/* ?? ?? ?? ?? */  
INSERT ssq_join_data(round_number, point,  collected_point, main_event_point, type, member_count,   
                         seal1_selection_count, seal2_selection_count, seal3_selection_count,  
             seal4_selection_count, seal5_selection_count, seal6_selection_count, seal7_selection_count,  
             last_changed_time)  
  VALUES(@round_number, 0, 0, 0, 1, 0,   0, 0, 0, 0, 0, 0, 0, GETDATE())  
  
/*SELECT @ret = @@ROWCOUNT*/  
  
/* ?? ?? ?? ?? */  
INSERT ssq_join_data(round_number, point, collected_point, main_event_point, type, member_count,   
             seal1_selection_count, seal2_selection_count, seal3_selection_count,  
             seal4_selection_count, seal5_selection_count, seal6_selection_count, seal7_selection_count,  
             last_changed_time)  
  VALUES(@round_number,  0, 0, 0, 2, 0,   0, 0, 0, 0, 0, 0, 0, GETDATE())  
  
/*SELECT @ret = @ret + @@ROWCOUNT */  
  
INSERT ssq_data(round_number, status, winner, event_start_time, event_end_time, seal_effect_time, seal_effect_end_time,  
       seal1, seal2, seal3, seal4, seal5, seal6, seal7,  
       last_changed_time, castle_snapshot_time, can_drop_guard)  
   VALUES(@round_number, @status, @winner,  @event_start_time,  @event_end_time,  @seal_effect_time, @seal_effect_end_time,  
      @seal1, @seal2, @seal3, @seal4, @seal5, @seal6, @seal7,  
       GETDATE(), @castle_snapshot_time, @can_drop_guard)  
  
/*  
SELECT @ret = @ret + @@ROWCOUNT  
  
SELECT @ret  
*/




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSSQSystemInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSSQSystemInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/**  
  * @procedure lin_LoadSSQSystemInfo  
  * @brief SSQ ?? ??  
  *  
  * @date 2004/11/18  
  * @author sonai  <sonai@ncsoft.net>  
  */  
CREATE PROCEDURE [dbo].[lin_LoadSSQSystemInfo] AS  
  
  
  
 SELECT TOP 1 round_number,  status, winner,  
   event_start_time, event_end_time, seal_effect_time, seal_effect_end_time,  
   seal1, seal2, seal3, seal4, seal5, seal6, seal7, ISNULL(castle_snapshot_time, 0), ISNULL(can_drop_guard, 0)  
   FROM ssq_data order by round_number desc






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSSQJoinInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSSQJoinInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_LoadSSQJoinInfo
  * @brief SSQ ??/?? ?? ?? ??
  *
  * @date 2004/11/18
  * @author sonai  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_LoadSSQJoinInfo]
(
@round_number INT
)
 AS 

SELECT point, collected_point, main_event_point, type, member_count, 
	 seal1_selection_count, 
	 seal2_selection_count, 
	 seal3_selection_count, 
	 seal4_selection_count, 
	 seal5_selection_count, 
	 seal6_selection_count, 
	 seal7_selection_count
	 
	FROM ssq_join_data WHERE round_number = @round_number



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveSSQJoinInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveSSQJoinInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_SaveSSQJoinInfo
  * @brief SSQ ??? ?? DB? ????.
  *
  * @date 2004/11/26
  * @author Seongeun Park  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_SaveSSQJoinInfo] 
(
@round_number INT,
@type TINYINT,
@point INT,
@collected_point INT,
@main_event_point INT,
@member_count INT,
@seal1 INT,
@seal2 INT,
@seal3 INT,
@seal4 INT,
@seal5 INT,
@seal6 INT,
@seal7 INT
)
AS

SET NOCOUNT ON

UPDATE ssq_join_data SET point = @point, collected_point = @collected_point, main_event_point = @main_event_point,
			       member_count = @member_count,
			       seal1_selection_count = @seal1,
			       seal2_selection_count = @seal2,
			       seal3_selection_count = @seal3,
			       seal4_selection_count = @seal4,
			       seal5_selection_count = @seal5,
			       seal6_selection_count = @seal6,
			       seal7_selection_count = @seal7,
			       last_changed_time = GETDATE()		                          
  	                   WHERE round_number = @round_number AND type =@type



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveSSQTopPointUser]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveSSQTopPointUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_SaveSSQTopPointUser
  * @brief ?? ?? ?? ??.
  *
  * @date 2004/12/09
  * @author Seongeun Park  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_SaveSSQTopPointUser] 
(
@ssq_round INT,
@record_id INT,

@ssq_point INT,
@rank_time INT,
@char_id  INT,
@char_name NVARCHAR(50),
@ssq_part TINYINT,
@ssq_position TINYINT,
@seal_selection_no TINYINT
)
AS

SET NOCOUNT ON

UPDATE ssq_top_point_user  SET  ssq_point = @ssq_point,
				    rank_time = @rank_time,
				    char_id = @char_id,
				    char_name = @char_name,
				    ssq_part = @ssq_part,
				    ssq_position = @ssq_position,
				    seal_selection_no = @seal_selection_no,
				    last_changed_time = GETDATE()
				                       
  	                   WHERE record_id = @record_id AND ssq_round = @ssq_round



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateSSQTopPointUser]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateSSQTopPointUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_CreateSSQTopPointUser
  * @brief ?? ?? ?? ??.
  *
  * @date 2004/12/09
  * @author Seongeun Park  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_CreateSSQTopPointUser] 
(
@ssq_round INT,
@record_id INT,

@ssq_point INT,
@rank_time INT,
@char_id  INT,
@char_name NVARCHAR(50),
@ssq_part TINYINT,
@ssq_position TINYINT,
@seal_selection_no TINYINT
)
AS

SET NOCOUNT ON

INSERT INTO ssq_top_point_user  
	         (ssq_round, record_id, ssq_point, rank_time, char_id, char_name, 
	          ssq_part, ssq_position, seal_selection_no, last_changed_time)
	VALUES (@ssq_round, @record_id, @ssq_point, @rank_time, @char_id, @char_name, @ssq_part, @ssq_position, @seal_selection_no, GETDATE())



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSSQTopPointUser]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSSQTopPointUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_LoadSSQTopPointUser
  * @brief SSQ top point user? ??.
  *
  * @date 2004/12/08
  * @author sonai  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_LoadSSQTopPointUser] 
(
@ssq_round INT
)
AS

SELECT ssq_round, record_id, ssq_point, rank_time, char_id, char_name, ssq_part, ssq_position, seal_selection_no
			FROM ssq_top_point_user  WHERE ssq_round  = @ssq_round



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSSQUserInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSSQUserInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
 * @procedure lin_LoadSSQUserInfo
 * @brief  Load user''s ssq info from ssq_user_data
 *
 * @date  2004/11/18
 * @author sonai <sonai@ncsoft.net>
 *
 * @param[in]  char_id user_data''s id
 */
CREATE PROCEDURE [dbo].[lin_LoadSSQUserInfo] 
(
@char_id INT
)
AS
SET NOCOUNT ON

SELECT round_number, ssq_join_time, ssq_part, ssq_position, seal_selection_no, 
              ssq_point,
              twilight_a_item_num,twilight_b_item_num,twilight_c_item_num,
              dawn_a_item_num,dawn_b_item_num, dawn_c_item_num,
              ticket_buy_count       
             FROM ssq_user_data WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateSSQUserInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateSSQUserInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/**
 * @fn lin_CreateSSQUserInfo
 * @brief  SSQ?? ?? ??? ??.
 */
CREATE PROCEDURE [dbo].[lin_CreateSSQUserInfo]
(
@char_id INT,
@round_number INT,
@ssq_join_time INT,
@ssq_part INT,
@ssq_position INT,
@seal_selection_no INT,
@ssq_point INT,
@twilight_a_item_num INT,
@twilight_b_item_num INT,
@twilight_c_item_num INT,
@dawn_a_item_num INT,
@dawn_b_item_num INT,
@dawn_c_item_num INT,
@ticket_buy_count INT
)
AS
SET NOCOUNT ON

INSERT INTO ssq_user_data  
	(char_id, round_number, ssq_join_time, ssq_part, ssq_position, seal_selection_no, ssq_point,
              twilight_a_item_num, twilight_b_item_num, twilight_c_item_num, dawn_a_item_num, dawn_b_item_num, dawn_c_item_num,
              ticket_buy_count) 
	values 
	(@char_id, @round_number, @ssq_join_time, @ssq_part, @ssq_position, @seal_selection_no, @ssq_point,
              @twilight_a_item_num, @twilight_b_item_num, @twilight_c_item_num, @dawn_a_item_num, @dawn_b_item_num, @dawn_c_item_num,
              @ticket_buy_count)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveSSQUserInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveSSQUserInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**
  * @procedure lin_SaveSSQUserInfo
  * @brief Save user''s ssq parameter  to ssq_user_data
  * 
  * @date 2004/11/18
  * @author sonai <sonai@ncsoft.net>
  * 
  * ???? ?? ???? ??? ?? ???.
  *
  * @param[in]  ssq_part	SSQ ??(?? : 1,  ?? : 2)
  * @param[in]  ssq_position  SSQ ??
  * @param[in]  seal_selection_no  ??? ??? ?? ??
  * @param[in]  ssq_point  SSQ ??? ??
  */

CREATE PROCEDURE [dbo].[lin_SaveSSQUserInfo] 
(
@char_id INT,
@round_number INT,
@ssq_join_time INT,
@ssq_part INT,
@ssq_position INT,
@seal_selection_no INT,
@ssq_point INT,
@twilight_a_item_num INT,
@twilight_b_item_num INT,
@twilight_c_item_num INT,
@dawn_a_item_num INT,
@dawn_b_item_num INT,
@dawn_c_item_num INT,
@ticket_buy_count INT
)
AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM ssq_user_data WHERE char_id = @char_id)
    BEGIN

    UPDATE ssq_user_data SET  round_number = @round_number,
                                                     ssq_join_time = @ssq_join_time,
 			             ssq_part = @ssq_part, 
		                          ssq_position = @ssq_position, 
			             seal_selection_no = @seal_selection_no, 
		                          ssq_point = @ssq_point,                                         
			             twilight_a_item_num = @twilight_a_item_num,
			             twilight_b_item_num = @twilight_b_item_num,
			             twilight_c_item_num = @twilight_c_item_num,
			             dawn_a_item_num = @dawn_a_item_num,
			             dawn_b_item_num = @dawn_b_item_num,
			             dawn_c_item_num = @dawn_c_item_num,
			             ticket_buy_count = @ticket_buy_count	
			             WHERE char_id = @char_id

   END
ELSE
   BEGIN

   INSERT INTO ssq_user_data (char_id, round_number, ssq_join_time, ssq_part, ssq_position,
			            seal_selection_no, ssq_point,
                                                    twilight_a_item_num, twilight_b_item_num, twilight_c_item_num,
                                                    dawn_a_item_num, dawn_b_item_num, dawn_c_item_num,
                                                    ticket_buy_count) 
	VALUES (@char_id, @round_number, @ssq_join_time, @ssq_part, @ssq_position,
			            @seal_selection_no, @ssq_point,
                                                    @twilight_a_item_num, @twilight_b_item_num, @twilight_c_item_num,
                                                    @dawn_a_item_num, @dawn_b_item_num, @dawn_c_item_num,
                                                    @ticket_buy_count)
   END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertIntoTeamBattleAgitMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertIntoTeamBattleAgitMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_InsertIntoTeamBattleAgitMember]
(
@agit_id INT,
@char_id INT,
@pledge_id INT,
@propose_time INT
)
AS
SET NOCOUNT ON
INSERT INTO team_battle_agit_member
(agit_id, char_id, pledge_id, propose_time)
VALUES
(@agit_id, @char_id, @pledge_id, @propose_time)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UnregisterTeamBattleAgitMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UnregisterTeamBattleAgitMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_UnregisterTeamBattleAgitMember]
(
	@agit_id INT,
	@char_id INT,
	@pledge_id INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

DELETE FROM team_battle_agit_member
WHERE 
agit_id = @agit_id AND char_id = @char_id AND pledge_id = @pledge_id

IF @@ERROR = 0
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UnregisterTeamBattleAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UnregisterTeamBattleAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_UnregisterTeamBattleAgitPledge]
(
	@agit_id INT,
	@pledge_id INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

DELETE FROM team_battle_agit_pledge
WHERE 
agit_id = @agit_id AND pledge_id = @pledge_id

IF @@ERROR <> 0
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

DELETE FROM  team_battle_agit_member
WHERE agit_id = @agit_id AND pledge_id = @pledge_id

IF @@ERROR = 0
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:

IF @ret <> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadTeamBattleAgitMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadTeamBattleAgitMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadTeamBattleAgitMember]
(
	@agit_id INT
)
AS
SET NOCOUNT ON
SELECT char_id, pledge_id, propose_time FROM team_battle_agit_member WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetTeamBattleWinner]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetTeamBattleWinner]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_SetTeamBattleWinner]
(
@agit_id INT,
@winner_pledge_id INT,
@master_pledge_id INT,
@is_final INT
)
AS
SET NOCOUNT ON
IF @is_final <> 0	-- battle royal
BEGIN
	DELETE FROM team_battle_agit_pledge WHERE agit_id = @agit_id AND pledge_id <> @winner_pledge_id AND pledge_id <> @master_pledge_id
	DELETE FROM team_battle_agit_member WHERE agit_id = @agit_id AND pledge_id <> @winner_pledge_id AND pledge_id <> @master_pledge_id
END
ELSE	-- final winner
BEGIN
	DELETE FROM team_battle_agit_pledge WHERE agit_id = @agit_id AND pledge_id <> @winner_pledge_id
	DELETE FROM team_battle_agit_member WHERE agit_id = @agit_id
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteTeamBattleAgitMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteTeamBattleAgitMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_DeleteTeamBattleAgitMember]
(
@agit_id INT
)
AS
SET NOCOUNT ON
DELETE FROM team_battle_agit_member WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_NewTeamBattleAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_NewTeamBattleAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_NewTeamBattleAgitPledge]
(
	@agit_id INT,
	@pledge_id INT,
	@char_id INT,
	@propose_time INT,
	@color INT,
	@npc_type INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

INSERT INTO team_battle_agit_pledge
(agit_id, pledge_id, propose_time, color, npc_type)
VALUES
(@agit_id, @pledge_id, @propose_time, @color, @npc_type)

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

INSERT INTO team_battle_agit_member
(agit_id, char_id, pledge_id, propose_time)
VALUES
(@agit_id, @char_id, @pledge_id, @propose_time)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:

IF @ret <> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_NewTeamBattleAgitMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_NewTeamBattleAgitMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_NewTeamBattleAgitMember]
(
	@agit_id INT,
	@char_id INT,
	@pledge_id INT,
	@propose_time INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT

INSERT INTO team_battle_agit_member
(agit_id, char_id, pledge_id, propose_time)
VALUES
(@agit_id, @char_id, @pledge_id, @propose_time)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteTeamBattleAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteTeamBattleAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_DeleteTeamBattleAgitPledge]
(
@agit_id INT
)
AS
SET NOCOUNT ON
DELETE FROM team_battle_agit_pledge WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetTeamBattleNpcType]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetTeamBattleNpcType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_SetTeamBattleNpcType]
(
	@agit_id INT,
	@pledge_id INT,
	@npc_type INT
)
AS
SET NOCOUNT ON
UPDATE team_battle_agit_pledge
SET npc_type = @npc_type 
WHERE agit_id = @agit_id AND pledge_id = @pledge_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadTeamBattleAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadTeamBattleAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadTeamBattleAgitPledge]
(
	@agit_id INT
)
AS
SET NOCOUNT ON
SELECT pledge_id, propose_time, color, npc_type FROM team_battle_agit_pledge WHERE agit_id = @agit_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertIntoTeamBattleAgitPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertIntoTeamBattleAgitPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_InsertIntoTeamBattleAgitPledge]
(
@agit_id INT,
@pledge_id INT,
@propose_time INT,
@color INT,
@npc_type INT
)
AS
SET NOCOUNT ON
INSERT INTO team_battle_agit_pledge
(agit_id, pledge_id, propose_time, color, npc_type)
VALUES
(@agit_id, @pledge_id, @propose_time, @color, @npc_type)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveTimeAttackRecord]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveTimeAttackRecord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/**
  * @procedure lin_SaveTimeAttackRecord
  * @brief ?? ?? ?? ??.
  *
  * @date 2004/12/04
  * @author Seongeun Park  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_SaveTimeAttackRecord] 
(
@room_no TINYINT,
@record_type TINYINT,
@ssq_round INT,

@ssq_part TINYINT,
@point INT,
@record_time INT,
@elapsed_time INT,
@member_count  INT,
@member_names NVARCHAR(256),
@member_dbid_list NVARCHAR(128),
@member_reward_flags INT,
@fee INT
)
AS

SET NOCOUNT ON

UPDATE time_attack_record SET  ssq_part = @ssq_part,
				  point = @point,
				  record_time = @record_time,
				  elapsed_time = @elapsed_time,
			      	  member_count = @member_count,
				  member_names = @member_names,
				  member_dbid_list = @member_dbid_list,
				  member_reward_flags = @member_reward_flags,
				  fee = @fee			       	                          
  	                   WHERE room_no = @room_no AND record_type = @record_type AND ssq_round = @ssq_round



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateTimeAttackRecord]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateTimeAttackRecord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'





/**
 * @fn lin_CreateTimeAttackRecord
 * @brief ?? ?? ??? ?? ???? ?? ??
 */
CREATE PROCEDURE [dbo].[lin_CreateTimeAttackRecord]
(
@room_no TINYINT,
@record_type TINYINT,
@ssq_round INT,
@ssq_part TINYINT,
@point       INT,
@record_time INT,
@elapsed_time INT,
@member_count INT,
@member_names NVARCHAR(256),
@member_dbid_list NVARCHAR(128),
@member_reward_flags INT,
@fee INT

)
AS
SET NOCOUNT ON

INSERT INTO time_attack_record  
	(room_no, record_type, ssq_round, ssq_part, point, record_time, elapsed_time, member_count, member_names,
              member_dbid_list, member_reward_flags, fee) 
	values 
	(@room_no, @record_type, @ssq_round, @ssq_part, @point, @record_time, @elapsed_time, @member_count, @member_names,
              @member_dbid_list, @member_reward_flags, @fee)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadTimeAttackRecord]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadTimeAttackRecord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/**
  * @procedure lin_LoadTimeAttackRecord
  * @brief TimeAttackRecord ??
  *
  * @date 2004/12/04
  * @author sonai  <sonai@ncsoft.net>
  */
CREATE PROCEDURE [dbo].[lin_LoadTimeAttackRecord] 
(
@ssq_round INT
)
AS

SELECT room_no, record_type, ssq_round, ssq_part, point, record_time, elapsed_time, member_count, member_names, 
	 ISNULL(member_dbid_list, ''''), ISNULL(member_reward_flags, 0), ISNULL(fee, 0)
	 FROM time_attack_record  WHERE ssq_round = @ssq_round



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadDayUsedTime]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadDayUsedTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_LoadDayUsedTime    
 load account''s today used time    
INPUT    
 account_id    
OUTPUT    
return    
 used sec INT    
made by    
 carrot    
date    
 2004-03-29    
********************************************/    
CREATE PROCEDURE [dbo].[lin_LoadDayUsedTime]    
(    
 @account_id INT    
)    
AS    
    
SET NOCOUNT ON    

SELECT TOP 1 used_sec, convert(varchar(19), last_logout, 121) FROM time_data (nolock) WHERE account_id = @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveTimeData]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveTimeData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************            
lin_SaveTimeData    
 Save time data table          
INPUT            
 @char_name NVARCHAR(30),            
 @nUsedSec INT            
OUTPUT            
return            
           
made by            
 carrot            
date            
 2004-05-10    
change            
********************************************/            
CREATE PROCEDURE [dbo].[lin_SaveTimeData]    
(            
 @account_id INT,
 @nUsedSec INT,
 @dtLastSaveDate NVARCHAR(20)
)            
AS            
            
SET NOCOUNT ON            

IF (@nUsedSec < 0)            
BEGIN            
    RAISERROR (''Not valid parameter : account id[%d] sec[%d], dt[%s] '',16, 1,  @account_id,  @nUsedSec, @dtLastSaveDate)
    RETURN -1            
END            

UPDATE  time_data SET last_logout = @dtLastSaveDate, used_sec = @nUsedSec WHERE account_id = @account_id 

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO time_data (account_id, last_logout, used_sec) VALUES (@account_id, @dtLastSaveDate, @nUsedSec)    
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeTimeData]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeTimeData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_ChangeTimeData      
 chagne time data table      
INPUT        
 @char_name NVARCHAR(30),        
 @nType INT,        
 @nChangeMin INT        
OUTPUT        
 changed acount id      
 result used sec      
return        
       
made by        
 carrot        
date        
 2004-04-29        
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_ChangeTimeData]      
(        
 @char_name NVARCHAR(30),        
 @nType INT,        
 @nChangeMin INT        
)        
AS        
        
SET NOCOUNT ON        
        
      
SET @nChangeMin = @nChangeMin * 60      -- change min to sec
IF (@nType < 1 OR @nType > 2 OR @nChangeMin <= 0) -- 1 : add, 2 : del
BEGIN        
    RAISERROR (''Not valid parameter : charnname[%s] type[%d], min[%d] '',16, 1,  @char_name,  @nType , @nChangeMin )        
    RETURN -1        
END        
        
DECLARE @account_id INT        
SET @account_id = 0    
SELECT @account_id = account_id FROM user_data (nolock) WHERE char_name = @char_name      
        
IF (@account_id <= 0)        
BEGIN        
    RAISERROR (''Not valid account id : charnname[%s] type[%d], min[%d] '',16, 1,  @char_name,  @nType , @nChangeMin )        
    RETURN -1        
END        
      
DECLARE @used_sec INT        
SET @used_sec = -1      
SELECT TOP 1 @used_sec = used_sec FROM time_data WHERE account_id = @account_id      
IF (@used_sec < 0 )      
BEGIN      
    RAISERROR (''Not exist time data : account_id[%d], charnname[%s] type[%d], min[%d] '',16, 1,  @account_id, @char_name,  @nType , @nChangeMin )        
    RETURN -1        
END      
      
IF (@nType = 1) -- add      
BEGIN      
 UPDATE time_data SET used_sec = @used_sec + @nChangeMin WHERE account_id = @account_id      
END      
ELSE IF (@nType = 2) -- del      
BEGIN      
 IF (@used_sec < @nChangeMin)      
 BEGIN      
  SET @nChangeMin = @used_sec
 END      
 UPDATE time_data SET used_sec = @used_sec - @nChangeMin WHERE account_id = @account_id      
END      
ELSE      
BEGIN      
    RAISERROR (''Not valid parameter : charnname[%s] type[%d], min[%d] '',16, 1,  @char_name,  @nType , @nChangeMin )        
    RETURN -1        
END      
      
SELECT TOP 1 account_id, used_sec FROM time_data WHERE account_id = @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateActiveSkill]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateActiveSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_UpdateActiveSkill]
(
 @char_id INT,
 @s1 INT, @l1 int, @d1 INT, @c1 TINYINT,
 @s2 INT, @l2 int, @d2 INT, @c2 TINYINT,
 @s3 INT, @l3 int, @d3 INT, @c3 TINYINT,
 @s4 INT, @l4 int, @d4 INT, @c4 TINYINT,
 @s5 INT, @l5 int, @d5 INT, @c5 TINYINT,
 @s6 INT, @l6 int, @d6 INT, @c6 TINYINT,
 @s7 INT, @l7 int, @d7 INT, @c7 TINYINT,
 @s8 INT, @l8 int, @d8 INT, @c8 TINYINT,
 @s9 INT, @l9 int, @d9 INT, @c9 TINYINT,
 @s10 INT, @l10 int, @d10 INT, @c10 TINYINT,
 @s11 INT, @l11 int, @d11 INT, @c11 TINYINT,
 @s12 INT, @l12 int, @d12 INT, @c12 TINYINT,
 @s13 INT, @l13 int, @d13 INT, @c13 TINYINT,
 @s14 INT, @l14 int, @d14 INT, @c14 TINYINT,
 @s15 INT, @l15 int, @d15 INT, @c15 TINYINT,
 @s16 INT, @l16 int, @d16 INT, @c16 TINYINT,
 @s17 INT, @l17 int, @d17 INT, @c17 TINYINT,
 @s18 INT, @l18 int, @d18 INT, @c18 TINYINT,
 @s19 INT, @l19 int, @d19 INT, @c19 TINYINT,
 @s20 INT, @l20 int, @d20 INT, @c20 TINYINT,
 @s21 INT, @l21 int, @d21 INT, @c21 TINYINT,
 @s22 INT, @l22 int, @d22 INT, @c22 TINYINT,
 @s23 INT, @l23 int, @d23 INT, @c23 TINYINT,
 @s24 INT, @l24 int, @d24 INT, @c24 TINYINT,
 @s25 INT, @l25 int, @d25 INT, @c25 TINYINT,
 @s26 INT, @l26 int, @d26 INT, @c26 TINYINT,
 @s27 INT, @l27 int, @d27 INT, @c27 TINYINT,
 @s28 INT, @l28 int, @d28 INT, @c28 TINYINT,
 @s29 INT, @l29 int, @d29 INT, @c29 TINYINT,
 @s30 INT, @l30 int, @d30 INT, @c30 TINYINT,
 @s31 INT, @l31 int, @d31 INT, @c31 TINYINT,
 @s32 INT, @l32 int, @d32 INT, @c32 TINYINT,
 @s33 INT, @l33 int, @d33 INT, @c33 TINYINT,
 @s34 INT, @l34 int, @d34 INT, @c34 TINYINT,
 @s35 INT, @l35 int, @d35 INT, @c35 TINYINT,
 @s36 INT, @l36 int, @d36 INT, @c36 TINYINT,
 @s37 INT, @l37 int, @d37 INT, @c37 TINYINT,
 @s38 INT, @l38 int, @d38 INT, @c38 TINYINT,
 @s39 INT, @l39 int, @d39 INT, @c39 TINYINT,
 @s40 INT, @l40 int, @d40 INT, @c40 TINYINT

)
AS
SET NOCOUNT ON
  
IF EXISTS(SELECT * FROM user_activeskill WHERE char_id = @char_id)
BEGIN
 UPDATE user_activeskill
 SET
 s1 = @s1, l1 = @l1, d1 = @d1, c1 = @c1,
 s2 = @s2, l2 = @l2, d2 = @d2, c2 = @c2,
 s3 = @s3, l3 = @l3, d3 = @d3, c3 = @c3,
 s4 = @s4, l4 = @l4, d4 = @d4, c4 = @c4,
 s5 = @s5, l5 = @l5, d5 = @d5, c5 = @c5,
 s6 = @s6, l6 = @l6, d6 = @d6, c6 = @c6,
 s7 = @s7, l7 = @l7, d7 = @d7, c7 = @c7,
 s8 = @s8, l8 = @l8, d8 = @d8, c8 = @c8,
 s9 = @s9, l9 = @l9, d9 = @d9, c9 = @c9,
 s10 = @s10, l10 = @l10, d10 = @d10, c10 = @c10,
 s11 = @s11, l11 = @l11, d11 = @d11, c11 = @c11,
 s12 = @s12, l12 = @l12, d12 = @d12, c12 = @c12,
 s13 = @s13, l13 = @l13, d13 = @d13, c13 = @c13,
 s14 = @s14, l14 = @l14, d14 = @d14, c14 = @c14,
 s15 = @s15, l15 = @l15, d15 = @d15, c15 = @c15,
 s16 = @s16, l16 = @l16, d16 = @d16, c16 = @c16,
 s17 = @s17, l17 = @l17, d17 = @d17, c17 = @c17,
 s18 = @s18, l18 = @l18, d18 = @d18, c18 = @c18,
 s19 = @s19, l19 = @l19, d19 = @d19, c19 = @c19,
 s20 = @s20, l20 = @l20, d20 = @d20, c20 = @c20,
 s21 = @s21, l21 = @l21, d21 = @d21, c21 = @c21,
 s22 = @s22, l22 = @l22, d22 = @d22, c22 = @c22,
 s23 = @s23, l23 = @l23, d23 = @d23, c23 = @c23,
 s24 = @s24, l24 = @l24, d24 = @d24, c24 = @c24,
 s25 = @s25, l25 = @l25, d25 = @d25, c25 = @c25,
 s26 = @s26, l26 = @l26, d26 = @d26, c26 = @c26,
 s27 = @s27, l27 = @l27, d27 = @d27, c27 = @c27,
 s28 = @s28, l28 = @l28, d28 = @d28, c28 = @c28,
 s29 = @s29, l29 = @l29, d29 = @d29, c29 = @c29,
 s30 = @s30, l30 = @l30, d30 = @d30, c30 = @c30,
 s31 = @s31, l31 = @l31, d31 = @d31, c31 = @c31,
 s32 = @s32, l32 = @l32, d32 = @d32, c32 = @c32,
 s33 = @s33, l33 = @l33, d33 = @d33, c33 = @c33,
 s34 = @s34, l34 = @l34, d34 = @d34, c34 = @c34,
 s35 = @s35, l35 = @l35, d35 = @d35, c35 = @c35,
 s36 = @s36, l36 = @l36, d36 = @d36, c36 = @c36,
 s37 = @s37, l37 = @l37, d37 = @d37, c37 = @c37,
 s38 = @s38, l38 = @l38, d38 = @d38, c38 = @c38,
 s39 = @s39, l39 = @l39, d39 = @d39, c39 = @c39,
 s40 = @s40, l40 = @l40, d40 = @d40, c40 = @c40

 WHERE char_id = @char_id
END
ELSE
BEGIN
 INSERT INTO user_activeskill
 (char_id,
 s1, l1, d1, c1,
 s2, l2, d2, c2,
 s3, l3, d3, c3,
 s4, l4, d4, c4,
 s5, l5, d5, c5,
 s6, l6, d6, c6,
 s7, l7, d7, c7,
 s8, l8, d8, c8,
 s9, l9, d9, c9,
 s10, l10, d10, c10,
 s11, l11, d11, c11,
 s12, l12, d12, c12,
 s13, l13, d13, c13,
 s14, l14, d14, c14,
 s15, l15, d15, c15,
 s16, l16, d16, c16,
 s17, l17, d17, c17,
 s18, l18, d18, c18,
 s19, l19, d19, c19,
 s20, l20, d20, c20,
 s21, l21, d21, c21,
 s22, l22, d22, c22,
 s23, l23, d23, c23,
 s24, l24, d24, c24,
 s25, l25, d25, c25,
 s26, l26, d26, c26,
 s27, l27, d27, c27,
 s28, l28, d28, c28,
 s29, l29, d29, c29,
 s30, l30, d30, c30,
 s31, l31, d31, c31,
 s32, l32, d32, c32,
 s33, l33, d33, c33,
 s34, l34, d34, c34,
 s35, l35, d35, c35,
 s36, l36, d36, c36,
 s37, l37, d37, c37,
 s38, l38, d38, c38,
 s39, l39, d39, c39,
 s40, l40, d40, c40)
 VALUES
 (@char_id,
 @s1, @l1, @d1, @c1,
 @s2, @l2, @d2, @c2,
 @s3, @l3, @d3, @c3,
 @s4, @l4, @d4, @c4,
 @s5, @l5, @d5, @c5,
 @s6, @l6, @d6, @c6,
 @s7, @l7, @d7, @c7,
 @s8, @l8, @d8, @c8,
 @s9, @l9, @d9, @c9,
 @s10, @l10, @d10, @c10,
 @s11, @l11, @d11, @c11,
 @s12, @l12, @d12, @c12,
 @s13, @l13, @d13, @c13,
 @s14, @l14, @d14, @c14,
 @s15, @l15, @d15, @c15,
 @s16, @l16, @d16, @c16,
 @s17, @l17, @d17, @c17,
 @s18, @l18, @d18, @c18,
 @s19, @l19, @d19, @c19,
 @s20, @l20, @d20, @c20,
 @s21, @l21, @d21, @c21,
 @s22, @l22, @d22, @c22,
 @s23, @l23, @d23, @c23,
 @s24, @l24, @d24, @c24,
 @s25, @l25, @d25, @c25,
 @s26, @l26, @d26, @c26,
 @s27, @l27, @d27, @c27,
 @s28, @l28, @d28, @c28,
 @s29, @l29, @d29, @c29,
 @s30, @l30, @d30, @c30,
 @s31, @l31, @d31, @c31,
 @s32, @l32, @d32, @c32,
 @s33, @l33, @d33, @c33,
 @s34, @l34, @d34, @c34,
 @s35, @l35, @d35, @c35,
 @s36, @l36, @d36, @c36,
 @s37, @l37, @d37, @c37,
 @s38, @l38, @d38, @c38,
 @s39, @l39, @d39, @c39,
 @s40, @l40, @d40, @c40)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateActiveSkill]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateActiveSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/****** Object:  Stored Procedure dbo.lin_CreateActiveSkill    Script Date: 2003-09-20 11:51:58 Updated by Vampire 2007-11-06 12:43:00 ******/
--by bert for clee

CREATE PROCEDURE [dbo].[lin_CreateActiveSkill]
(
	@char_id INT,
	@s1 INT, @l1 INT, @d1 INT, @c1 TINYINT,
	@s2 INT, @l2 INT, @d2 INT, @c2 TINYINT,
	@s3 INT, @l3 INT, @d3 INT, @c3 TINYINT,
	@s4 INT, @l4 INT, @d4 INT, @c4 TINYINT,
	@s5 INT, @l5 INT, @d5 INT, @c5 TINYINT,
	@s6 INT, @l6 INT, @d6 INT, @c6 TINYINT,
	@s7 INT, @l7 INT, @d7 INT, @c7 TINYINT,
	@s8 INT, @l8 INT, @d8 INT, @c8 TINYINT,
	@s9 INT, @l9 INT, @d9 INT, @c9 TINYINT,
	@s10 INT, @l10 INT, @d10 INT, @c10 TINYINT,
	@s11 INT, @l11 INT, @d11 INT, @c11 TINYINT,
	@s12 INT, @l12 INT, @d12 INT, @c12 TINYINT,
	@s13 INT, @l13 INT, @d13 INT, @c13 TINYINT,
	@s14 INT, @l14 INT, @d14 INT, @c14 TINYINT,
	@s15 INT, @l15 INT, @d15 INT, @c15 TINYINT,
	@s16 INT, @l16 INT, @d16 INT, @c16 TINYINT,
	@s17 INT, @l17 INT, @d17 INT, @c17 TINYINT,
	@s18 INT, @l18 INT, @d18 INT, @c18 TINYINT,
	@s19 INT, @l19 INT, @d19 INT, @c19 TINYINT,
	@s20 INT, @l20 INT, @d20 INT, @c20 TINYINT,
	 @s21 INT, @l21 INT, @d21 INT, @c21 TINYINT,
	 @s22 INT, @l22 INT, @d22 INT, @c22 TINYINT,
	 @s23 INT, @l23 INT, @d23 INT, @c23 TINYINT,
	 @s24 INT, @l24 INT, @d24 INT, @c24 TINYINT,
	 @s25 INT, @l25 INT, @d25 INT, @c25 TINYINT,
 	 @s26 INT, @l26 INT, @d26 INT, @c26 TINYINT,
 	 @s27 INT, @l27 INT, @d27 INT, @c27 TINYINT,
 	 @s28 INT, @l28 INT, @d28 INT, @c28 TINYINT,
 	 @s29 INT, @l29 INT, @d29 INT, @c29 TINYINT,
 	 @s30 INT, @l30 INT, @d30 INT, @c30 TINYINT,
 	 @s31 INT, @l31 INT, @d31 INT, @c31 TINYINT,
 	 @s32 INT, @l32 INT, @d32 INT, @c32 TINYINT,
 	 @s33 INT, @l33 INT, @d33 INT, @c33 TINYINT,
 	 @s34 INT, @l34 INT, @d34 INT, @c34 TINYINT,
 	 @s35 INT, @l35 INT, @d35 INT, @c35 TINYINT,
 	 @s36 INT, @l36 INT, @d36 INT, @c36 TINYINT,
 	 @s37 INT, @l37 INT, @d37 INT, @c37 TINYINT,
 	 @s38 INT, @l38 INT, @d38 INT, @c38 TINYINT,
 	 @s39 INT, @l39 INT, @d39 INT, @c39 TINYINT,
 	 @s40 INT, @l40 INT, @d40 INT, @c40 TINYINT
)
AS
SET NOCOUNT ON

INSERT INTO user_activeskill
(char_id,
s1, l1, d1, c1,
s2, l2, d2, c2,
s3, l3, d3, c3,
s4, l4, d4, c4,
s5, l5, d5, c5,
s6, l6, d6, c6,
s7, l7, d7, c7,
s8, l8, d8, c8,
s9, l9, d9, c9,
s10, l10, d10, c10,
s11, l11, d11, c11,
s12, l12, d12, c12,
s13, l13, d13, c13,
s14, l14, d14, c14,
s15, l15, d15, c15,
s16, l16, d16, c16,
s17, l17, d17, c17,
s18, l18, d18, c18,
s19, l19, d19, c19,
s20, l20, d20, c20,
 s21, l21, d21, c21,
 s22, l22, d22, c22,
 s23, l23, d23, c23,
 s24, l24, d24, c24,
 s25, l25, d25, c25,
 s26, l26, d26, c26,
 s27, l27, d27, c27,
 s28, l28, d28, c28,
 s29, l29, d29, c29,
 s30, l30, d30, c30,
 s31, l31, d31, c31,
 s32, l32, d32, c32,
 s33, l33, d33, c33,
 s34, l34, d34, c34,
 s35, l35, d35, c35,
 s36, l36, d36, c36,
 s37, l37, d37, c37,
 s38, l38, d38, c38,
 s39, l39, d39, c39,
 s40, l40, d40, c40)
VALUES
(@char_id,
@s1, @l1, @d1, @c1,
@s2, @l2, @d2, @c2,
@s3, @l3, @d3, @c3,
@s4, @l4, @d4, @c4,
@s5, @l5, @d5, @c5,
@s6, @l6, @d6, @c6,
@s7, @l7, @d7, @c7,
@s8, @l8, @d8, @c8,
@s9, @l9, @d9, @c9,
@s10, @l10, @d10, @c10,
@s11, @l11, @d11, @c11,
@s12, @l12, @d12, @c12,
@s13, @l13, @d13, @c13,
@s14, @l14, @d14, @c14,
@s15, @l15, @d15, @c15,
@s16, @l16, @d16, @c16,
@s17, @l17, @d17, @c17,
@s18, @l18, @d18, @c18,
@s19, @l19, @d19, @c19,
@s20, @l20, @d20, @c20,
@s21, @l21, @d21, @c21,
@s22, @l22, @d22, @c22,
@s23, @l23, @d23, @c23,
@s24, @l24, @d24, @c24,
@s25, @l25, @d25, @c25,
 @s26, @l26, @d26, @c26,
 @s27, @l27, @d27, @c27,
 @s28, @l28, @d28, @c28,
 @s29, @l29, @d29, @c29,
 @s30, @l30, @d30, @c30,
 @s31, @l31, @d31, @c31,
 @s32, @l32, @d32, @c32,
 @s33, @l33, @d33, @c33,
 @s34, @l34, @d34, @c34,
 @s35, @l35, @d35, @c35,
 @s36, @l36, @d36, @c36,
 @s37, @l37, @d37, @c37,
 @s38, @l38, @d38, @c38,
 @s39, @l39, @d39, @c39,
 @s40, @l40, @d40, @c40)

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetUserBan]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetUserBan]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_SetUserBan

INPUT
	@char_id	INT
	@ban_hour	smallint
OUTPUT
return
made by
	young
date
	2003-09-22
********************************************/
CREATE PROCEDURE [dbo].[lin_SetUserBan]
(
	@char_id	INT,
	@status		INT,
	@ban_hour	smallint,
	@ban_end	INT
)
AS
SET NOCOUNT ON

if @ban_hour = 0 
begin
	delete from user_ban where char_id = @char_id
end else begin

	if ( exists ( select * from user_ban (nolock) where char_id = @char_id ) )
	begin
		-- update
		update user_ban set status = @status, ban_date = getdate(), ban_hour = @ban_hour, ban_end = @ban_end where char_id = @char_id
	end else begin
		-- insert
		insert into user_ban ( char_id, status, ban_hour , ban_end ) values ( @char_id, @status, @ban_hour, @ban_end  )
	end
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetBlockCount]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetBlockCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetBlockCount
	get block count
INPUT
	@char_id		int,
	@block_target_id		int
OUTPUT
return
made by
	kks
date
	2004-12-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetBlockCount]
(
	@char_id		int,
	@block_target_id	int
)
AS
SET NOCOUNT ON

SELECT COUNT(*)
FROM user_blocklist(NOLOCK)
WHERE char_id = @block_target_id
	AND block_char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadBlockList]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadBlockList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_LoadBlockList
	when character log in, load he''s blocked list.
INPUT
	char_id
OUTPUT
return
made by
	carrot
date
	2003-12-01
change
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadBlockList]
(
	@char_id	INT
)
AS

SET NOCOUNT ON

SELECT block_char_id, block_char_name FROM user_blocklist WHERE char_id = @char_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteBlockList]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteBlockList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_DeleteBlockList    
 delete character''s blocked list.    
INPUT    
 char_id,    
 target char_name    
OUTPUT    
return    
made by    
 carrot    
date    
 2003-12-01    
change    
********************************************/    
CREATE PROCEDURE [dbo].[lin_DeleteBlockList]    
(    
 @char_id INT,    
 @target_char_name NVARCHAR(50)    
)    
AS    
    
SET NOCOUNT ON    
    
DECLARE @target_char_id INT    
SET @target_char_id = 0    
  
SELECT @target_char_id = block_char_id FROM user_blocklist  WHERE block_char_name = @target_char_name    
  
--SELECT @target_char_id = char_id FROM user_data WHERE char_name = @target_char_name    
    
IF @target_char_id > 0    
BEGIN    
 DELETE user_blocklist  WHERE char_id = @char_id AND block_char_id = @target_char_id    
 IF NOT @@ROWCOUNT = 1    
 BEGIN    
  RAISERROR (''Cannot find delete blocklist: char id = [%d], target name[%s]'', 16, 1, @char_id, @target_char_name)    
 END    
 ELSE    
 BEGIN    
  SELECT @target_char_id    
 END    
END    
ELSE    
BEGIN    
 RAISERROR (''Cannot find delete blocklist: char id = [%d], target naem[%s]'', 16, 1, @char_id, @target_char_name)    
END  
  



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddBlockList]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddBlockList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************  
lin_AddBlockList  
 add character''s blocked list.  
INPUT  
 char_id,  
 target char_name  
OUTPUT  
return  
made by  
 carrot  
date  
 2003-12-01  
change  
********************************************/  
CREATE PROCEDURE [dbo].[lin_AddBlockList]  
(  
 @char_id INT,  
 @target_char_name NVARCHAR(50)  
)  
AS  
  
SET NOCOUNT ON  
  
DECLARE @target_char_id INT  
DECLARE @target_builder_lev INT  
SET @target_char_id = 0  
SET @target_builder_lev  = 0

SELECT @target_char_id = char_id, @target_builder_lev = builder FROM user_data WHERE char_name = @target_char_name  

IF (@target_builder_lev  > 0 AND @target_builder_lev  <= 5)
BEGIN
  RAISERROR (''Try block builder : char id = [%d], target naem[%s]'', 16, 1, @char_id, @target_char_name)  
  RETURN -1;
END
  
IF @target_char_id > 0  
BEGIN  
 INSERT INTO user_blocklist VALUES (@char_id, @target_char_id, @target_char_name)  
 IF NOT @@ROWCOUNT = 1  
 BEGIN  
  RAISERROR (''Cannot find add blocklist: char id = [%d], target naem[%s]'', 16, 1, @char_id, @target_char_name)  
 END  
 ELSE  
 BEGIN  
  SELECT @target_char_id  
 END  
END  
ELSE  
BEGIN  
 RAISERROR (''Cannot find add blocklist: char id = [%d], target naem[%s]'', 16, 1, @char_id, @target_char_name)  
END  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CommentDelete]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CommentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_CommentDelete
	
INPUT	
	@delete		int,
	@comment_id		int
OUTPUT
return
made by
	young
date
	2003-09-02
********************************************/
CREATE PROCEDURE [dbo].[lin_CommentDelete]
(
	@delete		int,
	@comment_id		int
)
AS
SET NOCOUNT ON

if @delete = 1
	update user_comment set deleted = 1 where comment_id = @comment_id
else if @delete = 2
	update user_comment set deleted = 0 where comment_id = @comment_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CommentSearch]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CommentSearch]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CommentSearch    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_CommentSearch
	
INPUT	
	@char_id		int,
	@page			int
OUTPUT
return
made by
	young
date
	2003-09-02
********************************************/
CREATE PROCEDURE [dbo].[lin_CommentSearch]
(
	@char_id		int,
	@page			int
)
AS
SET NOCOUNT ON


select comment_id, char_name, char_id, comment, writer from user_comment (nolock) 
where char_id = @char_id and deleted = 0
order by comment_id desc



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CommentWrite]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CommentWrite]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CommentWrite    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_CommentWrite
	
INPUT	
	@char_name		nvarchar(50),
	@char_id		int,
	@comment		nvarchar(200),
	@writer			nvarchar(50)
OUTPUT
return
made by
	young
date
	2003-09-02
********************************************/
create PROCEDURE [dbo].[lin_CommentWrite]
(
	@char_name		nvarchar(50),
	@char_id		int,
	@comment		nvarchar(200),
	@writer			nvarchar(50)
)
AS
SET NOCOUNT ON

insert into user_comment ( char_name, char_id, comment, writer )
values ( @char_name, @char_id, @comment, @writer )



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CharLogin]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CharLogin]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CharLogin    Script Date: 2003-09-20 ?? 11:51:56 ******/
/********************************************
lin_CharLogin
	log character login
INPUT
	char_id
OUTPUT
return
made by
	carrot
date
	2002-06-11
change
********************************************/
CREATE PROCEDURE [dbo].[lin_CharLogin]
(
	@char_id	INT
)
AS

SET NOCOUNT ON

UPDATE user_data SET login = GETDATE() WHERE char_id = @char_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCharacterPledge]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCharacterPledge]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCharacterPledge    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCharacterPledge

INPUT
OUTPUT
return
made by
	carrot
date
	2003-06-30
change
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveCharacterPledge]
(
	@pledge_id INT,
	@char_id  INT
)
AS

SET NOCOUNT ON

UPDATE 
	user_data 
set 
	pledge_id= @pledge_id
WHERE 
	char_id= @char_id






' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCharacter_temp]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCharacter_temp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCharacter_temp    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCharacter_temp

INPUT
OUTPUT
return
made by
	carrot
date
	2003-06-13
change
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveCharacter_temp]
(
	@pledge_id INT,
	@class INT,
	@world INT,
	@xloc INT,
	@yloc INT,
	@zloc INT,
	@IsInVehicle INT,
	@HP FLOAT,
	@MP FLOAT,
	@max_HP FLOAT,
	@max_MP FLOAT,
	@SP INT,
	@Exp INT,
	@Lev INT,
	@align INT,
	@PK INT,
	@duel INT,
	@pkpardon INT,
	@char_id  INT
)
AS

SET NOCOUNT ON

UPDATE 
	user_data 
set 
	class= @class,
	world= @world,
	xloc= @xloc,
	yloc= @yloc,
	zloc= @zloc,
	IsInVehicle= @IsInVehicle,
	HP= @HP,
	MP= @MP,
	max_HP= @max_HP,
	max_MP= @max_MP,
	SP= @SP,
	Exp= @Exp,
	Lev= @Lev,
	align= @align,
	PK= @PK,
	duel= @duel,
	pkpardon= @pkpardon
WHERE 
	char_id= @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSendMailCount]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSendMailCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetSendMailCount
	get send mail count
INPUT
	@char_id		int

OUTPUT
return
made by
	kks
date
	2004-12-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetSendMailCount]
(
	@char_id		int
)
AS
SET NOCOUNT ON

SELECT COUNT(*)
FROM user_mail_sender(NOLOCK)
WHERE sender_id IN (SELECT char_id FROM user_data(nolock) WHERE account_id = (SELECT account_id FROM user_data (nolock) WHERE char_id = @char_id))
	AND mailbox_type = 1
	AND send_date BETWEEN CONVERT(DATETIME, CONVERT(NVARCHAR(10), GETDATE(), 120) + '' 00:00:00'') AND
		CONVERT(DATETIME, CONVERT(NVARCHAR(10), GETDATE(), 120) + '' 23:59:59'')



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RestoreChar2 ]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RestoreChar2 ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_RestoreChar2
	restore deleted char
INPUT
	@account_id	int,
	@char_id	int
OUTPUT

return
made by
	young
date
	2004-03-11
	update account_id from character
********************************************/
CREATE PROCEDURE [dbo].[lin_RestoreChar2 ]
(
	@account_id	int,
	@char_id	int,
	@new_char_name	nvarchar(50),
	@account_name	nvarchar(50) = ''''
)
AS

SET NOCOUNT ON

if ( len ( @account_name ) > 0 ) 
begin
	update user_data set account_id = @account_id , char_name = @new_char_name, account_name = @account_name , temp_delete_date = null  where char_id = @char_id
end else begin
	update user_data set account_id = @account_id , char_name = @new_char_name , temp_delete_date = null  where char_id = @char_id
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RestoreChar ]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RestoreChar ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_SetCharAccountId
	update account_id character
INPUT
	@account_id	int,
	@char_id	int
OUTPUT

return
made by
	young
date
	2003-09-02
	update account_id from character
********************************************/
CREATE PROCEDURE [dbo].[lin_RestoreChar ]
(
	@account_id	int,
	@char_id	int,
	@account_name	nvarchar(50) = ''''
)
AS

SET NOCOUNT ON

declare @char_inx int
declare @old_char_name nvarchar(50)
declare @new_char_name nvarchar(50)

select @old_char_name = char_name from user_data (nolock) where char_id = @char_id
select @char_inx = CHARINDEX ( ''_'', @old_char_name )

if @char_inx > 0 
begin
	select @new_char_name = SUBSTRING( @old_char_name, 1, @char_inx - 1)
end
else
begin
	select @new_char_name = @old_char_name
end

if ( len ( @account_name ) > 0 ) 
begin
	update user_data set account_id = @account_id , char_name = @new_char_name, account_name = @account_name , temp_delete_date = null  where char_id = @char_id
end else begin
	update user_data set account_id = @account_id , char_name = @new_char_name , temp_delete_date = null  where char_id = @char_id
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CharLogout]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CharLogout]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_CharLogout    
 log character Logout    
INPUT    
 char_id    
OUTPUT    
return    
 week play time by sec    
made by    
 carrot    
date    
 2002-06-11    
change    
 2002.-12-20    
  add usetime set    
 2004-03-29    
  add function to write today''s used sec    
********************************************/    
CREATE PROCEDURE [dbo].[lin_CharLogout]    
(    
 @char_id INT,    
 @usedTimeSec INT
)    
AS    
    
SET NOCOUNT ON    
    
DECLARE @logoutDate DATETIME    
SET @logoutDate = GETDATE()    
    
UPDATE user_data SET Logout = @logoutDate, use_time = use_time + @usedTimeSec WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveMail]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SaveMaill
	save mail 
INPUT
	@char_id		int,
	@mail_type		int,
	@related_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
OUTPUT
return
made by
	kks
date
	2004-12-15
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveMail]
(
	@char_id		int,
	@mail_type		int,
	@related_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
)
AS
SET NOCOUNT ON

DECLARE @mail_id int
SET @mail_id = 0

INSERT INTO user_mail
(title, content) VALUES (@title, @content)

SET @mail_id = @@IDENTITY

DECLARE @sender_name nvarchar(50)

SELECT @sender_name = char_name FROM user_data(nolock) WHERE char_id = @char_id

INSERT INTO user_mail_sender
(mail_id, related_id, mail_type, mailbox_type, sender_id, sender_name, receiver_name_list)
VALUES
(@mail_id, @related_id, @mail_type, 3, @char_id, @sender_name, @receiver_name_list)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCharacter_temp2]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCharacter_temp2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveCharacter_temp2    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveCharacter_temp

INPUT
OUTPUT
return
made by
	carrot
date
	2003-06-13
change
********************************************/
CREATE PROCEDURE [dbo].[lin_SaveCharacter_temp2]
(
	@ST_underware INT, 
	@ST_right_ear INT, 
	@ST_left_ear INT, 
	@ST_neck INT, 
	@ST_right_finger INT, 
	@ST_left_finger INT, 
	@ST_head INT, 
	@ST_right_hand INT, 
	@ST_left_hand INT, 
	@ST_gloves INT, 
	@ST_chest INT, 
	@ST_legs INT, 
	@ST_feet INT, 
	@ST_back INT, 
	@ST_both_hand INT, 
	@char_id  INT
)
AS

SET NOCOUNT ON

UPDATE 
	user_data 
set 
	ST_underware= @ST_underware, 
	ST_right_ear= @ST_right_ear, 
	ST_left_ear= @ST_left_ear, 
	ST_neck= @ST_neck, 
	ST_right_finger= @ST_right_finger, 
	ST_left_finger= @ST_left_finger, 
	ST_head= @ST_head, 
	ST_right_hand= @ST_right_hand, 
	ST_left_hand= @ST_left_hand, 
	ST_gloves= @ST_gloves, 
	ST_chest= @ST_chest, 
	ST_legs= @ST_legs, 
	ST_feet= @ST_feet, 
	ST_back= @ST_back, 
	ST_both_hand= @ST_both_hand
WHERE 
	char_id= @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveDropExp]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveDropExp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SaveDropExp    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SaveDropExp
	
INPUT	
	@drop_exe	int,
	@char_id	int
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
create PROCEDURE [dbo].[lin_SaveDropExp]
(
	@drop_exe	int,
	@char_id	int
)
AS
SET NOCOUNT ON

update user_data set drop_exp = @drop_exe where char_id = @char_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetUserLogTime]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetUserLogTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/****** Object:  Stored Procedure dbo.lin_GetUserLogTime    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetUserLogTime
	get user log time
INPUT
	char_id, 
	log_id,
	log_to

OUTPUT
	time diff
return
made by
	young
date
	2003-01-22
change
********************************************/
CREATE PROCEDURE [dbo].[lin_GetUserLogTime]
(
	@char_id	INT,
	@log_id		INT,
	@log_to	INT
)
AS

SET NOCOUNT ON

DECLARE @use_time int

select 
	top 1 @use_time = use_time
from 
	user_log (nolock)
where 
	char_id = @char_id 
	and log_id = @log_id 
	and log_to = @log_to
order by 
	log_date desc

if @use_time = NULL
begin
	select @use_time = use_time
	from user_data (nolock)
	where char_id = @char_id
end

select @use_time



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetWearingItemList]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetWearingItemList]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetWearingItemList
	GetWearingItemList
INPUT
	@char_id	int,
OUTPUT
return
made by
	kks
date
	2004-02-17
********************************************/
CREATE PROCEDURE [dbo].[lin_GetWearingItemList] 
(
@char_id	int
)
AS
SET NOCOUNT ON

SELECT ''st_underware'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_underware FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_right_ear'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_right_ear FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_left_ear'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_left_ear FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_neck'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_neck FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_right_finger'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_right_finger FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_left_finger'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_left_finger FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_head'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_head FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_right_hand'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_right_hand FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_left_hand'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_left_hand FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_gloves'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_gloves FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_chest'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_chest FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_legs'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_legs FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_feet'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_feet FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_back'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_back FROM user_data WHERE char_id = @char_id) UNION
SELECT ''st_both_hand'', item_id, char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item (nolock) WHERE item_id = (SELECT st_both_hand FROM user_data WHERE char_id = @char_id)


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetUserDataByCharName]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetUserDataByCharName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetUserDataByCharName    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetUserDataByCharName

INPUT
	@char_name	NVARCHAR(50)
OUTPUT
	ud.char_name, ud.account_name, ud.account_id, ud.pledge_id, ud.builder, ud.gender, ud.race, ud.class, ud.world, ud.xloc, ud.yloc, ud.zloc, 
	ud.HP, ud.MP, ud.SP, ud.Exp, ud.Lev, ud.align, ud.PK, ud.Str, ud.Dex, ud.Con, ud.Int, ud.Wit, ud.Men, 
	ud.ST_underware, ud.ST_right_ear, ud.ST_left_ear, ud.ST_neck, ud.ST_right_finger, ud.ST_left_finger, ud.ST_head, ud.ST_right_hand, 
	ud.ST_left_hand, ud.ST_gloves, ud.ST_chest, ud.ST_legs, ud.ST_feet, ud.ST_back, ud.ST_both_hand,
	uas.s1, uas.l1, uas.d1, uas.s2, uas.l2, uas.d2, uas.s3, uas.l3, uas.d3, uas.s4, uas.l4, uas.d4, uas.s5, uas.l5, uas.d5, uas.s6, uas.l6, uas.d6, uas.s7, uas.l7, uas.d7, uas.s8, uas.l8, uas.d8, uas.s9, uas.l9, uas.d9, uas.s10, uas.l10, uas.d10, 
	uas.s11, uas.l11, uas.d11, uas.s12, uas.l12, uas.d12, uas.s13, uas.l13, uas.d13, uas.s14, uas.l14, uas.d14, uas.s15, uas.l15, uas.d15, uas.s16, uas.l16, uas.d16, uas.s17, uas.l17, uas.d17, uas.s18, uas.l18, uas.d18, uas.s19, uas.l19, uas.d19, uas.s20, uas.l20, uas.d20
return
made by
	carrot
date
	2002-06-09
********************************************/
CREATE PROCEDURE [dbo].[lin_GetUserDataByCharName]
(
@char_name	nvarchar(50)
)
AS
SET NOCOUNT ON

declare @char_id	INT

set @char_id = 0

select top 1 @char_id = char_id from user_data where char_name = @char_name

exec lin_GetUserDataByCharId @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetClass]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetClass]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SetClass]
(
@char_id AS INT,
@subjob_id AS INT,
@class AS INT
)
AS
SET NOCOUNT ON

IF @subjob_id = 0
	UPDATE user_data SET class = @class, subjob0_class = @class WHERE char_id = @char_id
ELSE IF @subjob_id = 1
	UPDATE user_data SET class = @class, subjob1_class = @class WHERE char_id = @char_id
ELSE IF @subjob_id = 2
	UPDATE user_data SET class = @class, subjob2_class = @class WHERE char_id = @char_id
ELSE IF @subjob_id = 3
	UPDATE user_data SET class = @class, subjob3_class = @class WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetCharacterDeleteRestore]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetCharacterDeleteRestore]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetCharacterDeleteRestore    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_SetCharacterDeleteRestore
	Restore character which is set deleted
INPUT
	@char_id	INT
OUTPUT
return
made by
	carrot
date
	2003-01-7
********************************************/
CREATE PROCEDURE [dbo].[lin_SetCharacterDeleteRestore]
(
	@char_id	INT
)
AS

SET NOCOUNT ON

UPDATE user_data SET temp_delete_date = NULL WHERE char_id = @char_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetCharacterDelete]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetCharacterDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetCharacterDelete    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_SetCharacterDelete
	Set character is deleted
INPUT
	@char_id	INT
OUTPUT
	year
	month
	day
return
made by
	carrot
date
	2003-01-7
********************************************/
CREATE  PROCEDURE [dbo].[lin_SetCharacterDelete]
(
	@char_id	INT
)
AS

SET NOCOUNT ON

DECLARE @deletedDate	SMALLDATETIME

SET @deletedDate = GetDate()

UPDATE user_data SET temp_delete_date = @deletedDate WHERE char_id = @char_id

IF @@ROWCOUNT > 0 
BEGIN
	SELECT	YEAR(@deletedDate), MONTH(@deletedDate), DAY(@deletedDate),
		DATEPART(HOUR, @deletedDate), DATEPART(mi, @deletedDate), DATEPART(s, @deletedDate)
END
ELSE
BEGIN
	SELECT 0,0,0,0,0,0
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteChar]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'















/****** Object:  Stored Procedure dbo.lin_DeleteChar    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_DeleteChar
	Delete character sp
INPUT
	@char_id	INT
OUTPUT
	item_id
return
made by
	carrot
date
	2002-02-16
	Update all item and return item_ids
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteChar]
(
@char_id	INT
)
AS

SET NOCOUNT ON

DECLARE @backup_char_name NVARCHAR(50)
DECLARE @original_account_id INT
DECLARE @original_char_name NVARCHAR(50)
DECLARE @original_account_name NVARCHAR(50)
DECLARE @create_date datetime

set @original_account_id = 0
SELECT
	@original_account_id = account_id
	,@original_char_name = char_name
	,@original_account_name = account_name
	,@create_date = create_date
FROM user_data
WHERE char_id = @char_id

SELECT @backup_char_name = @original_char_name + ''_'' + LTRIM(STR(@original_account_id)) + ''_'' + LTRIM(STR(@char_id))

UPDATE user_data
SET account_id = -1
, char_name = @backup_char_name
, pledge_id = 0
WHERE char_id = @char_id

INSERT INTO user_deleted
(char_id, delete_date) VALUES (@char_id, GETDATE())

--DECLARE @tempItemIDtable TABLE (item_id INT)
--INSERT INTO @tempItemIDtable
--SELECT item_id FROM user_item  WHERE char_id = @char_id
--UPDATE user_item  SET char_id = 0, item_type = 0, amount = 0, enchant = 0, eroded = 0, bless = 0, ident = 0, wished = 0, warehouse = 0  WHERE char_id = @char_id
--SELECT item_id FROM @tempItemIDtable

SELECT item_id FROM user_item  WHERE char_id = @char_id

if @original_account_id > 0
begin
	-- make user_history
	exec lin_InsertUserHistory @original_char_name, @char_id, 2, @original_account_name, @create_date
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetBuilderCharacter]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetBuilderCharacter]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetBuilderCharacter    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_SetBuilderCharacter
	Set Builder Character flag
INPUT
	@char_name	nvarchar,
	@nBuilderLev	int
OUTPUT
	char_id
return
made by
	carrot
date
	2002-06-28
********************************************/
CREATE PROCEDURE [dbo].[lin_SetBuilderCharacter]
(
	@char_name	NVARCHAR(24),
	@nBuilderLev	INT
)
AS

SET NOCOUNT ON

DECLARE @Char_id INT
SET @Char_id = 0

UPDATE user_data SET builder =  @nBuilderLev WHERE char_name = @char_name
IF @@ROWCOUNT > 0
BEGIN
	SELECT @Char_id = char_id FROM user_data WHERE char_name = @char_name
END

SELECT @Char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAccount]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAccount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAccount    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_LoadAccount
	
INPUT
	@account_id	int
OUTPUT
return
made by
	carrot
date
	2002-06-09
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadAccount]
(
@account_id	int
)
AS
SET NOCOUNT ON

if @account_id < 1
begin
	RAISERROR (''lin_LoadAccount : invalid account_id [%d]'', 16, 1, @account_id)
	RETURN -1	
end

SELECT top 10 char_id, account_name FROM user_data (nolock) WHERE account_id= @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SendMailToReceiver]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SendMailToReceiver]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_SendMailToReceiver
	send mail  to receiver
INPUT
	@mail_id		int,
	@receiverName		nvarchar(50)
OUTPUT
return
made by
	kks
date
	2004-12-19
modified by
	kks
date
	2005-04-06
********************************************/
CREATE PROCEDURE [dbo].[lin_SendMailToReceiver]
(
	@mail_id		int,
	@receiver_name		nvarchar(50)
)
AS
SET NOCOUNT ON

if (@receiver_name = NULL)
BEGIN
	RETURN
END

DECLARE @receiver_id int
SET @receiver_id = 0

SELECT @receiver_id  = char_id FROM user_data(nolock) WHERE char_name = @receiver_name

IF (@receiver_id > 0) 
BEGIN
	INSERT INTO user_mail_receiver
	(mail_id, receiver_id, receiver_name)
	VALUES 
	(@mail_id, @receiver_id, @receiver_name)
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModChar2]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModChar2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ModChar2    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_ModChar2
	
INPUT
	@sp		int,
	@exp		int,
	@align		int,
	@pk		int,
	@pkpardon	int,
	@duel		int,
	@char_id	int
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_ModChar2]
(
	@gender		int,
	@race		int,
	@class		int,
	@face_index		int,
	@hair_shape_index	int,
	@hair_color_index		int,
	@char_id	int
)
AS
SET NOCOUNT ON

update user_data set gender=@gender, race=@race, class=@class, face_index=@face_index, hair_shape_index=@hair_shape_index, hair_color_index=@hair_color_index where char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAllHeroes]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAllHeroes]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetAllHeroes]
AS
SELECT ud.subjob0_class, un.char_id  FROM user_nobless un, user_data ud WHERE un.hero_type <> 0 AND un.char_id = ud.char_id ORDER BY win_count DESC



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateUseTime]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateUseTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UpdateUseTime    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_UpdateUseTime
	update character use time
INPUT
	char_id		int,
	usedtimesec	int
OUTPUT
return
made by
	young
date
	2003-03-26

		add usetime set
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdateUseTime]
(
	@char_id	INT,
	@usedTimeSec	INT
)
AS

SET NOCOUNT ON

UPDATE user_data SET use_time = use_time + @usedTimeSec WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[dp_GetItemListByUserID]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dp_GetItemListByUserID]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.dp_GetItemListByUserID    Script Date: 2003-09-20 ?? 11:51:58 ******/

CREATE PROCEDURE [dbo].[dp_GetItemListByUserID] @user_id varchar(12)
AS
SELECT user_item.item_id, itemdata.name, user_data.char_name, user_item.warehouse, user_item.amount, user_item.enchant, user_item.eroded, user_item.bless, user_item.wished
FROM user_data, user_item, itemdata 
WHERE char_name = @user_id
AND user_data.char_id = user_item.char_id AND user_item.item_type = itemdata.id
ORDER BY  user_item.warehouse, user_item.item_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetCharByAccountId]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetCharByAccountId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetCharByAccountId    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_GetCharByAccountId

INPUT
	@account_id	INT
OUTPUT
return
made by
	young
date
	2003-09-17
********************************************/
CREATE PROCEDURE [dbo].[lin_GetCharByAccountId]
(
@account_id	INT
)
AS
SET NOCOUNT ON

IF @account_id > 0
	SELECT char_id, account_id, char_name , account_name  FROM User_data WHERE account_id = @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdatePledgeInfo]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdatePledgeInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UpdatePledgeInfo    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_UpdatePledgeInfo

INPUT
	@fieldName	nvarchar(50),
	@field_data	INT,
	@char_id	INT
OUTPUT
return
made by
	carrot
date
	2003-06-13
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdatePledgeInfo]
(
@fieldName	nvarchar(50),
@field_data	INT,
@char_id	INT
)
AS
SET NOCOUNT ON

IF @fieldName = N''pledge_dismiss_time'' begin update user_data set pledge_dismiss_time = @field_data where char_id =  @char_id end
ELSE IF @fieldName = N''pledge_ousted_time'' begin update user_data set pledge_ousted_time = @field_data where char_id =  @char_id end
ELSE IF @fieldName = N''pledge_withdraw_time'' begin update user_data set pledge_withdraw_time = @field_data where char_id =  @char_id end
ELSE IF @fieldName = N''surrender_war_id'' begin update user_data set surrender_war_id = @field_data where char_id =  @char_id end
ELSE 
BEGIN 
	RAISERROR (''lin_UpdatePledgeInfo : invalid field [%s]'', 16, 1, @fieldName)
	RETURN -1	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[dp_GetItemListByAccount]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dp_GetItemListByAccount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.dp_GetItemListByAccount    Script Date: 2003-09-20 ?? 11:51:57 ******/

CREATE PROCEDURE [dbo].[dp_GetItemListByAccount] @user_id varchar(12)
AS
SELECT b.item_id, c.name, a.char_name, b.warehouse, b.amount, b.enchant, b.eroded, b.bless, b.wished
FROM user_data a, user_item b, itemdata  c
WHERE a.account_name = @user_id
AND a.char_id = b.char_id AND b.item_type = c.id 
ORDER BY a.char_name, b.warehouse, b.item_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModChar3]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModChar3]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/****** Object:  Stored Procedure dbo.lin_ModChar3    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_ModChar3
	
INPUT
	@mod field	int,
	@delta		int,
	@char_id	int
OUTPUT
return
made by
	young
date
	2003-08-26
********************************************/
CREATE PROCEDURE [dbo].[lin_ModChar3]
(
	@sp		int,
	@exp		int,
	@level		int,
	@align		int,
	@pk		int,
	@pkpardon	int,
	@duel		int,
	@char_id	int
)
AS
SET NOCOUNT ON

update user_data set 
	sp = sp + @sp,
	exp = exp + @exp,	
	align = align + @align,
	pk = pk + @pk,
	pkpardon = pkpardon + @pkpardon,
	duel = duel + @duel,
	lev = @level 
where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetSponsor]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetSponsor]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_SetSponsor]
(
	@action int,
	@user_id1 int,
	@user_id2 int
) 
AS       
SET NOCOUNT ON    
IF (@action=0)
 BEGIN
	update user_data set SponsorId=0 where char_id=@user_id1 or char_id=@user_id2
 END
ELSE
 BEGIN
	update user_data set SponsorId=@user_id2 where char_id=@user_id1
	update user_data set SponsorId=@user_id1 where char_id=@user_id2
 END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UserSimpleLoad]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UserSimpleLoad]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_UserSimpleLoad]
(
 @char_id INT
)
AS
SET NOCOUNT ON   
SELECT ud.char_name, ud.Lev, ud.class, ud.gender, ud.race, ud.division,ISNULL((SELECT char_name  FROM user_data (nolock)  WHERE char_id = ud.SponsorId), ''''),ISNULL(ud.nickname,''''),ud.pledge_group
	FROM (SELECT * FROM User_data (nolock) WHERE char_id = @char_id) AS ud
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_Err2]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_Err2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_Err2] 

 AS


declare @char_id int
declare @char_name nvarchar(50)
declare @lev int
declare @class int

declare @skill_class int
declare @skill_lev int
declare @skill_id int

declare user_cursor cursor for
select char_id, char_name, lev, class from user_data where account_id > 0

open user_cursor

fetch next from user_cursor
into @char_id, @char_name, @lev, @class

while @@fetch_status = 0
begin
	select @char_id, @char_name, @lev, @class
	declare skill_cursor cursor for
	select class, lev, skill_id from err_table2 where class = @class and lev <= @lev

	open skill_cursor

	fetch next from skill_cursor
	into @skill_class, @skill_lev, @skill_id

	while @@fetch_status = 0
	begin
		insert into user_skill ( char_id, skill_id, skill_lev, to_end_time )
		values ( @char_id, @skill_id , 1, 0 )

		fetch next from skill_cursor
		into @skill_class, @skill_lev, @skill_id
	end

	CLOSE skill_cursor
	DEALLOCATE skill_cursor

	fetch next from user_cursor
	into @char_id, @char_name, @lev, @class
end

close user_cursor
deallocate user_cursor


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_JoinPledgeMember]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_JoinPledgeMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.lin_JoinPledgeMember    Script Date: 2003-09-20 11:51:57 ******/
-- lin_JoinPledgeMember
-- by bert
-- mod by Vampire

CREATE PROCEDURE [dbo].[lin_JoinPledgeMember] (@pledge_id INT, @member_id INT,@division INT)
AS

SET NOCOUNT ON

DECLARE @ret INT,@plgrp INT

IF @division=-1 or @division=65535 or @division=4294967295
 BEGIN
   SELECT @plgrp=9,@division=-1
 END
ELSE IF @division=0
 BEGIN
   SELECT @plgrp=6
 END
ELSE IF @division=100 or @division=200
  BEGIN
     SELECT @plgrp=7
  END
ELSE
 BEGIN
   SELECT @plgrp=8
 END

BEGIN TRAN

UPDATE user_data
SET pledge_id = @pledge_id,division = @division, pledge_group = @plgrp
WHERE char_id = @member_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END
SELECT @ret
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetUserNickname]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetUserNickname]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetUserNickname    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE
[dbo].[lin_SetUserNickname] (@user_id INT, @nickname NVARCHAR(50))
AS

SET NOCOUNT ON

DECLARE @ret INT

UPDATE user_data
SET nickname = @nickname
WHERE char_id = @user_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @user_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_EnableChar]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_EnableChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_EnableChar    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_EnableChar
	Enable character
INPUT
	@char_name nvarchar(50),
	@account_id int
OUTPUT

return
made by
	young
date
	2002-12-6
	enable character
********************************************/
CREATE PROCEDURE [dbo].[lin_EnableChar]
(
@char_name nvarchar(50),
@account_id int
)
AS

SET NOCOUNT ON

declare @old_account_id int

select @old_account_id = account_id from user_data (nolock) where char_name = @char_name

if @old_account_id < 0
begin
	update user_data set account_id = @account_id where char_name = @char_name
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveCharacter]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveCharacter]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[lin_SaveCharacter]
(
	@subjob_id INT,
	@pledge_id INT,
	@class INT,
	@world INT,
	@xloc INT,
	@yloc INT,
	@zloc INT,
	@IsInVehicle INT,
	@HP FLOAT,
	@MP FLOAT,
	@max_HP FLOAT,
	@max_MP FLOAT,
	@SP INT,
	@Exp BIGINT,
	@Lev INT,
	@align INT,
	@PK INT,
	@duel INT,
	@pkpardon INT,
	@ST_underware INT, 
	@ST_right_ear INT, 
	@ST_left_ear INT, 
	@ST_neck INT, 
	@ST_right_finger INT, 
	@ST_left_finger INT, 
	@ST_head INT, 
	@ST_right_hand INT, 
	@ST_left_hand INT, 
	@ST_gloves INT, 
	@ST_chest INT, 
	@ST_legs INT, 
	@ST_feet INT, 
	@ST_back INT, 
	@ST_both_hand INT, 
	@Face_Index INT, 
	@Hair_Shape_Index INT, 
	@Hair_Color_Index INT, 
	@ssq_dawn_round INT,
	@char_id  INT,
	@subjob0_class INT, 
	@subjob1_class INT, 
	@subjob2_class INT, 
	@subjob3_class INT, 
	@CP FLOAT,
	@max_CP FLOAT,
	@ST_hair INT,
	@wedding INT ,
	@division INT,
	@pledge_group INT,
	@AcademyLev	INT,
	@KarmaOrig	INT,
	@PKdiff	INT,
	@ST_face	INT,
	@CursedTimeEquip	INT,
	@TitleColor	INT,
	@WeddingTelTime	INT,
	@ST_HairAll	INT,
	@ST_Agathon	INT,
	@ST_LeftBracelet	INT,
	@ST_RightBracelet	INT,
	@ST_Talisman1		INT,
	@ST_Talisman2		INT,
	@ST_Talisman3		INT,
	@ST_Talisman4		INT,
	@ST_Talisman5		INT,
	@ST_Talisman6		INT,
	@Souls	INT
)
AS

SET NOCOUNT ON

UPDATE 
	user_data 
SET
	subjob_id = @subjob_id,
	class= @class,
	world= @world,
	xloc= @xloc,
	yloc= @yloc,
	zloc= @zloc,
	IsInVehicle= @IsInVehicle,
	HP= @HP,
	MP= @MP,
	max_HP= @max_HP,
	max_MP= @max_MP,
	SP= @SP,
	Exp= @Exp,
	Lev= @Lev,
	align= @align,
	PK= @PK,
	duel= @duel,
	pkpardon= @pkpardon,
	ST_underware= @ST_underware, 
	ST_right_ear= @ST_right_ear, 
	ST_left_ear= @ST_left_ear, 
	ST_neck= @ST_neck, 
	ST_right_finger= @ST_right_finger, 
	ST_left_finger= @ST_left_finger, 
	ST_head= @ST_head, 
	ST_right_hand= @ST_right_hand, 
	ST_left_hand= @ST_left_hand, 
	ST_gloves= @ST_gloves, 
	ST_chest= @ST_chest, 
	ST_legs= @ST_legs, 
	ST_feet= @ST_feet, 
	ST_back= @ST_back, 
	ST_both_hand= @ST_both_hand,
	Face_Index= @Face_Index, 
	Hair_Shape_Index= @Hair_Shape_Index, 
	Hair_Color_Index= @Hair_Color_Index ,
	ssq_dawn_round = @ssq_dawn_round,
	subjob0_class = @subjob0_class, 
	subjob1_class = @subjob1_class, 
	subjob2_class = @subjob2_class, 
	subjob3_class = @subjob3_class, 
	cp = @CP,
	max_cp = @max_CP,
	ST_hair = @ST_hair,
	wedding = @wedding,
	division = @division,
	pledge_group = @pledge_group,
	AcademyLev = @AcademyLev,
	KarmaOrig = @KarmaOrig,
	PKdiff = @PKdiff,
	ST_face = @ST_face,
	CursedTimeEquip = @CursedTimeEquip,
	TitleColor = @TitleColor,
	WeddingTelTime = @WeddingTelTime,
	ST_left_bracelet = @ST_LeftBracelet,
	ST_right_bracelet = @ST_RightBracelet,
	ST_hairall = @ST_HairAll,
	ST_agathon = @ST_Agathon,
	souls = @Souls,
	talisman1 = @ST_Talisman1,
	talisman2 = @ST_Talisman2,
	talisman3 = @ST_Talisman3,
	talisman4 = @ST_Talisman4,
	talisman5 = @ST_Talisman5,
	talisman6 = @ST_Talisman6
WHERE 
	char_id= @char_id
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModChar]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

/****** Object:  Stored Procedure dbo.lin_ModChar    Script Date: 2003-09-20 11:51:59 ******/
/********************************************
lin_ModChar
	
INPUT
	@sp		int,
	@exp		bigint,
	@align		int,
	@pk		int,
	@pkpardon	int,
	@duel		int,
	@char_id	int,
	@level		int
OUTPUT
return
made by
	carrot
date
	2002-06-10
mod by Vampire 2008-04-06
********************************************/
CREATE PROCEDURE [dbo].[lin_ModChar]
(
	@sp		int,
	@exp		bigint,
	@level		int,
	@align		int,
	@pk		int,
	@pkpardon	int,
	@duel		int,
	@char_id	int
)
AS
SET NOCOUNT ON

update user_data set sp=@sp, exp=@exp, lev = @level,  align=@align, pk=@pk, pkpardon=@pkpardon, duel=@duel where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_EnableChar2]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_EnableChar2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_EnableChar2
	Enable character
INPUT
	@char_id int,
	@account_id int
OUTPUT

return
made by
	kks
date
	2004-08-07
	enable character
********************************************/
CREATE PROCEDURE [dbo].[lin_EnableChar2]
(
@char_id int,
@account_id int
)
AS

SET NOCOUNT ON

declare @old_account_id int

select @old_account_id = account_id from user_data (nolock) where char_id = @char_id

if @old_account_id < 0
begin
	update user_data set account_id = @account_id where char_id = @char_id
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DropItem]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DropItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DropItem    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_DropItem
	Drop item to ground 
	If item is equiped, it will be unequiped.
INPUT
	@char_id	INT,
	@item_id		 INT,
	@amount	INT,
	@stackable	TINYINT
	@unequip_position	TINYINT
		1 ST_underware 
		2 ST_right_ear 
		3 ST_left_ear 
		4 ST_neck     
		5 ST_right_finger 
		6 ST_left_finger 
		7 ST_head     
		8 ST_right_hand 
		9 ST_left_hand 
		10 ST_gloves   
		11 ST_chest    
		12 ST_legs     
		13 ST_feet     
		14 ST_back     
		15 ST_both_hand
OUTPUT
	char_id, item_id, amount
return
made by
	carrot
date
	2002-05-01
********************************************/
CREATE PROCEDURE [dbo].[lin_DropItem]
(
	@char_id	INT,
	@item_id		INT,
	@amount	INT,
	@stackable	TINYINT,
	@unequip_position	TINYINT
)
AS
SET NOCOUNT ON

DECLARE @item_id_new		INT
DECLARE @nAmountOld		INT

SET @nAmountOld = -1
SET @item_id_new = NULL

IF @unequip_position = 1  UPDATE user_data SET ST_underware = 0 WHERE char_id = @char_id AND ST_underware = @item_id
ELSE IF @unequip_position = 2  UPDATE user_data SET ST_right_ear = 0 WHERE char_id = @char_id AND ST_right_ear = @item_id
ELSE IF @unequip_position = 3  UPDATE user_data SET ST_left_ear = 0 WHERE char_id = @char_id AND ST_left_ear = @item_id
ELSE IF @unequip_position = 4  UPDATE user_data SET ST_neck = 0 WHERE char_id = @char_id AND ST_neck = @item_id
ELSE IF @unequip_position = 5  UPDATE user_data SET ST_right_finger = 0 WHERE char_id = @char_id AND ST_right_finger = @item_id
ELSE IF @unequip_position = 6  UPDATE user_data SET ST_left_finger = 0 WHERE char_id = @char_id AND ST_left_finger = @item_id
ELSE IF @unequip_position = 7  UPDATE user_data SET ST_head = 0 WHERE char_id = @char_id AND ST_head = @item_id
ELSE IF @unequip_position = 8  UPDATE user_data SET ST_right_hand = 0 WHERE char_id = @char_id AND ST_right_hand = @item_id
ELSE IF @unequip_position = 9  UPDATE user_data SET ST_left_hand = 0 WHERE char_id = @char_id AND ST_left_hand = @item_id
ELSE IF @unequip_position = 10  UPDATE user_data SET ST_gloves = 0 WHERE char_id = @char_id AND ST_gloves = @item_id
ELSE IF @unequip_position = 11  UPDATE user_data SET ST_chest = 0 WHERE char_id = @char_id AND ST_chest = @item_id
ELSE IF @unequip_position = 12  UPDATE user_data SET ST_legs = 0 WHERE char_id = @char_id AND ST_legs = @item_id
ELSE IF @unequip_position = 13  UPDATE user_data SET ST_feet = 0 WHERE char_id = @char_id AND ST_feet = @item_id
ELSE IF @unequip_position = 14  UPDATE user_data SET ST_back = 0 WHERE char_id = @char_id AND ST_back = @item_id
ELSE IF @unequip_position = 15  UPDATE user_data SET ST_both_hand = 0 WHERE char_id = @char_id AND ST_both_hand = @item_id


IF (@stackable = 1)
	BEGIN
		
		SELECT @nAmountOld = ISNULL(amount, 0) FROM user_item WHERE char_id = @char_id AND item_id =@item_id 
		IF @nAmountOld = @amount
			UPDATE user_item SET char_id = 0  WHERE item_id = @item_id 
		ELSE IF @nAmountOld IS NULL OR @nAmountOld = -1
			RETURN
		ELSE
		BEGIN
			UPDATE user_item SET amount = amount - @amount WHERE char_id = @char_id AND item_id =@item_id AND warehouse = 0
			INSERT INTO user_item 
			(char_id , item_type , amount , enchant , eroded , bless , ident , wished , warehouse) 
			SELECT 0, item_type, @amount, enchant, eroded, bless, ident, wished, warehouse FROM user_item WHERE  char_id = @char_id AND item_id = @item_id AND warehouse = 0
			SET @item_id_new = @@IDENTITY
		END

		SELECT char_id, item_id, amount FROM user_item WHERE item_id IN  (@item_id, @item_id_new )
	END
ELSE
	BEGIN
		--DELETE user_item WHERE char_id = @char_id AND item_id = @item_id 
		 UPDATE user_item SET char_id = 0, warehouse = 0  WHERE char_id = @char_id AND item_id = @item_id 

		SELECT char_id, item_id, amount FROM user_item WHERE item_id = @item_id
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DisableChar]    Script Date: 02/08/2011 16:50:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DisableChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DisableChar    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DisableChar
	disable character
INPUT
	@char_name nvarchar(50)
OUTPUT

return
made by
	young
date
	2002-11-30
	disable character
********************************************/
CREATE PROCEDURE [dbo].[lin_DisableChar]
(
@char_name nvarchar(50)
)
AS

SET NOCOUNT ON

update user_data set account_id = -2 where char_name = @char_name



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPledgeMember]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPledgeMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************  
lin_LoadPledgeMember  
   
INPUT  
 pledge_id = @pledge_id  
OUTPUT  
return  
made by  
 carrot  
date  
 2002-06-10  
change 2003-07-22 carrot  
 check character is deleted.  
********************************************/  
CREATE PROCEDURE [dbo].[lin_LoadPledgeMember]  
(  
 @pledge_id  int  
)  
AS  
SET NOCOUNT ON  
  
IF (@pledge_id > 0)
SELECT TOP 140 char_id FROM user_data (nolock) WHERE pledge_id = @pledge_id and account_id > 0
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetUserSSQDawnRound]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetUserSSQDawnRound]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/**  
  * @procedure lin_SetUserSSQDawnRound  
  * @brief SSQ ?? ?? ??  
  *  
  * @date 2004/12/17  
  * @author Seongeun Park  <sonai@ncsoft.net>  
  */  
CREATE PROCEDURE [dbo].[lin_SetUserSSQDawnRound]  
(  
 @char_id  INT,  
 @ssq_dawn_round INT  
)  
AS  
SET NOCOUNT ON  
  
UPDATE user_data SET ssq_dawn_round = @ssq_dawn_round WHERE char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadLastLogout]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadLastLogout]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_LoadLastLogout
	load char last logout
INPUT
	char_id	int

OUTPUT
return
made by
	carrot
date
	2003-12-1
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadLastLogout]
(
@char_id		INT

)
AS
SET NOCOUNT ON


select Year(logout), Month(logout), Day(logout), DATEPART(HOUR, logout), DATEPART(mi, logout), DATEPART(s, logout),
Year(login), Month(login), Day(login), DATEPART(HOUR, login), DATEPART(mi, login), DATEPART(s, login),
Year(create_date), Month(create_date), Day(create_date), DATEPART(HOUR, create_date), DATEPART(mi, create_date), DATEPART(s, create_date)
from user_data (nolock) where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CheckCursedWeapon]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CheckCursedWeapon]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_CheckCursedWeapon]
(
	@cursed_id	INT
)
AS
SET NOCOUNT ON 
SELECT TOP 1 ui.item_id,ud.CursedTimeEquip, ud.PKdiff, ud.char_id FROM user_item ui LEFT JOIN user_data ud ON (ui.char_id = ud.char_id) WHERE item_type=@cursed_id AND ui.char_id > 0
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateSubJob]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateSubJob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_CreateSubJob]
(
	@char_id	INT,
	@new_subjob_id TINYINT,
	@new_class	TINYINT,
	@old_subjob_id	TINYINT,
	@hp		FLOAT,
	@mp		FLOAT,
	@sp		INT,
	@exp		BIGINT,
	@level		TINYINT,
	@henna_1	INT,
	@henna_2	INT,
	@henna_3	INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 0
-- transaction on
BEGIN TRAN

IF @new_subjob_id = 1
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id
ELSE IF @new_subjob_id = 2
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id
ELSE IF @new_subjob_id = 3
	UPDATE user_data SET subjob1_class = @new_class WHERE char_id = @char_id

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

-- save old class

IF @old_subjob_id = 0 AND (NOT EXISTS(SELECT char_id FROM user_subjob WHERE char_id = @char_id AND subjob_id = 0))
BEGIN
	DECLARE @original_date DATETIME
	SELECT @original_date = create_date FROM user_data(NOLOCK) WHERE char_id = @char_id
	INSERT INTO user_subjob
	(char_id, subjob_id, hp, mp, sp, exp, level, henna_1, henna_2, henna_3, create_date)
	VALUES
	(@char_id, 0, @hp, @mp, @sp, @exp, @level, @henna_1, @henna_2, @henna_3, @original_date)
END

UPDATE user_subjob
SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
	henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
WHERE char_id = @char_id AND subjob_id = @old_subjob_id

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

-- create new class
INSERT INTO user_subjob (char_id, subjob_id, create_date) VALUES (@char_id, @new_subjob_id, GETDATE())
IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @new_subjob_id
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadFriends]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadFriends]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_LoadFriends] (@char_id INT)  
AS  
  
SET NOCOUNT ON  
  
SELECT friend_char_id, ud.char_name AS friend_char_name   
FROM user_friend AS uf, user_data AS ud  
WHERE uf.char_id = @char_id AND uf.friend_char_id = ud.char_id AND ud.account_id <> -1  
  



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetDBIDByCharName]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetDBIDByCharName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************    
lin_GetDBIDByCharName  
 Get user id  
INPUT    
 @charname nvarchar(50),    
OUTPUT    
    
return    
made by    
 carrot    
date    
 2004-02-22  
********************************************/    
CREATE PROCEDURE [dbo].[lin_GetDBIDByCharName]  
(    
 @char_name nvarchar(50)  
)    
AS    
SET NOCOUNT ON    
  
SELECT TOP 1 char_id FROM user_data WHERE char_name = @char_name  
  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_WithdrawPledgeMember]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_WithdrawPledgeMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_WithdrawPledgeMember    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_WithdrawPledgeMember
-- by bert

CREATE PROCEDURE
[dbo].[lin_WithdrawPledgeMember] (@pledge_id INT, @member_id INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

UPDATE user_data
SET pledge_id = 0
WHERE char_id = @member_id
AND pledge_id = @pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	-- ???? ??? ???
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END
SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetHeroByClassId]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetHeroByClassId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetHeroByClassId]
	@class_id	int
AS
SELECT un.char_id  
FROM user_nobless un, user_data ud 
WHERE un.char_id = ud.char_id 
	AND un.hero_type <> 0 
	AND ud.subjob0_class = @class_id
ORDER BY win_count DESC




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddPunishmentHistory]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddPunishmentHistory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_AddPunishmentHistory
	Add Punishment Histroy to user_history
INPUT
	@char_name	NVARCHAR(24),
	@char_id	INT,
	@log_type	TINYINT,
	@account_name	NVARCHAR(24)
OUTPUT
	
return
made by
	zzangse
date
	2005-08-31			created by zzangse
********************************************/
CREATE  PROCEDURE [dbo].[lin_AddPunishmentHistory] 
(
	@char_name	NVARCHAR(24),
	@char_id	INT,
	@log_type	TINYINT,
	@account_name	NVARCHAR(24)
)
AS

SET NOCOUNT ON  
SET @char_name = RTRIM(@char_name)  
DECLARE @create_date datetime

SELECT
	@create_date = create_date
FROM user_data
WHERE char_id = @char_id

if @char_id>0
begin  
 -- make user_history  
 exec lin_InsertUserHistory @char_name, @char_id, @log_type, @account_name, @create_date 
end




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddUserLog]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddUserLog]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_AddUserLog
	
INPUT	
	@char_id	int,
	@log_id		int,
	@log_from	int,
	@log_to		int,
	@use_time	int,
	@subjob_id	int
OUTPUT
return
made by
	carrot
date
	2002-06-16
modified by 
	kks
date
	2005-01-17	
modified by
	btwinuni
date
	2005-10-24
********************************************/
CREATE PROCEDURE [dbo].[lin_AddUserLog]
(
	@char_id	int,
	@log_id		int,
	@log_from	int,
	@log_to		int,
	@use_time	int,
	@subjob_id	int = -1
)
AS
SET NOCOUNT ON


if @subjob_id < 0
begin
	SELECT @subjob_id = subjob_id FROM user_data(NOLOCK) WHERE char_id = @char_id
end

insert into user_log(char_id, log_id, log_from, log_to, use_time, subjob_id) values(@char_id, @log_id, @log_from, @log_to, @use_time, @subjob_id)




' 
END
GO
/****** Object:  StoredProcedure [dbo].[spCopyXYZlocForDummy]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[spCopyXYZlocForDummy]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.spCopyXYZlocForDummy    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[spCopyXYZlocForDummy] (@nSrc INT, @nDest INT, @nCount INT)
AS

DECLARE @i INT
DECLARE @xloc INT
DECLARE @yloc INT
DECLARE @zloc INT

SELECT @i = 0

WHILE @i < @nCount
BEGIN

SELECT @xloc = xloc, @yloc = yloc, @zloc = zloc
FROM user_data
WHERE char_name = ''dummy0'' + STR(@nSrc + @i, 4)

UPDATE user_data
SET xloc = @xloc, yloc = @yloc, zloc = @zloc
WHERE char_name = ''dummy0'' + STR(@nDest + @i, 4)

SELECT @i = @i + 1

END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeCharacterLocation]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeCharacterLocation]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ChangeCharacterLocation    Script Date: 2003-09-20 ?? 11:51:56 ******/
/********************************************
lin_ChangeCharacterLocation
	Set Character location
INPUT
	@char_name	nvarchar,
	@nWorld		SMALLINT,
	@nX		INT,
	@nY		INT,
	@nZ		INT
OUTPUT
	char_id
return
made by
	carrot
date
	2002-07-02
********************************************/
CREATE PROCEDURE [dbo].[lin_ChangeCharacterLocation]
(
	@char_name	NVARCHAR(24),
	@nWorld		INT,
	@nX		INT,
	@nY		INT,
	@nZ		INT
)
AS

SET NOCOUNT ON

DECLARE @Char_id INT
SET @Char_id = 0

UPDATE user_data SET world = @nWorld, xLoc = @nX , yLoc = @nY , zLoc = @nZ WHERE char_name = @char_name
IF @@ROWCOUNT > 0
BEGIN
	SELECT @Char_id = char_id FROM user_data WHERE char_name = @char_name
END

SELECT @Char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeCharacterName2]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeCharacterName2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_ChangeCharacterName2
	change character name
INPUT
	@char_id	int,
	@old_char_name	nvarchar,
	@new_char_name	nvarchar
OUTPUT
	char_id
return
made by
	kks
date
	2004-12-21
********************************************/
CREATE PROCEDURE [dbo].[lin_ChangeCharacterName2]
(
	@char_id		INT,
	@old_char_name	NVARCHAR(24),
	@new_char_name	NVARCHAR(24)
)
AS

SET NOCOUNT ON

DECLARE @nTmpCount INT
DECLARE @account_name NVARCHAR(50)
DECLARE @create_date datetime

DECLARE @ret_char_id INT
SET @ret_char_id = 0

IF not exists(SELECT char_name FROM user_data WHERE char_name = @new_char_name and char_id != @char_id)
BEGIN
	UPDATE user_data set char_name = @new_char_name where char_name = @old_char_name
	
	IF @@ROWCOUNT > 0
	BEGIN
		SELECT @char_id = char_id , @account_name = account_name, @create_date = create_date  FROM user_data WHERE char_name = @new_char_name
	
		-- make user_history
		exec lin_InsertUserHistory @new_char_name, @char_id, 3, @account_name, @create_date

		set @ret_char_id = @char_id
	END
END

SELECT @ret_char_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeCharacterName]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeCharacterName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_ChangeCharacterName    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_ChangeCharacterName
	change character name
INPUT
	@old_char_name	nvarchar,
	@new_char_name	nvarchar
OUTPUT
	char_id
return
made by
	young
date
	2002-010-08
********************************************/
CREATE PROCEDURE [dbo].[lin_ChangeCharacterName]
(
	@old_char_name	NVARCHAR(24),
	@new_char_name	NVARCHAR(24)
)
AS

SET NOCOUNT ON

DECLARE @Char_id INT
DECLARE @nTmpCount INT
DECLARE @account_name NVARCHAR(50)
DECLARE @create_date datetime

SET @Char_id = 0

IF not exists(SELECT char_name FROM user_data WHERE char_name = @new_char_name)
BEGIN
	UPDATE user_data set char_name = @new_char_name where char_name = @old_char_name
	IF @@ROWCOUNT > 0
	BEGIN
		SELECT @char_id = char_id , @account_name = account_name, @create_date = create_date  FROM user_data WHERE char_name = @new_char_name
	END
END

SELECT @Char_id

if @char_id > 0
begin
	-- make user_history
	exec lin_InsertUserHistory @new_char_name, @char_id, 3, @account_name, @create_date
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_RefreshCharacterByName]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_RefreshCharacterByName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_RefreshCharacterByName    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_RefreshCharacterByName
	
INPUT
	@CharName		NVARCHAR(50)
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_RefreshCharacterByName]
(
	@CharName		NVARCHAR(50)
)
AS
SET NOCOUNT ON

SELECT 
	char_id, account_name, account_id, pledge_id, builder, gender, race, class, world, xloc, yloc, zloc, 
	HP, MP, SP, Exp, Lev, align, PK, duel, pkpardon, 
	ST_underware, ST_right_ear, ST_left_ear, ST_neck, ST_right_finger, ST_left_finger, ST_head, ST_right_hand, ST_left_hand, ST_gloves, ST_chest, ST_legs, ST_feet, ST_back, ST_both_hand 
FROM user_data (nolock)  
WHERE char_name = @CharName




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_OustPledgeMember]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_OustPledgeMember]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_OustPledgeMember    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_OustPledgeMember
-- by bert
-- return ousted member id
CREATE PROCEDURE [dbo].[lin_OustPledgeMember]
(
	@pledge_id	INT,
	@char_name	NVARCHAR(50)
)
AS

DECLARE @ret INT
DECLARE @char_id INT

SELECT @char_id = char_id
FROM user_data
WHERE char_name = @char_name

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
BEGIN
	SELECT @ret = 0
	GOTO EXIT_PROC
END

SET NOCOUNT ON

BEGIN TRAN

UPDATE user_data
SET pledge_id = 0
WHERE char_id = @char_id AND pledge_id = @pledge_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = @char_id
	-- ???? ??? ??? ????.
END
ELSE
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

EXIT_PROC:
SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeSubJobBySubJobId]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeSubJobBySubJobId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_ChangeSubJobBySubJobId
	get temp mail 
INPUT
	@char_id		int,
	@subjob_id		int
OUTPUT
return
made by
	kks
date
	2005-04-06
	2005-09-07	modified by btwinuni
********************************************/
CREATE PROCEDURE [dbo].[lin_ChangeSubJobBySubJobId]
(
	@char_id		int,
	@subjob_id		int
)
AS
SET NOCOUNT ON


IF EXISTS(SELECT TOP 1 char_id FROM user_data(NOLOCK) WHERE char_id = @char_id AND subjob_id = @subjob_id)
BEGIN
	RETURN
END

-- update subjob char property
UPDATE 	user_subjob 
SET hp = R.hp,
	mp = R.mp,
	sp = R.sp,
	exp = R.exp,
	level = R.lev
FROM ( SELECT hp, mp, sp, exp, lev, subjob_id FROM user_data(nolock) WHERE  char_id = @char_id ) AS R
WHERE user_subjob.char_id = @char_id
	AND user_subjob.subjob_id = R.subjob_id


-- update subjob char henna
UPDATE user_subjob
SET henna_1 = R.henna_1,
	henna_2 = R.henna_2,
	henna_3 = R.henna_3
FROM ( SELECT henna_1, henna_2, henna_3 FROM user_henna(nolock) WHERE char_id = @char_id ) AS R
WHERE user_subjob.char_id = @char_id
	AND user_subjob.subjob_id = @subjob_id


-- update user data property
UPDATE 	user_data
SET hp = R.hp,
	mp = R.mp,
	sp = R.sp,
	exp = R.exp,
	lev = R.level,
	subjob_id = @subjob_id
FROM ( SELECT hp, mp, sp, exp, level FROM user_subjob(nolock) WHERE char_id = @char_id AND subjob_id = @subjob_id ) AS R
WHERE user_data.char_id = @char_id

declare @sql varchar(1000)
set @sql = ''update user_data ''
	+ '' set class = subjob'' + cast(@subjob_id as varchar) + ''_class ''
	+ '' where char_id = '' + cast(@char_id as varchar)
exec (@sql)


-- update char henna
UPDATE user_henna
SET henna_1 = R.henna_1,
	henna_2 = R.henna_2,
	henna_3 = R.henna_3
FROM ( SELECT henna_1, henna_2, henna_3 FROM user_subjob(nolock) WHERE char_id = @char_id AND subjob_id = @subjob_id ) AS R
WHERE user_henna.char_id = @char_id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteFriends]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteFriends]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DeleteFriends    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_DeleteFriends
-- by bert
-- return deleted friend id set

CREATE PROCEDURE [dbo].[lin_DeleteFriends] (@char_id INT)
AS

SET NOCOUNT ON

SELECT friend_char_id FROM user_friend WHERE char_id = @char_id

DELETE FROM user_friend
WHERE char_id = @char_id OR friend_char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_EstablishFriendship]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_EstablishFriendship]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_EstablishFriendship    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_EstablishFriendship
-- by bert

CREATE PROCEDURE [dbo].[lin_EstablishFriendship] (@char_id INT, @char_name VARCHAR(50), @friend_char_id INT, @friend_char_name VARCHAR(50))
AS

SET NOCOUNT ON

DECLARE @ret INT

BEGIN TRAN

INSERT INTO user_friend
(char_id, friend_char_id, friend_char_name)
VALUES
(@char_id, @friend_char_id, @friend_char_name)

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

INSERT INTO user_friend
(char_id, friend_char_id, friend_char_name)
VALUES
(@friend_char_id, @char_id, @char_name)

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:

IF @ret <> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_BreakFriendship]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_BreakFriendship]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_BreakFriendship    Script Date: 2003-09-20 ?? 11:51:58 ******/
-- lin_BreakFriendship
-- by bert

CREATE PROCEDURE [dbo].[lin_BreakFriendship] (@char_id INT, @friend_char_id INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

DELETE FROM user_friend
WHERE
(char_id = @char_id AND friend_char_id = @friend_char_id)
OR
(char_id = @friend_char_id AND friend_char_id = @char_id)

IF @@ERROR = 0 AND @@ROWCOUNT = 2
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

SELECT @ret


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadHenna]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadHenna]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_LoadHenna]
(        
@char_id INT
)        
AS    
SET NOCOUNT ON        

SELECT  henna_1, henna_2, henna_3 FROM user_henna WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveHenna]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveHenna]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveHenna]
(        
@char_id INT,
@henna_1 INT,
@henna_2 INT,
@henna_3 INT
)        
AS  
SET NOCOUNT ON        

IF EXISTS(SELECT * FROM user_henna WHERE char_id = @char_id)
BEGIN
	UPDATE user_henna SET henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3 
	WHERE char_id = @char_id
END
ELSE
BEGIN
	INSERT INTO user_henna (char_id, henna_1, henna_2, henna_3)
	VALUES (@char_id, @henna_1, @henna_2, @henna_3)
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertUserHistory]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertUserHistory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'







/****** Object:  Stored Procedure dbo.lin_InsertUserHistory    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_InsertUserHistory
	make user history log
INPUT
	@char_name	nvarchar(50),
	@char_id	int,
	@log_action	tinyint,
	@account_name	nvarchar(50),
	@create_date		datetime
OUTPUT
return
made by
	young
date
	2003-1-14
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertUserHistory]
(
	@char_name	nvarchar(50),
	@char_id	int,
	@log_action	tinyint,
	@account_name	nvarchar(50),
	@create_date		datetime
)
AS
SET NOCOUNT ON

declare @create_date2 datetime

if @create_date is NULL
begin
	set @create_date2 = getdate()
end
else
begin
	set @create_date2 = @create_date
end
insert into user_history( char_name, char_id, log_action, account_name, create_date) values
( @char_name, @char_id, @log_action, @account_name, @create_date2)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SeizeItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SeizeItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'






/****** Object:  Stored Procedure dbo.lin_SeizeItem    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SeizeItem
	
INPUT
	@option	INT,
	@warehouse	INT,
	@item_id	INT
OUTPUT
return
made by
	young
date
	2003-06-25
	2004-5-21 modified by young
********************************************/
CREATE PROCEDURE [dbo].[lin_SeizeItem]
(
@option	INT,
@warehouse	INT,
@item_id	INT
)
AS
SET NOCOUNT ON


if @option = 1
	update user_item set warehouse = 1001 where item_id = @item_id
else if @option = 2
	update user_item set warehouse = @warehouse where item_id = @item_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SeizeItem2]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SeizeItem2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SeizeItem2
	
INPUT
	@option	INT,
	@warehouse	INT,
	@item_id	INT
OUTPUT
return
made by
	young
date
	2004-6-22 
********************************************/
CREATE PROCEDURE [dbo].[lin_SeizeItem2]
(
@option	INT,
@warehouse	INT,
@item_id	INT
)
AS
SET NOCOUNT ON

update user_item set warehouse = @warehouse where item_id = @item_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetPledgeAdena ]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetPledgeAdena ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetPledgeAdena
	Get pledge adena
INPUT
	@pledge_id	INT
OUTPUT
return
made by
	young
date
	2003-12-11
********************************************/
CREATE PROCEDURE [dbo].[lin_GetPledgeAdena ]
(
	@pledge_id	INT
)

as

set nocount on

select isnull( sum(amount) , 0) from user_item (nolock) where warehouse = 2 and char_id = @pledge_id and item_type = 57


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadItems]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadItems]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
/********************************************
lin_LoadItems
 Load item data and check adena data
INPUT  
 @char_id INT,
 @warehouse  INT
OUTPUT
 item_id, item_type, amount, enchant, eroded, bless, ident, wished  
return
made by
 carrot
date
 2002-04-23
//const WCHAR* qsLoadItems = L"SELECT item_id, item_type, amount, enchant, eroded, bless, ident, wished FROM user_item WHERE char_id = %d AND warehouse = %d AND (NOT item_type = 0) AND NOT ITEM_TYPE = 57";
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadItems]
(
 @char_id INT,
 @warehouse INT
)
AS
SET NOCOUNT ON

DECLARE @nSum  INT
DECLARE @nCount INT

SET @nSum = 0
SET @nCount = 0


--SELECT @nCount = count(amount), @nSum = sum(amount) FROM user_item WHERE char_id = @char_id AND item_type = 57 AND warehouse = @warehouse  
--IF @nCount > 1  
--BEGIN  
-- DECLARE @nMaxItemId INT  
-- SELECT @nMaxItemId = Max(item_id) FROM user_item WHERE char_id = @char_id AND item_type = 57 AND warehouse = @warehouse  
-- IF @nMaxItemId > 0   
-- BEGIN  
--  UPDATE user_item Set amount = @nSum WHERE char_id = @char_id AND item_type = 57 AND warehouse = @warehouse And item_id = @nMaxItemId  
--  DELETE user_item WHERE char_id = @char_id AND item_type = 57 AND warehouse = @warehouse And NOT item_id = @nMaxItemId  
-- END  
--END  
  
SELECT item_id, item_type, amount, enchant, eroded, bless, ident, wished, attack_attr_type, attack_attr_value, def_attr_fire, def_attr_water, def_attr_wind, def_attr_earth, def_attr_holy, def_attr_unholy FROM user_item (nolock) WHERE char_id = @char_id AND warehouse = @warehouse  AND item_type > 0

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateUserItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateUserItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[lin_UpdateUserItem]
(
@char_id	INT,
@item_type	INT,
@amount	INT,
@enchant	INT,
@eroded	INT,
@bless		INT,
@ident		INT,
@wished	INT,
@warehouse	INT,
@item_id		INT,
@attack_attr_type	TINYINT,
@attack_attr_value	INT,
@def_attr_fire	INT,
@def_attr_water	INT,
@def_attr_wind	INT,
@def_attr_earth	INT,
@def_attr_holy	INT,
@def_attr_unholy	INT
)
AS
SET NOCOUNT ON

UPDATE user_item  set char_id=@char_id, item_type=@item_type, amount=@amount, enchant=@enchant, eroded=@eroded, bless=@bless, ident=@ident, wished=@wished, warehouse=@warehouse, attack_attr_type=@attack_attr_type, attack_attr_value=@attack_attr_value, def_attr_fire=@def_attr_fire, def_attr_water=@def_attr_water, def_attr_wind=@def_attr_wind, def_attr_earth=@def_attr_earth, def_attr_holy=@def_attr_holy, def_attr_unholy=@def_attr_unholy WHERE item_id=@item_id

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DepositBank]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DepositBank]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DepositBank    Script Date: 2003-09-20 ?? 11:51:57 ******/
CREATE PROCEDURE [dbo].[lin_DepositBank]
(
	@oldItemId int,
	@nAmount int,
	@warehouse int
)
AS

SET NOCOUNT ON

declare @newItemId int

IF @nAmount > 0 
BEGIN
	insert into user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse)
	select char_id, item_type, @nAmount, enchant, eroded, bless, ident, wished, @warehouse from user_item where item_id = @oldItemId
	set @newItemId = @@identity
	update user_item set amount = amount - @nAmount where item_id = @oldItemId
	select @newItemId
END
ELSE IF @nAmount = 0
BEGIN
	SELECT 0
END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************  
lin_DeleteItem  
   
INPUT  
 @item_id  INT  
OUTPUT  
return  
made by  
 carrot  
date  
 2002-06-10  
********************************************/  
CREATE PROCEDURE [dbo].[lin_DeleteItem]  
(  
 @item_id  INT  
)  
AS  
SET NOCOUNT ON  
  
SET NOCOUNT ON   
DECLARE @item_check int
DELETE user_item WHERE item_id=@item_id
SELECT @item_check=COUNT(char_id) FROM user_item WHERE item_id=@item_id
IF @item_check = 0
SELECT 1
ELSE
SELECT 0

  
  




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_CreateItem]
(
@char_id	INT,
@item_type 	INT,
@amount 	INT,
@enchant 	INT,
@eroded 	INT,
@bless 		INT,
@ident 		TINYINT,
@wished 	TINYINT,
@warehouse	INT,
@attack_attr_type	TINYINT,
@attack_attr_value	INT,
@def_attr_fire	INT,
@def_attr_water	INT,
@def_attr_wind	INT,
@def_attr_earth	INT,
@def_attr_holy	INT,
@def_attr_unholy	INT
)
AS
SET NOCOUNT ON

insert into user_item 
	(char_id , item_type , amount , enchant , eroded , bless , ident , wished , warehouse,attack_attr_type, attack_attr_value, def_attr_fire, def_attr_water, def_attr_wind, def_attr_earth, def_attr_holy, def_attr_unholy) 
	values 
	(@char_id, @item_type , @amount , @enchant , @eroded , @bless , @ident , @wished , @warehouse,@attack_attr_type, @attack_attr_value, @def_attr_fire, @def_attr_water, @def_attr_wind, @def_attr_earth, @def_attr_holy, @def_attr_unholy)

SELECT @@IDENTITY
' 
END
GO
/****** Object:  StoredProcedure [dbo].[LIN_MakeNewBlankItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIN_MakeNewBlankItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[LIN_MakeNewBlankItem]
AS

SET NOCOUNT ON

declare @newItemId int

insert into user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse,attack_attr_type,attack_attr_value,def_attr_fire,def_attr_water,def_attr_wind,def_attr_earth,def_attr_holy,def_attr_unholy)
values(0,0,0,0,0,0,0,0,0,254,0,0,0,0,0,0,0)

SET @newItemId = @@IDENTITY
select @newItemId

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadPetItems]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadPetItems]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_LoadPetItems]
(
	@pet_id 	INT
)
AS
SET NOCOUNT ON

SELECT item_id, item_type, amount, enchant, eroded, bless, ident, wished, attack_attr_type, attack_attr_value, def_attr_fire, def_attr_water, def_attr_wind, def_attr_earth, def_attr_holy, def_attr_unholy FROM user_item WHERE char_id = @pet_id  AND warehouse = 5

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadItemByItemId]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadItemByItemId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_LoadItemByItemId]
(
	@item_id		INT
)
AS
SET NOCOUNT ON

SELECT char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse, attack_attr_type, attack_attr_value, def_attr_fire, def_attr_water, def_attr_wind, def_attr_earth, def_attr_holy, def_attr_unholy FROM user_item (nolock) WHERE item_id = @item_id AND (NOT item_type = 0)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModItemOwner]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModItemOwner]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_ModItemOwner
	
INPUT
	@item_id	INT,
	@new_char_id	INT,
	@new_warehouse	INT
OUTPUT
return
made by
	young
date
	2003-11-07
********************************************/
CREATE PROCEDURE [dbo].[lin_ModItemOwner]
(
@item_id	INT,
@new_char_id 	INT,
@new_warehouse	INT

)
AS
SET NOCOUNT ON

UPDATE user_item  set char_id=@new_char_id,  warehouse=@new_warehouse WHERE item_id=@item_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Lin_EnchantItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Lin_EnchantItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'





/****** Object:  Stored Procedure dbo.Lin_EnchantItem    Script Date: 2003-09-20 ?? 11:51:56 ******/
/********************************************
Lin_EnchantItem
	enchant item
INPUT
	@char_id	INT,
	@item_id 	INT,
	@target_item_id 	INT,
	@nEnchantNum 	INT
	@bZeorDelete 	INT = 0
OUTPUT
	@nResultAmount	INT
return
made by
	carrot
date
	2002-10-14
********************************************/
CREATE PROCEDURE [dbo].[Lin_EnchantItem]
(
	@char_id	INT,
	@item_id 	INT,
	@target_item_id 	INT,
	@nEnchantNum 	INT,
	@bZeorDelete 	INT = 0
)
AS
SET NOCOUNT ON

DECLARE @nResultAmount 	INT
SET @nResultAmount = -1

UPDATE user_item SET amount = amount -1 WHERE char_id = @char_id AND item_id = @item_id
UPDATE user_item SET enchant = enchant + @nEnchantNum WHERE char_id = @char_id AND item_id = @target_item_id

IF NOT @@ROWCOUNT = 1 
	SELECT -1
ELSE
BEGIN
	
	SELECT @nResultAmount = ISNULL(amount, -1) FROM user_item WHERE char_id = @char_id AND item_id = @item_id
	IF ( @nResultAmount = 0 AND @bZeorDelete = 1) 
	BEGIN
		UPDATE user_item SET char_id = 0 WHERE char_id = @char_id AND item_id = @item_id
	END

	SELECT @nResultAmount
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[STAT_ITEM_ACC]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[STAT_ITEM_ACC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[STAT_ITEM_ACC]      
AS        
BEGIN        
        
TRUNCATE TABLE LIN2AUDIT..STAT_ITEM_CNT      
TRUNCATE TABLE LIN2AUDIT..STAT_ITEM_ENT        
TRUNCATE TABLE LIN2AUDIT..STAT_ITEM_MENT        
TRUNCATE TABLE LIN2AUDIT..STAT_ITEM_MINCNT        
        
--1. ?? ??? ???? ???? ??? ??        
--================================================================================================================================      
DECLARE @LAST_ITEM_TYPE INT      
DECLARE @SQL    VARCHAR(1000)      
      
DECLARE ITEM_TYPE_CURSOR CURSOR      
 FOR SELECT TOP 1 ITEM_TYPE FROM USER_ITEM ORDER BY ITEM_TYPE DESC      
OPEN ITEM_TYPE_CURSOR      
FETCH NEXT FROM ITEM_TYPE_CURSOR      
INTO @LAST_ITEM_TYPE      
WHILE @@FETCH_STATUS = 0      
BEGIN      
      
DECLARE @I VARCHAR(10)      
SET @I = 1      
WHILE (@I < @LAST_ITEM_TYPE)      
BEGIN      
 SET @SQL = ''INSERT INTO LIN2AUDIT..STAT_ITEM_CNT ''      
 SET @SQL = @SQL + ''SELECT ''+@I+'' AS ITEM_TYPE, COUNT(*) AS ''''??? ???'''', SUM(CAST(AMOUNT AS BIGINT))  AS ''''??? ??'''' ''      
 SET @SQL = @SQL + ''FROM USER_ITEM WITH (NOLOCK) WHERE ITEM_TYPE = ''+@I+''''      
 EXEC (@SQL)      
 SET @I = @I + 1      
END      
      
FETCH NEXT FROM ITEM_TYPE_CURSOR      
INTO @LAST_ITEM_TYPE      
END      
CLOSE ITEM_TYPE_CURSOR      
DEALLOCATE ITEM_TYPE_CURSOR      
--================================================================================================================================      
       
---------------------------------------------------------------        
--2. ?? ??? ???? +1 ??? ???? ???? ? ??        
        
INSERT INTO LIN2AUDIT..STAT_ITEM_ENT        
 SELECT ITEM_TYPE, ENCHANT , COUNT(ITEM_TYPE)  AS ''??? ???'', SUM(AMOUNT) AS ''??? ??''        
 FROM USER_ITEM WITH (NOLOCK)         
 WHERE ENCHANT >0        
 GROUP BY ITEM_TYPE, ENCHANT        
 ORDER BY ITEM_TYPE, ENCHANT ASC        
        
----------------------------------------------------------------        
--3. ?? ???? ???? ?? ?? ???? unique_id         
INSERT INTO LIN2AUDIT..STAT_ITEM_MENT        
 SELECT T2.ITEM_TYPE, T2.ITEM_ID, UD.CHAR_NAME, T2.ME,  UD.BUILDER        
 FROM      
 (        
 SELECT UI.CHAR_ID AS CHAR_ID ,UI.ITEM_TYPE AS ITEM_TYPE, UI.ITEM_ID AS ITEM_ID, t.MAX_ENCHANT AS ME        
 FROM USER_ITEM AS UI INNER JOIN         
 (         
 SELECT ITEM_TYPE, MAX(ENCHANT) AS MAX_ENCHANT        
 FROM USER_ITEM WITH (NOLOCK)        
 WHERE ENCHANT >0        
 GROUP BY ITEM_TYPE        
         
 ) AS T        
 on UI.ITEM_TYPE = T.ITEM_TYPE AND UI.ENCHANT = T.MAX_ENCHANT         
 --ORDER BY UI.ITEM_TYPE        
 ) AS T2 INNER JOIN USER_DATA AS UD        
 on T2.CHAR_ID = UD.CHAR_ID        
 WHERE UD.ACCOUNT_ID<>-1        
 ORDER BY T2.ITEM_TYPE        
      
------------------------------------------------------------------        
        
--4. 1??? ??? ?? ??? ? ??? 10??? ???? unique_id        
INSERT INTO LIN2AUDIT..STAT_ITEM_MINCNT        
 SELECT  ITEM_TYPE , ITEM_ID        
 FROM USER_ITEM        
 WHERE ITEM_TYPE in (SELECT ITEM_TYPE        
   FROM USER_ITEM WITH (NOLOCK)         
   GROUP BY ITEM_TYPE        
   HAVING COUNT(ITEM_TYPE)<11)        
 ORDER BY ITEM_TYPE        
        
--====================================================================        
        
TRUNCATE TABLE LIN2AUDIT..STAT_ACC_RACE      
TRUNCATE TABLE LIN2AUDIT..STAT_ACC_CLASS        
TRUNCATE TABLE LIN2AUDIT..STAT_ACC_LEV        
TRUNCATE TABLE LIN2AUDIT..STAT_ACC_MLEV        
        
--1. ??? ???? COUNT        
INSERT INTO LIN2AUDIT..STAT_ACC_RACE        
 SELECT RACE,COUNT(RACE) FROM USER_DATA WITH (NOLOCK) WHERE BUILDER=0 AND ACCOUNT_ID > 0 GROUP BY RACE ORDER BY RACE        
        
INSERT INTO LIN2AUDIT..STAT_ACC_CLASS        
 SELECT CLASS,COUNT(CLASS) FROM USER_DATA WITH (NOLOCK) WHERE BUILDER=0 AND ACCOUNT_ID > 0 GROUP BY CLASS ORDER BY CLASS        
        
--2. ??? COUNT        
INSERT INTO LIN2AUDIT..STAT_ACC_LEV        
 SELECT LEV,COUNT(LEV) FROM USER_DATA WITH (NOLOCK) WHERE BUILDER=0 AND ACCOUNT_ID > 0 GROUP BY LEV ORDER BY LEV        
        
--3. 70????? ?????        
INSERT INTO LIN2AUDIT..STAT_ACC_MLEV        
 SELECT ACCOUNT_NAME, CHAR_NAME, LEV, RACE, CLASS        
 FROM USER_DATA WITH (NOLOCK)      
 WHERE LEV>=76 AND BUILDER=0 AND ACCOUNT_ID > 0    
 ORDER BY LEV DESC        
         
END        




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AmountChange]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AmountChange]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_AmountChange    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_AmountChange
	change item''s amount and return result amount
INPUT
	@char_id	INT,
	@item_id 	INT,
	@change 	INT,
	@bZeorDelete 	INT = 0
OUTPUT
	amount		INT
return
made by
	carrot
date
	2002-04-22
change
	2002-10-15
		??? ??? 0? ??? ? ??? ?? ?? ??? ??
change
	2003-05-12
		?? ??? ??? ??? ??
********************************************/
CREATE PROCEDURE [dbo].[lin_AmountChange]
(
	@char_id	INT,
	@item_id 	INT,
	@change 	INT,
	@bZeorDelete 	INT = 0
)
AS
SET NOCOUNT ON

DECLARE @nResultAmount 	INT
SET @nResultAmount = -1

IF(select top 1 amount from user_item where char_id = @char_id AND item_id = @item_id ) + @change >= 0
begin
	UPDATE user_item SET amount = amount + @change WHERE char_id = @char_id AND item_id = @item_id
	
	IF NOT @@ROWCOUNT = 1 
		SELECT -1
	ELSE
		SELECT @nResultAmount = ISNULL(amount, -1) FROM user_item WHERE char_id = @char_id AND item_id = @item_id
		IF ( @nResultAmount = 0 AND @bZeorDelete = 1) 
		BEGIN
			UPDATE user_item SET char_id = 0 WHERE char_id = @char_id AND item_id = @item_id
		END
	
		SELECT @nResultAmount
end
else
select -1



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_BetaAddItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_BetaAddItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_BetaAddItem    Script Date: 2003-09-20 ?? 11:51:56 ******/
CREATE PROCEDURE [dbo].[lin_BetaAddItem]  
(
	@char_id int,
	@Item_type int,
	@amount int
)
AS

SET NOCOUNT ON

DECLARE @tempRowCount INT
DECLARE @bIsStackable TINYINT
SELECT @bIsStackable = IsStackable FROM ITEMNAME WHERE id = @Item_type

If @bIsStackable Is NULL 
Begin
	RAISERROR (''Not exist Item Type'', 16, 1)
End
Else
Begin
	If @bIsStackable = 1
	Begin
		Update user_item set amount = amount + @amount  where item_type = @Item_type and char_id = @char_id
		Set @tempRowCount = @@ROWCOUNT
		If @tempRowCount = 0
			INSERT INTO user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse) VALUES (@char_id, @Item_type, @amount, 0,0,0,0,0,0)
	End
	Else If @amount = 1
	Begin
		INSERT INTO user_item (char_id, item_type, amount, enchant, eroded, bless, ident, wished, warehouse) VALUES (@char_id, @Item_type, @amount, 0,0,0,0,0,0)
		Set @tempRowCount = @@ROWCOUNT
	End
	Else
	Begin
		RAISERROR (''Amount is invalid'', 16, 1)
	End
End

If @tempRowCount Is NOT NULL
	Select @tempRowCount




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetItemAmount]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetItemAmount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetItemAmount    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetItemAmount
	get item amount
INPUT
	@item_type  int
OUTPUT
	
return
made by
	young
date
	2003-06-18
********************************************/
CREATE PROCEDURE [dbo].[lin_GetItemAmount]
(
	@item_type  int 
)

AS

SET NOCOUNT ON

if exists(select  * from  itemdata (nolock) where id = @item_type and consumetype = ''consume_type_normal'' ) 
begin
	select count(*) as count from user_item (nolock) where item_type = @item_type
end
else
begin
	select -1 as count
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetItem    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_GetItem
	Get item from ground 
INPUT
	@char_id	INT,
	@item_id		 INT
OUTPUT
	item_id, amount
return
made by
	carrot
date
	2002-04-30
********************************************/
CREATE PROCEDURE [dbo].[lin_GetItem]
(
	@char_id	INT,
	@item_id		INT
)
AS
SET NOCOUNT ON
DECLARE @nCount	INT
DECLARE @nAmountIn	INT
DECLARE @nAmountOld	INT
DECLARE @nItemType	INT

SET @nCount = -1
SET @nAmountIn = -1
SET @nItemType = -1

SELECT @nAmountIn = amount, @nItemType = item_type FROM user_item WHERE item_id = @item_id
IF @nItemType = -1 
BEGIN
	RETURN
END

IF (@nItemType = 57)
	BEGIN
		SELECT @nCount = count(*) FROM user_item WHERE char_id = @char_id AND item_type = 57 AND warehouse = 0
		IF @nCount = 0
			UPDATE user_item SET char_id = @char_id  WHERE item_id = @item_id
		ELSE
		BEGIN
			DELETE user_item WHERE item_id = @item_id
			UPDATE user_item SET amount = amount + @nAmountIn  WHERE char_id = @char_id AND item_type = 57 AND warehouse = 0
		END

		SELECT item_id, amount FROM user_item WHERE char_id = @char_id AND item_type = 57
	END
ELSE
	BEGIN
		UPDATE user_item SET char_id = @char_id  WHERE item_id = @item_id

		SELECT item_id, amount FROM user_item WHERE item_id = @item_id
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AdenaChange]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AdenaChange]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_AdenaChange    Script Date: 2003-09-20 ?? 11:51:56 ******/
/********************************************
lin_AdenaChange
	change adena and return result amount
INPUT
	@char_id	INT,
	@price	 	INT
OUTPUT
	adena id		INT,
	amount		INT
return
made by
	carrot
date
	2002-04-22
********************************************/
CREATE PROCEDURE [dbo].[lin_AdenaChange]
(
	@char_id	INT,
	@price	 	INT
)
AS
SET NOCOUNT ON

DECLARE @nAmount	INT

SET @nAmount = NULL

SELECT @nAmount = amount FROM user_item WHERE char_id = @char_id AND item_type = 57
IF @nAmount IS NULL
	BEGIN
		SELECT -1, -1
	END
ELSE IF @nAmount + @price < 0
	BEGIN
		SELECT -1, -1
	END
ELSE
	BEGIN
		UPDATE user_item SET amount = amount + @price WHERE char_id = @char_id AND item_type = 57 AND warehouse = 0
		SELECT item_id, amount FROM user_item WHERE char_id = @char_id AND item_type = 57 AND warehouse = 0
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetItemType]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetItemType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetItemType
	Get item type
INPUT
	@item_id		 INT
OUTPUT

return
made by
	young
date
	2004-01-09
********************************************/
CREATE PROCEDURE [dbo].[lin_GetItemType]
(
	@item_id		INT
)
AS

SET NOCOUNT ON

select item_id, char_id, item_type, amount, warehouse from user_item (nolock) where item_id = @item_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateWarehouseItem]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateWarehouseItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_UpdateWarehouseItem    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_UpdateWarehouseItem 
	
INPUT
	@warehouse	INT,
	@amount	INT,
	@item_id		INT
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_UpdateWarehouseItem]
(
	@warehouse	INT,
	@amount	INT,
	@item_id		INT
)
AS
SET NOCOUNT ON

UPDATE user_item SET warehouse=@warehouse,amount=@amount WHERE item_id=@item_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertUserLog]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertUserLog]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InsertUserLog    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_InsertUserLog
	add user log data
INPUT
	char_id
	log_id
OUTPUT
return
made by
	young
date
	2003-1-15
change
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertUserLog]
(
	@char_id	INT,
	@log_id	TINYINT
)
AS

SET NOCOUNT ON

insert into user_log( char_id, log_id)
values (@char_id, @log_id)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateMacroInfo]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateMacroInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_CreateMacroInfo
	create macroinfo
INPUT
	@macro_id		int,
	@macro_order		int,
	@macro_int1		int,
	@macro_int2		int,
	@macro_int3		int,
	@macro_str		nvarchar(255)

OUTPUT
return
made by
	young
date
	2004-6-11
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateMacroInfo]
(
@macro_id		int,
@macro_order		int,
@macro_int1		int,
@macro_int2		int,
@macro_int3		int,
@macro_str		nvarchar(255)
)
AS
SET NOCOUNT ON

if ( exists ( select * from user_macro where macro_id = @macro_id ) )
begin
	if ( exists ( select * from user_macroinfo where macro_id = @macro_id and macro_order = @macro_order ) )
	begin
		update user_macroinfo set macro_int1 = @macro_int1, macro_int2 = @macro_int2, macro_int3 = @macro_int3 where macro_id = @macro_id and macro_order = @macro_order

	end else begin
		insert into user_macroinfo ( macro_id, macro_order, macro_int1, macro_int2, macro_int3, macro_str )
		values ( @macro_id, @macro_order, @macro_int1, @macro_int2, @macro_int3, @macro_str )
	end

end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateMacro]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateMacro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_CreateMacro
	create macro
INPUT
	@char_id		int,
	@macro_name		nvarchar(64),
	@macro_tooltip		nvarchar(64)
	@macro_iconname	nvarchar(64)
	@macro_icontype		int

OUTPUT
return
made by
	young
date
	2004-6-11
********************************************/
CREATE PROCEDURE [dbo].[lin_CreateMacro]
(
@char_id		int,
@macro_name		nvarchar(64),
@macro_tooltip		nvarchar(64),
@macro_iconname	nvarchar(64),
@macro_icontype	int
)
AS
SET NOCOUNT ON

insert into user_macro ( char_id, macro_name, macro_tooltip, macro_iconname, macro_icontype)
values
( @char_id, @macro_name, @macro_tooltip, @macro_iconname, @macro_icontype)

select @@IDENTITY



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetOneMacro]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetOneMacro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetOneMacro
	get one macro
INPUT
	@char_id		int,
	@macro_number	int
OUTPUT
return
made by
	young
date
	2004-6-11
********************************************/
CREATE PROCEDURE [dbo].[lin_GetOneMacro]
(
@char_id		int,
@macro_id	int
)
AS
SET NOCOUNT ON

select R1.macro_id,  char_id, macro_name, macro_tooltip, macro_iconname, macro_icontype, 
macro_order, macro_int1, macro_int2, macro_int3, macro_str from (
select * from user_macro  where char_id = @char_id and macro_id = @macro_id ) as R1
left join ( select * from user_macroinfo where macro_id = @macro_id  ) as R2
on R1.macro_id = R2.macro_id
 order by macro_order asc



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetMacro]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetMacro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SetMacro
	ALTER  macro
INPUT
	@macro_id		int,
	@macro_name		nvarchar(64),
	@macro_tooltip		nvarchar(64)
	@macro_iconname	nvarchar(64)
	@macro_icontype		int

OUTPUT
return
made by
	young
date
	2004-6-16
********************************************/
CREATE PROCEDURE [dbo].[lin_SetMacro]
(
@macro_id		int,
@macro_name		nvarchar(64),
@macro_tooltip		nvarchar(64),
@macro_iconname	nvarchar(64),
@macro_icontype	int
)
AS
SET NOCOUNT ON

if ( exists ( select * from user_macro where macro_id = @macro_id ) )
begin
	update user_macro
	set macro_name = @macro_name, macro_tooltip = @macro_tooltip,
		macro_iconname = @macro_iconname, macro_icontype = @macro_icontype
	where macro_id = @macro_id


	delete from user_macroinfo where macro_id = @macro_id


end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteMacro]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteMacro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_DeleteMacro
	delete  macro
INPUT

	@macro_id	int
OUTPUT
return
made by
	young
date
	2004-6-11
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteMacro]
(
@macro_id		int
)
AS
SET NOCOUNT ON

delete from user_macroinfo where macro_id = @macro_id
delete from user_macro where macro_id = @macro_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMacro]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMacro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMacro
	get macro
INPUT
	@char_id		int,
OUTPUT
return
made by
	young
date
	2004-6-11
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMacro]
(
@char_id		int
)
AS
SET NOCOUNT ON

select R1.macro_id,  char_id, macro_name, macro_tooltip, macro_iconname, macro_icontype, 
macro_order, macro_int1, macro_int2, macro_int3, macro_str from (
select * from user_macro  where char_id = @char_id ) as R1
left join ( select * from user_macroinfo ) as R2
on R1.macro_id = R2.macro_id
order by R1.macro_id asc ,   macro_order asc



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMacroCount]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMacroCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMacroCount
	get macro coubt
INPUT
	@char_id		int,
OUTPUT
return
made by
	young
date
	2004-6-14
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMacroCount]
(
@char_id		int
)
AS
SET NOCOUNT ON

select count(*) from user_macro where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetTempMail]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetTempMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetTempMail
	get temp mail 
INPUT
	@char_id		int,
	@mail_id		int
OUTPUT
return
made by
	kks
date
	2004-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_GetTempMail]
(
	@char_id		int,
	@mail_id		int
)
AS
SET NOCOUNT ON

SELECT
	m.id, s.receiver_name_list, m.title, m.content
FROM user_mail m (nolock), user_mail_sender s(nolock)
WHERE m.id = @mail_id
	AND s.mail_id = m.id

/*AND (m.id IN (SELECT mail_id FROM user_mail_receiver(nolock) WHERE receiver_id = @char_id)
OR m.id IN (SELECT mail_id FROM user_mail_sender(nolock) WHERE sender_id = @char_id))
*/



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMail]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMail
	get mail 
INPUT
	@char_id		int,
	@mail_id		int
OUTPUT
return
made by
	kks
date
	2004-12-10
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMail]
(
	@char_id		int,
	@mail_id		int
)
AS
SET NOCOUNT ON

UPDATE user_mail_receiver
SET read_date = GETDATE(),
read_status = 1
WHERE mail_id = @mail_id
AND receiver_id = @char_id
AND read_status = 0
AND deleted = 0

SELECT
	m.id, s.sender_id, s.sender_name, s.receiver_name_list, m.title, m.content, datediff( ss, ''1970/1/1 0:0:0'' , s.send_date ), s.mail_type
FROM user_mail m (nolock), user_mail_sender s(nolock)
WHERE m.id = @mail_id
	AND s.mail_id = m.id

/*AND (m.id IN (SELECT mail_id FROM user_mail_receiver(nolock) WHERE receiver_id = @char_id)
OR m.id IN (SELECT mail_id FROM user_mail_sender(nolock) WHERE sender_id = @char_id))
*/




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModifyTempMail]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModifyTempMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ModifyTempMail
	modify temp mail 
INPUT
	@char_id		int,
	@mail_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
OUTPUT
return
made by
	kks
date
	2004-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_ModifyTempMail]
(
	@char_id		int,
	@mail_id		int,
	@receiver_name_list		nvarchar(250),
	@title			nvarchar(200),
	@content		nvarchar(4000)
)
AS
SET NOCOUNT ON

UPDATE user_mail
SET title = @title,
	content = @content,
	created_date = GETDATE()
WHERE id = @mail_id

UPDATE user_mail_sender
SET receiver_name_list = @receiver_name_list,
	send_date = GETDATE()
WHERE 
	mail_id = @mail_id AND 
	sender_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetMailCount]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetMailCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_GetMailCount
	get mail count
INPUT
	@char_id		int,

OUTPUT
return
made by
	kks
date
	2004-12-17
********************************************/
CREATE PROCEDURE [dbo].[lin_GetMailCount]
(
	@char_id		int
)
AS
SET NOCOUNT ON

SELECT
	(SELECT COUNT(*) 
	FROM user_mail_receiver(NOLOCK)
	WHERE receiver_id = @char_id
		AND deleted = 0
		AND mailbox_type = 0) incomming_mail,
	(SELECT COUNT(*)
	FROM user_mail_sender(NOLOCK)
	WHERE sender_id = @char_id
		AND deleted = 0
		AND mailbox_type = 1) sent_mail,
	(SELECT COUNT(*) 
	FROM user_mail_receiver(NOLOCK)
	WHERE receiver_id = @char_id
		AND deleted = 0
		AND mailbox_type = 2)
	+
	(SELECT COUNT(*)
	FROM user_mail_sender(NOLOCK)
	WHERE sender_id = @char_id
		AND deleted = 0
		AND mailbox_type = 2) archived_mail,
	(SELECT COUNT(*)
	FROM user_mail_sender(NOLOCK)
	WHERE sender_id = @char_id
		AND deleted = 0
		AND mailbox_type = 3) temp_mail




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ArchiveMail]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ArchiveMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ArchiveMail
	archive mail
INPUT
	@char_id		int,
	@mail_id		int,
	@mailbox_type			int

OUTPUT
return
made by
	kks
date
	2004-12-19
********************************************/
CREATE PROCEDURE [dbo].[lin_ArchiveMail]
(
	@char_id		int,
	@mail_id		int,
	@mailbox_type			int
)
AS
SET NOCOUNT ON

IF @mailbox_type = 0
BEGIN
	UPDATE user_mail_receiver
	SET mailbox_type = 2
	WHERE mail_id = @mail_id AND
		receiver_id = @char_id
END

if @mailbox_type = 1
BEGIN
	UPDATE user_mail_sender
	SET mailbox_type = 2
	WHERE mail_id = @mail_id AND
		sender_id = @char_id 
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetUnreadMailCount]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetUnreadMailCount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_GetUnreadMailCount
	get unread mail count
INPUT
	@char_id		int,

OUTPUT
return
made by
	kks
date
	2004-12-23
********************************************/
CREATE PROCEDURE [dbo].[lin_GetUnreadMailCount]
(
	@char_id		int
)
AS
SET NOCOUNT ON

SELECT COUNT(*)
FROM user_mail_receiver(NOLOCK)
WHERE receiver_id = @char_id
	AND mailbox_type = 0
	AND read_status = 0;



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteMail]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteMail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




/********************************************
lin_DeleteMail
	delete mail
INPUT
	@char_id		int,
	@mail_id		int,
	@mailbox_type			int

OUTPUT
return
made by
	kks
date
	2004-12-19
modified by kks (2005-08-29)
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteMail]
(
	@char_id		int,
	@mail_id		int,
	@mailbox_type			int
)
AS
SET NOCOUNT ON

UPDATE user_mail_receiver
SET deleted = 1
WHERE mail_id = @mail_id AND
	receiver_id = @char_id AND
	mailbox_type = @mailbox_type AND
	deleted = 0

IF @@ROWCOUNT = 0
	BEGIN
	UPDATE user_mail_sender
	SET deleted = 1
	WHERE mail_id = @mail_id AND
		sender_id = @char_id AND
		mailbox_type = @mailbox_type
	END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ManageUserNameReserved]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ManageUserNameReserved]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ManageUserNameReserved
	manage user name reserved ( add, del )
INPUT
	@option	int,
	@char_name	nvarchar(50),
	@account_id	int,
	@used		int
OUTPUT

return
made by
	kks
date
	2004-12-13
********************************************/
CREATE PROCEDURE [dbo].[lin_ManageUserNameReserved]
(
	@option	int,
	@char_name	nvarchar(50),
	@account_id	int,
	@used		int
)
AS
SET NOCOUNT ON

declare @reservedcount int
set @reservedcount  = 0

if ( @option = 0 )
begin
	-- add user name reserved
	select @reservedcount  = count(*) from user_name_reserved (nolock) where char_name = @char_name
	if ( @reservedcount >= 1)
		return

	insert into user_name_reserved ( char_name, account_id, used )
	values ( @char_name, @account_id, @used )
end 

if ( @option = 1 )
begin
	-- del user_name_reserved
	delete from user_name_reserved where char_name = @char_name
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CheckReserved]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CheckReserved]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_CheckReserved    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_CheckReserved
	
INPUT
	@char_name	NCHAR(12),
	@account_name	NCHAR(13),
	@account_id	INT
OUTPUT
	
return
made by
	carrot
date
	2003-07-09
change
********************************************/
CREATE PROCEDURE [dbo].[lin_CheckReserved]
(
@char_name	NVARCHAR(24),
@account_name	NVARCHAR(24),
@account_id	INT
)
AS

SET NOCOUNT ON

SET @char_name = RTRIM(@char_name)

-- check reserved name
declare @reserved_name nvarchar(50)
declare @reserved_account_id int
select top 1 @reserved_name = char_name, @reserved_account_id = account_id from user_name_reserved (nolock) where used = 0 and char_name = @char_name
if not @reserved_name is null
begin
	if not @reserved_account_id = @account_id
	begin
		RAISERROR (''Character name is reserved by other player: name = [%s]'', 16, 1, @char_name)
		RETURN -1
	end
end





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateNewbieData]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateNewbieData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_CreateNewbieData
	create  newbie data
INPUT
	@account_id	INT,

OUTPUT
return
made by
	kks
date
	2004-11-25

********************************************/
CREATE PROCEDURE [dbo].[lin_CreateNewbieData]
(
	@account_id	INT
)
AS
SET NOCOUNT ON

INSERT INTO user_newbie(account_id, char_id, newbie_stat)
VALUES (@account_id, 0, 0)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_UpdateNewbieCharData]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_UpdateNewbieCharData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_UpdateNewbieCharData
	update newbie char
INPUT
	@account_id	INT,
	@char_id 	INT
OUTPUT
return
made by
	kks
date
	2004-11-25
********************************************/
CREATE PROCEDURE [dbo].[lin_UpdateNewbieCharData]
(
	@account_id	INT,
	@char_id 	INT
)
AS
SET NOCOUNT ON

UPDATE user_newbie 
SET char_id = @char_id
WHERE account_id = @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadNewbieData]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadNewbieData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_LoadNewbieData
	load newbie data
INPUT

OUTPUT
return
made by
	kks
date
	2004-11-25
change
********************************************/
CREATE PROCEDURE [dbo].[lin_LoadNewbieData]

AS

SET NOCOUNT ON

SELECT account_id, char_id, newbie_stat
FROM user_newbie (nolock)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetNewbieStat]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetNewbieStat]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SetNewbieStat
	set newbie staus
INPUT
	@account_id	INT,
	@newbie_stat 	INT
OUTPUT
return
made by
	kks
date
	2004-11-25
********************************************/
CREATE PROCEDURE [dbo].[lin_SetNewbieStat]
(
	@account_id	INT,
	@newbie_stat 	INT
)
AS
SET NOCOUNT ON

UPDATE user_newbie 
SET newbie_stat = @newbie_stat
WHERE account_id = @account_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeletePreviousOlympiadPoint]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeletePreviousOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeletePreviousOlympiadPoint]
(
@char_id INT,
@previous_olympiad_point INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET previous_point = 0
WHERE 
char_id = @char_id
AND previous_point = @previous_olympiad_point

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModOlympiadPoint]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- 2005-11-16	created by btwinuni
-- 2005-11-23	modified by btwinuni	check nobless
CREATE PROCEDURE [dbo].[lin_ModOlympiadPoint]
(
	@char_id	int,
	@previous_point	int,
	@olympiad_point	int,
	@mod_type	int
)
AS

declare
	@old_previous_point	int,
	@old_olympiad_point	int,
	@new_previous_point	int,
	@new_olympiad_point	int

select @old_previous_point = previous_point, @old_olympiad_point = olympiad_point
from user_nobless (nolock)
where char_id = @char_id

-- is not nobless
if @old_previous_point is null or @old_olympiad_point is null
return

if @mod_type = 1	-- relative
begin
	set @new_previous_point = @old_previous_point + @previous_point
	if @new_previous_point < 0
		set @new_previous_point = 0

	set @new_olympiad_point = @old_olympiad_point + @olympiad_point
	if @new_olympiad_point < 0
		set @new_olympiad_point = 0
end
else		-- absolute
begin
	set @new_previous_point = @previous_point
	if @new_previous_point < 0
		set @new_previous_point = 0

	set @new_olympiad_point = @olympiad_point
	if @new_olympiad_point < 0
		set @new_olympiad_point = 0
end

update user_nobless
set previous_point = @new_previous_point,
	olympiad_point = @new_olympiad_point
where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAllNobless]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAllNobless]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetAllNobless]
AS
SELECT char_id, nobless_type, hero_type, win_count, previous_point, olympiad_point, match_count, olympiad_win_count, olympiad_lose_count, history_open FROM user_nobless



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetHistoryOpen]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetHistoryOpen]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SetHistoryOpen]
(
@char_id AS INT,
@history_open AS TINYINT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET history_open = @history_open
WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveNoblessType]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveNoblessType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveNoblessType]
(
@char_id INT,
@nobless_type INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET nobless_type = @nobless_type
WHERE char_id = @char_id

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveHeroType]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveHeroType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SaveHeroType]
(
@char_id INT,
@hero_type INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET hero_type = @hero_type
WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ResetOlympiadPoint]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ResetOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_ResetOlympiadPoint]
(
@give_point INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET previous_point = olympiad_point

UPDATE user_nobless
SET olympiad_point = @give_point



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetNoblessById]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetNoblessById]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetNoblessById]
(
@char_id AS INT
)
AS
SELECT nobless_type, hero_type, win_count, previous_point, olympiad_point, match_count, olympiad_win_count, olympiad_lose_count, history_open FROM user_nobless WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_WriteHeroWords]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_WriteHeroWords]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_WriteHeroWords]
(
@char_id INT,
@hero_words VARCHAR(128)
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET words = @hero_words
WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddOlympiadPoint]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_AddOlympiadPoint]
(
@char_id INT,
@diff INT
)
AS
SET NOCOUNT ON

UPDATE user_nobless
SET olympiad_point = olympiad_point + @diff
WHERE char_id = @char_id

DECLARE @olympiad_point INT
SELECT @olympiad_point = olympiad_point FROM user_nobless WHERE char_id = @char_id
IF @olympiad_point < 0
BEGIN
	UPDATE user_nobless
	SET olympiad_point = 0
	WHERE char_id = @char_id
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ReloadOlympiadPoint]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ReloadOlympiadPoint]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_ReloadOlympiadPoint]
(
@char_id INT
)
AS
SELECT olympiad_point FROM user_nobless WHERE char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_NewNobless]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_NewNobless]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_NewNobless]
(
@char_id INT,
@nobless_type INT,
@olympiad_point INT
)
AS
SET NOCOUNT ON

INSERT user_nobless
(char_id,  nobless_type, olympiad_point)
VALUES
(@char_id, @nobless_type, @olympiad_point)

SELECT @@ROWCOUNT



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddProhibit]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddProhibit]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_AddProhibit    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_AddProhibit
	
INPUT	
	@char_name	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
CREATE PROCEDURE [dbo].[lin_AddProhibit]
(
	@char_name	nvarchar(50),
	@noption	int
)
AS
SET NOCOUNT ON

if ( @noption = 1) 
	insert into user_prohibit values (@char_name)
else if ( @noption = 3)
	insert into user_prohibit_word values (@char_name)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelProhibit]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelProhibit]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_DelProhibit    Script Date: 2003-09-20 ?? 11:51:58 ******/
/********************************************
lin_DelProhibit
	
INPUT	
	@char_name	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-06-16
********************************************/
CREATE PROCEDURE [dbo].[lin_DelProhibit]
(
	@char_name	nvarchar(50),
	@noption	int
)
AS
SET NOCOUNT ON

if @noption = 2  
	delete from  user_prohibit 
	where  char_name = @char_name
else if @noption = 4 
	delete from  user_prohibit_word 
	where words = @char_name



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetPunish]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetPunish]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetPunish    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetPunish
	Get punish
INPUT
	@char_id	INT
OUTPUT
return
made by
	young
date
	2002-11-27
********************************************/
CREATE PROCEDURE [dbo].[lin_GetPunish]
(
	@char_id	INT
)

as

set nocount on

select punish_id, punish_on, remain_game, remain_real from user_punish (nolock) where char_id = @char_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPunish]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPunish]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'







/****** Object:  Stored Procedure dbo.lin_SetPunish    Script Date: 2003-09-20 ??? 11:52:00 ******/
/********************************************
lin_SetPunish
	Set punish
INPUT
	@char_id	INT,
	@punish_id 	INT,
	@punish_on	INT,
	@remain	INT
OUTPUT
return
made by
	young
date
	2002-11-27
********************************************/
CREATE   PROCEDURE [dbo].[lin_SetPunish]
(
	@char_id	INT,
	@punish_id	INT,
	@punish_on	INT,
	@remain	INT

)
AS
SET NOCOUNT ON

declare @nCount int

select @nCount = count(*) from user_punish (nolock) where char_id = @char_id and punish_id = @punish_id

if ( @nCount > 0 and @remain = 0)
begin
	delete from user_punish where char_id = @char_id and punish_id = @punish_id
end

if ( @nCount > 0 and @remain > 0)
begin
	if @punish_on = 1
		update user_punish set  remain_game = @remain where char_id = @char_id and punish_id = @punish_id

	if @punish_on = 0
		update user_punish set  remain_real = @remain  where char_id = @char_id and punish_id = @punish_id
		
end

if ( @nCount = 0 and @remain > 0)
begin
	if @punish_on = 1
		insert into user_punish(char_id, punish_id, punish_on, remain_game) values (@char_id, @punish_id, 1, @remain)

	if @punish_on = 0
		insert into user_punish(char_id, punish_id, punish_on, remain_real) values (@char_id, @punish_id, 0, @remain)
end





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadRecipeInfo]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadRecipeInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_LoadRecipeInfo
 load all recipe
INPUT        
 @char_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_LoadRecipeInfo]
(        
 @char_id INT
)        
AS        
        
SET NOCOUNT ON        

SELECT recipe_id FROM user_recipe WHERE char_id = @char_id ORDER BY recipe_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelRecipeInfo]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelRecipeInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_DelRecipeInfo
 delete recipe info
INPUT        
 @char_id
 @recipe_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_DelRecipeInfo]
(        
 @char_id INT,
 @recipe_id INT
)        
AS        
        
SET NOCOUNT ON        

DELETE user_recipe WHERE char_id = @char_id and recipe_id = @recipe_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SaveRecipeInfo]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SaveRecipeInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_SaveRecipeInfo
 delete recipe info
INPUT        
 @char_id
 @recipe_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_SaveRecipeInfo]
(        
 @char_id INT,
 @recipe_id INT
)        
AS        
        
SET NOCOUNT ON        

INSERT user_recipe VALUES (@char_id, @recipe_id)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelAquireSkill]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelAquireSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DelAquireSkill]
(
	@char_id	INT,
	@subjob_id	INT,
	@skill_id		INT
)
AS
SET NOCOUNT ON

DELETE FROM user_skill WHERE char_id = @char_id AND skill_id = @skill_id AND ISNULL(subjob_id, 0) = @subjob_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetAquireSkill]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetAquireSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetAquireSkill]
(
	@char_id	INT,
	@subjob_id	INT
)
AS
SET NOCOUNT ON

SELECT skill_id, skill_lev, to_end_time FROM user_skill WHERE char_id = @char_id AND ISNULL(subjob_id, 0) = @subjob_id ORDER BY 1, 2



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetSkillCoolTime]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetSkillCoolTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SetSkillCoolTime]
(
	@char_id	INT,
	@subjob_id	INT,
	@skill_id		INT,
	@nToEndTime	INT
)
AS
SET NOCOUNT ON

UPDATE user_skill SET to_end_time = @nToEndTime WHERE char_id = @char_id AND skill_id = @skill_id AND ISNULL(subjob_id, 0) = @subjob_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetSubJobAcquireSkill]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetSubJobAcquireSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_SetSubJobAcquireSkill
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@skill_id	int,
	@skill_level	int

OUTPUT
return
made by
	kks
date
	2005-01-19
********************************************/
CREATE PROCEDURE [dbo].[lin_SetSubJobAcquireSkill]
(
	@char_id	int,
	@subjob_id	int,
	@skill_id	int,
	@skill_level	int
)
AS
SET NOCOUNT ON

DECLARE @cnt INT
SET @cnt = 0

IF exists(select * from user_skill(nolock) where char_id = @char_id and subjob_id = @subjob_id and skill_id = @skill_id)    
BEGIN    
	update user_skill set skill_lev = @skill_level where char_id = @char_id and subjob_id = @subjob_id and skill_id = @skill_id
END    
ELSE
BEGIN    
	insert into user_skill values (@char_id, @skill_id, @skill_level, 0, @subjob_id)
END    




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteSubJobSkill]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteSubJobSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_DeleteSubJobSkill
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@skill_id	int

OUTPUT
return
made by
	kks
date
	2005-01-19
********************************************/
CREATE PROCEDURE [dbo].[lin_DeleteSubJobSkill]
(
	@char_id	int,
	@subjob_id	int,
	@skill_id	int
)
AS
SET NOCOUNT ON

delete user_skill where char_id = @char_id and subjob_id = @subjob_id and skill_id = @skill_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAquireSkill]    Script Date: 02/08/2011 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAquireSkill]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_SetAquireSkill]
(
	@char_id	INT,
	@subjob_id	INT,
	@skill_id		INT,
	@skill_level	INT
)
AS
SET NOCOUNT ON

IF EXISTS(SELECT skill_lev FROM user_skill WHERE char_id = @char_id AND skill_id = @skill_id AND ISNULL(subjob_id, 0) = @subjob_id)
	UPDATE user_skill SET skill_lev = @skill_level WHERE char_id = @char_id AND skill_id = @skill_id AND ISNULL(subjob_id, 0) = @subjob_id
ELSE
	INSERT INTO user_skill (char_id, subjob_id, skill_id, skill_lev) VALUES (@char_id, @subjob_id, @skill_id, @skill_level)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_StartAllianceWar]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_StartAllianceWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- lin_StartAllianceWar
-- by bert

CREATE PROCEDURE
[dbo].[lin_StartAllianceWar] (@challenger_alliance_id INT, @challengee_alliance_id INT, @war_begin_time INT)
AS

SET NOCOUNT ON

DECLARE @ret INT

DECLARE @challenger_name VARCHAR(50)
DECLARE @challengee_name VARCHAR(50)

SELECT @challenger_name = name FROM alliance WHERE id = @challenger_alliance_id
SELECT @challengee_name = name FROM alliance WHERE id = @challengee_alliance_id

INSERT INTO Alliance_War
(challenger, challengee, begin_time, challenger_name, challengee_name)
VALUES
(@challenger_alliance_id, @challengee_alliance_id, @war_begin_time, @challenger_name, @challengee_name)

SELECT @@IDENTITY


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAlliance]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAlliance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAlliance    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_LoadAlliance
-- by bert
CREATE PROCEDURE
[dbo].[lin_LoadAlliance] (@alliance_id INT)
AS

SET NOCOUNT ON

SELECT id, name, master_pledge_id, oust_time, crest_id FROM alliance WHERE id = @alliance_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadAllAllianceId]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadAllAllianceId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_LoadAllAllianceId    Script Date: 2003-09-20 ?? 11:51:57 ******/
-- lin_LoadAllAllianceId
-- by bert
CREATE PROCEDURE
[dbo].[lin_LoadAllAllianceId]
AS

SET NOCOUNT ON

SELECT id FROM alliance



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetAllianceInfo]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetAllianceInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetAllianceInfo    Script Date: 2003-09-20 ?? 11:51:57 ******/
/********************************************
lin_SetAllianceInfo
	
INPUT	
	@fieldName	nvarchar(50),
	@field_data	INT,
	@pledge_id	INT
OUTPUT

return
made by
	bert ^^
********************************************/

CREATE PROCEDURE [dbo].[lin_SetAllianceInfo]
(
@fieldName	nvarchar(50),
@field_data	INT,
@alliance_id	INT
)
AS
SET NOCOUNT ON

IF @fieldName = N''oust_time'' begin update alliance set oust_time = @field_data where id =  @alliance_id end
ELSE IF @fieldName = N''crest_id'' begin update alliance set crest_id = @field_data where id =  @alliance_id end
ELSE 
BEGIN 
	RAISERROR (''lin_SetAllianceInfo : invalid field [%s]'', 16, 1, @fieldName)
	RETURN -1	
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModifyAllianceName]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModifyAllianceName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[lin_ModifyAllianceName]
(  
@alliance_name  NVARCHAR(50),  
@alliance_id  int  
)  
AS  
SET NOCOUNT ON 

UPDATE alliance SET name = @alliance_name WHERE id = @alliance_id    



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetItemData]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetItemData]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetItemData    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetItemData
	
INPUT
	@id	int
OUTPUT
return
made by
	carrot
date
	2002-06-10
********************************************/
create PROCEDURE [dbo].[lin_GetItemData]
(
	@id	int
)
AS
SET NOCOUNT ON

select top 1 consumetype from itemdata  (nolock)  where id = @id





' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_InsertItemName]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_InsertItemName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_InsertItemName    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_InsertItemName
	insert item name data
INPUT
	@id	INT,
	@name 	nvarchar(50),
	@desc 	nvarchar(50)
OUTPUT
return
made by
	carrot
date
	2002-10-8
change		carrot
	2003-1-9	add IsQuest field
********************************************/
CREATE PROCEDURE [dbo].[lin_InsertItemName]
(
@id	INT,
@name 	nvarchar(50),
@desc 	nvarchar(50),
@consumeType 	nvarchar(50),
@IsQuest	TINYINT = 0
)
AS
SET NOCOUNT ON


INSERT INTO ItemData
	(id, name, [desc], consumeType, IsQuest) 
	values 
	(@id, @name, @desc, @consumeType, @IsQuest)



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_LoadSociality]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_LoadSociality]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_LoadSociality
 load sociality
INPUT        
 @char_id
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_LoadSociality]
(        
 @char_id INT
)        
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT  * FROM user_sociality WHERE char_id = @char_id)
BEGIN
	SELECT  sociality, used_sulffrage, convert(nvarchar(19), last_changed, 121) FROM user_sociality WHERE char_id = @char_id
END
ELSE
BEGIN
	SELECT  0, 0, ''0000-00-00 00:00:00''
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ResetSociality]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ResetSociality]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_ResetSociality
 set sociality
INPUT        
 @char_id
 @sociality
 @sulffrage
 @last_changed
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_ResetSociality]
(        
 @char_id INT,
 @sociality INT,
 @sulffrage INT,
 @last_changed DATETIME
)        
AS        
        
SET NOCOUNT ON        

IF EXISTS(SELECT  * FROM user_sociality WHERE char_id = @char_id)
BEGIN
	UPDATE user_sociality 
	SET sociality = @sociality , used_sulffrage = @sulffrage , last_changed = @last_changed
	WHERE char_id = @char_id
END
ELSE
BEGIN
	INSERT INTO user_sociality (char_id, sociality , used_sulffrage , last_changed ) VALUES (@char_id, @sociality , @sulffrage , @last_changed)
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_updateSulffrageUsed]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_updateSulffrageUsed]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_updateSulffrageUsed
 set sulffrage
INPUT        
 @char_id
 @sociality
 @sulffrage
 @last_changed
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_updateSulffrageUsed]
(        
 @char_id INT,
 @sulffrage INT
)        
AS        
        
SET NOCOUNT ON        

UPDATE user_sociality 
SET used_sulffrage = @sulffrage
WHERE char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_updateSociality]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_updateSociality]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************        
lin_updateSociality
 set sociality
INPUT        
 @char_id
 @sociality
 @sulffrage
 @last_changed
OUTPUT        
return        
       
made by        
 carrot        
date        
 2004-07-4
change        
********************************************/        
CREATE PROCEDURE [dbo].[lin_updateSociality]
(        
 @char_id INT,
 @sociality INT
)        
AS        
        
SET NOCOUNT ON        

UPDATE user_sociality 
SET sociality = @sociality 
WHERE char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddSubJobHenna]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddSubJobHenna]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_AddSubJobHenna
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@henna	int

OUTPUT
return
made by
	kks
date
	2005-01-18
********************************************/
CREATE PROCEDURE [dbo].[lin_AddSubJobHenna]
(
	@char_id	int,
	@subjob_id	int,
	@henna	int
)
AS
SET NOCOUNT ON

declare @henna1 int
declare @henna2 int
declare @henna3 int

set @henna1 = 0
set @henna2 = 0
set @henna3 = 0

select @henna1 = isnull(henna_1, 0), @henna2 = isnull(henna_2, 0), @henna3 = isnull(henna_3, 0) from user_subjob where char_id = @char_id and subjob_id = @subjob_id

if (@henna1 = 0)
begin
	update user_subjob set henna_1 = @henna where char_id = @char_id and subjob_id = @subjob_id
end
else if  (@henna2 = 0)
begin
	update user_subjob set henna_2 = @henna where char_id = @char_id and subjob_id = @subjob_id
end
else if (@henna3 = 0)
begin
	update user_subjob set henna_3 = @henna where char_id = @char_id and subjob_id = @subjob_id
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetExpBySubjob]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetExpBySubjob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************
lin_GetExpBySubjob
	get experience of user_subjob by subjob_id
INPUT
	@char_id		int
	@subjob_id		int
OUTPUT
return
made by
	kernel0
date
	2005-04-20
********************************************/
CREATE PROCEDURE [dbo].[lin_GetExpBySubjob]
(
	@char_id		INT,
	@subjob_id		INT
)
AS
SET NOCOUNT ON

SELECT 
	exp
FROM 
	user_subjob
WHERE 
	char_id = @char_id 
	AND subjob_id = isnull(@subjob_id, 0)


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModSubJobAbilityAbsolutely]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModSubJobAbilityAbsolutely]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ModSubJobAbilityAbsolutely
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@sp		int,
	@exp		int,
	@lev		int
OUTPUT
return
made by
	kks
date
	2005-01-18
********************************************/
CREATE PROCEDURE [dbo].[lin_ModSubJobAbilityAbsolutely]
(
	@char_id	int,
	@subjob_id	int,
	@sp		int,
	@exp		int,
	@lev		int
)
AS
SET NOCOUNT ON

update user_subjob set sp =  @sp, exp = @exp,  level =  @lev where char_id = @char_id and subjob_id = @subjob_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetSubJobLevel]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetSubJobLevel]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_GetSubJobLevel]
(  
 @char_id INT  
)  
AS  
 
SET NOCOUNT ON  
SELECT subjob_id, ISNULL(level, 40) FROM user_subjob WHERE char_id = @char_id ORDER BY subjob_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DelSubJobHenna]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DelSubJobHenna]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_DelSubJobHenna
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@henna	int

OUTPUT
return
made by
	kks
date
	2005-01-18
********************************************/
CREATE PROCEDURE [dbo].[lin_DelSubJobHenna]
(
	@char_id	int,
	@subjob_id	int,
	@henna	int
)
AS
SET NOCOUNT ON

declare @henna1 int
declare @henna2 int
declare @henna3 int

set @henna1 = 0
set @henna2 = 0
set @henna3 = 0

select @henna1 = isnull(henna_1, 0), @henna2 = isnull(henna_2, 0), @henna3 = isnull(henna_3, 0) from user_subjob where char_id = @char_id and subjob_id = @subjob_id

if (@henna = @henna1)
begin
	update user_subjob set henna_1 = 0 where char_id = @char_id and subjob_id = @subjob_id
end
else if (@henna = @henna2)
begin
	update user_subjob set henna_2 = 0 where char_id = @char_id and subjob_id = @subjob_id
end
else if (@henna = @henna3)
begin
	update user_subjob set henna_3 = 0 where char_id = @char_id and subjob_id = @subjob_id
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ModSubJobAbility]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ModSubJobAbility]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/********************************************
lin_ModSubJobAbility
	
INPUT
	@char_id	int,
	@subjob_id	int,
	@sp		int,
	@exp		int,
	@lev		int
OUTPUT
return
made by
	kks
date
	2005-01-18
modified by
	kernel0
date	2005-04-20	
********************************************/
CREATE PROCEDURE [dbo].[lin_ModSubJobAbility]
(
	@char_id	int,
	@subjob_id	int,
	@sp		int,
	@exp		int,
	@lev		int
)
AS
SET NOCOUNT ON

update user_subjob set sp = sp + @sp, exp = exp + @exp,  level = @lev where char_id = @char_id and subjob_id = @subjob_id


' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_ChangeSubJob]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_ChangeSubJob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_ChangeSubJob]
(
	@char_id	INT,
	@subjob_id	TINYINT,
	@old_subjob_id	TINYINT,
	@hp		FLOAT,
	@mp		FLOAT,
	@sp		INT,
	@exp		BIGINT,
	@level		TINYINT,
	@henna_1	INT,
	@henna_2	INT,
	@henna_3	INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 0

BEGIN TRAN

UPDATE user_subjob
SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
	henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
WHERE char_id = @char_id AND subjob_id = @old_subjob_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1	-- update, insert check
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT hp, mp, sp, exp, level, henna_1, henna_2, henna_3 FROM user_subjob
	WHERE char_id = @char_id AND subjob_id = @subjob_id

' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_AddSubJob]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_AddSubJob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
/******************************************************************************
#Name:	lin_AddSubjob
#Desc:	add subjob

#Argument:
	Input:	@char_id	INT
		@new_class	TINYINT
		@hp		FLOAT
		@mp		FLOAT
		@sp		INT
		@exp		BIGINT
		@level		TINYINT
		@subjob_id	TINYINT
		@henna_1	INT
		@henna_2	INT
		@henna_3	INT
	Output:
#Return:	Success(1) / Failure(0)
#Result Set:

#Remark:
#Example:
#See:
#History:
	Create	btwinuni	2005-07-28
	Modify	btwinuni	2005-09-07
	Mod by Vampire 2008-03-30
******************************************************************************/
CREATE PROCEDURE [dbo].[lin_AddSubJob]
(
	@char_id	INT,
	@new_class	TINYINT,
	@hp		FLOAT,
	@mp		FLOAT,
	@sp		INT,
	@exp		BIGINT,
	@level		TINYINT,
	@subjob_id	TINYINT,
	@henna_1	INT,
	@henna_2	INT,
	@henna_3	INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 1

BEGIN TRAN

-- subjob_id duplication check
IF EXISTS(SELECT subjob_id FROM user_subjob WHERE char_id = @char_id AND subjob_id = @subjob_id)
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

ELSE	-- insert
BEGIN
	INSERT INTO user_subjob
	(char_id, hp, mp, sp, exp, level, henna_1, henna_2, henna_3, subjob_id, create_date)
	VALUES
	(@char_id, @hp, @mp, @sp, @exp, @level, @henna_1, @henna_2, @henna_3, @subjob_id, getdate())

	DECLARE @sql VARCHAR(1000)
	SET @sql = ''UPDATE user_data ''
		+ '' SET subjob'' + cast(@subjob_id as varchar) + ''_class = '' + cast(@new_class as varchar)
		+ '' WHERE char_id = '' + cast(@char_id as varchar)
	EXEC (@sql)
END

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret
' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteSurrenderWar]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteSurrenderWar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_DeleteSurrenderWar]( @war_id INT)  
AS  
  
SET NOCOUNT ON  
SELECT char_id FROM user_surrender WHERE surrender_war_id = @war_id  
DELETE FROM user_surrender WHERE surrender_war_id = @war_id



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SurrenderPersonally]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SurrenderPersonally]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[lin_SurrenderPersonally](@char_id INT, @war_id INT)  
AS  
  
SET NOCOUNT ON  
  
INSERT INTO user_surrender  
(char_id, surrender_war_id)  
VALUES   
(@char_id, @war_id)  
  
SELECT @@ROWCOUNT




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_SetPetitionMsg]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_SetPetitionMsg]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_SetPetitionMsg    Script Date: 2003-09-20 ?? 11:52:00 ******/
/********************************************
lin_SetPetitionMsg
	store Petition Msg
INPUT
	@char_id	int,
	@msg	nvarchar(500)
OUTPUT

return
made by
	carrot
date
	2003-02-27
********************************************/
CREATE PROCEDURE [dbo].[lin_SetPetitionMsg]
(
	@char_id	int,
	@msg	nvarchar(500)
)
AS
SET NOCOUNT ON

if exists(select * from PetitionMsg where char_id =@char_id)
begin
	update PetitionMsg set msg = @msg where char_id = @char_id
end 
else 
begin
	insert into PetitionMsg  (char_id, msg) 
	values( @char_id, @msg)
end



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_GetPetitionMsg]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_GetPetitionMsg]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.lin_GetPetitionMsg    Script Date: 2003-09-20 ?? 11:51:59 ******/
/********************************************
lin_GetPetitionMsg
	get Petition Msg and delete it
INPUT
	@char_id	int
OUTPUT
	msg(nvarchar 500)
return
made by
	carrot
date
	2003-02-27
********************************************/
CREATE PROCEDURE [dbo].[lin_GetPetitionMsg]
(
	@char_id	int
)
AS
SET NOCOUNT ON

select ISNULL(msg, '''') as msg from PetitionMsg where char_id = @char_id
delete PetitionMsg where char_id = @char_id




' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_DeleteNotOwnedItem]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_DeleteNotOwnedItem]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


/********************************************  
lin_DeleteNotOwnedItem  
   
INPUT  
OUTPUT  
  
return  
made by  
 carrot  
date  
 2003-10-12  
********************************************/  
CREATE PROCEDURE [dbo].[lin_DeleteNotOwnedItem]  
AS  
SET NOCOUNT ON  
  
DELETE user_item WHERE char_id =  0 OR item_type = 0  
  
DECLARE @ToDeleteCharacter CURSOR  
DECLARE @char_id INT  
SET @ToDeleteCharacter = CURSOR FAST_FORWARD FOR  
 SELECT char_id  
 FROM user_data  
 WHERE account_id > 0 AND temp_delete_date IS NOT NULL AND DATEDIFF ( dd , temp_delete_date , GETDATE())  >= 7  
OPEN @ToDeleteCharacter  
FETCH FROM @ToDeleteCharacter INTO @char_id  
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
 EXEC lin_deleteChar @char_id  
 FETCH NEXT FROM @ToDeleteCharacter INTO @char_id  
END  
  
CLOSE @ToDeleteCharacter   
DEALLOCATE @ToDeleteCharacter  

exec dbo.lin_CleanUpGhostData  



' 
END
GO
/****** Object:  StoredProcedure [dbo].[lin_CreateChar]    Script Date: 02/08/2011 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[lin_CreateChar]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[lin_CreateChar]
(  
@char_name NVARCHAR(24),  
@account_name NVARCHAR(24),  
@account_id INT,  
@pledge_id INT,  
@builder  TINYINT,  
@gender TINYINT,  
@race  TINYINT,  
@class  TINYINT,  
@world  SMALLINT,  
@xloc  INT,  
@yloc  INT,  
@zloc  INT,  
@HP  FLOAT,  
@MP  FLOAT,  
@SP  INT,  
@Exp  BIGINT,  
@Lev  TINYINT,  
@align  SMALLINT,  
@PK  INT,  
@Duel  INT,  
@PKPardon  INT,  
@FaceIndex   INT = 0,  
@HairShapeIndex  INT = 0,  
@HairColorIndex  INT = 0  
)  
AS  
  
SET NOCOUNT ON  
  
SET @char_name = RTRIM(@char_name)  
DECLARE @char_id int  
SET @char_id = 0  
  

IF @char_name LIKE N'' ''   
BEGIN  
 RAISERROR (''Character name has space : name = [%s]'', 16, 1, @char_name)  
 RETURN -1  
END  
  
-- check user_prohibit   
if exists(select char_name from user_prohibit (nolock) where char_name = @char_name)  
begin  
 RAISERROR (''Character name is prohibited: name = [%s]'', 16, 1, @char_name)  
 RETURN -1   
end  
  
declare @user_prohibit_word nvarchar(20)  
select top 1 @user_prohibit_word = words from user_prohibit_word (nolock) where @char_name like ''%'' + words + ''%''
if @user_prohibit_word is not null  
begin  
 RAISERROR (''Character name has prohibited word: name = [%s], word[%s]'', 16, 1, @char_name, @user_prohibit_word)  
 RETURN -1   
end  
  
-- check reserved name  
declare @reserved_name nvarchar(50)  
declare @reserved_account_id int  
select top 1 @reserved_name = char_name, @reserved_account_id = account_id from user_name_reserved (nolock) where used = 0 and char_name = @char_name  
if not @reserved_name is null  
begin  
 if not @reserved_account_id = @account_id  
 begin  
  RAISERROR (''Character name is reserved by other player: name = [%s]'', 16, 1, @char_name)  
  RETURN -1  
 end  
end  
  
-- insert user_data  
INSERT INTO user_data   
( char_name, account_name, account_id, pledge_id, builder, gender, race, class, subjob0_class, 
world, xloc, yloc, zloc, HP, MP, max_hp, max_mp, SP, Exp, Lev, align, PK, PKpardon, duel, create_date, face_index, hair_shape_index, hair_color_index )  
VALUES  
(@char_name, @account_name, @account_id, @pledge_id, @builder, @gender, @race, @class, @class, 
@world, @xloc, @yloc, @zloc, @HP, @MP, @HP, @MP, @SP, @Exp, @Lev, @align, @PK, @Duel, @PKPardon, GETDATE(), @FaceIndex, @HairShapeIndex, @HairColorIndex)  
  
IF (@@error = 0)  
BEGIN  
 SET @char_id = @@IDENTITY  
 INSERT INTO quest (char_id) VALUES (@char_id)  
END  
  
SELECT @char_id  
  
if @char_id > 0  
begin  
 -- make user_history  
 exec lin_InsertUserHistory @char_name, @char_id, 1, @account_name, NULL  
 if not @reserved_name is null  
  update user_name_reserved set used = 1 where char_name = @reserved_name  
end
' 
END

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_data' AND name = N'c1')
	ALTER TABLE user_data ADD c1 int NULL DEFAULT 0
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_data' AND name = N'c2')
	ALTER TABLE user_data ADD c2 int NULL DEFAULT 0
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_data' AND name = N'c3')
	ALTER TABLE user_data ADD c3 int NULL DEFAULT 0

DROP PROCEDURE dbo.lin_GetUserDataByCharId
GO

CREATE PROCEDURE dbo.lin_GetUserDataByCharId
(
@char_id INT
)
AS
SET NOCOUNT ON
DECLARE @acc NVARCHAR(50)
set @acc=(select account_name from user_data where char_id=@char_id)

IF @char_id > 0

SELECT
 RTRIM(ud.char_name), ud.char_id, RTRIM(ud.account_name), ud.account_id, ud.pledge_id, ud.builder, ud.gender, ud.race, ud.class,       
 ud.world, ud.xloc, ud.yloc, ud.zloc, ud.IsInVehicle, ud.HP, ud.MP, ud.Max_HP, ud.Max_MP, ud.CP, ud.Max_CP, ud.SP, ud.Exp, ud.Lev, ud.align, ud.PK, ud.duel, ud.pkpardon,       
 ud.ST_underware, ud.ST_right_ear, ud.ST_left_ear, ud.ST_neck, ud.ST_right_finger, ud.ST_left_finger, ud.ST_head, ud.ST_right_hand, ud.ST_left_hand, ud.ST_gloves, ud.ST_chest, ud.ST_legs, ud.ST_feet, ud.ST_back, ud.ST_both_hand, ud.ST_hair,  
 ISNULL(YEAR(temp_delete_date),0), ISNULL(MONTH(temp_delete_date),0), ISNULL(DAY(temp_delete_date),0),  
 ISNULL(DATEPART(HOUR, temp_delete_date),0), ISNULL(DATEPART(mi, temp_delete_date),0), ISNULL(DATEPART(s, temp_delete_date),0),  
 ISNULL(uas.s1, 0), ISNULL(uas.l1, 0), ISNULL(uas.d1, 0), ISNULL(uas.c1, 0),
 ISNULL(uas.s2, 0), ISNULL(uas.l2, 0), ISNULL(uas.d2, 0), ISNULL(uas.c2, 0),
 ISNULL(uas.s3, 0), ISNULL(uas.l3, 0), ISNULL(uas.d3, 0), ISNULL(uas.c3, 0),
 ISNULL(uas.s4, 0), ISNULL(uas.l4, 0), ISNULL(uas.d4, 0), ISNULL(uas.c4, 0),
 ISNULL(uas.s5, 0), ISNULL(uas.l5, 0), ISNULL(uas.d5, 0), ISNULL(uas.c5, 0),
 ISNULL(uas.s6, 0), ISNULL(uas.l6, 0), ISNULL(uas.d6, 0), ISNULL(uas.c6, 0),
 ISNULL(uas.s7, 0), ISNULL(uas.l7, 0), ISNULL(uas.d7, 0), ISNULL(uas.c7, 0),
 ISNULL(uas.s8, 0), ISNULL(uas.l8, 0), ISNULL(uas.d8, 0), ISNULL(uas.c8, 0),
 ISNULL(uas.s9, 0), ISNULL(uas.l9, 0), ISNULL(uas.d9, 0), ISNULL(uas.c9, 0),
 ISNULL(uas.s10, 0), ISNULL(uas.l10, 0), ISNULL(uas.d10, 0), ISNULL(uas.c10, 0),
 ISNULL(uas.s11, 0), ISNULL(uas.l11, 0), ISNULL(uas.d11, 0), ISNULL(uas.c11, 0),
 ISNULL(uas.s12, 0), ISNULL(uas.l12, 0), ISNULL(uas.d12, 0), ISNULL(uas.c12, 0),
 ISNULL(uas.s13, 0), ISNULL(uas.l13, 0), ISNULL(uas.d13, 0), ISNULL(uas.c13, 0),
 ISNULL(uas.s14, 0), ISNULL(uas.l14, 0), ISNULL(uas.d14, 0), ISNULL(uas.c14, 0),
 ISNULL(uas.s15, 0), ISNULL(uas.l15, 0), ISNULL(uas.d15, 0), ISNULL(uas.c15, 0),
 ISNULL(uas.s16, 0), ISNULL(uas.l16, 0), ISNULL(uas.d16, 0), ISNULL(uas.c16, 0),
 ISNULL(uas.s17, 0), ISNULL(uas.l17, 0), ISNULL(uas.d17, 0), ISNULL(uas.c17, 0),
 ISNULL(uas.s18, 0), ISNULL(uas.l18, 0), ISNULL(uas.d18, 0), ISNULL(uas.c18, 0),
 ISNULL(uas.s19, 0), ISNULL(uas.l19, 0), ISNULL(uas.d19, 0), ISNULL(uas.c19, 0),
 ISNULL(uas.s20, 0), ISNULL(uas.l20, 0), ISNULL(uas.d20, 0), ISNULL(uas.c20, 0),
 ud.quest_flag, ud.face_index, ud.hair_shape_index, ud.hair_color_index,
 ud.nickname, ud.power_flag, ud.pledge_dismiss_time, ud.pledge_ousted_time, ud.pledge_withdraw_time, ud.surrender_war_id, ud.use_time, ud.drop_exp,
 ISNULL( ub.status, 0), ISNULL( ub.ban_end , 0), ISNULL(ud.subjob_id , 0),
 ud.subjob0_class, ud.subjob1_class, ud.subjob2_class, ud.subjob3_class, ISNULL(ssq_dawn_round, 0),
 ISNULL(uun.color_rgb, 0x00ffffff),ISNULL(ud.wedding,0),ud.division,ud.pledge_group,ud.AcademyLev,ud.KarmaOrig,ud.PKdiff,ud.ST_face,ud.CursedTimeEquip,ISNULL(ud.TitleColor,0x00ffffff),ud.WeddingTelTime,
ISNULL(dyn.adena_drop,1),ISNULL(dyn.items_drop,1),ISNULL(dyn.spoil,1),ISNULL(dyn._exp,1),ISNULL(dyn._sp,1),ISNULL(SponsorId,0),
 ISNULL(uas.s21, 0), ISNULL(uas.l21, 0), ISNULL(uas.d21, 0), ISNULL(uas.c21, 0),
 ISNULL(uas.s22, 0), ISNULL(uas.l22, 0), ISNULL(uas.d22, 0), ISNULL(uas.c22, 0),
 ISNULL(uas.s23, 0), ISNULL(uas.l23, 0), ISNULL(uas.d23, 0), ISNULL(uas.c23, 0),
 ISNULL(uas.s24, 0), ISNULL(uas.l24, 0), ISNULL(uas.d24, 0), ISNULL(uas.c24, 0),
ud.ST_left_bracelet,ud.ST_right_bracelet,ud.ST_hairall,ud.ST_agathon,ud.souls,ud.transformation_id,ud.talisman1,ud.talisman2,ud.talisman3,ud.talisman4,ud.talisman5,ud.talisman6,
ISNULL(uas.s25, 0), ISNULL(uas.l25, 0), ISNULL(uas.d25, 0), ISNULL(uas.c25, 0),
ISNULL(uas.s26, 0), ISNULL(uas.l26, 0), ISNULL(uas.d26, 0), ISNULL(uas.c26, 0),
ISNULL(uas.s27, 0), ISNULL(uas.l27, 0), ISNULL(uas.d27, 0), ISNULL(uas.c27, 0),
ISNULL(uas.s28, 0), ISNULL(uas.l28, 0), ISNULL(uas.d28, 0), ISNULL(uas.c28, 0),
ISNULL(uas.s29, 0), ISNULL(uas.l29, 0), ISNULL(uas.d29, 0), ISNULL(uas.c29, 0),
ISNULL(uas.s30, 0), ISNULL(uas.l30, 0), ISNULL(uas.d30, 0), ISNULL(uas.c30, 0),
ISNULL(uas.s31, 0), ISNULL(uas.l31, 0), ISNULL(uas.d31, 0), ISNULL(uas.c31, 0),
ISNULL(uas.s32, 0), ISNULL(uas.l32, 0), ISNULL(uas.d32, 0), ISNULL(uas.c32, 0),
ISNULL(uas.s33, 0), ISNULL(uas.l33, 0), ISNULL(uas.d33, 0), ISNULL(uas.c33, 0),
ISNULL(uas.s34, 0), ISNULL(uas.l34, 0), ISNULL(uas.d34, 0), ISNULL(uas.c34, 0),
ISNULL(uas.s35, 0), ISNULL(uas.l35, 0), ISNULL(uas.d35, 0), ISNULL(uas.c35, 0),
ISNULL(uas.s36, 0), ISNULL(uas.l36, 0), ISNULL(uas.d36, 0), ISNULL(uas.c36, 0),
ISNULL(uas.s37, 0), ISNULL(uas.l37, 0), ISNULL(uas.d37, 0), ISNULL(uas.c37, 0),
ISNULL(uas.s38, 0), ISNULL(uas.l38, 0), ISNULL(uas.d38, 0), ISNULL(uas.c38, 0),
ISNULL(uas.s39, 0), ISNULL(uas.l39, 0), ISNULL(uas.d39, 0), ISNULL(uas.c39, 0),
ISNULL(uas.s40, 0), ISNULL(uas.l40, 0), ISNULL(uas.d40, 0), ISNULL(uas.c40, 0),
ISNULL(ud.c1,0),ISNULL(ud.c2,0),ISNULL(ud.c3,0),
ISNULL(ous.start_time,0),ISNULL(ous.remain_time,0)
FROM
 (SELECT * FROM User_data (nolock) WHERE char_id = @char_id) AS ud
 LEFT OUTER JOIN
 (SELECT * FROM user_ActiveSkill (nolock) WHERE char_id = @char_id) as uas ON ud.char_id = uas.char_id
 left  OUTER JOIN
 (select * from user_ban (nolock) where char_id = @char_id) as ub on ud.char_id = ub.char_id
 left OUTER JOIN
 (select * from user_name_color (nolock) where char_id = @char_id) as uun on ud.char_id = uun.char_id
left OUTER JOIN
(select * from dynamic_rates (nolock) where acc_name=@acc) as dyn on @acc=dyn.acc_name
left OUTER JOIN
(select * from offlinestore_users (nolock) where char_id = @char_id) as ous ON ud.char_id = ous.char_id
GO

GO
/****** Object:  Table [dbo].[user_jailed]    Script Date: 09/15/2010 13:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_jailed](
	[char_id] [int] NOT NULL,
	[jailed_when] [datetime] NOT NULL CONSTRAINT [DF_user_jailed_jailed_when]  DEFAULT (getdate()),
	[jailed_until] [bigint] NOT NULL,
 CONSTRAINT [PK_user_jailed] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'hp_stove')
	ALTER TABLE castle ADD hp_stove	tinyint NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'mp_flame')
	ALTER TABLE castle ADD mp_flame	tinyint NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'hatcher')
	ALTER TABLE castle ADD hatcher	tinyint NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'hp_stove_expire')
	ALTER TABLE castle ADD hp_stove_expire	INT NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'mp_flame_expire')
	ALTER TABLE castle ADD mp_flame_expire	INT NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'teleport_level')
	ALTER TABLE castle ADD teleport_level	INT NULL
IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'castle' AND name = N'teleport_expire')
	ALTER TABLE castle ADD teleport_expire	INT NULL

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lin_LoadCastle]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lin_LoadCastle]
GO


/********************************************
lin_LoadCastle

INPUT
 @id int,
 @type int
OUTPUT
 pledge_id,
 next_war_time,
 tax_rate,
 status,
 name,
 crop_income,
 shop_income,
 siege_elapsed_time
 shop_Income_Temp,
 Tax_rate_to_change,
 tax_child_rate_to_change
return
made by
 carrot
date
 2002-06-16
change 2004-02-29 carrot
mod 2010-09-23 Vampire
 add CastleIncomeTemp and TaxRateTochange, tax_child_rate_to_change
********************************************/
CREATE PROCEDURE [DBO].[lin_LoadCastle]
(
 @id int,
 @type int
)
AS
SET NOCOUNT ON

SELECT
 pledge_id, next_war_time, tax_rate, tax_child_rate, status, name, crop_income, shop_income, siege_elapsed_time, shop_Income_Temp, Tax_rate_to_change,  
 tax_child_rate_to_change, isnull(hp_stove,0), isnull(mp_flame,0), isnull(hatcher,0), isnull(hp_stove_expire,0), isnull(mp_flame_expire,0), isnull(teleport_level,0), isnull(teleport_expire,0)
FROM
 castle (nolock)
WHERE
 id = @id AND type = @type

GO

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE lin_GetPledgeScoreRank
AS
BEGIN
	SET NOCOUNT ON;
	declare @pledge_id int
	declare @name varchar(50)
	declare @score int
	declare @RankPos int
	declare PledgeRankList cursor for
	select top 1000 pledge_id, name, score from pledge where score > 0 order by score desc
	OPEN PledgeRankList
	FETCH NEXT FROM PledgeRankList INTO @pledge_id, @name, @score
	set @RankPos = 0 
	create table ##RANK (rank int, pledge_id int, name varchar(50), score int)
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @RankPos=@RankPos + 1
		INSERT INTO ##RANK VALUES(@RankPos,@pledge_id,@name,@score)
		FETCH NEXT FROM PledgeRankList INTO @pledge_id, @name, @score
	END
	CLOSE PledgeRankList
	DEALLOCATE PledgeRankList
	select * from ##RANK
	drop table ##RANK
END
GO

GO
/****** Object:  Table [dbo].[aio_items]    Script Date: 11/12/2010 11:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aio_items](
	[iid] [bigint] IDENTITY(1,1) NOT NULL,
	[char_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
 CONSTRAINT [PK_aio_items] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[aio_buffers]    Script Date: 11/12/2010 11:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aio_buffers](
	[aid] [bigint] IDENTITY(1,1) NOT NULL,
	[char_id] [int] NOT NULL CONSTRAINT [DF_aio_buffers_char_id]  DEFAULT ((0)),
	[unlimited] [tinyint] NOT NULL CONSTRAINT [DF_aio_buffers_unlimited]  DEFAULT ((0)),
	[added_in] [int] NOT NULL,
	[expires_in] [int] NOT NULL CONSTRAINT [DF_aio_buffers_expires_in]  DEFAULT ((0)),
 CONSTRAINT [PK_aio_buffers] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_data' AND name = N'CursedLastPkTime')
	ALTER TABLE user_data ADD [CursedLastPkTime] [int] NOT NULL DEFAULT 0

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lin_GetUserDataByCharId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lin_GetUserDataByCharId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lin_CheckCursedWeapon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lin_CheckCursedWeapon]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lin_SaveCharacter]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lin_SaveCharacter]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

CREATE PROCEDURE [dbo].[lin_CheckCursedWeapon]
(
	@cursed_id	INT
)
AS
SET NOCOUNT ON 
SELECT TOP 1 ui.item_id, ud.CursedTimeEquip, ud.PKdiff, ud.char_id, ud.CursedLastPkTime FROM user_item ui LEFT JOIN user_data ud ON (ui.char_id = ud.char_id) WHERE item_type=@cursed_id AND ui.char_id > 0

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

CREATE PROCEDURE [dbo].[lin_GetUserDataByCharId]
(
@char_id INT
)
AS
SET NOCOUNT ON
DECLARE @acc NVARCHAR(50)
set @acc=(select account_name from user_data where char_id=@char_id)

IF @char_id > 0

SELECT
 RTRIM(ud.char_name), ud.char_id, RTRIM(ud.account_name),
ud.account_id, ud.pledge_id, ud.builder, ud.gender, ud.race, ud.class,
 ud.world, ud.xloc, ud.yloc, ud.zloc, ud.IsInVehicle, ud.HP, ud.MP,
ud.Max_HP, ud.Max_MP, ud.CP, ud.Max_CP, ud.SP, ud.Exp, ud.Lev,
ud.align, ud.PK, ud.duel, ud.pkpardon,
 ud.ST_underware, ud.ST_right_ear, ud.ST_left_ear, ud.ST_neck,
ud.ST_right_finger, ud.ST_left_finger, ud.ST_head, ud.ST_right_hand,
ud.ST_left_hand, ud.ST_gloves, ud.ST_chest, ud.ST_legs, ud.ST_feet,
ud.ST_back, ud.ST_both_hand, ud.ST_hair,
 ISNULL(YEAR(temp_delete_date),0), ISNULL(MONTH(temp_delete_date),0),
ISNULL(DAY(temp_delete_date),0),
 ISNULL(DATEPART(HOUR, temp_delete_date),0), ISNULL(DATEPART(mi,
temp_delete_date),0), ISNULL(DATEPART(s, temp_delete_date),0),
 ISNULL(uas.s1, 0), ISNULL(uas.l1, 0), ISNULL(uas.d1, 0),
ISNULL(uas.c1, 0),
 ISNULL(uas.s2, 0), ISNULL(uas.l2, 0), ISNULL(uas.d2, 0),
ISNULL(uas.c2, 0),
 ISNULL(uas.s3, 0), ISNULL(uas.l3, 0), ISNULL(uas.d3, 0),
ISNULL(uas.c3, 0),
 ISNULL(uas.s4, 0), ISNULL(uas.l4, 0), ISNULL(uas.d4, 0),
ISNULL(uas.c4, 0),
 ISNULL(uas.s5, 0), ISNULL(uas.l5, 0), ISNULL(uas.d5, 0),
ISNULL(uas.c5, 0),
 ISNULL(uas.s6, 0), ISNULL(uas.l6, 0), ISNULL(uas.d6, 0),
ISNULL(uas.c6, 0),
 ISNULL(uas.s7, 0), ISNULL(uas.l7, 0), ISNULL(uas.d7, 0),
ISNULL(uas.c7, 0),
 ISNULL(uas.s8, 0), ISNULL(uas.l8, 0), ISNULL(uas.d8, 0),
ISNULL(uas.c8, 0),
 ISNULL(uas.s9, 0), ISNULL(uas.l9, 0), ISNULL(uas.d9, 0),
ISNULL(uas.c9, 0),
 ISNULL(uas.s10, 0), ISNULL(uas.l10, 0), ISNULL(uas.d10, 0),
ISNULL(uas.c10, 0),
 ISNULL(uas.s11, 0), ISNULL(uas.l11, 0), ISNULL(uas.d11, 0),
ISNULL(uas.c11, 0),
 ISNULL(uas.s12, 0), ISNULL(uas.l12, 0), ISNULL(uas.d12, 0),
ISNULL(uas.c12, 0),
 ISNULL(uas.s13, 0), ISNULL(uas.l13, 0), ISNULL(uas.d13, 0),
ISNULL(uas.c13, 0),
 ISNULL(uas.s14, 0), ISNULL(uas.l14, 0), ISNULL(uas.d14, 0),
ISNULL(uas.c14, 0),
 ISNULL(uas.s15, 0), ISNULL(uas.l15, 0), ISNULL(uas.d15, 0),
ISNULL(uas.c15, 0),
 ISNULL(uas.s16, 0), ISNULL(uas.l16, 0), ISNULL(uas.d16, 0),
ISNULL(uas.c16, 0),
 ISNULL(uas.s17, 0), ISNULL(uas.l17, 0), ISNULL(uas.d17, 0),
ISNULL(uas.c17, 0),
 ISNULL(uas.s18, 0), ISNULL(uas.l18, 0), ISNULL(uas.d18, 0),
ISNULL(uas.c18, 0),
 ISNULL(uas.s19, 0), ISNULL(uas.l19, 0), ISNULL(uas.d19, 0),
ISNULL(uas.c19, 0),
 ISNULL(uas.s20, 0), ISNULL(uas.l20, 0), ISNULL(uas.d20, 0),
ISNULL(uas.c20, 0),
 ud.quest_flag, ud.face_index, ud.hair_shape_index, ud.hair_color_index,
 ud.nickname, ud.power_flag, ud.pledge_dismiss_time,
ud.pledge_ousted_time, ud.pledge_withdraw_time, ud.surrender_war_id,
ud.use_time, ud.drop_exp,
 ISNULL( ub.status, 0), ISNULL( ub.ban_end , 0), ISNULL(ud.subjob_id , 0),
 ud.subjob0_class, ud.subjob1_class, ud.subjob2_class,
ud.subjob3_class, ISNULL(ssq_dawn_round, 0),
 ISNULL(uun.color_rgb,
0x00ffffff),ISNULL(ud.wedding,0),ud.division,ud.pledge_group,ud.AcademyLev,ud.KarmaOrig,ud.PKdiff,ud.ST_face,ud.CursedTimeEquip,ISNULL(ud.TitleColor,0x00ffffff),ud.WeddingTelTime,
ISNULL(dyn.adena_drop,1),ISNULL(dyn.items_drop,1),ISNULL(dyn.spoil,1),ISNULL(dyn._exp,1),ISNULL(dyn._sp,1),ISNULL(SponsorId,0),
 ISNULL(uas.s21, 0), ISNULL(uas.l21, 0), ISNULL(uas.d21, 0), ISNULL(uas.c21, 0),
 ISNULL(uas.s22, 0), ISNULL(uas.l22, 0), ISNULL(uas.d22, 0), ISNULL(uas.c22, 0),
 ISNULL(uas.s23, 0), ISNULL(uas.l23, 0), ISNULL(uas.d23, 0), ISNULL(uas.c23, 0),
 ISNULL(uas.s24, 0), ISNULL(uas.l24, 0), ISNULL(uas.d24, 0), ISNULL(uas.c24, 0),
ud.ST_left_bracelet,ud.ST_right_bracelet,ud.ST_hairall,ud.ST_agathon,ud.souls,ud.transformation_id,ud.talisman1,ud.talisman2,ud.talisman3,ud.talisman4,ud.talisman5,ud.talisman6,
ISNULL(uas.s25, 0), ISNULL(uas.l25, 0), ISNULL(uas.d25, 0), ISNULL(uas.c25, 0),
ISNULL(uas.s26, 0), ISNULL(uas.l26, 0), ISNULL(uas.d26, 0), ISNULL(uas.c26, 0),
ISNULL(uas.s27, 0), ISNULL(uas.l27, 0), ISNULL(uas.d27, 0), ISNULL(uas.c27, 0),
ISNULL(uas.s28, 0), ISNULL(uas.l28, 0), ISNULL(uas.d28, 0), ISNULL(uas.c28, 0),
ISNULL(uas.s29, 0), ISNULL(uas.l29, 0), ISNULL(uas.d29, 0), ISNULL(uas.c29, 0),
ISNULL(uas.s30, 0), ISNULL(uas.l30, 0), ISNULL(uas.d30, 0), ISNULL(uas.c30, 0),
ISNULL(uas.s31, 0), ISNULL(uas.l31, 0), ISNULL(uas.d31, 0), ISNULL(uas.c31, 0),
ISNULL(uas.s32, 0), ISNULL(uas.l32, 0), ISNULL(uas.d32, 0), ISNULL(uas.c32, 0),
ISNULL(uas.s33, 0), ISNULL(uas.l33, 0), ISNULL(uas.d33, 0), ISNULL(uas.c33, 0),
ISNULL(uas.s34, 0), ISNULL(uas.l34, 0), ISNULL(uas.d34, 0), ISNULL(uas.c34, 0),
ISNULL(uas.s35, 0), ISNULL(uas.l35, 0), ISNULL(uas.d35, 0), ISNULL(uas.c35, 0),
ISNULL(uas.s36, 0), ISNULL(uas.l36, 0), ISNULL(uas.d36, 0), ISNULL(uas.c36, 0),
ISNULL(uas.s37, 0), ISNULL(uas.l37, 0), ISNULL(uas.d37, 0), ISNULL(uas.c37, 0),
ISNULL(uas.s38, 0), ISNULL(uas.l38, 0), ISNULL(uas.d38, 0), ISNULL(uas.c38, 0),
ISNULL(uas.s39, 0), ISNULL(uas.l39, 0), ISNULL(uas.d39, 0), ISNULL(uas.c39, 0),
ISNULL(uas.s40, 0), ISNULL(uas.l40, 0), ISNULL(uas.d40, 0), ISNULL(uas.c40, 0),
ISNULL(ud.c1,0),ISNULL(ud.c2,0),ISNULL(ud.c3,0),
ISNULL(ous.start_time,0),ISNULL(ous.remain_time,0),ISNULL(ud.CursedLastPkTime,0)
FROM
 (SELECT * FROM User_data (nolock) WHERE char_id = @char_id) AS ud
 LEFT OUTER JOIN
 (SELECT * FROM user_ActiveSkill (nolock) WHERE char_id = @char_id) as
uas ON ud.char_id = uas.char_id
 left  OUTER JOIN
 (select * from user_ban (nolock) where char_id = @char_id) as ub on
ud.char_id = ub.char_id
 left OUTER JOIN
 (select * from user_name_color (nolock) where char_id = @char_id) as
uun on ud.char_id = uun.char_id
left OUTER JOIN
(select * from dynamic_rates (nolock) where acc_name=@acc) as dyn on
@acc=dyn.acc_name
left OUTER JOIN
(select * from offlinestore_users (nolock) where char_id = @char_id)
as ous ON ud.char_id = ous.char_id

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

CREATE PROCEDURE [dbo].[lin_SaveCharacter]
(
	@subjob_id INT,
	@pledge_id INT,
	@class INT,
	@world INT,
	@xloc INT,
	@yloc INT,
	@zloc INT,
	@IsInVehicle INT,
	@HP FLOAT,
	@MP FLOAT,
	@max_HP FLOAT,
	@max_MP FLOAT,
	@SP INT,
	@Exp BIGINT,
	@Lev INT,
	@align INT,
	@PK INT,
	@duel INT,
	@pkpardon INT,
	@ST_underware INT, 
	@ST_right_ear INT, 
	@ST_left_ear INT, 
	@ST_neck INT, 
	@ST_right_finger INT, 
	@ST_left_finger INT, 
	@ST_head INT, 
	@ST_right_hand INT, 
	@ST_left_hand INT, 
	@ST_gloves INT, 
	@ST_chest INT, 
	@ST_legs INT, 
	@ST_feet INT, 
	@ST_back INT, 
	@ST_both_hand INT, 
	@Face_Index INT, 
	@Hair_Shape_Index INT, 
	@Hair_Color_Index INT, 
	@ssq_dawn_round INT,
	@char_id  INT,
	@subjob0_class INT, 
	@subjob1_class INT, 
	@subjob2_class INT, 
	@subjob3_class INT, 
	@CP FLOAT,
	@max_CP FLOAT,
	@ST_hair INT,
	@wedding INT ,
	@division INT,
	@pledge_group INT,
	@AcademyLev	INT,
	@KarmaOrig	INT,
	@PKdiff	INT,
	@ST_face	INT,
	@CursedTimeEquip	INT,
	@TitleColor	INT,
	@WeddingTelTime	INT,
	@ST_HairAll	INT,
	@ST_Agathon	INT,
	@ST_LeftBracelet	INT,
	@ST_RightBracelet	INT,
	@ST_Talisman1		INT,
	@ST_Talisman2		INT,
	@ST_Talisman3		INT,
	@ST_Talisman4		INT,
	@ST_Talisman5		INT,
	@ST_Talisman6		INT,
	@Souls	INT,
	@CursedLastPkTime	INT
)
AS

SET NOCOUNT ON

UPDATE 
	user_data 
SET
	subjob_id = @subjob_id,
	class= @class,
	world= @world,
	xloc= @xloc,
	yloc= @yloc,
	zloc= @zloc,
	IsInVehicle= @IsInVehicle,
	HP= @HP,
	MP= @MP,
	max_HP= @max_HP,
	max_MP= @max_MP,
	SP= @SP,
	Exp= @Exp,
	Lev= @Lev,
	align= @align,
	PK= @PK,
	duel= @duel,
	pkpardon= @pkpardon,
	ST_underware= @ST_underware, 
	ST_right_ear= @ST_right_ear, 
	ST_left_ear= @ST_left_ear, 
	ST_neck= @ST_neck, 
	ST_right_finger= @ST_right_finger, 
	ST_left_finger= @ST_left_finger, 
	ST_head= @ST_head, 
	ST_right_hand= @ST_right_hand, 
	ST_left_hand= @ST_left_hand, 
	ST_gloves= @ST_gloves, 
	ST_chest= @ST_chest, 
	ST_legs= @ST_legs, 
	ST_feet= @ST_feet, 
	ST_back= @ST_back, 
	ST_both_hand= @ST_both_hand,
	Face_Index= @Face_Index, 
	Hair_Shape_Index= @Hair_Shape_Index, 
	Hair_Color_Index= @Hair_Color_Index ,
	ssq_dawn_round = @ssq_dawn_round,
	subjob0_class = @subjob0_class, 
	subjob1_class = @subjob1_class, 
	subjob2_class = @subjob2_class, 
	subjob3_class = @subjob3_class, 
	cp = @CP,
	max_cp = @max_CP,
	ST_hair = @ST_hair,
	wedding = @wedding,
	division = @division,
	pledge_group = @pledge_group,
	AcademyLev = @AcademyLev,
	KarmaOrig = @KarmaOrig,
	PKdiff = @PKdiff,
	ST_face = @ST_face,
	CursedTimeEquip = @CursedTimeEquip,
	TitleColor = @TitleColor,
	WeddingTelTime = @WeddingTelTime,
	ST_left_bracelet = @ST_LeftBracelet,
	ST_right_bracelet = @ST_RightBracelet,
	ST_hairall = @ST_HairAll,
	ST_agathon = @ST_Agathon,
	souls = @Souls,
	talisman1 = @ST_Talisman1,
	talisman2 = @ST_Talisman2,
	talisman3 = @ST_Talisman3,
	talisman4 = @ST_Talisman4,
	talisman5 = @ST_Talisman5,
	talisman6 = @ST_Talisman6,
	CursedLastPkTime = @CursedLastPkTime
WHERE 
	char_id= @char_id

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban_history](
	[ubhid] [bigint] IDENTITY(1,1) NOT NULL,
	[account] [nvarchar](32) COLLATE Latin1_General_CI_AS NOT NULL,
	[history] [nvarchar](256) COLLATE Latin1_General_CI_AS NULL,
	[type] [nvarchar](32) COLLATE Latin1_General_CI_AS NOT NULL,
	[date] [datetime] NOT NULL CONSTRAINT [DF_ban_history_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_ban_history] PRIMARY KEY CLUSTERED 
(
	[ubhid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_reusetime_ex](
	[char_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[skill_lv] [int] NOT NULL,	
	[subjob_id] [int] NOT NULL,
	[to_end_time] [int] NOT NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_user_reusetime] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[skill_id] ASC,
	[skill_lv] ASC,
	[subjob_id] ASC	
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_char_id]  DEFAULT ((0)) FOR [char_id]
GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_skill_id]  DEFAULT ((0)) FOR [skill_id]
GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_skill_lv]  DEFAULT ((0)) FOR [skill_lv]
GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_subjob]  DEFAULT ((0)) FOR [subjob_id]
GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_casttime]  DEFAULT ((0)) FOR [to_end_time]
GO

ALTER TABLE [dbo].[user_reusetime_ex] ADD  CONSTRAINT [DF_user_reusetime_duration]  DEFAULT ((0)) FOR [duration]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DELETE FROM [user_reusetime_ex]
GO

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_reusetime_ex' AND name = N'totdur')
BEGIN
	ALTER TABLE [user_reusetime_ex] ADD [totdur] [int] NOT NULL
	ALTER TABLE [dbo].[user_reusetime_ex] ADD CONSTRAINT [DF_user_reusetime_totdur]  DEFAULT ((0)) FOR [totdur]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'dynamic_rates' AND name = N'time')
BEGIN
	ALTER TABLE [dynamic_rates] ADD [time] [int] NOT NULL   DEFAULT ((0))
END
GO

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'dynamic_rates' AND name = N'duration')
BEGIN
	ALTER TABLE [dynamic_rates] ADD [duration] [int] NOT NULL   DEFAULT ((-1))
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[lin_GetUserDataByCharId]
(
@char_id INT
)
AS
SET NOCOUNT ON
DECLARE @acc NVARCHAR(50)
set @acc=(select account_name from user_data where char_id=@char_id)

IF @char_id > 0

SELECT
 RTRIM(ud.char_name), ud.char_id, RTRIM(ud.account_name),
ud.account_id, ud.pledge_id, ud.builder, ud.gender, ud.race, ud.class,
 ud.world, ud.xloc, ud.yloc, ud.zloc, ud.IsInVehicle, ud.HP, ud.MP,
ud.Max_HP, ud.Max_MP, ud.CP, ud.Max_CP, ud.SP, ud.Exp, ud.Lev,
ud.align, ud.PK, ud.duel, ud.pkpardon,
 ud.ST_underware, ud.ST_right_ear, ud.ST_left_ear, ud.ST_neck,
ud.ST_right_finger, ud.ST_left_finger, ud.ST_head, ud.ST_right_hand,
ud.ST_left_hand, ud.ST_gloves, ud.ST_chest, ud.ST_legs, ud.ST_feet,
ud.ST_back, ud.ST_both_hand, ud.ST_hair,
 ISNULL(YEAR(temp_delete_date),0), ISNULL(MONTH(temp_delete_date),0),
ISNULL(DAY(temp_delete_date),0),
 ISNULL(DATEPART(HOUR, temp_delete_date),0), ISNULL(DATEPART(mi,
temp_delete_date),0), ISNULL(DATEPART(s, temp_delete_date),0),
 ISNULL(uas.s1, 0), ISNULL(uas.l1, 0), ISNULL(uas.d1, 0),
ISNULL(uas.c1, 0),
 ISNULL(uas.s2, 0), ISNULL(uas.l2, 0), ISNULL(uas.d2, 0),
ISNULL(uas.c2, 0),
 ISNULL(uas.s3, 0), ISNULL(uas.l3, 0), ISNULL(uas.d3, 0),
ISNULL(uas.c3, 0),
 ISNULL(uas.s4, 0), ISNULL(uas.l4, 0), ISNULL(uas.d4, 0),
ISNULL(uas.c4, 0),
 ISNULL(uas.s5, 0), ISNULL(uas.l5, 0), ISNULL(uas.d5, 0),
ISNULL(uas.c5, 0),
 ISNULL(uas.s6, 0), ISNULL(uas.l6, 0), ISNULL(uas.d6, 0),
ISNULL(uas.c6, 0),
 ISNULL(uas.s7, 0), ISNULL(uas.l7, 0), ISNULL(uas.d7, 0),
ISNULL(uas.c7, 0),
 ISNULL(uas.s8, 0), ISNULL(uas.l8, 0), ISNULL(uas.d8, 0),
ISNULL(uas.c8, 0),
 ISNULL(uas.s9, 0), ISNULL(uas.l9, 0), ISNULL(uas.d9, 0),
ISNULL(uas.c9, 0),
 ISNULL(uas.s10, 0), ISNULL(uas.l10, 0), ISNULL(uas.d10, 0),
ISNULL(uas.c10, 0),
 ISNULL(uas.s11, 0), ISNULL(uas.l11, 0), ISNULL(uas.d11, 0),
ISNULL(uas.c11, 0),
 ISNULL(uas.s12, 0), ISNULL(uas.l12, 0), ISNULL(uas.d12, 0),
ISNULL(uas.c12, 0),
 ISNULL(uas.s13, 0), ISNULL(uas.l13, 0), ISNULL(uas.d13, 0),
ISNULL(uas.c13, 0),
 ISNULL(uas.s14, 0), ISNULL(uas.l14, 0), ISNULL(uas.d14, 0),
ISNULL(uas.c14, 0),
 ISNULL(uas.s15, 0), ISNULL(uas.l15, 0), ISNULL(uas.d15, 0),
ISNULL(uas.c15, 0),
 ISNULL(uas.s16, 0), ISNULL(uas.l16, 0), ISNULL(uas.d16, 0),
ISNULL(uas.c16, 0),
 ISNULL(uas.s17, 0), ISNULL(uas.l17, 0), ISNULL(uas.d17, 0),
ISNULL(uas.c17, 0),
 ISNULL(uas.s18, 0), ISNULL(uas.l18, 0), ISNULL(uas.d18, 0),
ISNULL(uas.c18, 0),
 ISNULL(uas.s19, 0), ISNULL(uas.l19, 0), ISNULL(uas.d19, 0),
ISNULL(uas.c19, 0),
 ISNULL(uas.s20, 0), ISNULL(uas.l20, 0), ISNULL(uas.d20, 0),
ISNULL(uas.c20, 0),
 ud.quest_flag, ud.face_index, ud.hair_shape_index, ud.hair_color_index,
 ud.nickname, ud.power_flag, ud.pledge_dismiss_time,
ud.pledge_ousted_time, ud.pledge_withdraw_time, ud.surrender_war_id,
ud.use_time, ud.drop_exp,
 ISNULL( ub.status, 0), ISNULL( ub.ban_end , 0), ISNULL(ud.subjob_id , 0),
 ud.subjob0_class, ud.subjob1_class, ud.subjob2_class,
ud.subjob3_class, ISNULL(ssq_dawn_round, 0),
 ISNULL(uun.color_rgb,
0x00ffffff),ISNULL(ud.wedding,0),ud.division,ud.pledge_group,ud.AcademyLev,ud.KarmaOrig,ud.PKdiff,ud.ST_face,ud.CursedTimeEquip,ISNULL(ud.TitleColor,0x00ffffff),ud.WeddingTelTime,
ISNULL(dyn.adena_drop,1),ISNULL(dyn.items_drop,1),ISNULL(dyn.spoil,1),ISNULL(dyn._exp,1),ISNULL(dyn._sp,1),ISNULL(SponsorId,0),
 ISNULL(uas.s21, 0), ISNULL(uas.l21, 0), ISNULL(uas.d21, 0), ISNULL(uas.c21, 0),
 ISNULL(uas.s22, 0), ISNULL(uas.l22, 0), ISNULL(uas.d22, 0), ISNULL(uas.c22, 0),
 ISNULL(uas.s23, 0), ISNULL(uas.l23, 0), ISNULL(uas.d23, 0), ISNULL(uas.c23, 0),
 ISNULL(uas.s24, 0), ISNULL(uas.l24, 0), ISNULL(uas.d24, 0), ISNULL(uas.c24, 0),
ud.ST_left_bracelet,ud.ST_right_bracelet,ud.ST_hairall,ud.ST_agathon,ud.souls,ud.transformation_id,ud.talisman1,ud.talisman2,ud.talisman3,ud.talisman4,ud.talisman5,ud.talisman6,
ISNULL(uas.s25, 0), ISNULL(uas.l25, 0), ISNULL(uas.d25, 0), ISNULL(uas.c25, 0),
ISNULL(uas.s26, 0), ISNULL(uas.l26, 0), ISNULL(uas.d26, 0), ISNULL(uas.c26, 0),
ISNULL(uas.s27, 0), ISNULL(uas.l27, 0), ISNULL(uas.d27, 0), ISNULL(uas.c27, 0),
ISNULL(uas.s28, 0), ISNULL(uas.l28, 0), ISNULL(uas.d28, 0), ISNULL(uas.c28, 0),
ISNULL(uas.s29, 0), ISNULL(uas.l29, 0), ISNULL(uas.d29, 0), ISNULL(uas.c29, 0),
ISNULL(uas.s30, 0), ISNULL(uas.l30, 0), ISNULL(uas.d30, 0), ISNULL(uas.c30, 0),
ISNULL(uas.s31, 0), ISNULL(uas.l31, 0), ISNULL(uas.d31, 0), ISNULL(uas.c31, 0),
ISNULL(uas.s32, 0), ISNULL(uas.l32, 0), ISNULL(uas.d32, 0), ISNULL(uas.c32, 0),
ISNULL(uas.s33, 0), ISNULL(uas.l33, 0), ISNULL(uas.d33, 0), ISNULL(uas.c33, 0),
ISNULL(uas.s34, 0), ISNULL(uas.l34, 0), ISNULL(uas.d34, 0), ISNULL(uas.c34, 0),
ISNULL(uas.s35, 0), ISNULL(uas.l35, 0), ISNULL(uas.d35, 0), ISNULL(uas.c35, 0),
ISNULL(uas.s36, 0), ISNULL(uas.l36, 0), ISNULL(uas.d36, 0), ISNULL(uas.c36, 0),
ISNULL(uas.s37, 0), ISNULL(uas.l37, 0), ISNULL(uas.d37, 0), ISNULL(uas.c37, 0),
ISNULL(uas.s38, 0), ISNULL(uas.l38, 0), ISNULL(uas.d38, 0), ISNULL(uas.c38, 0),
ISNULL(uas.s39, 0), ISNULL(uas.l39, 0), ISNULL(uas.d39, 0), ISNULL(uas.c39, 0),
ISNULL(uas.s40, 0), ISNULL(uas.l40, 0), ISNULL(uas.d40, 0), ISNULL(uas.c40, 0),
ISNULL(ud.c1,0),ISNULL(ud.c2,0),ISNULL(ud.c3,0),
ISNULL(ous.start_time,0),ISNULL(ous.remain_time,0),ISNULL(ud.CursedLastPkTime,0),
ISNULL(dyn.time, 0), ISNULL(dyn.duration, 0)
FROM
 (SELECT * FROM User_data (nolock) WHERE char_id = @char_id) AS ud
 LEFT OUTER JOIN
 (SELECT * FROM user_ActiveSkill (nolock) WHERE char_id = @char_id) as
uas ON ud.char_id = uas.char_id
 left  OUTER JOIN
 (select * from user_ban (nolock) where char_id = @char_id) as ub on
ud.char_id = ub.char_id
 left OUTER JOIN
 (select * from user_name_color (nolock) where char_id = @char_id) as
uun on ud.char_id = uun.char_id
left OUTER JOIN
(select * from dynamic_rates (nolock) where acc_name=@acc) as dyn on
@acc=dyn.acc_name
left OUTER JOIN
(select * from offlinestore_users (nolock) where char_id = @char_id)
as ous ON ud.char_id = ous.char_id

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

GO

/****** Object:  StoredProcedure [dbo].[lin_DeleteSubJob]    Script Date: 07/25/2012 23:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[lin_DeleteSubJob]
(
	@char_id	INT,
	@subjob_id	INT
)
AS

SET NOCOUNT ON

DECLARE @ret INT
SELECT @ret = 0

BEGIN TRAN

DELETE FROM shortcut_data WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_henna WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_skill WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

IF @subjob_id = 1
	UPDATE user_data SET subjob1_class = -1 WHERE char_id = @char_id
ELSE IF @subjob_id = 2
	UPDATE user_data SET subjob2_class = -1 WHERE char_id = @char_id
ELSE IF @subjob_id = 3
	UPDATE user_data SET subjob3_class = -1 WHERE char_id = @char_id

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	SELECT @ret = 0
	GOTO EXIT_TRAN
END

DELETE FROM user_subjob
WHERE char_id = @char_id AND subjob_id = @subjob_id

IF @@ERROR = 0 AND @@ROWCOUNT = 1	-- update, insert check
BEGIN
	SELECT @ret = 1
END
ELSE
BEGIN
	SELECT @ret = 0
END

EXIT_TRAN:

IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret

GO

/****** Object:  Table [dbo].[user_chatblock]    Script Date: 08/03/2012 18:14:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_chatblock](
	[char_id] [int] NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_user_chatblock] PRIMARY KEY CLUSTERED 
(
	[char_id] ASC,
	[type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[user_delivery]    Script Date: 08/04/2012 01:59:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user_delivery](
	[delivery_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[char_name] [nvarchar](50) NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[enchant] [int] NOT NULL,
	[status] [int] NOT NULL,
	[gw_description] [nvarchar](128) NULL,
	[gw_token] [nvarchar](128) NULL,
	[gw_status] [nvarchar](64) NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_user_delivery] PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[user_delivery] ADD  CONSTRAINT [DF_user_delivery_date]  DEFAULT (getdate()) FOR [date]
GO

ALTER TABLE user_data ADD country int NOT NULL DEFAULT ((-1))
GO
