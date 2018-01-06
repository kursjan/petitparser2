*PetitParser2-RewriteEngine
startIndexFor: anObject
	^ ((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ rewriteEngine startPositionForNode: anObject ]
		ifFalse: [ anObject ]