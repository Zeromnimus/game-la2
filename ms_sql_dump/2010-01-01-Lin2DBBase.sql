SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_count]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_count](
	[record_time] [datetime] NOT NULL CONSTRAINT [DF_user_count_record_time]  DEFAULT (getdate()),
	[server_id] [tinyint] NOT NULL,
	[world_user] [smallint] NOT NULL,
	[limit_user] [smallint] NOT NULL,
	[auth_user] [int] NOT NULL,
	[wait_user] [int] NOT NULL,
	[dayofweek] [tinyint] NOT NULL CONSTRAINT [DF_user_count_dayofweek]  DEFAULT (datepart(weekday,getdate()))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_auth]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_auth](
	[account] [varchar](14) NOT NULL,
	[password] [binary](16) NOT NULL,
	[quiz1] [varchar](255) NOT NULL,
	[quiz2] [varchar](255) NOT NULL,
	[answer1] [binary](32) NOT NULL,
	[answer2] [binary](32) NOT NULL,
	[ipcreatefrom] [varchar](50) NULL,
	[createdate] [varchar](50) NULL,
 CONSTRAINT [PK_user_auth] PRIMARY KEY CLUSTERED 
(
	[account] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_account]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_account](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](14) NOT NULL,
	[pay_stat] [int] NOT NULL CONSTRAINT [DF_user_account__pay_stat]  DEFAULT ((0)),
	[login_flag] [int] NOT NULL CONSTRAINT [DF_user_account__login_flag]  DEFAULT ((0)),
	[warn_flag] [int] NOT NULL CONSTRAINT [DF_user_account__warn_flag]  DEFAULT ((0)),
	[block_flag] [int] NOT NULL CONSTRAINT [DF_user_account__block_flag]  DEFAULT ((0)),
	[block_flag2] [int] NOT NULL CONSTRAINT [DF_user_account__block_flag2]  DEFAULT ((0)),
	[block_end_date] [datetime] NULL,
	[last_login] [datetime] NULL,
	[last_logout] [datetime] NULL,
	[subscription_flag] [int] NOT NULL CONSTRAINT [DF_user_account_subscription_flag]  DEFAULT ((0)),
	[last_world] [tinyint] NULL,
	[last_game] [int] NULL,
	[last_ip] [varchar](15) NULL,
	[hkey] [varchar](16) NULL,
	[cheat] [int] NOT NULL DEFAULT ((0)),
	[mask] [varchar](15) NULL,
	[lastbanaction] [char](20) NULL,
	[lastadmin] [char](20) NULL,
	[lastdate] [char](40) NULL,
	[reason] [char](20) NULL,
	[verifystring] [char](24) NULL,
 CONSTRAINT [PK_user_account_] PRIMARY KEY CLUSTERED 
(
	[account] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ssn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ssn](
	[ssn] [char](13) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[newsletter] [tinyint] NOT NULL CONSTRAINT [DF_ssn_newsletter]  DEFAULT ((0)),
	[job] [int] NOT NULL,
	[phone] [varchar](16) NOT NULL,
	[mobile] [varchar](20) NULL,
	[reg_date] [datetime] NOT NULL CONSTRAINT [DF_ssn_reg_date]  DEFAULT (getdate()),
	[zip] [varchar](6) NOT NULL,
	[addr_main] [varchar](255) NOT NULL,
	[addr_etc] [varchar](255) NOT NULL,
	[account_num] [tinyint] NOT NULL CONSTRAINT [DF_ssn_account_num]  DEFAULT ((0)),
	[status_flag] [int] NOT NULL CONSTRAINT [DF_ssn_status_flag]  DEFAULT ((0)),
	[final_news_date] [datetime] NULL,
	[master] [varchar](14) NULL,
	[valid_email_date] [datetime] NULL,
	[final_master_date] [datetime] NOT NULL CONSTRAINT [DF_ssn_final_master_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_ssn] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[server]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[server](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[inner_ip] [varchar](15) NOT NULL,
	[ageLimit] [int] NOT NULL,
	[pk_flag] [tinyint] NOT NULL CONSTRAINT [DF_server_pk_flag]  DEFAULT ((1)),
	[kind] [int] NOT NULL CONSTRAINT [DF__server__kind__6C040022]  DEFAULT ((0)),
	[port] [int] NOT NULL CONSTRAINT [DF_server_port]  DEFAULT ((7777)),
	[region] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[hauthd_log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[hauthd_log](
	[time] [datetime] NOT NULL,
	[account] [varchar](14) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[hkey] [varchar](16) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[gm_illegal_login]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[gm_illegal_login](
	[account] [varchar](15) NOT NULL,
	[try_date] [datetime] NOT NULL CONSTRAINT [DF_gm_illegal_login_try_date]  DEFAULT (getdate()),
	[ip] [varchar](15) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[block_reason_code]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[block_reason_code](
	[block_reason] [int] NOT NULL,
	[block_desc] [varchar](50) NOT NULL,
	[flag] [tinyint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[block_msg]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[block_msg](
	[uid] [int] NULL,
	[account] [varchar](14) NOT NULL,
	[msg] [varchar](50) NULL,
	[reason] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[item_code]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[item_code](
	[item_id] [int] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[duration] [int] NOT NULL,
	[active_date] [datetime] NOT NULL,
 CONSTRAINT [PK_item_code] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[blacklist]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[blacklist](
	[ban_id] [int] NOT NULL,
	[ipaddress] [char](16) NOT NULL,
	[admin] [varchar](50) NOT NULL,
 CONSTRAINT [PK_blacklist] PRIMARY KEY CLUSTERED 
(
	[ban_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[worldstatus]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[worldstatus](
	[idx] [int] NOT NULL,
	[server] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL CONSTRAINT [DF_worldstatus_status]  DEFAULT ((0)),
 CONSTRAINT [PK_worldstatus] PRIMARY KEY CLUSTERED 
(
	[idx] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_time]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_time](
	[uid] [int] NOT NULL,
	[account] [varchar](14) NOT NULL,
	[present_time] [int] NOT NULL,
	[next_time] [int] NULL,
	[total_time] [int] NOT NULL,
	[op_date] [datetime] NOT NULL,
	[flag] [tinyint] NOT NULL,
 CONSTRAINT [PK_user_time] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[user_info]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[user_info](
	[account] [varchar](14) NOT NULL,
	[create_date] [datetime] NOT NULL CONSTRAINT [DF_user_info_create_date]  DEFAULT (getdate()),
	[ssn] [varchar](13) NOT NULL,
	[status_flag] [tinyint] NOT NULL CONSTRAINT [DF_user_info_status_flag]  DEFAULT ((0)),
	[kind] [int] NOT NULL CONSTRAINT [DF_user_info_kind]  DEFAULT ((0)),
 CONSTRAINT [PK_user_info] PRIMARY KEY CLUSTERED 
(
	[account] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ap_GPwd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Created By darkangel
-- 2003.06.19
-- Get Account''s Password

CREATE PROCEDURE [dbo].[ap_GPwd]  @account varchar(14), @pwd binary(16) output
AS
SELECT @pwd=password FROM user_auth with (nolock) WHERE account=@account
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[l2p_TempCreateAccount]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[l2p_TempCreateAccount]
@account varchar(14),
@ssn varchar(13)
AS
-- ґх№М °иБ¤А» »эјєЗП±в А§ЗС ·зЖѕАФґПґЩ. 
-- АМ№М °иБ¤АМ »эјєµЗѕо АЦґВ БЦ№Оµо·П№шИЈАЗ °жїмїЎґВ »эјєµЗБц ѕКЅАґПґЩ. 
-- Е¬·ОБоєЈЕё±в°ЈїЎёё »зїлµЗѕоѕЯ ЗХґПґЩ. 

DECLARE @account_num int

SELECT account FROM user_info WHERE account = @account
IF @@ROWCOUNT <> 0 
BEGIN
	print ''Already Exist''
	RETURN
END

SELECT @account_num= account_num FROM ssn WHERE ssn =@ssn
If @@rowcount  =  0
begin
	set @account_num = 1
end
else
begin
	set @account_num = @account_num + 1
end

BEGIN TRAN	
	IF @account_num = 1
		Insert ssn ( ssn, name, email, newsletter, job, phone, mobile, reg_date, zip, addr_main, addr_etc, account_num, status_flag )
		values (@ssn, ''ЕЧЅєЖ®°иБ¤'', ''newjisu@ncsoft.net'',0,0,''02-1234-1234'',''011-1234-1234'',getdate(),'''','''','''',@account_num,0)		
	ELSE
		UPDATE ssn SET account_num = @account_num WHERE ssn =  @ssn
	IF @@ERROR <> 0 GOTO DO_ROLLBACK
	INSERT INTO user_account (account, pay_stat) VALUES (@account, 0)
	IF @@ERROR <> 0 GOTO DO_ROLLBACK
	Insert user_auth ( account, password, quiz1, quiz2, answer1, answer2 ) 
	values ( @account, 0xB53AA65D7C98EF3F0A93B5B578E2C4C4, ''і»°Ў ґЩґС ГКµоЗР±і АМё§Ає №«ѕщАП±о?'', ''і»°Ў ґЩґС ГКµоЗР±і АМё§Ає №«ѕщАП±о?'', 0x93A5EFCC45DA1D96A33A1C1CD14B6D6D, 0x93A5EFCC45DA1D96A33A1C1CD14B6D6D)
	IF @@ERROR <> 0 GOTO DO_ROLLBACK
	Insert user_info ( account, create_date, ssn, status_flag, kind )
	values ( @account, getdate(),@ssn, 0, 99  )
	IF @@ERROR <> 0 GOTO DO_ROLLBACK	
	
	
	--update user_account set pay_stat=101, login_flag=0 where account = @account
commit TRAN
RETURN 1

DO_ROLLBACK:
ROLLBACK TRAN
RETURN 0
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[hauthd_login]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[hauthd_login]
@uid int 
AS
SELECT pay_stat AS ok FROM user_account WITH (nolock) WHERE uid=@uid
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ap_SLog]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ap_SLog] 
@uid int, @lastlogin datetime, @lastlogout datetime, @LastGame int, @LastWorld tinyint, @LastIP varchar(15)
AS
UPDATE user_account 
SET last_login = @lastlogin, last_logout=@lastlogout, last_world=@lastWorld, last_game=@lastGame, last_ip=@lastIP
WHERE uid=@uid
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ap_GStat]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ap_GStat]
@account varchar(14), 
@uid int OUTPUT, 
@payStat int OUTPUT, 
@loginFlag int OUTPUT, 
@warnFlag int OUTPUT, 
@blockFlag int OUTPUT, 
@blockFlag2 int OUTPUT, 
@subFlag int OUTPUT, 
@lastworld tinyint OUTPUT,
@block_end_date datetime OUTPUT
 AS
SELECT @uid=uid, 
	 @payStat=pay_stat,
              @loginFlag = login_flag, 
              @warnFlag = warn_flag, 
              @blockFlag = block_flag, 
              @blockFlag2 = block_flag2, 
              @subFlag = subscription_flag , 
              @lastworld=last_world, 
              @block_end_date=block_end_date 
               FROM user_account WITH (nolock)
WHERE account=@account
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ap_SUserTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ap_SUserTime] @useTime int, @uid int
AS
UPDATE user_time SET total_time = total_time - @useTime, present_time = present_time - @useTime
WHERE uid = @uid
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ap_GUserTime]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ap_GUserTime]  @uid int, @userTime int OUTPUT
AS
SELECT @userTime=total_time FROM user_time WITH (nolock) 
WHERE uid = @uid
' 
END
