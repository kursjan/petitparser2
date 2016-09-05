initialization
initializeStartingAt: aSymbol dependencies: aDictionary
	self initialize.

	child := PP2DelegateNode named: aSymbol.
	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PP2DelegateNode named: value) ].
	dependencies := aDictionary