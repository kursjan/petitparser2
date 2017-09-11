*PetitParser2-RewriteEngine
insert: aString before: anObject
	| position anIndex |
	anIndex := self startIndexFor: anObject.
	anIndex isNil
		ifTrue: [ ^ nil ].
	position := self source insert: aString at: anIndex.
	rewriteEngine
		updateStartPositionFor:
			((anObject isParseNode)
				ifTrue: [ anObject ]
				ifFalse: [ match ])
		to: position
		whenEqualTo: anIndex.
	^ position