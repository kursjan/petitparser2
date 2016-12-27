visiting
visitMapping: node
	super visitMapping: node.
	
	(self isAnyStarLazyPredicateObject: node) ifTrue: [  
		node strategy: (PP2AnyStarLazyPredicateObject on: node 
			predicate: node child afterWater boundaryElements anyOne predicate).
		^ self.
	].

	(self isAnyStarLazyLiteralObject: node) ifTrue: [  
		node strategy: (PP2AnyStarLazyLiteralObject on: node 
			literal: node child afterWater boundaryElements anyOne literal).
		^ self.
	].


	(self isMappingOfTwo: node) ifTrue: [  
		node strategy: (PP2MappingOfTwo on: node).
		^ self
	].

	(self isMappingOfThree: node) ifTrue: [  
		node strategy: (PP2MappingOfThree on: node).
		^ self
	].


	^ super visitMapping: node
