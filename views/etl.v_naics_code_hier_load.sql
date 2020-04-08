USE DFNB3
GO

DROP VIEW etl.v_naics_code_hier_load;
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW etl.v_naics_code_hier_load
AS


WITH input

AS (SELECT* 
		FROM etl.v_naics_code),
industry_sector 
AS (SELECT i.naics_code AS industry_sector_code
			, i.naics_desc AS industry_sector_desc

			FROM input AS i
			WHERE LEN(i.naics_code) = 2),

industry_sub_sector 
AS (SELECT i.naics_code AS industry_sub_sector_code
			, i.naics_desc AS industry_sub_sector_desc

			FROM input AS i
			WHERE LEN(i.naics_code) = 3),

industry_group
AS (SELECT i.naics_code AS industry_group_code
			, i.naics_desc AS industry_group_desc

			FROM input AS i
			WHERE LEN(i.naics_code) = 4),

industry
AS (SELECT i.naics_code AS industry_code
			, i.naics_desc AS industry_desc

			FROM input AS i
			WHERE LEN(i.naics_code) = 5),

nation_industry
AS (SELECT i.naics_code AS nation_industry_code
			, i.naics_desc AS nation_industry_desc

			FROM input AS i
			WHERE LEN(i.naics_code) = 6)

SELECT industry_sector.industry_sector_code
       ,industry_sector.industry_sector_desc
	   ,industry_sub_sector.industry_sub_sector_code
	   ,industry_sub_sector.industry_sub_sector_desc
	   ,industry_group.industry_group_code
	   ,industry_group.industry_group_desc
	   ,industry.industry_code
	   ,industry.industry_desc
	   ,nation_industry.nation_industry_code
	   ,nation_industry.nation_industry_desc

FROM industry_sector
	LEFT JOIN
	industry_sub_sector ON industry_sector_code = LEFT(industry_sub_sector_code, 2)
	LEFT JOIN
	industry_group ON industry_sub_sector_code = LEFT(industry_group_code, 3)	
	LEFT JOIN
	industry ON industry_group_code = LEFT (industry_code, 4)
	LEFT JOIN
	nation_industry ON industry_code = LEFT(nation_industry_code, 5);

	GO
