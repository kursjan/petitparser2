*PetitParser2-Backtracking
continuationStack
	^ self globalAt: #continuationStack ifAbsentPut: [ Stack new ]