instance creation
newStartingAt: aSymbol
	"Answer a new parser starting at aSymbol."
	^ self basicNew
		initializeStartingAt: aSymbol;
		yourself