CREATE PROCEDURE spAddUpdateDeleteTerm
	@TermsID			int,
	@TermsDescription	varchar(50),
	@TermsDueDays		smallint,
	@Delete				bit = 0
AS
	SET NOCOUNT ON
	IF (@TermsID > 0 AND NOT EXISTS(SELECT NULL FROM Terms WHERE TermsID = @TermsID)) BEGIN
		SELECT	[TermsID] = 0, 
				[TermsDescription] = '', 
				[TermsDueDays] = 0,
				[errorMessage] = 'TermsID not found'
	END ELSE IF(@Delete = 1) BEGIN							-- DELETE
		IF (
				EXISTS(SELECT NULL FROM InvoiceArchive WHERE TermsID = @TermsID) OR
				EXISTS(SELECT NULL FROM Invoices WHERE TermsID = @TermsID) OR
				EXISTS(SELECT NULL FROM Vendors WHERE DefaultTermsID = @TermsID)
			) BEGIN
			SELECT *, [errorMessage] = 'TermsID in use. Can not delete.'
			FROM Terms 
			WHERE TermsID = @TermsID
		END ELSE BEGIN
			DELETE FROM Terms WHERE TermsID = @TermsID
			SELECT	[TermsID] = 0, 
					[TermsDescription] = '', 
					[TermsDueDays] = 0,
					[errorMessage] = ''
		END
	END ELSE IF(@TermsID = 0) BEGIN						-- ADD
		IF EXISTS(	SELECT NULL 
					FROM Terms 
					WHERE	TermsDescription = @TermsDescription OR
							TermsDueDays = @TermsDueDays) BEGIN

			SELECT	[TermsID] = 0, 
					[TermsDescription] = '', 
					[TermsDueDays] = 0,
					[errorMessage] = 'Duplicate description and/or due days. Can not insert data'
		END ELSE BEGIN
			INSERT INTO Terms(TermsDescription,TermsDueDays)
			VALUES (@TermsDescription,@TermsDueDays)

			SELECT	[TermsID] = @@IDENTITY, 
					[TermsDescription] = @TermsDescription, 
					[TermsDueDays] = @TermsDueDays,
					[errorMessage] = ''

		END
	END ELSE IF(@TermsID > 0) BEGIN						-- UPDATE
		
		IF EXISTS(	SELECT NULL 
					FROM Terms 
					WHERE	( (TermsID != @TermsID) AND	
								(TermsDescription = @TermsDescription OR
								TermsDueDays = @TermsDueDays)
							) ) BEGIN
			SELECT	*, [errorMessage] = 'Update would result in a duplicate ' +
										'description and/or due days. Can not update data'
			FROM Terms WHERE TermsID = @TermsID
		END ELSE BEGIN
			UPDATE Terms SET TermsDescription = @TermsDescription, 
							 TermsDueDays = @TermsDueDays
			WHERE TermsID = @TermsID

			SELECT	*, [errorMessage] = ''
			FROM Terms WHERE TermsID = @TermsID
		END

	END