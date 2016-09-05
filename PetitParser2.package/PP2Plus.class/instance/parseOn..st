parsing
parseOn: aPP2Context
	| elements retval |
	
	(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [
		^ retval
	].
	elements := OrderedCollection with: retval.
	
	(node max - 1) timesRepeat: [
	 	(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements