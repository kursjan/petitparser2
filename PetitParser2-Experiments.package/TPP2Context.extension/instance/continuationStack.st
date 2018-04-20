*PetitParser2-Experiments-Backtracking
continuationStack
	^ self globalAt: #continuationStack ifAbsentPut: [ Stack new ]