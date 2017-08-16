*PetitParser2-RewriteEngine
startPositionForNode: aSmaCCParseNode
	((aSmaCCParseNode isParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source startIndex ].
	^ newStarts
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode startPosition ]