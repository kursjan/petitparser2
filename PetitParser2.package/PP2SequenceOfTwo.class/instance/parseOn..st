parsing
parseOn: aPP2Context
	| retval elements memento |
	memento := aPP2Context remember.
	(retval := firstChild parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		^ retval
	].
	elements := Array new: 2.
	elements at: 1 put: retval.
	
	(retval := secondChild parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		aPP2Context restore: memento.
		^ retval
	].
	elements at: 2 put: retval.

	^ elements