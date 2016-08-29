visiting
visitOptional: node
	(self isOptionalCharacter: node) ifTrue: [  
		node strategy: (PP2OptionalLiteralObject on: node)
	].

	^ super visitPossesiveRepeating: node
