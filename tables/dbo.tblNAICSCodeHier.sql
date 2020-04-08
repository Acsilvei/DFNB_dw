/*****************************************************************************************************************
NAME:    dbo.tblNAICSCodeHier
PURPOSE: Create the dbo.tblNAICSCodeHier table

MODIFICATION LOG:
Ver      Date        Author           Description
-------  ----------  ---------------  ------------------------------------------------------------------------
1.0      03/04/2020  ASILVEIRA         1. Build this table for LDSBC IT243
1.1      03/04/2020  ASILVEIRA         1. Added PK and NOT NULL Constraints

RUNTIME: 
approx 1 sec

NOTES:  
NAICS Codes Hierarchy.

**************************************************************************************************************/

USE [DFNB3]
GO

DROP TABLE [dbo].[tblNAICSCodeHier] 
GO

CREATE TABLE [dbo].[tblNAICSCodeHier](
    [industry_sector_code] [float] NOT NULL,
    [industry_sector_desc] [nvarchar](500) NOT NULL,
    [industry_sub_sector_code] [float] NOT NULL,
	[industry_sub_sector_desc] [nvarchar](500) NULL,
	[industry_group_code] [float] NOT NULL,
	[industry_group_desc] [nvarchar](500) NOT NULL,
	[industry_code] [float] NOT NULL,
	[industry_desc][nvarchar](500) NOT NULL,
	[nation_industry_code] [float] NOT NULL,
	[nation_industry_desc][nvarchar](500) NOT NULL,
	CONSTRAINT [PK_tblNAICSCodeHier] PRIMARY KEY Clustered 
([nation_industry_code] ASC
)
)
;
