declare @circuit nvarchar(50)
set @circuit = (select top 1  [circuit name] from [dbo].[Foglio1$] where type = 'S' order by newid())
select @circuit

declare @nlbs int
set @nlbs = (select [lower body strenght] from [dbo].[Foglio1$] where [circuit name] = @circuit)

declare @nlbc int
set @nlbc = (select [lower body cardio] from [dbo].[Foglio1$] where [circuit name] = @circuit)

declare @nlbm int
set @nlbm = (select [lower body mixed] from [dbo].[Foglio1$] where [circuit name] = @circuit)

declare @ufs int
set @ufs = (select [upper or full strenght] from [dbo].[Foglio1$] where [circuit name] = @circuit)

declare @ufc int
set @ufc = (select [upper or full cardio] from [dbo].[Foglio1$] where [circuit name] = @circuit)

declare  @ufm int
set @ufm = (select [upper or full mixed] from [dbo].[Foglio1$] where [circuit name] = @circuit)

SELECT top(@nlbs) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where F3 = ' lower body' and F4 = ' strength' and F2 = ' both' order by NEWID()

Select top(@nlbc) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where F3 = ' lower body' and F4 = ' cardio' and F2 = ' both' order by NEWID()

select top(@nlbm) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where F3 = ' lower body' and F4 = ' both' and F2 = ' both' order by NEWID()

select top(@ufs) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where  F4 = ' strength' and F2 = ' both' and F3 =' lower body' or F3 = ' upper body' order by NEWID()

select top (@ufc) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where F4 = ' cardio' and F2 = ' both' and F3 =' lower body' or F3 = ' upper body' order by NEWID()

select top (@ufm) [# EXERCISES] from [dbo].[Foglio1$F45_exercise_list] where F4 = ' both' and F2 = ' both' and F3 =' lower body' or F3 = ' upper body' order by NEWID()

SELECT [pods], [sets], [laps], [times] from [dbo].[Foglio1$] where [circuit name] = @circuit
