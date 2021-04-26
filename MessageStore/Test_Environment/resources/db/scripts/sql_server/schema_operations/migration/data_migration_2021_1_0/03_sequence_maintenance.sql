:setvar SCHEMANAME CONNECT_MS
BEGIN
	DECLARE  @max_msg_hdr_id BIGINT, @max_srvc_id BIGINT, @max_tag_id BIGINT, @max_msg_bdy_id BIGINT, @max_msg_evnt_id BIGINT
	
	SELECT @max_srvc_id = MAX(SRVC_ID) FROM $(SCHEMANAME).[MS_SRVC];
	PRINT 'Max Id of MS_SRVC table : ' + CAST(@max_srvc_id AS VARCHAR)

	SELECT @max_msg_hdr_id = MAX(MSG_HDR_ID) FROM $(SCHEMANAME).[MS_MSG_HDR];
	PRINT 'Max Id of MS_MSG_HDR table : ' + CAST(@max_msg_hdr_id AS VARCHAR)

	SELECT @max_tag_id = MAX(TAG_ID) FROM $(SCHEMANAME).[MS_TAG];
	PRINT 'Max Id of MS_TAG table : ' + CAST(@max_tag_id AS VARCHAR)

	SELECT @max_msg_bdy_id = MAX(MSG_BDY_ID) FROM $(SCHEMANAME).[MS_MSG_BDY];
	PRINT 'Max Id of MS_MSG_BDY table : ' + CAST(@max_msg_bdy_id AS VARCHAR)

	SELECT @max_msg_evnt_id = MAX(MSG_EVNT_ID) FROM $(SCHEMANAME).[MS_MSG_EVNT];
	PRINT 'Max Id of MS_MSG_EVNT table : ' + CAST(@max_msg_evnt_id AS VARCHAR)
	
	IF (@max_srvc_id > 0)
	 BEGIN
	  DBCC CHECKIDENT ('$(SCHEMANAME).[MS_SRVC]', RESEED, @max_srvc_id)
	 END
	IF (@max_msg_hdr_id > 0)
	 BEGIN
	  DBCC CHECKIDENT ('$(SCHEMANAME).[MS_MSG_HDR]', RESEED, @max_msg_hdr_id)
	 END
	IF (@max_tag_id > 0)
	 BEGIN
	DBCC CHECKIDENT ('$(SCHEMANAME).[MS_TAG]', RESEED, @max_tag_id)
	 END
	IF (@max_msg_bdy_id > 0)
	 BEGIN
	DBCC CHECKIDENT ('$(SCHEMANAME).[MS_MSG_BDY]', RESEED, @max_msg_bdy_id)
	 END
	IF (@max_msg_evnt_id > 0)
	 BEGIN
	DBCC CHECKIDENT ('$(SCHEMANAME).[MS_MSG_EVNT]', RESEED, @max_msg_evnt_id)
	 END
END