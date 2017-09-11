*PetitParser2-RewriteEngine
originalStartIndexFor: anObject
	^ ((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ anObject startPosition ]
		ifFalse: [ anObject ]