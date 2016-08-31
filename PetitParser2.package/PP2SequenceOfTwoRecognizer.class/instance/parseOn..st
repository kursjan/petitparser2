parsing
parseOn: aPP2Context
	| retval memento |
	memento := aPP2Context remember.
	(retval := firstChild parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		^ retval
	].

	(retval := secondChild parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		aPP2Context restore: memento.
		^ retval
	].