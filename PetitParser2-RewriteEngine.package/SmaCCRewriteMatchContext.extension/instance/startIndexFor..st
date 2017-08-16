*PetitParser2-RewriteEngine
startIndexFor: anObject
	^ ((anObject isParseNode)
		or: [ anObject isParseToken ])
		ifTrue: [ rewriteEngine startPositionForNode: anObject ]
		ifFalse: [ anObject ]