utility
selectEvenly: n fromFiles: collection thatSatisfy: aBlock
	| set step index size sorted |
	set := IdentitySet new.	
	step := 65537.
	index := 0.
	size := collection size.
	sorted := collection sort.
	self assert: collection atRandom isFile.
	
	[set size = n] whileFalse: [ 
		index := ((index + step) % size).
		(aBlock value: (sorted at: (index + 1) )) ifTrue: [ 
			set add: (sorted at: (index + 1)).
		].
	].

	^ set asOrderedCollection sorted collect: [ :file | file contents ]