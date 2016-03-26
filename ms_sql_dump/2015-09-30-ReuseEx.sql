if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[lin_UpdateSkillReuseEx]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[lin_UpdateSkillReuseEx]
GO

CREATE PROCEDURE [dbo].[lin_UpdateSkillReuseEx]
	@char_id [int],
	@skill_id [int],
	@skill_lv [int],
	@subjob_id [int],
	@to_end_time [int],
	@duration [int],
	@totdur [int]
AS
SET NOCOUNT ON

IF EXISTS(SELECT * FROM user_reusetime_ex WHERE char_id = @char_id AND subjob_id = @subjob_id AND skill_id = @skill_id AND skill_lv = @skill_lv)
	UPDATE user_reusetime_ex SET to_end_time = @to_end_time, duration = @duration, totdur = @totdur WHERE char_id = @char_id AND subjob_id = @subjob_id AND skill_id = @skill_id AND skill_lv = @skill_lv
ELSE 
	INSERT INTO user_reusetime_ex(char_id,skill_id,skill_lv,subjob_id,to_end_time,duration,totdur) VALUES(@char_id,@skill_id,@skill_lv,@subjob_id,@to_end_time,@duration,@totdur)
GO