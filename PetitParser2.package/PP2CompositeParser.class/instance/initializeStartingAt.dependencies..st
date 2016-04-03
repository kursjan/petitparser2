initialization
initializeStartingAt: aSymbol dependencies: aDictionary
	self initialize.

	parser := PP2DelegateParser named: aSymbol.
	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PP2DelegateParser named: value) ].
	dependencies := aDictionary