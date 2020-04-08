BEGIN
-- 1) Truncate existing data	

TRUNCATE TABLE dbo.tblNAICSCodeHier;

-- 2) Reload data

INSERT INTO dbo.tblNAICSCodeHier
SELECT v.*
FROM etl.v_naics_hier_load AS v 

END;