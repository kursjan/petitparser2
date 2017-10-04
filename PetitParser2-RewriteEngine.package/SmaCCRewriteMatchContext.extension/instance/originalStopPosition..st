*PetitParser2-RewriteEngine
originalStopPosition: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self originalStopPosition: each ] ].
	((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ ^ anObject stopPosition ].
	^ nil