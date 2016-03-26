if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[user_private_buff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[user_private_buff]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lin_LoadPrivateBuffs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[lin_LoadPrivateBuffs]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lin_SavePrivateBuffs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[lin_SavePrivateBuffs]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lin_DeletePrivateBuffs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[lin_DeletePrivateBuffs]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_private_buff](
	[id] [int] NOT NULL,
	[char_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[b1] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b1]  DEFAULT ((0)),
	[b2] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b2]  DEFAULT ((0)),
	[b3] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b3]  DEFAULT ((0)),
	[b4] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b4]  DEFAULT ((0)),
	[b5] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b5]  DEFAULT ((0)),
	[b6] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b6]  DEFAULT ((0)),
	[b7] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b7]  DEFAULT ((0)),
	[b8] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b8]  DEFAULT ((0)),
	[b9] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b9]  DEFAULT ((0)),
	[b10] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b10]  DEFAULT ((0)),
	[b11] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b11]  DEFAULT ((0)),
	[b12] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b12]  DEFAULT ((0)),
	[b13] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b13]  DEFAULT ((0)),
	[b14] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b14]  DEFAULT ((0)),
	[b15] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b15]  DEFAULT ((0)),
	[b16] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b16]  DEFAULT ((0)),
	[b17] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b17]  DEFAULT ((0)),
	[b18] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b18]  DEFAULT ((0)),
	[b19] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b19]  DEFAULT ((0)),
	[b20] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b20]  DEFAULT ((0)),
	[b21] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b21]  DEFAULT ((0)),
	[b22] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b22]  DEFAULT ((0)),
	[b23] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b23]  DEFAULT ((0)),
	[b24] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b24]  DEFAULT ((0)),
	[b25] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b25]  DEFAULT ((0)),
	[b26] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b26]  DEFAULT ((0)),
	[b27] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b27]  DEFAULT ((0)),
	[b28] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b28]  DEFAULT ((0)),
	[b29] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b29]  DEFAULT ((0)),
	[b30] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b30]  DEFAULT ((0)),
	[b31] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b31]  DEFAULT ((0)),
	[b32] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b32]  DEFAULT ((0)),
	[b33] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b33]  DEFAULT ((0)),
	[b34] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b34]  DEFAULT ((0)),
	[b35] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b35]  DEFAULT ((0)),
	[b36] [int] NOT NULL CONSTRAINT [DF_user_private_buff_b36]  DEFAULT ((0))
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lin_LoadPrivateBuffs]
(
@char_id int
)
AS
SET NOCOUNT ON
	SELECT TOP 10 id,name,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36
	FROM user_private_buff (nolock)   
	WHERE char_id = @char_id
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lin_SavePrivateBuffs]
(
@id int,
@char_id int,
@name nvarchar(255),
@b1 int,
@b2 int,
@b3 int,
@b4 int,
@b5 int,
@b6 int,
@b7 int,
@b8 int,
@b9 int,
@b10 int,
@b11 int,
@b12 int,
@b13 int,
@b14 int,
@b15 int,
@b16 int,
@b17 int,
@b18 int,
@b19 int,
@b20 int,
@b21 int,
@b22 int,
@b23 int,
@b24 int,
@b25 int,
@b26 int,
@b27 int,
@b28 int,
@b29 int,
@b30 int,
@b31 int,
@b32 int,
@b33 int,
@b34 int,
@b35 int,
@b36 int
)
AS
SET NOCOUNT ON
IF EXISTS(SELECT id FROM user_private_buff WHERE id = @id and char_id = @char_id)
BEGIN
	UPDATE user_private_buff 
		SET name = @name,
		b1 = @b1,
		b2 = @b2,
		b3 = @b3,
		b4 = @b4,
		b5 = @b5,
		b6 = @b6,
		b7 = @b7,
		b8 = @b8,
		b9 = @b9,
		b10 = @b10,
		b11 = @b11,
		b12 = @b12,
		b13 = @b13,
		b14 = @b14,
		b15 = @b15,
		b16 = @b16,
		b17 = @b17,
		b18 = @b18,
		b19 = @b19,
		b20 = @b20,
		b21 = @b21,
		b22 = @b22,
		b23 = @b23,
		b24 = @b24,
		b25 = @b25,
		b26 = @b26,
		b27 = @b27,
		b28 = @b28,
		b29 = @b29,
		b30 = @b30,
		b31 = @b31,
		b32 = @b32,
		b33 = @b33,
		b34 = @b34,
		b35 = @b35,
		b36 = @b36
		WHERE id = @id AND char_id = @char_id
END
	ELSE
		BEGIN
			INSERT INTO user_private_buff (id,char_id,name,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36)
			VALUES (@id,@char_id,@name,@b1,@b2,@b3,@b4,@b5,@b6,@b7,@b8,@b9,@b10,@b11,@b12,@b13,@b14,@b15,@b16,@b17,@b18,@b19,@b20,@b21,@b22,@b23,@b24,@b25,@b26,@b27,@b28,@b29,@b30,@b31,@b32,@b33,@b34,@b35,@b36)
		END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lin_DeletePrivateBuffs]
(
@id int,
@char_id int
)
AS
SET NOCOUNT ON
DELETE FROM user_private_buff WHERE id = @id and char_id = @char_id
GO
