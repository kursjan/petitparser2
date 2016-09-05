visiting
visitMapping: node
	(self isMappingOfTwo: node) ifTrue: [  
		node strategy: (PP2MappingOfTwo on: node)
	].

	(self isMappingOfThree: node) ifTrue: [  
		node strategy: (PP2MappingOfThree on: node)
	].


	^ super visitMapping: node
