*PetitParser2-RewriteEngine
isAtStartOfParent: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject do: [ :each | ^ self isAtStartOfParent: each ] ].
	^ (anObject isParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent startPosition = anObject startPosition ] ]