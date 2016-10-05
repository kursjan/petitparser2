tests
testPeriodTokenCache
	| identifierToken |
	parser := PP2SmalltalkParser new optimize.
	identifierToken := parser productionAt: #periodToken.
	self assert: (identifierToken strategies noneSatisfy: [ :s | s isKindOf: PP2Cache ])