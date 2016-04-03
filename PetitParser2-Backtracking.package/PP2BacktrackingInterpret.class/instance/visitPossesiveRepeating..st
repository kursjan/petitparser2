visiting
visitPossesiveRepeating: parser
	| context elements index |
	
	index := 0.
	elements := OrderedCollection new.
	
	[ index < parser max ] whileTrue: [
		context := currentContext.
	 	(self visit: parser child) isPetitFailure ifTrue: [ 
			^ self returnPossesiveMin: parser min index: index elements: elements 
		].
		index := index + 1.
		elements at: index ifAbsentPut: currentContext value.
	].

	^ self returnPossesiveMin: parser min index: index elements: elements.
