accessing
parserInstanceFor: aSymbol
	^ (super parserInstanceFor: aSymbol) optimize;
		resetCaches;
		yourself