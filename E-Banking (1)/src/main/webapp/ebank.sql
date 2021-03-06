if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[acholder_info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[acholder_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ant_req]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ant_req]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[cheque_req]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cheque_req]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dd_req]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dd_req]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[loan_appln]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[loan_appln]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[login_info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[login_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[max(id) dd_req]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[max(id) dd_req]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[reg_info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[reg_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tran_info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tran_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[userlogin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[userlogin]
GO

CREATE TABLE [dbo].[acholder_info] (
	[acc_no] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[reg_id] [float] NULL ,
	[acc_type] [float] NOT NULL ,
	[branch] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[crd] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bal] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ant_req] (
	[req_id] [float] NULL ,
	[acc_exi] [float] NOT NULL ,
	[acc_no] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[crd] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[s_qtn] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[s_ans] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[f_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[s_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sex] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[emailid] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[r_phone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[o_phone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[h_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[city] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[branch] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[age] [float] NOT NULL ,
	[s_time] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sp_time] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[t_pwd] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sta] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cheque_req] (
	[id] [float] NULL ,
	[acc_no] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[issue_date] [smalldatetime] NULL ,
	[bk_no] [float] NULL ,
	[start_no] [float] NULL ,
	[end_no] [float] NULL ,
	[sta] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dd_req] (
	[req_id] [float] NULL ,
	[acc_no] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[infavourof] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[place] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[amt] [float] NOT NULL ,
	[c_amt] [float] NULL ,
	[dd_no] [float] NULL ,
	[dd_date] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sta] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[loan_appln] (
	[lid] [float] NULL ,
	[acc_no] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[name] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[prof] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[anu_income] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[addr] [nvarchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[city] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[pin] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ophone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[rphone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[mob] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[crd] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[det] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pur] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sta] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[login_info] (
	[acc_no] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[s_qtn] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[s_ans] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[role] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[reg_id] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[max(id) dd_req] (
	[Expr1000] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[reg_info] (
	[reg_id] [float] NULL ,
	[req_id] [float] NULL ,
	[f_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[s_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[age] [float] NOT NULL ,
	[h_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[city] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[emailid] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[r_phone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[o_phone] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sex] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tran_info] (
	[trn_id] [float] NULL ,
	[acc_no] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[trn_date] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[d_amt] [float] NULL ,
	[c_amt] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[userlogin] (
	[userid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[req_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

