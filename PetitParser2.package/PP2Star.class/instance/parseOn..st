parsing
parseOn: aPP2Context
	| elements retval |
	elements := OrderedCollection new.
	
	node max timesRepeat: [
		(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [
			^ elements
		].
		elements addLast: retval 
	].
	
	^ elements