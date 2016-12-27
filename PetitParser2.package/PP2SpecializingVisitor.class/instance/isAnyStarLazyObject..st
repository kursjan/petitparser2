testing
isAnyStarLazyObject: node 
	| sea |
	node class = PP2MappingNode ifFalse: [ ^ false ].
	node child class = PP2SeaNode ifFalse: [ ^ false ].
	
	sea := node child.
	
	sea island isEpsilon ifFalse: [ ^ false ].
	(self isAny: sea waterToken) ifFalse: [ ^ false ].
	(sea beforeWater boundaryElements size = 2) ifFalse: [ ^ false ].
	(sea afterWater boundaryElements size = 1) ifFalse: [ ^ false ].
	
	^ true