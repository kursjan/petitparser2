parsing
parseOn: aPP2Context
	| elements retval |
	
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [
		^ retval
	].
	elements := OrderedCollection with: retval.
	
	(node max - 1) timesRepeat: [
	 	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
			^ elements asArray 
		].
		elements addLast: retval 
	].

	^ elements asArray