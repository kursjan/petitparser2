querying
productionNames
	"Answer a dictionary of slot indexes and production names."
	
	| productionNames ignoredNames |
	productionNames := Dictionary new.
	ignoredNames := self class ignoredNames
		collect: [ :each | each asSymbol ].
	self class allInstVarNames keysAndValuesDo: [ :key :value |
		(ignoredNames includes: value asSymbol)
			ifFalse: [ productionNames at: key put: value asSymbol ] ].
	^ productionNames