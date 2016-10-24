initialization
initializeStartingAt: aSymbol
	self initialize.

	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PP2DelegateNode named: value) 
	].

	self productionNames keysAndValuesDo: [ :key :value |
		(self instVarAt: key) child: (self perform: value) 
	].

	child := (self perform: aSymbol)