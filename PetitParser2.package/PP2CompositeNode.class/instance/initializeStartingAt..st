initialization
initializeStartingAt: aSymbol
	| parser |
	self initialize.

	self productionNames keysAndValuesDo: [ :key :value |
		self instVarAt: key put: (PP2DelegateNode named: value) 
	].

	self productionNames keysAndValuesDo: [ :key :value |
		parser := self perform: value.
		self assert: parser ~= self description: 'you probably forgot to return the parser in "', value, '"'.
		(self instVarAt: key) child: parser 
	].

	child := (self perform: aSymbol)