USE DFNB3;
GO

DROP VIEW etl.v_naics_code;
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW etl.v_naics_code
AS

SELECT LEN(nc.[2017_NAICS_US_code]) AS naics_level
,CASE
WHEN LEN(nc.[2017_NAICS_US_code]) = 2
THEN  NULL
ELSE LEFT(nc.[2017_NAICS_US_code], LEN(nc.[2017_NAICS_US_code]) -1)
END AS naics_parent_code
,nc.[2017_NAICS_US_code] AS naics_code
,nc.[2017_NAICS_US_title] AS naics_desc
FROM stg.NAICS_CODES_2017 AS nc;