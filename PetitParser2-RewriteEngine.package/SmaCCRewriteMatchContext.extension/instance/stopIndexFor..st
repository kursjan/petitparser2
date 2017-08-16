*PetitParser2-RewriteEngine
stopIndexFor: anObject
	^ ((anObject isParseNode )
		or: [ anObject isParseToken ])
		ifTrue: [ rewriteEngine stopPositionForNode: anObject ]
		ifFalse: [ anObject ]