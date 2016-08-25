statistics
median: list
	| sorted size |
	sorted := list sort.
	size := sorted size.
	^ (size % 2 = 0) ifTrue: [ 
		((sorted at: (size // 2)) + (sorted at: ((size // 2) + 1))) / 2
	] ifFalse: [ 
		sorted at: (size // 2) + 1
	]

