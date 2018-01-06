*PetitParser2-RewriteEngine
stopIndexFor: anObject
	^ ((anObject isParseNode )
		or: [ anObject isToken ])
		ifTrue: [ rewriteEngine stopPositionForNode: anObject ]
		ifFalse: [ anObject ]