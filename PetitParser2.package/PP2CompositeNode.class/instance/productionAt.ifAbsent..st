querying
productionAt: aSymbol ifAbsent: aBlock
	"Answer the production named aSymbol, if there is no such production answer the result of evaluating aBlock."
	
	(self class ignoredNames includes: aSymbol asString)
		ifTrue: [ ^ aBlock value ].
	(self class startSymbol = aSymbol)
		ifTrue: [ ^ child ].
	^ self instVarAt: (self class allInstVarNames
		indexOf: aSymbol asString
		ifAbsent: [ ^ aBlock value ])