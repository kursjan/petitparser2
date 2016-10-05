as yet unclassified
testIdentifierTokenCache
	| identifierToken |
	parser := PP2SmalltalkParser new optimize.
	identifierToken := parser productionAt: #identifierToken.
	self assert: (identifierToken strategies noneSatisfy: [ :s | s isKindOf: PP2Cache ])