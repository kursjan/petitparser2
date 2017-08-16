*PetitParser2-RewriteEngine
stopPositionForNode: aSmaCCParseNode
	((aSmaCCParseNode isParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source stopIndex ].
	^ newStops
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode stopPosition ]