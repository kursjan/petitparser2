testing
isAnyStarLazyLiteralObject: node 
	(self isAnyStarLazyObject: node) ifFalse: [ ^ false ].
		
	((node child afterWater boundaryElements anyOne) isKindOf: PP2LiteralObjectNode) ifFalse: [ ^false ].
	^ true