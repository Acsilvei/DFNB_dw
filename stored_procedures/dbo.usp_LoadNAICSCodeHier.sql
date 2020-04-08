USE DFNB3
GO

DROP PROCEDURE dbo.usp_LoadNAICSCodeHier
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.usp_LoadNAICSCodeHier
AS




BEGIN
-- 1) Truncate existing data	

TRUNCATE TABLE dbo.tblNAICSCodeHier;

-- 2) Reload data

INSERT INTO dbo.tblNAICSCodeHier
SELECT v.*
FROM etl.v_naics_hier_load AS v 

END;