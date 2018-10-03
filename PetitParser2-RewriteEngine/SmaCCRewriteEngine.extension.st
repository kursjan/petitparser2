Extension { #name : #SmaCCRewriteEngine }

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteEngine >> startPositionForNode: aSmaCCParseNode [
	((aSmaCCParseNode isParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source startIndex ].
	^ newStarts
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode startPosition ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteEngine >> stopPositionForNode: aSmaCCParseNode [
	((aSmaCCParseNode isParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source stopIndex ].
	^ newStops
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode stopPosition ]
]
