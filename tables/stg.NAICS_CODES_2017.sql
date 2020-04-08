/*****************************************************************************************************************
NAME:    dbo.usp_LoadSSISConfigurations
PURPOSE: Load the SSIS Configurations table

MODIFICATION LOG:
Ver      Date        Author           Description
-------  ----------  ---------------  ------------------------------------------------------------------------
1.0      03/04/2020  ASILVEIRA         1. Build this table for LDSBC IT243

RUNTIME: 
approx 1 sec

NOTES:  
The data source of this table is the US Census.

**************************************************************************************************************/

USE [DFNB3]
GO

--****** Object:  Table [stg].[NAICS_CODES_2017]    Script Date: 03/04/2020/
DROP TABLE [stg].[NAICS_CODES_2017] 
GO

--****** Object:  Table [stg].[NAICS_CODES_2017]    Script Date: 03/04/2020/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[NAICS_CODES_2017](
    [seq_no] [float] NULL,
    [2017_NAICS_US_Code] [float] NULL,
    [2017_NAICS_US_Title] [nvarchar](500) NULL
) ON [PRIMARY]
GO

