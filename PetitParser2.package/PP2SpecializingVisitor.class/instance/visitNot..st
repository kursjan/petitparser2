visiting
visitNot: node
	(self isNotLiteralObject: node) ifTrue: [  
		node strategy: (PP2NotLiteralObject on: node)
	].

	(self isNotPredicateObject: node) ifTrue: [  
		node strategy: (PP2NotPredicateObject on: node)
	].

	^ super visitOptional: node
