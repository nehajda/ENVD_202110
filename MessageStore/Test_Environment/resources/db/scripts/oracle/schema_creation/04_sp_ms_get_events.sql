DEFINE SCHEMANAME = 'CONNECT_MS.';
CREATE OR REPLACE PROCEDURE &SCHEMANAME.ms_get_events
(
p_headerId NUMBER, cur OUT SYS_REFCURSOR
)
AS
BEGIN
				
OPEN cur FOR SELECT
	ME.MSG_EVNT_ID AS MSG_EVNT_ID,
	ME.CRTD_AT AS EVNT_CRTD_AT,
	ME.STATUS AS EVNT_STATUS,
	ME.ERR_CODE AS EVNT_ERR_CODE,
	ME.ERR_DESC AS EVNT_ERR_DESC,
	ME.ERR_CAT AS EVNT_ERR_CATEGORY,
	ME.ERR_REASON AS EVNT_ERR_REASON,
	ME.ERR_DETAIL_DESC AS EVNT_ERR_DETAIL_DESC
FROM
	MS_MSG_HDR MH,
	MS_MSG_EVNT ME
WHERE
	ME.MSG_HDR_ID = p_headerId
ORDER BY 
	ME.CRTD_AT DESC;

END;