*PetitParser2-RewriteEngine
originalStartPosition: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				do: [ :each | ^ self originalStartPosition: each ] ].
	((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ ^ anObject startPosition ].
	^ nil