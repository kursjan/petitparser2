*PetitParser2-RewriteEngine
isAtEndOfParent: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self isAtEndOfParent: each ] ].
	^ (anObject isParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent stopPosition = anObject stopPosition ] ]