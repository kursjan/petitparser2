testing
isAnyStarLazyPredicateObject: node 
	(self isAnyStarLazyObject: node) ifFalse: [ ^ false ].
	
	((node child afterWater boundaryElements anyOne) isKindOf: PP2PredicateObjectNode) ifFalse: [ ^false ].
	^ true