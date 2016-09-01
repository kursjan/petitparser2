visiting
visitAnd: node
	(self isAndLiteralObject: node) ifTrue: [  
		node strategy: (PP2AndLiteralObject on: node)
	].

	(self isAndPredicateObject: node) ifTrue: [  
		node strategy: (PP2AndPredicateObject on: node)
	].

	^ super visitOptional: node
